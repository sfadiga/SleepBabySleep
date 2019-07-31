import QtQuick 2.13
import QtQuick.Controls 2.13
import Theme 1.0

Page {
    id: root
    title: Theme.menuHelpText
    padding: 10
    background: Rectangle {
        color: Theme.backgroundColor
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        contentWidth: helpText.width
        Text {
            id: helpText
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            width: scrollView.width - 30
            text: Theme.helpText
        }
    }
}
