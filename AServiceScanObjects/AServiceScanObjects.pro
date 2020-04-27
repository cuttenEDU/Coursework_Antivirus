QT -= gui

TEMPLATE = lib
CONFIG += staticlib

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    aservicescanobjects.cpp

HEADERS += \
    aservicescanobjects.h

# Default rules for deployment.
unix {
    target.path = $$[QT_INSTALL_PLUGINS]/generic
}
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../AServiceFindObjects/release/ -lAServiceFindObjects
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../AServiceFindObjects/debug/ -lAServiceFindObjects

INCLUDEPATH += $$PWD/../AServiceFindObjects
DEPENDPATH += $$PWD/../AServiceFindObjects

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../AServiceFindObjects/release/libAServiceFindObjects.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../AServiceFindObjects/debug/libAServiceFindObjects.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../AServiceFindObjects/release/AServiceFindObjects.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../AServiceFindObjects/debug/AServiceFindObjects.lib

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../AServiceBaseLoad/release/ -lAServiceBaseLoad
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../AServiceBaseLoad/debug/ -lAServiceBaseLoad

INCLUDEPATH += $$PWD/../AServiceBaseLoad
DEPENDPATH += $$PWD/../AServiceBaseLoad

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../AServiceBaseLoad/release/libAServiceBaseLoad.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../AServiceBaseLoad/debug/libAServiceBaseLoad.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../AServiceBaseLoad/release/AServiceBaseLoad.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../AServiceBaseLoad/debug/AServiceBaseLoad.lib
