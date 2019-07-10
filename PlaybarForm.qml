import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.12
import Theme 1.0

ToolBar {
    id: toolBar

    property bool isplaying: false
    property alias pop: pop
    property alias currentVolume: slider.value

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
            loopTimer.interval = loopLabel.text * 1000//buttonLoop.state * 1

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

/*        if (playQueueModel.count > 0) {
            for(var i = 0 ; i < playQueueView.count ; i++) {
                var item = playQueueView.itemAtIndex(i)
                if (isplaying) {
                    item.audio.stop()
                }
                else {
                    item.audio.loops = Audio.Infinite
                    item.audio.volume = slider.value
                    item.audio.play()
                }
            }
            isplaying = !isplaying
            buttonPlay.state = isplaying ? "playing" : "stoped"
        }
*/
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
            loopTimer.interval = buttonLoop.state * 1
         else
         {
            loopTimer.stop()
            displayTimer.stop()
         }

      /*  if (playQueueModel.count > 0) {
            for(var i = 0 ; i < playQueueView.count ; i++) {
                var item = playQueueView.itemAtIndex(i)
                if (isplaying) {
                    item.audio.stop()
                }
                else {
                    item.audio.loops = Audio.Infinite
                    item.audio.volume = slider.value
                    item.audio.play()
                }
            }
            isplaying = !isplaying
            buttonPlay.state = isplaying ?  "paused" : "playing"
        }
        */
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
        interval: 60
        repeat: true
        onTriggered: loopLabel.text = loopLabel.text - 1 //JS is the crazy language, this works as intended!
    }

    RowLayout {
        anchors.fill: parent

        RoundButton {
            id: buttonPlay
            Layout.alignment: Qt.AlignLeft
            icon {
                source: "qrc:/icons/ic_play_circle_outline_24px.svg"
                color: Theme.playbarIconColor
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
            Layout.minimumHeight: 35
            Layout.minimumWidth: 35
            icon {
                source: "qrc:/icons/ic_all_inclusive_24px.svg"
                color: Theme.playbarIconColor
            }
            Text {
                id: loopLabel
                anchors.centerIn: buttonLoop
                text: ""
                font.pointSize: 16
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
                implicitWidth: 26
                implicitHeight: 26
                radius: 13
                color: slider.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
        }

        RoundButton {
            id: volumeButton
            icon {
                source: "qrc:/icons/ic_volume_down_24px.svg"
                color: Theme.playbarIconColor
            }
            TapHandler {
                onTapped: muteControl()
            }
        }

        RoundButton {
            id: playListButton
            Layout.alignment: Qt.AlignRight
            icon {
                source: "qrc:/icons/ic_playlist_add_check_24px.svg"
                color: Theme.playbarIconColor
            }
            TapHandler {
                onTapped: pop.open()
            }
        }
    }

    Popup {
        id: pop
        dim:true
        modal: true
        focus: true
        parent: Overlay.overlay
        closePolicy: Popup.CloseOnPressOutside

        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height))

        width: parent.width
        height: 120

        background: Rectangle {
            color: Theme.plalistPaneColor
        }

        ListView {
            id: playQueueView
            anchors.fill: parent
            orientation: ListView.Horizontal
            model: playQueueModel
            delegate: SoundItem {
                width: 80
                height: 80
                id: soundItem
                sound_src: sound
                color_text: colorCode
                label: name
                icon_src: image
                playbar_ref: playQueueModel
            }
        }
    }
}

