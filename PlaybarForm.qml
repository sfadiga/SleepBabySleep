import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.12
import Theme 1.0
import Qt.labs.settings 1.1

ToolBar {
    id: playBar

    property alias playlistPane: playlistPopup
    property alias currentVolume: slider.value
    property alias playlistModel: playBar.playlistModel

    readonly property int time_base: 60000

    property bool isplaying: false
    property var playlistModel: ListModel {}

    position: ToolBar.Footer
    padding: 5
    height: 60
    width: parent.width

    background: Rectangle {
        color: Theme.playBarColor
    }

    function playStart() {
        for(var i = 0 ; i < playQueueView.count ; i++) {
            var item = playQueueView.itemAtIndex(i)
            item.audio.loops = Audio.Infinite
            item.audio.volume = slider.value
            item.audio.play()
        }
        isplaying = true
        buttonPlay.state = "playing"
        if(buttonLoop.state != "0") {
            loopTimer.interval = loopLabel.text * time_base

            loopTimer.start()
            displayTimer.start()
        }
    }

    function playStop() {
        for(var i = 0 ; i < playQueueView.count ; i++) {
            var item = playQueueView.itemAtIndex(i)
            item.audio.stop()
        }
        isplaying = false
        buttonPlay.state = "stoped"
        if(buttonLoop.state != "0") {
            loopTimer.stop()
            displayTimer.stop()
            loopLabel.text = buttonLoop.state
        }

    }

    function playControl() {
        if(playQueueModel.count > 0)
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

        if (buttonLoop.state != "0")
            loopTimer.interval = loopLabel.text * time_base
        else
        {
            loopTimer.stop()
            displayTimer.stop()
        }
    }

    function volumeControl() {
        if (playQueueModel.count > 0 && isplaying) {
            for(var i = 0 ; i < playQueueView.count ; i++) {
                var item = playQueueView.itemAtIndex(i)
                item.audio.volume = slider.value
            }
        }
        if (slider.value > 0.5)
            volumeButton.icon.source = "qrc:/icons/ic_volume_up_24px.svg"
        else if (slider.value < 0.5 && slider.value > 0)
            volumeButton.icon.source = "qrc:/icons/ic_volume_down_24px.svg"
        else if (slider.value === 0)
            volumeButton.icon.source = "qrc:/icons/ic_volume_off_24px.svg"

    }

    function muteControl() {
        if (slider.value > 0)
            slider.value = 0
        else
            slider.value = 0.6
    }

    Timer {
        id: loopTimer
        interval: 0
        onTriggered: playStop()

    }
    Timer { // updates the icon label minute by minute
        id: displayTimer
        interval: time_base
        repeat: true
        onTriggered: loopLabel.text = loopLabel.text - 1 //JS is the crazy language, this works as intended!
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
                    PropertyChanges { target: loopLabel; text: "" }
                },
                State {
                    name: "5"
                    PropertyChanges { target: loopLabel; text: "5" }
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                },
                State {
                    name: "15"
                    PropertyChanges { target: loopLabel; text: "15" }
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                },
                State {
                    name: "30"
                    PropertyChanges { target: loopLabel; text: "30" }
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                },
                State {
                    name: "45"
                    PropertyChanges { target: loopLabel; text: "45" }
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                },
                State {
                    name: "60"
                    PropertyChanges { target: loopLabel; text: "60" }
                    PropertyChanges { target: buttonLoop; icon.source: "" }
                }
            ]

            Component.onCompleted: buttonLoop.state = 0
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

            TapHandler {
                onTapped: save()//muteControl()
            }
        }

        RoundButton {
            id: playListButton
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
            Layout.alignment: Qt.AlignRight
            icon {
                source: "qrc:/icons/ic_playlist_add_check_24px.svg"
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
        height: 160

        background: Rectangle {
            color: Theme.playlistPaneColor
        }

        Column {
            anchors.fill: parent
            spacing: 5
            Label {
                id: playlistLabel
                text: qsTr("Playlist:")
                style: Text.Outline
                styleColor: "black"
                font.bold: true
                font.pointSize: 12
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
                    soundItemButton.onDoubleClicked: { removeFromPlaylist(playlistView.currentIndex) }
                    soundItemButton.onPressed: { audio.play() }
                }
            }
        }
    }

    function removeFromPlaylist(index) {
        playlistModel.remove(index)
    }


}

