import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.12

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
        color: "lightgray"
    }

    function control() {
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
            button.icon.source = isplaying ? "qrc:/icons/ic_pause_circle_outline_24px.svg" : "qrc:/icons/ic_play_circle_outline_24px.svg"
        }
    }

    function volume() {
        if (playQueueModel.count > 0 && isplaying) {
            for(var i = 0 ; i < playQueueView.count ; i++) {
                var item = playQueueView.itemAtIndex(i)
                item.audio.volume = slider.value
            }
        }
        if (slider.value > 0.5)
            volumeIcon.source = "qrc:/icons/ic_volume_up_24px.svg"
        else if (slider.value < 0.5 && slider.value > 0)
            volumeIcon.source = "qrc:/icons/ic_volume_down_24px.svg"
        else if (slider.value === 0)
            volumeIcon.source = "qrc:/icons/ic_volume_off_24px.svg"

    }

    RowLayout {
        anchors.fill: parent

        RoundButton {
            id: button
            Layout.alignment: Qt.AlignLeft
            icon {
                source: "qrc:/icons/ic_play_circle_outline_24px.svg"
                color: "black"
            }
            TapHandler {
                onTapped: control()
            }
        }

        ToolSeparator {
            Layout.alignment: Qt.AlignLeft
        }

        Slider {
            id: slider
            value: 0.7
            Layout.alignment: Qt.AlignLeft
            Layout.fillWidth: true
            onValueChanged: volume()

            background: Rectangle {
                x: slider.leftPadding
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 4
                width: slider.availableWidth
                height: implicitHeight
                radius: 2
                color: "#bdbebf"

                Rectangle {
                    width: slider.visualPosition * parent.width
                    height: parent.height
                    color: "#21be2b"
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

        Image {
            id: volumeIcon
            source: "qrc:/icons/ic_volume_down_24px.svg"
        }


        ToolSeparator {
            Layout.alignment: Qt.AlignLeft
        }

        RoundButton {
            id: openbutton
            Layout.alignment: Qt.AlignRight
            icon {
                source: "qrc:/icons/ic_playlist_add_check_24px.svg"
                color: "black"
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
        height: 100

        background: Rectangle {
            color: "gray"
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

