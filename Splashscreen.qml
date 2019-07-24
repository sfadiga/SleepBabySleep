import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import Theme 1.0
import Qt.labs.settings 1.1

Item {
    id: splashScreen
    anchors.fill: parent
    visible: false
    Rectangle {
        id: splashRect
        anchors.fill: parent
        color: Theme.topBarColor
        border.width: 1
        border.color: "black"

        Image {
            id: appLogo
            source: "qrc:/android_icon_high.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
        }

        Text {
            id: appName
            text: qsTr("Sleep Baby Sleep")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: appLogo.bottom
            anchors.topMargin: 30
            antialiasing: true
            font.bold: true
            font.capitalization: Font.AllUppercase
            font.pointSize: 20
            font.wordSpacing: 5
            font.letterSpacing: 2
            color: Qt.lighter(Theme.topBarColor)
            style: Text.Outline
            styleColor: Qt.darker(Theme.topBarColor)
        }

        BusyIndicator {
            id: busyAnimation
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: appName.bottom
            anchors.topMargin: parent.height / 5
            width: 50 //parent.width / 2
            height: 50 // width
            running: true

            contentItem: Item {
                implicitWidth: 64
                implicitHeight: 64

                Item {
                    id: item
                    x: parent.width / 2 - 32
                    y: parent.height / 2 - 32
                    width: 64
                    height: 64
                    opacity: busyAnimation.running ? 1 : 0

                    Behavior on opacity {
                        OpacityAnimator {
                            duration: 250
                        }
                    }

                    RotationAnimator {
                        target: item
                        running: busyAnimation.visible && busyAnimation.running
                        from: 0
                        to: 360
                        loops: Animation.Infinite
                        duration: 1250
                    }

                    Repeater {
                        id: repeater
                        model: 8

                        Rectangle {
                            x: item.width / 2 - width / 2
                            y: item.height / 2 - height / 2
                            implicitWidth: 10
                            implicitHeight: 10
                            radius: 5
                            color: "red"
                            transform: [
                                Translate {
                                    y: -Math.min(item.width, item.height) * 0.5 + 5
                                },
                                Rotation {
                                    angle: index / repeater.count * 360
                                    origin.x: 5
                                    origin.y: 5
                                }
                            ]
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: visible = true
}

