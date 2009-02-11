/*
    PopupWindow
    TrayTextBrowser

    Copyright (c) 2008 by Rustam Chakin <qutim.develop@gmail.com>

 ***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************
*/

#include "popupwindow.h"
#include <QTimer>
#include <QMouseEvent>
#include <QDesktopWidget>
#include <QString>
#include <QFile>
#include "abstractnotificationlayer.h"


PopupWindow::~PopupWindow()
{
	m_notification_layer.deletePopupWindow(this);
}

PopupWindow::PopupWindow(const QString &u, int width, int height, int t,
                         int pos, int st, int psInStack, bool f, QWidget *parent)
	: QWidget(parent),
	m_notification_layer(AbstractNotificationLayer::instance())
{
	ui.setupUi(this);
	ui.nickLabel->installEventFilter(this);
	connect(ui.textBrowser, SIGNAL(closeWindow()), this, SLOT(close()));
	connect(ui.textBrowser, SIGNAL(startChat()), this, SLOT(startChatSlot()));
	time = t;
	contactUin = u;
	position = pos;
	style = st;
	positionInStack = psInStack;
	firstTrayWindow = false;
	userMessage = f;
	setFixedSize(QSize(width, height));
	setAttribute(Qt::WA_QuitOnClose, false);
	setAttribute(Qt::WA_DeleteOnClose, true);
	QTimer::singleShot((time + 1) * 1000, this, SLOT(close()));
#if defined(Q_OS_MAC)
	setWindowFlags(windowFlags() | Qt::FramelessWindowHint);
#else
	setWindowFlags(windowFlags() | Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint | Qt::ToolTip);
#endif
}

bool PopupWindow::eventFilter(QObject *obj, QEvent *event)
{
	if ( obj->objectName() == "textBrowser" )
	{
//		if ( event->type() == QEvent::Paint )
//		{
//			qDebug()<<"left";
//		}
		qDebug()<<event;
	}
	if(event->type() == QEvent::MouseButtonRelease)
	{
		QMouseEvent *mevent = (QMouseEvent *) event;
		if (mevent->button() == Qt::RightButton)
			close();
		else if (mevent->button() == Qt::LeftButton)
		{
			qDebug()<<"left";
			startChatSlot();
		}
		return true;
	}
	return QWidget::eventFilter(obj,event);
}

void PopupWindow::showTrayMessage()
{
	QDesktopWidget desktopSize;
	QRect geometry = desktopSize.availableGeometry();
	moveToPointX = 0;
	moveToPointY = 0;

	switch(position)
	{
	case 0:
		moveToPointX = geometry.left();
		moveToPointY = geometry.top() + (positionInStack - 1) * height();
		break;
	case 1:
		moveToPointX = geometry.right() - width();
		moveToPointY = geometry.top() + (positionInStack - 1) * height();
		break;
	case 2:
		moveToPointX = geometry.left();
		moveToPointY = geometry.bottom() - positionInStack * height();
		break;
	default:
		moveToPointX = geometry.right() - width();
		moveToPointY = geometry.bottom() - positionInStack * height();
	}
	slide();
}

void PopupWindow::slide()
{
	fromX = 0;
	fromY = 0;
	switch (style)
	{
	case 0:
		move(moveToPointX, moveToPointY);
		show();
		break;
	case 1:
		if (position == 0 || position == 1)
		{
			fromX = moveToPointX;
			fromY = moveToPointY - height();
			move(fromX, fromY);
			show();
			slideVerticallyDown();
		} else if (position == 2 || position == 3)
		{
			fromX = moveToPointX;
			fromY = moveToPointY + height();
			move(fromX, fromY);
			show();
			slideVerticallyUp();
		}
		break;
	case 2:
		if (position == 0 || position == 2)
		{
			fromX = moveToPointX - width();
			fromY = moveToPointY;
			move(fromX, fromY);
			show();
			slideHorizontallyRight();
		} else if (position == 1 || position == 3)
		{
			fromX = moveToPointX + width();
			fromY = moveToPointY;
			move(fromX, fromY);
			show();
			slideHorizontallyLeft();
		}
		break;
	default:
		move(moveToPointX, moveToPointY);
		show();
	}

}

void PopupWindow::slideVerticallyUp()
{
	fromY -= 5;

	if (fromY >= moveToPointY)
		{
			move(moveToPointX, fromY);
			QTimer::singleShot(10, this, SLOT(slideVerticallyUp()));
		}
}

