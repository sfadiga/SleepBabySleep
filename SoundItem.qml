import QtQuick 2.13
import QtMultimedia 5.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13
import QtQuick.Layouts 1.13
import Theme 1.0

Item {
    id: root

    property alias audio: audioLoader.item
    property bool isplaying: false

    Loader {
        id: audioLoader
        active: false
    }

    Component.onCompleted: {
        if (type === "wav") {
            audioLoader.sourceComponent = soundComp
        } else {
            audioLoader.sourceComponent = audioComp
        }
        audioLoader.active = true
    }

    Component {
        id: soundComp
        SoundEffect {
            id: soundFx
            source: sound
            volume: currentVolume
            onPlayingChanged: {
                if(playing)
                    txtLabel.state = "playing"
                else
                    txtLabel.state = "stopped"
            }
        }
    }

    Component {
        id: audioComp
        Audio {
            id: soundFx
            source: sound
            volume: currentVolume
            onPlaying: txtLabel.state = "playing"
            onStopped: txtLabel.state = "stopped"
        }
    }

    ColumnLayout {
        id: column
        width: 90
        RoundButton {
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
                source: image
                color: colorCode
            }
            states: [
                State {
                    name: "on"
                    when: soundItemButton.pressed
                    PropertyChanges { target: soundItemButton; opacity: 0.5 }
                    PropertyChanges { target: backgroundRectangle; color: Theme.buttonBackgroundSelectedColor }
                }]


            onClicked:
            {
                if (root.isplaying) {
                    root.audio.stop()
                } else {
                    root.audio.play()
                }
                root.isplaying = !root.isplaying
            }

            onPressAndHold: operate()

        }

        Label{
            id: txtLabel
            Layout.alignment: Qt.AlignHCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            Layout.preferredWidth: column.width
            text: name
            font.pointSize: 12
            color: Qt.darker(colorCode)
            states: [
                State {
                    name: "playing"
                    PropertyChanges { target: txtLabel; color: Theme.labelSelectedColor }
                    PropertyChanges { target: txtLabel; font.bold: true }
                    PropertyChanges { target: txtLabel; font.pointSize: 13 }
                }]
        }
    } //Column
} // Item

