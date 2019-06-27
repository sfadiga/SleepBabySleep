import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("DormeBBDorme")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            //text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            //font.pixelSize: Qt.application.font.pixelSize * 1.6

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
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Settings")
                width: parent.width
                onClicked: {
                    stackView.push("SettingsForm.ui.qml")
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
        }
    }

    StackView {
        id: stackView
        //initialItem: "SoundForm.ui.qml"
        anchors.fill: parent
    }

    footer: PlaybarForm {
        id: playBar
        width: parent.width
        property var playQueueModel: PlaybarModel {}
    }

    Component.onCompleted: {
        stackView.push(soundForm)
    }

    SoundForm {
        id: soundForm
        playbar_model: playBar.playQueueModel
    }

}
