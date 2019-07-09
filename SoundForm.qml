import QtQuick 2.12
import QtQuick.Controls 2.12
import Theme 1.0
Page {
    id: root

    property var playbar_model: 0
    property var popup_from_ref: 0
    property var current_volume_ref: 0

    anchors.fill: parent

    title:  qsTr("Sleep Baby Sleep")

    SwipeView {
        id: view
        anchors.fill: parent

        Repeater {
            model: SoundModel{}
            delegate:
                SwipeDelegate {
                id: swipeDelegate
                Page {
                    anchors.fill: parent
                    background: Rectangle {
                        color: Theme.backgroundColor
                    }

                    Column {
                        id: column

                        anchors.fill: parent

                        Rectangle {
                            id: categoryRectangle
                            width: parent.width
                            height: 30
                            color: categoryColor
                            Text {
                                antialiasing: true
                                anchors.verticalCenter: categoryRectangle.verticalCenter
                                text: categoryTitle
                                font.pointSize: 14
                                font.bold: true
                                font.letterSpacing: 2
                                padding: 10
                                color: Theme.categoryTitleColor
                                style: Text.Outline
                                styleColor: Qt.darker(categoryColor)

                            }
                        } // category rectangle

                        GridView {
                            id: soundGrid
                            leftMargin: 10
                            topMargin: 5
                            height: parent.height
                            width: parent.width
                            cellHeight: 80
                            cellWidth: 80

                            model: contents

                            delegate: SoundItem {
                                id: soundItem
                                sound_src: sound
                                color_text: colorCode
                                label: name
                                icon_src: image
                                playbar_model_ref: playbar_model
                                popup_ref: popup_from_ref
                                volume_ref: current_volume_ref
                            }
                        }
                    } // column
                } // page
            } // delegate
        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        delegate:  Rectangle {
            implicitWidth: 15
            implicitHeight: 15

            radius: width
            color: Theme.topBarColor

            opacity: index === view.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }
    }

}
