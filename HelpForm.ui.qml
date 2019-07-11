import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root
    title: qsTr("Help")
    padding: 10

    ScrollView {
        id: scrollView
        anchors.fill: parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        Text {
            id: element
            //anchors.fill: parent
            height: parent.height
            width: root.width - 35
            elide: Text.ElideLeft
            wrapMode: Text.WordWrap
            font.pixelSize: 14

            text: qsTr("--- Instructions ---
- Safety first !!!
- Never use headphones or high volume sounds with your baby.
- Never left the mobile phone unatended with your baby.
- Never left the mobile phone inside the baby crib (batteries are dangerous).
- Try all the sounds before using with your baby, check volume first!
- App Usage:
- Navigate through  each category of sound by swiping left.
- To preview a sound, tap a button with the desired sound.
- To add a sound to the playlist, tap and hold the selected sound button.
- On the bottom playbar select the play button to start playing.
- The loop button allows to select between the following play modes:
* infinite repetition.
* 5, 15, 30, 45, 60 minutes repetition.
- The volume slide bar controls the volume of the playlist being executed.
- The volume icon mute/unmute the playlist.
- To remove a sound from the playlist tap the playlist button (right far off button).
- Then tap and hold the button of the sound to be removed from the playlist.
- On the settings it is possible to change theme (colors).
- Hope you and your baby enjoy!
")

        }
    }
}
