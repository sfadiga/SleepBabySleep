import QtQuick 2.12
import QtMultimedia 5.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import Theme 1.0

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

    ColumnLayout {
        id: column

        width: 70

        Button {
            id: rbutton
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 50
            Layout.preferredHeight: 50

            background: Rectangle {
                id: rec
                radius: 50 // make it round
                color: Theme.buttonBackgroundColor
            }


            icon {
                width: 30//parent.width
                height: 30///parent.height
                source: root.icon_src
                color: root.color_text
            }

            onPressed: audio.play()
            onPressAndHold: {
                playbar_model_ref.append(model)
                popup_ref.open()
            }
        }
        Label{
            id: txtLabel
            Layout.alignment: Qt.AlignHCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap

            Layout.preferredWidth: column.width

            text: root.label

            font.pointSize: 11
            color: root.color_text
        }
        /* Text {
            id: txtLabel
            Layout.alignment: Qt.AlignHCenter

            wrapMode: Text.WordWrap

            Layout.preferredWidth: column.width
           //Layout.preferredHeight: column.height
            //elide: Text.ElideMiddle

            text: root.label

            font.pointSize: 10
            color: root.color_text
        }
        */

    } //Column

} // Item




























/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
