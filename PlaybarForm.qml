import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.12
import Theme 1.0
import RadialBar 1.0
import Qt.labs.settings 1.1

ToolBar {
    id: playBar

    property alias playlistPane: playlistPopup
    property alias currentVolume: slider.value
    property alias playlistModel: playBar.playlistModel

    property real beforeMuteVolume: 0
    property bool isplaying: false
    property var playlistModel: ListModel {}
    readonly property int timeBase: 1000

    position: ToolBar.Footer
    padding: 5
    height: 70
    width: parent.width

    background: Rectangle {
        color: Theme.playBarColor
    }

    function playStart() {
        if (!playlistView.currentItem) {
            playlistPopup.open()
            return
        }
        for(var i = 0 ; i < playlistView.count ; i++) {
            var item = playlistView.itemAtIndex(i)
            item.audio.loops = SoundEffect.Infinite
            item.audio.volume = slider.value
            item.audio.play()
        }
        isplaying = true
        buttonPlay.state = "playing"
        if(buttonLoop.state !== "0") {
            loopTimer.interval = buttonLoop.loopLabel * timeBase * 60
            buttonLoop.progress = 0
            loopTimer.start()
            displayTimer.start()
        }
    }

    function playStop() {
        for(var i = 0 ; i < playlistView.count ; i++) {
            var item = playlistView.itemAtIndex(i)
            item.audio.stop()
        }
        isplaying = false
        buttonPlay.state = "stoped"
        if(buttonLoop.state !== "0") {
            loopTimer.stop()
            displayTimer.stop()
            buttonLoop.loopLabel = buttonLoop.state
        }

    }

    function playControl() {
        if(playlistModel.count > 0)
        {
            if(isplaying) {
                playStop()
            }
            else {
                playStart()
            }
        }
    }

    function loopControl() {

        if (buttonLoop.state === "0")
            buttonLoop.state = "5"
        else if (buttonLoop.state === "5")
            buttonLoop.state = "15"
        else if (buttonLoop.state === "15")
            buttonLoop.state = "30"
        else if (buttonLoop.state === "30")
            buttonLoop.state = "45"
        else if (buttonLoop.state === "45")
            buttonLoop.state = "60"
        else if (buttonLoop.state === "60")
            buttonLoop.state = "0"

        if (buttonLoop.state !== "0") {
            loopTimer.interval = buttonLoop.loopLabel * timeBase
            loopTimer.stop()
            displayTimer.stop()
            progressBar.value = 0
            if(isplaying) {
                loopTimer.start()
                displayTimer.start()
            }
        } else {
            loopTimer.stop()
            displayTimer.stop()
        }
    }

    function volumeControl() {
        if (playlistModel.count > 0 && isplaying) {
            for(var i = 0 ; i < playlistView.count ; i++) {
                var item = playlistView.itemAtIndex(i)
                item.audio.volume = playBar.currentVolume
            }
        }
    }

    function muteControl() {
        if (slider.value > 0) {
            playBar.beforeMuteVolume = slider.value
            slider.value = 0
        } else {
            slider.value = playBar.beforeMuteVolume
        }
    }

    Timer {
        id: loopTimer
        interval: 0
        onTriggered: playStop()
    }
    Timer { // updates the icon label minute by minute
        id: displayTimer
        interval: timeBase
        repeat: true
        onTriggered: {
            buttonLoop.progress += 100 * (1/(buttonLoop.loopLabel * 60)) //360 is 100% complete
        }
    }

    RowLayout {
        anchors.fill: parent

        RoundButton {
            id: buttonPlay
            Layout.alignment: Qt.AlignLeft
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
            icon {
                source: "qrc:/icons/ic_play_circle_outline_24px.svg"
                color: Theme.playbarIconColor
                width: 30
                height: 30
            }
            TapHandler {
                onTapped: playControl()
            }

            states: [
                State {
                    name: "playing"
                    PropertyChanges { target: buttonPlay; icon.source: "qrc:/icons/ic_pause_circle_outline_24px.svg" }
                },
                State {
                    name: "stoped"
                    PropertyChanges { target: buttonPlay; icon.source: "qrc:/icons/ic_play_circle_outline_24px.svg" }
                }

            ]
        }

         RoundButton {
            id: buttonLoop
            property alias progress: progressBar.value
            property alias loopLabel: loopLabel.text

            Layout.alignment: Qt.AlignLeft
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
            icon {
                source: "qrc:/icons/ic_all_inclusive_24px.svg"
                color: Theme.playbarIconColor
                width: 30
                height: 30
            }
            Text {
                id: loopLabel
                anchors.centerIn: buttonLoop
                text: ""
                font.pointSize: 20
            }

            TapHandler {
                onTapped: loopControl()
            }
            states: [
                State {
                    name: "0"
                    PropertyChanges { target: buttonLoop; icon.source: "qrc:/icons/ic_all_inclusive_24px.svg" }
                    PropertyChanges { target: progressBar; visible: false}
                    PropertyChanges { target: progressBar; value: 0}
                    PropertyChanges { target: loopLabel; text: "" }
                },
                State {
                    name: "5"
                    PropertyChanges { target: loopLabel; text: "5" }
                    PropertyChanges { target: progressBar; visible: true}
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                },
                State {
                    name: "15"
                    PropertyChanges { target: loopLabel; text: "15" }
                    PropertyChanges { target: progressBar; visible: true}
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                },
                State {
                    name: "30"
                    PropertyChanges { target: loopLabel; text: "30" }
                    PropertyChanges { target: progressBar; visible: true}
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                },
                State {
                    name: "45"
                    PropertyChanges { target: loopLabel; text: "45" }
                    PropertyChanges { target: progressBar; visible: true}
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                },
                State {
                    name: "60"
                    PropertyChanges { target: loopLabel; text: "60" }
                    PropertyChanges { target: progressBar; visible: true}
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                }
            ]

            Component.onCompleted: buttonLoop.state = 0

            RadialBar {
                id: progressBar
                antialiasing: true
                width: buttonLoop.width
                height: buttonLoop.height
                penStyle: Qt.MiterJoin
                dialType: RadialBar.FullDial
                progressColor: "lightgreen"
                foregroundColor: "darkslategray"
                dialWidth: 4
                startAngle: 180
                spanAngle: 70
                minValue: 0
                maxValue: 100
                value: 0
                showText: false
            }
        }

        Slider {
            id: slider
            value: 0.4
            Layout.alignment: Qt.AlignLeft
            Layout.fillWidth: true

            onValueChanged: volumeControl()

            background: Rectangle {
                x: slider.leftPadding
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 4
                width: slider.availableWidth
                height: implicitHeight
                radius: 2
                color: "lightgray"

                Rectangle {
                    width: slider.visualPosition * parent.width
                    height: parent.height
                    color: Qt.darker("darkgray")
                    radius: 2
                }
            }
            handle: Rectangle {
                x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                implicitWidth: 30
                implicitHeight: 30
                radius: 15
                color: slider.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
        }

        RoundButton {
            id: volumeButton
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
            icon {
                source: "qrc:/icons/ic_volume_down_24px.svg"
                color: Theme.playbarIconColor
                width: 30
                height: 30
            }

            states: [
                State {
                    name: "100"
                    when: slider.value > 0.5
                    PropertyChanges { target: volumeButton; icon.source: "qrc:/icons/ic_volume_up_24px.svg" }
                },
                State {
                    name: "50"
                    when: slider.value < 0.5 & slider.value > 0
                    PropertyChanges { target: volumeButton; icon.source: "qrc:/icons/ic_volume_down_24px.svg" }
                },
                State {
                    name: "0"
                    when: slider.value == 0
                    PropertyChanges { target: volumeButton; icon.source: "qrc:/icons/ic_volume_off_24px.svg" }
                }

            ]

            TapHandler {
                onTapped: muteControl()
            }
        }

        RoundButton {
            id: playListButton
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
            Layout.alignment: Qt.AlignRight
            icon {
                source: playlistModel.count > 0 ? "qrc:/icons/ic_playlist_play_24px.svg" : "qrc:/icons/ic_playlist_add_24px.svg"
                color: Theme.playbarIconColor
                width: 30
                height: 30
            }
            TapHandler {
                onTapped: playlistPopup.open()
            }
        }
    }

    Popup {
        id: playlistPopup
        dim:true
        modal: true
        focus: true
        parent: Overlay.overlay

        closePolicy: Popup.CloseOnPressOutside

        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height))

        width: parent.width
        height: playBar.parent.height / 3

        background: Rectangle {
            color: Theme.playlistPaneColor
        }

        Column {
            anchors.fill: parent
            spacing: 10
            Label {
                id: playlistLabel
                text: qsTr("Playlist:")
                style: Text.Outline
                styleColor: "black"
                font.bold: true
                font.pointSize: 14
                font.letterSpacing: 2
                color: "white"
            }

            ListView {
                id: playlistView
                spacing: 5
                height: parent.height
                width: parent.width
                orientation: ListView.Horizontal

                model: playlistModel

                delegate: SoundItem {
                    id: soundItem
                    width: 90
                    height: 90
                    soundSource: sound
                    colorText: colorCode
                    label: name
                    iconSource: image
                    function operate() {
                        playlistModel.remove(index)
                        window.save()
                    }
                }
            }
        }
    }
}

