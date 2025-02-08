QT += quick widgets
QT += serialport

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        collector.cpp \
        logmanager.cpp \
        main.cpp \
        serialcommunicationestablishment.cpp \
        systemcontroller.cpp

#include(qmltermwidget/qmltermwidget.pro)

RESOURCES += qml.qrc

TRANSLATIONS += \
    esp_comm_en_US.ts
CONFIG += lrelease
CONFIG += embed_translations

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    collector.h \
    logmanager.h \
    serialcommunicationestablishment.h \
    systemcontroller.h

DISTFILES += \
    DeveloperGuide.md \
    README.md
