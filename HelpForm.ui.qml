import QtQuick 2.12
import QtQuick.Controls 2.12
import Theme 1.0

Page {
    id: root
    title: qsTr("Help")
    padding: 10
    background: Rectangle {
        color: Theme.backgroundColor
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        contentWidth: helpText.width
        Text {
            id: helpText
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            width: scrollView.width - 30
            text: qsTr("<h2><strong>Instructions</strong></h2>
<h3><span style=\"color: #ff0000;\">Safety First!</span></h3>
<ul>
<li><strong>Never</strong> use headphones or high volume sounds with your baby.</li>
<li><strong>Never</strong> left the device unatended with your baby.</li>
<li><strong>Never</strong> left the device inside the baby crib (batteries are dangerous).</li>
<li>Try all the sounds before using with your baby, <strong>check volume first</strong>!</li>
</ul>
<h3>App Usage</h3>
<ul>
<li><strong>Beware that this App while running will keep your device awake (screen on).</strong></li>
<li>Navigate through each category of sound by <strong>swiping left.</strong></li>
<li>To preview a sound, <strong>tap</strong> a button with the desired sound.</li>
<li>To add a sound to the playlist, <strong>tap and hold</strong> the selected sound button.</li>
<li>On the bottom playbar select the play button to start playing.</li>
<li>The <strong>loop</strong> button allows to select between the following play modes:
<ul>
<li>Infinite repetition.</li>
<li>5, 15, 30, 45, 60 minutes repetition.</li>
</ul>
</li>
<li>The <strong>volume slider</strong> controls the volume of the playlist being executed.</li>
<li>The <strong>volume icon</strong> mute/unmute the playlist.</li>
<li>To remove a sound from the playlist tap the <strong>playlist button</strong> (right far off button).</li>
<li>Then <strong>tap and hold</strong> the button of the sound to be removed from the playlist.</li>
<li>On the settings it is possible to change theme (colors).</li>
<li>The App saves the selected theme and the sounds selected on the playlist.</li>
</ul>
<h3><em><span style=\"color: #3366ff;\">Hope you and your baby enjoy!</span></em></h3>")
        }
    }
}
