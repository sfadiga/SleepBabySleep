import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.settings 1.1
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import Theme 1.0

Item {
    id: window
    visible: false

    anchors.fill: parent

    width: 640
    height: 480

    property alias playlistModel: playBar.playlistModel;
    property alias playlistPane: playBar.playlistPane;
    property alias currentVolume: playBar.currentVolume;

    Settings {
        id: windowSettings
        property string playlistSaved: ""
        property real playlistVolume: 0.0
    }

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        spacing: 0

        ToolBar {
            id: toolBar
            z: 10 // make the toolbar the most upfront widget
            Layout.alignment: Qt.AlignTop
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: toolButton.height

            background: Rectangle {
                color: Theme.topBarColor
            }

            ToolButton {
                id: toolButton
                Layout.alignment: Qt.AlignLeft
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
                anchors.centerIn:  parent
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

        StackView {
            id: stackView
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: window.height - toolBar.height - playBar.height
            Component.onCompleted: stackView.push("SoundForm.qml")
        }

        PlaybarForm {
            id: playBar
            z: 10 // make the playbar the most upfront widget
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignBottom
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
    }

    Component.onDestruction: {
        save()
    }

    Component.onCompleted: {
        load()
        visible = true
    }

    function save() {
        var datamodel = []
        for(var i = 0; i < playBar.playlistModel.count; ++i) {
            datamodel.push(playBar.playlistModel.get(i))
        }
        windowSettings.playlistSaved = JSON.stringify(datamodel)
        windowSettings.playlistVolume = playBar.currentVolume
    }

    function load(){
        if (windowSettings.playlistSaved !== "") {
            playBar.playlistModel.clear()
            var data = JSON.parse(windowSettings.playlistSaved)
            for(var i = 0; i < data.length; ++i) {
                playBar.playlistModel.append(data[i])
            }
        }
        playBar.currentVolume = windowSettings.playlistVolume
    }
}

