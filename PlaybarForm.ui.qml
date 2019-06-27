import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

ToolBar {
    id: toolBar

    position: ToolBar.Footer
    padding: 5
    height: 55

    background: Rectangle {
        color: "transparent"
    }

   /* PlaybarModel {
        id: playQueueModel
    }*/

    RoundButton {
        id: button
        anchors.left: parent.left
        icon {
            source: "qrc:/icons/ic_play_circle_outline_24px.svg"
            color: "black"
        }
    }

    Slider {
        id: slider
        value: 0.5
        anchors.left: button.right
        Text {
            text: qsTr("Volume")
        }
    }

    ToolSeparator {
        id: separator
        anchors.left: slider.right
    }

    ListView {
        id: swipeView
        anchors.left: separator.right
        width: (parent.width - slider.width - separator.width - button.width - separator2.width)
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
    }

    ToolSeparator {
        id: separator2
        anchors.left: swipeView.right
    }
}
