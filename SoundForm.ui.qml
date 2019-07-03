import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.12

Page {
    id: root

    property var playbar_model: 0
    property var popup_from_ref: 0
    property var current_volume_ref: 0

    padding: 5

    title: qsTr("Sleep Baby Sleep")

    GridView {
        id: gridView
        anchors.fill: parent

        cellHeight: 60
        cellWidth: 60

        focus: true

        highlight: Rectangle {
            color: "lightsteelblue"
            //radius: 5
        }

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

        model: SoundModel {
        }
    }
}




/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
