import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Theme 1.0
import Qt.labs.settings 1.1
import QtQuick.Window 2.12

// TODO experimental stuff ==== V

Loader {
    id:loader

    Component {
        id: splash
        Window {
            id: splashWindow
            signal timeout()
            //anchors.fill: parent
            width: 800// parent.width
            height: 600// parent.height

            modality: Qt.ApplicationModal
            flags: Qt.SplashScreen
            color: "green"
            ProgressBar {
                id: progress
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                value: 0
                from: 0
                to: 100
            }
            Timer {
                id: timer
                interval: 10
                running: true
                repeat: true
                onTriggered: {
                    progress.value++
                    if(progress.value >= 100){
                        timer.stop()
                        splashWindow.timeout()
                    }
                }
            }
        }
    }

    sourceComponent: splash
    active: true
    visible: true
    onStatusChanged:  {
        if (loader.status == Loader.Ready)
            item.show()
    }

    Connections {
        id: connection
        target: loader.item
        onTimeout: {
            connection.target = null
            loader.sourceComponent = rootWindow
        }
    }


    Component {
        id:rootWindow
    // ^===== TODO experimental stuff


    ApplicationWindow {
    id: window
    visible: false

    width: 640
    height: 480


    header: ToolBar {
        contentHeight: toolButton.implicitHeight
        background: Rectangle {
            color: Theme.topBarColor
        }

        ToolButton {
            id: toolButton
            icon {
                source: stackView.depth > 1 ?
                            "qrc:/icons/ic_arrow_back_24px.svg" :
                            "qrc:/icons/ic_menu_24px.svg"
            }

            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            anchors.centerIn: parent
            antialiasing: true
            text: stackView.currentItem.title
            font.bold: true
            font.capitalization: Font.AllUppercase
            font.pointSize: 20
            font.wordSpacing: 5
            font.letterSpacing: 2
            color: Qt.lighter(Theme.topBarColor)
            style: Text.Outline
            styleColor: Qt.darker(Theme.topBarColor)
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        background: Rectangle {
            color: Theme.menuBackgroundColor
        }

        Column {
            anchors.fill: parent
            ItemDelegate {
                text: qsTr("Settings")
                width: parent.width
                onClicked: {
                    stackView.push("SettingsForm.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Help")
                width: parent.width
                onClicked: {
                    stackView.push("HelpForm.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("About")
                width: parent.width
                onClicked: {
                    stackView.push("AboutForm.ui.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        SoundForm {
            id: soundForm
            playbar_model: playBar.playQueueModel
            popup_from_ref: playBar.pop
            current_volume_ref: playBar.currentVolume
        }
    }


    footer: PlaybarForm {
        id: playBar
        width: parent.width
        property var playQueueModel: PlaybarModel {}
    }


    Settings {
        id: settings
        property string themeSaved: Theme.selectedTheme
    }

    Component.onDestruction: {
        settings.themeSaved = Theme.selectedTheme
    }

    Component.onCompleted: {
        stackView.push(soundForm)
        Theme.selectedTheme = settings.themeSaved
        window.visible = true
    }


}
}
}
