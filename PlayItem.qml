import QtQuick 2.12
import QtMultimedia 5.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12


Item {
    id: root

    property string sound_src: ""
    property string color_text: ""
    property string label: ""
    property string icon_src: ""
    property variant playbar_ref: 0

    x: 5
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
            //text: name
            //radius:5
            icon {
                //name : string
                width : parent.width
                height : parent.height
                source: root.icon_src
                color: root.color_text
            }

            TapHandler {
                onLongPressed: {
                    //console.info("remove play item")
                    //console.info(model)
                    playbar_ref.remove(model)
                }
            }

        }

        Text {
            x: 5
            text: root.label
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

    } //Column

} // Item
