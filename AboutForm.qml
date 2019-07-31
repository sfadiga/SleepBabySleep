import QtQuick 2.13
import QtQuick.Controls 2.13
import Theme 1.0

Page {
    title: Theme.menuAboutText
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
        text: Theme.aboutText
    }
}
