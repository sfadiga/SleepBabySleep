import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.12

Page {
    id: root

    property var playbar_model: 0

    title: qsTr("Sleep Baby Sleep")
    padding: 5

    GridView {
        id: gridView
        anchors.fill: parent
        cellHeight: 70
        cellWidth: 60

        delegate: SoundItem {
            id: soundItem
            sound_src: sound
            color_text: colorCode
            label: name
            icon_src: image
            playbar_ref: playbar_model
        }

        model: SoundModel {
        }
    }
}




/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
