import QtQuick 2.12
import QtQuick.Controls 2.12
import Theme 1.0

Page {
    title: qsTr("About")
    padding: 10
    background: Rectangle {
        color: Theme.backgroundColor
    }
    Text {
        id: element
        anchors.fill: parent
        textFormat: Text.RichText
        elide: Text.ElideLeft
        wrapMode: Text.WordWrap
        text: qsTr("<p>This is an <strong>App</strong> from a parent to parents,&nbsp; it tries to help people desperate to put their babies to sleep! :)</p>
<p>The App was developed in <strong><em>Qt/QML</em></strong>&nbsp;-<strong> <span style=\"color: #3366ff;\">https://www.qt.io/</span></strong></p>
<p>The source code is available at:&nbsp;<strong><span style=\"color: #3366ff;\">https://github.com/sfadiga/SleepBabySleep</span></strong></p>
<p><span style=\"color: #ff0000;\"><strong>Disclaimer:</strong></span> <span style=\"text-decoration: underline;\"><em>Use by your own, <strong>I will not be responsible </strong>for anything wrong that you may come to do with this App.</em></span></p>
<h4><span style=\"color: #3366ff;\"><strong><em>Sandro Fadiga, SleepBabySleep, Jul/2019.</em></strong></span></h4>")
    }
}