void PopupWindow::slideVerticallyDown()
{
	fromY += 5;
	if (fromY <= moveToPointY)
	{
		move(moveToPointX, fromY);
		QTimer::singleShot(10, this, SLOT(slideVerticallyDown()));
	}
}

void PopupWindow::slideHorizontallyRight()
{
	fromX += 5;
	if (fromX <= moveToPointX)
	{
		move(fromX, moveToPointY);
		QTimer::singleShot(10, this, SLOT(slideHorizontallyRight()));
	}
}

void PopupWindow::slideHorizontallyLeft()
{
	fromX -= 5;
	if (fromX >= moveToPointX)
	{
		move(fromX, moveToPointY);
		QTimer::singleShot(10, this, SLOT(slideHorizontallyLeft()));
	}
}

void PopupWindow::setData(const TreeModelItem &item, const QString &mineNick, const QString &from,
		const QString &picturePath, const QString &msg)
{
	m_contact_item = item;
	if ( themeHeader.isEmpty() )
	{

		ui.nickLabel->setStyleSheet("background-image : url(:/icons/tray_pics/header.png);\n\ncolor : white; \n");
		ui.nickLabel->setText(tr("<b>%1</b>").arg(Qt::escape(mineNick)));
	} else {
		themeHeader.replace("%path%", themePath);
		themeHeader.replace("%minenick%", (Qt::escape(mineNick)));
		themeHeader.replace("%fromnick%", Qt::escape(from));
		ui.nickLabel->setStyleSheet(themeHeaderCSS);
		ui.nickLabel->setText(themeHeader);
	}

	if(themeContent.isEmpty())
	{

		QString message = tr("<b>%1</b><br /> <img align='left'  height='64' width='64' src='%avatar%' hspace='4' vspace='4'> %2").arg(Qt::escape(from)).arg(Qt::escape(msg));
		setDataHtml(message, picturePath);
	}
	else
	{

	    themeContent.replace("%path%", Qt::escape(themePath));
		themeContent.replace("%message%", msg);
		themeContent.replace("%fromnick%", Qt::escape(from));
		ui.textBrowser->setStyleSheet(themeContentCSS);
		setDataHtml(themeContent, picturePath);
	}

}


void PopupWindow::startChatSlot()
{
	if (userMessage)
	{
		AbstractChatLayer::instance().createChat(m_contact_item);
	}
	close();
}

void PopupWindow::setSystemData(const QString& nickName, const QString &msg)
{
	if ( themeHeader.isEmpty() )
	{
		ui.nickLabel->setStyleSheet("background-image : url(:/icons/tray_pics/header.png);\n\ncolor : white; \n");
		ui.nickLabel->setText(tr("<b>%1</b>").arg(Qt::escape(nickName)));
	} else {
		themeHeader.replace("%path%", Qt::escape(themePath));
		themeHeader.replace("%minenick%", Qt::escape(nickName));
		ui.nickLabel->setStyleSheet(themeHeaderCSS);
		ui.nickLabel->setText(themeHeader);
	}

	if ( themeContent.isEmpty())
	{
		QString message = tr("<b>%1</b>").arg(msg);
		setSystemDataHtml(msg);
	} else {
		themeContent.replace("%path%", Qt::escape(themePath));
		themeContent.replace("%message%", msg);
		ui.textBrowser->setStyleSheet(themeContentCSS);
		setSystemDataHtml(themeContent);
	}

}

void PopupWindow::setTheme(const QString &header, const QString &headerCss, const QString &content, const QString &contentCss, const QString &path)
{
	themePath = path;
	themeHeader = header;
	themeHeaderCSS = headerCss;
	themeContent = content;
	themeContentCSS = contentCss;
	themeHeaderCSS.replace("%path%", Qt::escape(themePath));
	themeContentCSS.replace("%path%", Qt::escape(themePath));
}

void PopupWindow::setDataHtml(const QString &msg, const QString &picturePath)
{
	QString picture;
	if ( !picturePath.isEmpty() && QFile::exists(picturePath)  )
		picture = picturePath;
	else
		picture = ":/icons/crystal_project/noavatar.png";

	QString message = msg;
	ui.textBrowser->append(message.replace("%avatar%", picture));
	ui.textBrowser->moveCursor(QTextCursor::Start);
	ui.textBrowser->ensureCursorVisible();
}

void PopupWindow::setSystemDataHtml(const QString &msg)
{
	ui.textBrowser->append(msg);
	ui.textBrowser->moveCursor(QTextCursor::Start);
	ui.textBrowser->ensureCursorVisible();
}
