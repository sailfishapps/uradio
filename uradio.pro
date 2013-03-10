TARGET=uradio

# Add dependency to Symbian components
# CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp
# Please do not modify the following line.
include(sailfishapplication/sailfishapplication.pri)

qml.files = *.qml qml
OTHER_FILES += \
    uradio_harmattan.desktop \
    uradio_large.png \
    cross.png \
    stripes.png \
    qml/cover/CoverPage.qml \
    qml/uradio/main.qml \
    qml/uradio/MrElop.qml \
    qml/uradio/Radio1.qml \
    qml/uradio/Settings.qml \
    qml/uradio/Splash.qml \
    qml/uradio/MainPage.qml \
    qml/uradio/AboutPage.qml \
    uradio.yaml

desktop.files = uradio.desktop

RESOURCES += \
    res.qrc




