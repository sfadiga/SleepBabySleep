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

    function playControl() {
        if (playQueueModel.count > 0) {
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
            buttonPlay.state = isplaying ? "playing" : "paused"
            //buttonPlay.icon.source = isplaying ? "qrc:/icons/ic_pause_circle_outline_24px.svg" : "qrc:/icons/ic_play_circle_outline_24px.svg"
        }
    }

    function loopControl() {

         buttonLoop.state = "30"
         /*if (buttonLoop.state === "0")
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
*/
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

    RowLayout {
        anchors.fill: parent

//        ToolSeparator {
//            Layout.alignment: Qt.AlignLeft
//        }

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
                        name: "paused"
                        PropertyChanges { target: buttonPlay; icon.source: "qrc:/icons/ic_play_circle_outline_24px.svg" }
                    }

                ]
        }

//        ToolSeparator {
//            Layout.alignment: Qt.AlignLeft
//        }

        RoundButton {
            id: buttonLoop
            Layout.alignment: Qt.AlignLeft
            icon {
                source: "qrc:/icons/ic_all_inclusive_24px.svg"
                color: Theme.playbarIconColor
            }
            TapHandler {
                onTapped: loopControl()
            }
            states: [
                    State {
                        name: "0"
                       // when: buttonLoop.pressed && buttonLoop.state === "60"
                        PropertyChanges { target: buttonLoop; icon.source: "qrc:/icons/ic_all_inclusive_24px.svg" }
                    },
                    State {
                        name: "5"
                       // when: buttonLoop.pressed && buttonLoop.state === "0"
                        PropertyChanges { target: buttonLoop; icon.source: "qrc:/icons/ic_beach_access_24px.svg" }
                    },
                    State {
                        name: "15"
                       // when: buttonLoop.pressed && buttonLoop.state === "5"
                        PropertyChanges { target: buttonLoop; icon.source: "qrc:/icons/ic_all_inclusive_15_24px.svg" }
                    },
                    State {
                        name: "30"
                        //when: buttonLoop.pressed && buttonLoop.state === "15"
                        PropertyChanges { target: buttonLoop; icon.source: "qrc:/icons/ic_all_inclusive_30_24px.svg" }
                    },
                    State {
                        name: "45"
                        //when: buttonLoop.pressed && buttonLoop.state === "30"
                        PropertyChanges { target: buttonLoop; icon.source: "qrc:/icons/ic_all_inclusive_45_24px.svg" }
                    },
                    State {
                        name: "60"
                       // when: buttonLoop.pressed && buttonLoop.state === "45"
                        PropertyChanges { target: buttonLoop; icon.source: "qrc:/icons/ic_all_inclusive_60_24px.svg" }
                    }
                ]
        }

//        ToolSeparator {
//            Layout.alignment: Qt.AlignLeft
//        }

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
                //id: volumeIcon
                source: "qrc:/icons/ic_volume_down_24px.svg"
                color: Theme.playbarIconColor
            }

            TapHandler {
                onTapped: muteControl()
            }
        }


//        ToolSeparator {
//            Layout.alignment: Qt.AlignLeft
//        }

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

//        ToolSeparator {
//            Layout.alignment: Qt.AlignLeft
//        }
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
        height: 100

        background: Rectangle {
            color: Theme.plalistPaneColor
        }

        ListView {
            id: playQueueView
            anchors.fill: parent
            orientation: Qt.Horizontal
            focus: true
            delegate: PlayItem {
                id: soundItem
                sound_src: sound
                color_text: colorCode
                label: name
                icon_src: image
                playbar_ref: playQueueModel
            }

            model: playQueueModel
        }
    }

}

