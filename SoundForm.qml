import QtQuick 2.13
import QtQuick.Controls 2.13
import Theme 1.0
Page {
    id: root
    title: Theme.applicationTitle
    SwipeView {
        id: swipeView
        anchors.fill: parent

        Repeater {
            id: repeater
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
                            z: 5 // avoid unwanted effect of sound icons over the label
                            width: parent.width
                            height: 40
                            color: categoryColor
                            Text {
                                antialiasing: true
                                anchors.verticalCenter: categoryRectangle.verticalCenter
                                anchors.horizontalCenter: categoryRectangle.horizontalCenter
                                text: categoryTitle
                                font.pointSize: 16
                                font.bold: true
                                font.letterSpacing: 2
                                padding: 10
                                color: Theme.categoryTitleColor
                                style: Text.Outline
                                styleColor: Qt.darker(categoryColor)

                            }
                        } // category rectangle
                        GridView {
                            id: gridView

                            property var contentHeight: 120
                            property var contentWidth: 90

                            height: parent.height
                            width: parent.width

                            cellHeight: contentHeight
                            cellWidth: Math.floor(parent.width / Math.floor(parent.width / contentWidth))

                            ScrollBar.vertical: ScrollBar {
                                visible: false
                            }

                            model: contents

                            delegate: Component {
                                id: rectComp
                                Item {
                                    width: gridView.cellWidth
                                    height: gridView.cellHeight
                                    SoundItem {
                                        id: soundItem
                                        anchors {
                                            fill: parent
                                            topMargin: 5
                                        }
                                        function operate() {
                                            var m = model
                                            playlistModel.append({name: m.name, colorCode: m.colorCode, sound: m.sound, image: m.image, type: m.type})
                                            playlistPane.open()
                                            window.save()
                                        }
                                    }
                                }
                            }
                        }
                    } // column
                } // page
            } // delegate
        } // repeater
    }

    PageIndicator {
        id: indicator

        count: swipeView.count
        currentIndex: swipeView.currentIndex

        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        delegate:  Rectangle {
            implicitWidth: 15
            implicitHeight: 15

            radius: width
            color: Theme.topBarColor

            opacity: index === swipeView.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }
    }
}
