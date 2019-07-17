import QtQuick 2.12
import QtQuick.Controls 2.12
import Theme 1.0
Page {
    id: root

    title: qsTr("Sleep Baby Sleep")

    SwipeView {
        id: view
        anchors.fill: parent

        Repeater {
            model: SoundModel { }
            delegate:
                SwipeDelegate {
                id: swipeDelegate
                Page {
                    id: soundListPage
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
                            cellHeight: 110
                            cellWidth: 90

                            model: contents

                            delegate: SoundItem {
                                id: soundItem
                                soundSource: sound
                                colorText: colorCode
                                label: name
                                iconSource: image
                                soundItemButton.onDoubleClicked: { addToPlaylist(model) }
                                soundItemButton.onPressed: { audio.play() }
                            }
                        }
                    } // column
                } // page
            } // delegate
        }
    }

    function addToPlaylist(model) {
        playlistModel.append(model)
        playlistPane.open()
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
