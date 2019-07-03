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
    property variant playbar_model_ref: 0
    property variant popup_ref: 0
    property variant volume_ref: 0

    Audio {
        id: audio
        source: root.sound_src
        volume: root.volume_ref
    }

    Column {

        RoundButton {
            id: rbutton
            anchors.horizontalCenter: parent.horizontalCenter

            icon {
                source: root.icon_src
                color: root.color_text
            }

            TapHandler {
                onTapped: {
                    audio.play()

                }
                onLongPressed: {
                    playbar_model_ref.append(model)
                    popup_ref.open()
                }
            }

            checked: GridView.isCurrentItem

        }

        Text {
            text: root.label
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

    } //Column

} // Item






/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
