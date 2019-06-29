import QtQuick 2.12
import QtMultimedia 5.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12


Item {
    id: root

    property alias audio: audio
    property string sound_src: ""
    property string color_text: ""
    property string label: ""
    property string icon_src: ""
    property variant playbar_ref: 0

    height: 50
    width: 50

    Audio {
        id: audio
        source: root.sound_src
        //loops: Audio.Infinite
    }

    Column {
        spacing: 5
        RoundButton {
            id: rbutton
            anchors.horizontalCenter: parent.horizontalCenter
            width: 45
            height: 45
            icon {
                width : parent.width
                height : parent.height
                source: root.icon_src
                color: root.color_text
            }

            TapHandler {
                onLongPressed: {
                    playbar_ref.remove(model)
                }
            }

        }

        Text {
            text: root.label
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

    } //Column

} // Item
