import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    title: qsTr("About")

    padding: 10
    Text {
        id: element
        text: qsTr("<p>A app to help desperate parents put their babies to sleep, or not! :P</p>
                    <p>This app was developed in Qt/Qml.</p>
                    <p>The source code is available at:</p>
                    <p><a href=\"https://github.com/sfadiga/SleepBabySleep\">https://github.com/sfadiga/SleepBabySleep</a></p>
                    <p>Use by your own!</p>
                    <p>I'm not responsible for anything wrong you will do :)</p>
                    <p>Sandro Fadiga, Jul/2019.</p>")
        anchors.fill: parent
        textFormat: Text.RichText
        elide: Text.ElideLeft
        wrapMode: Text.WordWrap
        font.pixelSize: 14
    }
}
