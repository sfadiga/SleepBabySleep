import QtQml 2.12
import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.settings 1.1
import QtQuick.Window 2.12
import Theme 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    Loader {
        id: mainWindowLoader
        anchors.fill: parent
        active: true
        source: "qrc:/MainWindow.qml"
        asynchronous: true
        onLoaded: {
            splashScreenLoader.item.visible = false;
            splashScreenLoader.source = "";
            item.visible = true;
        }

    }

    Loader {
        id: splashScreenLoader
        anchors.fill: parent
        source: "qrc:/Splashscreen.qml"
        onLoaded: {
            mainWindowLoader.active = true;
        }
        onSourceChanged:
        {
            Theme.selectedTheme = settings.themeSaved
        }
    }

    Settings {
        id: settings
        property string themeSaved: Theme.selectedTheme
    }

    Component.onDestruction: {
        settings.themeSaved = Theme.selectedTheme
    }

}
