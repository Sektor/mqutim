# This is a plugin
TEMPLATE=plugin
PLUGIN_FOR=qtopia
PLUGIN_TYPE=mqutim

# This plugin uses Qtopia
CONFIG+=qtopia

DEPENDPATH += . libs src include/qutim libs/gloox src/conference src/xeps
INCLUDEPATH += . src libs/gloox include/qutim src/conference src/xeps libs

TARGET = jabber
DEPENDPATH += . \
    settings
INCLUDEPATH += ../../include

QT += core \
    gui \
    network \
    xml
RESOURCES += jabber.qrc

# Input
HEADERS += libs/config.win.h \
           src/acceptautdialog.h \
           src/activitydialog.h \
           src/changeResource.h \
           src/customstatusdialog.h \
           src/jAccount.h \
           src/jAccountSettings.h \
           src/jAddContact.h \
           src/jAdhoc.h \
           src/jBuddy.h \
           src/jClientIdentification.h \
           src/jConnection.h \
           src/jDataForm.h \
           src/jDiscoIdentity.h \
           src/jDiscoItem.h \
           src/jFileTransfer.h \
           src/jFileTransferWidget.h \
           src/jInvitationHandler.h \
           src/jJoinChat.h \
           src/jLayer.h \
           src/jPluginSystem.h \
           src/jProtocol.h \
           src/jRoster.h \
           src/jSearchConference.h \
           src/jServiceBrowser.h \
           src/jServiceDiscovery.h \
           src/jSlotSignal.h \
           src/jTransport.h \
           src/jVCard.h \
           src/loginform.h \
           src/systeminfo.h \
           src/VCardAvatar.h \
           src/VCardBirthday.h \
           src/VCardConst.h \
           src/VCardDatedit.h \
           src/VCardEntry.h \
           src/VCardLabel.h \
           src/VCardLinedit.h \
           src/VCardRecord.h \
           src/VCardRole.h \
           src/xmlconsole.h \
           include/qutim/jabber.h \
           libs/gloox/adhoc.h \
           libs/gloox/adhoccommandprovider.h \
           libs/gloox/adhochandler.h \
           libs/gloox/amp.h \
           libs/gloox/annotations.h \
           libs/gloox/annotationshandler.h \
           libs/gloox/base64.h \
           libs/gloox/bookmarkhandler.h \
           libs/gloox/bookmarkstorage.h \
           libs/gloox/bytestream.h \
           libs/gloox/bytestreamdatahandler.h \
           libs/gloox/bytestreamhandler.h \
           libs/gloox/capabilities.h \
           libs/gloox/chatstate.h \
           libs/gloox/chatstatefilter.h \
           libs/gloox/chatstatehandler.h \
           libs/gloox/client.h \
           libs/gloox/clientbase.h \
           libs/gloox/component.h \
           libs/gloox/compressionbase.h \
           libs/gloox/compressiondatahandler.h \
           libs/gloox/compressionzlib.h \
           libs/gloox/config.h \
           libs/gloox/connectionbase.h \
           libs/gloox/connectionbosh.h \
           libs/gloox/connectiondatahandler.h \
           libs/gloox/connectionhandler.h \
           libs/gloox/connectionhttpproxy.h \
           libs/gloox/connectionlistener.h \
           libs/gloox/connectionsocks5proxy.h \
           libs/gloox/connectiontcpbase.h \
           libs/gloox/connectiontcpclient.h \
           libs/gloox/connectiontcpserver.h \
           libs/gloox/connectiontls.h \
           libs/gloox/dataform.h \
           libs/gloox/dataformfield.h \
           libs/gloox/dataformfieldcontainer.h \
           libs/gloox/dataformitem.h \
           libs/gloox/dataformreported.h \
           libs/gloox/delayeddelivery.h \
           libs/gloox/disco.h \
           libs/gloox/discohandler.h \
           libs/gloox/disconodehandler.h \
           libs/gloox/dns.h \
           libs/gloox/error.h \
           libs/gloox/event.h \
           libs/gloox/eventdispatcher.h \
           libs/gloox/eventhandler.h \
           libs/gloox/featureneg.h \
           libs/gloox/flexoff.h \
           libs/gloox/flexoffhandler.h \
           libs/gloox/gloox.h \
           libs/gloox/gpgencrypted.h \
           libs/gloox/gpgsigned.h \
           libs/gloox/inbandbytestream.h \
           libs/gloox/instantmucroom.h \
           libs/gloox/iq.h \
           libs/gloox/iqhandler.h \
           libs/gloox/jid.h \
           libs/gloox/jingleaudiortp.h \
           libs/gloox/jinglecontent.h \
           libs/gloox/jingledescription.h \
           libs/gloox/jingleiceudp.h \
           libs/gloox/jingleplugin.h \
           libs/gloox/jinglerawudp.h \
           libs/gloox/jinglesession.h \
           libs/gloox/jinglesessionhandler.h \
           libs/gloox/jingletransport.h \
           libs/gloox/jinglevideortp.h \
           libs/gloox/lastactivity.h \
           libs/gloox/lastactivityhandler.h \
           libs/gloox/loghandler.h \
           libs/gloox/logsink.h \
           libs/gloox/macros.h \
           libs/gloox/md5.h \
           libs/gloox/message.h \
           libs/gloox/messageevent.h \
           libs/gloox/messageeventfilter.h \
           libs/gloox/messageeventhandler.h \
           libs/gloox/messagefilter.h \
           libs/gloox/messagehandler.h \
           libs/gloox/messagesession.h \
           libs/gloox/messagesessionhandler.h \
           libs/gloox/mucinvitationhandler.h \
           libs/gloox/mucmessagesession.h \
           libs/gloox/mucroom.h \
           libs/gloox/mucroomconfighandler.h \
           libs/gloox/mucroomhandler.h \
           libs/gloox/mutex.h \
           libs/gloox/mutexguard.h \
           libs/gloox/nickname.h \
           libs/gloox/nonsaslauth.h \
           libs/gloox/oob.h \
           libs/gloox/parser.h \
           libs/gloox/prep.h \
           libs/gloox/presence.h \
           libs/gloox/presencehandler.h \
           libs/gloox/privacyitem.h \
           libs/gloox/privacylisthandler.h \
           libs/gloox/privacymanager.h \
           libs/gloox/privatexml.h \
           libs/gloox/privatexmlhandler.h \
           libs/gloox/pubsub.h \
           libs/gloox/pubsubevent.h \
           libs/gloox/pubsubeventhandler.h \
           libs/gloox/pubsubitem.h \
           libs/gloox/pubsubmanager.h \
           libs/gloox/pubsubresulthandler.h \
           libs/gloox/receipt.h \
           libs/gloox/registration.h \
           libs/gloox/registrationhandler.h \
           libs/gloox/resource.h \
           libs/gloox/rosteritem.h \
           libs/gloox/rosteritemdata.h \
           libs/gloox/rosterlistener.h \
           libs/gloox/rostermanager.h \
           libs/gloox/search.h \
           libs/gloox/searchhandler.h \
           libs/gloox/sha.h \
           libs/gloox/shim.h \
           libs/gloox/sihandler.h \
           libs/gloox/simanager.h \
           libs/gloox/siprofileft.h \
           libs/gloox/siprofilefthandler.h \
           libs/gloox/siprofilehandler.h \
           libs/gloox/socks5bytestream.h \
           libs/gloox/socks5bytestreammanager.h \
           libs/gloox/socks5bytestreamserver.h \
           libs/gloox/stanza.h \
           libs/gloox/stanzaextension.h \
           libs/gloox/stanzaextensionfactory.h \
           libs/gloox/statisticshandler.h \
           libs/gloox/subscription.h \
           libs/gloox/subscriptionhandler.h \
           libs/gloox/tag.h \
           libs/gloox/taghandler.h \
           libs/gloox/tlsbase.h \
           libs/gloox/tlsdefault.h \
           libs/gloox/tlsgnutlsbase.h \
           libs/gloox/tlsgnutlsclient.h \
           libs/gloox/tlsgnutlsclientanon.h \
           libs/gloox/tlsgnutlsserveranon.h \
           libs/gloox/tlshandler.h \
           libs/gloox/tlsopenssl.h \
           libs/gloox/tlsschannel.h \
           libs/gloox/uniquemucroom.h \
           libs/gloox/util.h \
           libs/gloox/vcard.h \
           libs/gloox/vcardhandler.h \
           libs/gloox/vcardmanager.h \
           libs/gloox/vcardupdate.h \
           libs/gloox/xhtmlim.h \
           src/conference/jConference.h \
           src/conference/joinconferenceform.h \
           src/conference/reasondialog.h \
           src/conference/topicConfigDialog.h \
           src/xeps/activityextension.h \
           src/xeps/gmailextension.h \
           src/xeps/moodsextenstion.h \
           src/xeps/tuneextension.h \
           src/xeps/versionextension.h \
           src/xeps/xstatusextension.h \
           libs/config.h.win
