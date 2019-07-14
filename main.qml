import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Theme 1.0
import Qt.labs.settings 1.1

ApplicationWindow {
    id: window
    visible: true

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
    }


}
