import QtQuick 2.12
import QtMultimedia 5.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import Theme 1.0

Item {
    id: root

    property alias audio: audio
    property alias soundItemButton: soundItemButton

    property string label: ""
    property string colorText: ""
    property string soundSource: ""
    property string iconSource: ""

    Audio {
        id: audio
        source: root.soundSource
        volume: currentVolume
    }

    ColumnLayout {
        id: column
        width: 90
        Button {
            id: soundItemButton
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 70
            Layout.preferredHeight: 70

            background: Rectangle {
                id: backgroundRectangle
                radius: 35 // make it round
                color: Theme.buttonBackgroundColor
            }
            icon {
                width: 50
                height: 50
                source: root.iconSource
                color: root.colorText
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
            color: root.colorText
        }
    } //Column
} // Item




























/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