FORMS += src/acceptautdialog.ui \
         src/activitydialog.ui \
         src/customstatusdialog.ui \
         src/jAccountSettings.ui \
         src/jAddContact.ui \
         src/jFileTransferWidget.ui \
         src/jJoinChat.ui \
         src/jSearchConference.ui \
         src/jServiceBrowser.ui \
         src/jVCard.ui \
         src/loginform.ui \
         src/wChangeResource.ui \
         src/wPersonal.ui \
         src/xmlconsole.ui \
         src/conference/joinconferenceform.ui \
         src/conference/reasondialog.ui \
         src/conference/topicConfig.ui
SOURCES += src/acceptautdialog.cpp \
           src/activitydialog.cpp \
           src/changeResource.cpp \
           src/customstatusdialog.cpp \
           src/jAccount.cpp \
           src/jAccountSettings.cpp \
           src/jAddContact.cpp \
           src/jAdhoc.cpp \
           src/jBuddy.cpp \
           src/jClientIdentification.cpp \
           src/jConnection.cpp \
           src/jDataForm.cpp \
           src/jFileTransfer.cpp \
           src/jFileTransferWidget.cpp \
           src/jInvitationHandler.cpp \
           src/jJoinChat.cpp \
           src/jLayer.cpp \
           src/jPluginSystem.cpp \
           src/jProtocol.cpp \
           src/jRoster.cpp \
           src/jSearchConference.cpp \
           src/jServiceBrowser.cpp \
           src/jServiceDiscovery.cpp \
           src/jSlotSignal.cpp \
           src/jTransport.cpp \
           src/jVCard.cpp \
           src/loginform.cpp \
           src/systeminfo.cpp \
           src/VCardAvatar.cpp \
           src/VCardBirthday.cpp \
           src/VCardDatedit.cpp \
           src/VCardEntry.cpp \
           src/VCardLabel.cpp \
           src/VCardLinedit.cpp \
           src/VCardRecord.cpp \
           src/VCardRole.cpp \
           src/xmlconsole.cpp \
           libs/gloox/adhoc.cpp \
           libs/gloox/amp.cpp \
           libs/gloox/annotations.cpp \
           libs/gloox/base64.cpp \
           libs/gloox/bookmarkstorage.cpp \
           libs/gloox/capabilities.cpp \
           libs/gloox/chatstate.cpp \
           libs/gloox/chatstatefilter.cpp \
           libs/gloox/client.cpp \
           libs/gloox/clientbase.cpp \
           libs/gloox/component.cpp \
           libs/gloox/compressionzlib.cpp \
           libs/gloox/connectionbosh.cpp \
           libs/gloox/connectionhttpproxy.cpp \
           libs/gloox/connectionsocks5proxy.cpp \
           libs/gloox/connectiontcpbase.cpp \
           libs/gloox/connectiontcpclient.cpp \
           libs/gloox/connectiontcpserver.cpp \
           libs/gloox/connectiontls.cpp \
           libs/gloox/dataform.cpp \
           libs/gloox/dataformfield.cpp \
           libs/gloox/dataformfieldcontainer.cpp \
           libs/gloox/dataformitem.cpp \
           libs/gloox/dataformreported.cpp \
           libs/gloox/delayeddelivery.cpp \
           libs/gloox/disco.cpp \
           libs/gloox/dns.cpp \
           libs/gloox/error.cpp \
           libs/gloox/eventdispatcher.cpp \
           libs/gloox/featureneg.cpp \
           libs/gloox/flexoff.cpp \
           libs/gloox/gloox.cpp \
           libs/gloox/gpgencrypted.cpp \
           libs/gloox/gpgsigned.cpp \
           libs/gloox/inbandbytestream.cpp \
           libs/gloox/instantmucroom.cpp \
           libs/gloox/iq.cpp \
           libs/gloox/jid.cpp \
           libs/gloox/jinglecontent.cpp \
           libs/gloox/jingledescription.cpp \
           libs/gloox/jinglesession.cpp \
           libs/gloox/jingletransport.cpp \
           libs/gloox/lastactivity.cpp \
           libs/gloox/logsink.cpp \
           libs/gloox/md5.cpp \
           libs/gloox/message.cpp \
           libs/gloox/messageevent.cpp \
           libs/gloox/messageeventfilter.cpp \
           libs/gloox/messagefilter.cpp \
           libs/gloox/messagesession.cpp \
           libs/gloox/mucmessagesession.cpp \
           libs/gloox/mucroom.cpp \
           libs/gloox/mutex.cpp \
           libs/gloox/nickname.cpp \
           libs/gloox/nonsaslauth.cpp \
           libs/gloox/oob.cpp \
           libs/gloox/parser.cpp \
           libs/gloox/prep.cpp \
           libs/gloox/presence.cpp \
           libs/gloox/privacyitem.cpp \
           libs/gloox/privacymanager.cpp \
           libs/gloox/privatexml.cpp \
           libs/gloox/pubsubevent.cpp \
           libs/gloox/pubsubitem.cpp \
           libs/gloox/pubsubmanager.cpp \
           libs/gloox/receipt.cpp \
           libs/gloox/registration.cpp \
           libs/gloox/rosteritem.cpp \
           libs/gloox/rostermanager.cpp \
           libs/gloox/search.cpp \
           libs/gloox/sha.cpp \
           libs/gloox/shim.cpp \
           libs/gloox/simanager.cpp \
           libs/gloox/siprofileft.cpp \
           libs/gloox/socks5bytestream.cpp \
           libs/gloox/socks5bytestreammanager.cpp \
           libs/gloox/socks5bytestreamserver.cpp \
           libs/gloox/stanza.cpp \
           libs/gloox/stanzaextensionfactory.cpp \
           libs/gloox/subscription.cpp \
           libs/gloox/tag.cpp \
           libs/gloox/tlsdefault.cpp \
           libs/gloox/tlsgnutlsbase.cpp \
           libs/gloox/tlsgnutlsclient.cpp \
           libs/gloox/tlsgnutlsclientanon.cpp \
           libs/gloox/tlsgnutlsserveranon.cpp \
           libs/gloox/tlsopenssl.cpp \
           libs/gloox/tlsschannel.cpp \
           libs/gloox/uniquemucroom.cpp \
           libs/gloox/util.cpp \
           libs/gloox/vcard.cpp \
           libs/gloox/vcardmanager.cpp \
           libs/gloox/vcardupdate.cpp \
           libs/gloox/xhtmlim.cpp \
           src/conference/jConference.cpp \
           src/conference/joinconferenceform.cpp \
           src/conference/reasondialog.cpp \
           src/conference/topicConfigDialog.cpp \
           src/xeps/activityextension.cpp \
           src/xeps/gmailextension.cpp \
           src/xeps/moodsextenstion.cpp \
           src/xeps/tuneextension.cpp \
           src/xeps/versionextension.cpp \
           src/xeps/xstatusextension.cpp
