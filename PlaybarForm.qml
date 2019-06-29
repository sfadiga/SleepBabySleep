import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.12

ToolBar {
    id: toolBar

    property bool isplaying: false

    position: ToolBar.Footer
    padding: 5
    height: 55

    function control() {
        if (playQueueModel.count > 0) {
            for(var i = 0 ; i < playQueueView.count ; i++) {
                var item = playQueueView.itemAtIndex(i)
                if (isplaying) {
                    item.audio.stop()
                }
                else {
                    item.audio.loops = Audio.Infinite
                    item.audio.volume = slider.value
                    item.audio.play()
                }
            }
            isplaying = !isplaying
            button.icon.source = isplaying ? "qrc:/icons/ic_pause_circle_outline_24px.svg" : "qrc:/icons/ic_play_circle_outline_24px.svg"
        }
    }

    function volume() {
        if (playQueueModel.count > 0 && isplaying) {
            for(var i = 0 ; i < playQueueView.count ; i++) {
                var item = playQueueView.itemAtIndex(i)
                item.audio.volume = slider.value
            }
        }
    }

    background: Rectangle {
        color: "lightgray"
    }

    RoundButton {
        id: button
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        icon {
            source: "qrc:/icons/ic_play_circle_outline_24px.svg"
            color: "black"
        }
        TapHandler {
            onTapped: control()
        }
    }

    ToolSeparator {
        id: separator1
        anchors.left: button.right
        anchors.verticalCenter: parent.verticalCenter
    }

    Slider {
        id: slider
        value: 0.5
        anchors.left: separator1.right
        anchors.verticalCenter: parent.verticalCenter
        Text {
            text: qsTr("Volume")
        }
        onValueChanged: volume()
    }

    ToolSeparator {
        id: separator
        anchors.left: slider.right
        anchors.verticalCenter: parent.verticalCenter
    }

    ListView {
        id: playQueueView
        anchors.left: separator.right
        anchors.verticalCenter: parent.top

        width: (parent.width - slider.width - separator.width - button.width - separator2.width - separator1.width)
        orientation: Qt.Horizontal
        focus: true
        delegate: PlayItem {
            id: soundItem
            sound_src: sound
            color_text: colorCode
            label: name
            icon_src: image
            playbar_ref: playQueueModel
        }

        model: playQueueModel

        //ScrollBar.horizontal: ScrollBar { }
        ScrollBar.horizontal: ScrollBar {
            id: hbar
            hoverEnabled: true
            active: hovered || pressed
            orientation: Qt.Horizontal
            size: playQueueView.width / content.width
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
              }

    }

    ToolSeparator {
        id: separator2
        anchors.left: playQueueView.right
        anchors.verticalCenter: parent.verticalCenter
    }
}
