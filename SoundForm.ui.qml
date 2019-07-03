import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root

    property var playbar_model: 0
    property var popup_from_ref: 0
    property var current_volume_ref: 0

    padding: 5

    title: qsTr("Sleep Baby Sleep")

    ListView {
        id: listView
        anchors.fill: parent
        spacing: 5

        delegate: Item {
            width: parent.width
            height: soundGrid.height + categoryRectangle.height
            Column {
                id: column
                spacing: 10
                anchors {
                    left: parent.left
                    right: parent.right
                }

                Rectangle {
                    id: categoryRectangle
                    width: parent.width
                    height: 30
                    color: categoryColor
                    Text {
                        text: categoryTitle
                        font.pointSize: 12
                        padding: 5
                    }
                } // category rectangle

                GridView {
                    id: soundGrid

                    anchors {
                        left: parent.left
                        right: parent.right
                    }

                    cellHeight: 60
                    cellWidth: 60
                    // i can't believe that qml does not have a way to adjust content based on width TODO improve this
                    height: cellHeight * ((contents.count / (parent.width / cellWidth)) + 1)

                    model: contents

                    delegate: SoundItem {
                        id: soundItem
                        sound_src: sound
                        color_text: colorCode
                        label: name
                        icon_src: image
                        playbar_model_ref: playbar_model
                        popup_ref: popup_from_ref
                        volume_ref: current_volume_ref
                    }
                }
            } // column
        }
        model: SoundModel {
        }
    }
}
