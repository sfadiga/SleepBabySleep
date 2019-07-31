
pragma Singleton

import QtQuick 2.13


QtObject {
    id: theme

    property string applicationTitle: qsTr("Baby Whisperer")
    property string menuSettingsText: qsTr("Settings")
    property string menuHelpText: qsTr("Help")
    property string menuAboutText: qsTr("About")
    property string playlistText: qsTr("Playlist: %1")
    property string playlistEmptyText: qsTr("Is empty!")

    property string settingsSelectThemeText: qsTr("Select a theme:")
    property string settingsTheme1Text: qsTr("Theme #1")
    property string settingsTheme2Text: qsTr("Theme #2")
    property string settingsTheme3Text: qsTr("Theme #3")

    property string playingMessage: qsTr("Executing the playlist !")


    property string aboutText: qsTr("<p>This is an <strong>App</strong> from a parent to parents,&nbsp; it tries to help people desperate to put their babies to sleep! :)</p>
                                        <p>The App was developed in <strong><em>Qt/QML</em></strong>&nbsp;-<strong> <span style=\"color: #3366ff;\">https://www.qt.io/</span></strong></p>
                                        <p>The source code is available at:&nbsp;<strong><span style=\"color: #3366ff;\">https://github.com/sfadiga/TheBabyProject</span></strong></p>
                                        <p><span style=\"color: #ff0000;\"><strong>Disclaimer:</strong></span> <span style=\"text-decoration: underline;\"><em>Use by your own, <strong>I will not be responsible </strong>for anything wrong that you may come to do with this App.</em></span></p>
                                        <h4><span style=\"color: #3366ff;\"><strong><em>Sandro Fadiga, Baby Whisperer, Jul/2019.</em></strong></span></h4>")

    property string helpText: qsTr("<h2><strong>Instructions</strong></h2>
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
                                    <li>To preview a sound: <strong>tap</strong> the icon to play then <strong>tap</strong> again to stop.</li>
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

    property string themeSelect: "t1"
    property alias selectedTheme: theme.themeSelect

    readonly property color mainWindowLabelColor: Qt.lighter(topBarColor)
    readonly property color mainWindowLabelStyleColor: Qt.darker(topBarColor)

    readonly property color categoryTitleColor: backgroundColor
    readonly property color playbarIconColor: "black"

    readonly property color playbarLoopForegroundColor: "darkslategray"
    readonly property color playbarLoopProgressColor: "lightgreen"

    readonly property color playbarSliderColor: "lightgray"
    readonly property color playbarSliderBackgroundColor: Qt.darker("darkgray")

    readonly property color playbarSliderHandlerPressedColor: "#f0f0f0"
    readonly property color playbarSliderHandlerNormalColor:"#f6f6f6"
    readonly property color playbarSliderHandlerBorderColor:"#bdbebf"

    readonly property color playlistPopupLabelStyleColor: "black"
    readonly property color playlistPopupLabelColor: "white"

    readonly property color labelSelectedColor: "red"

    readonly property color topBarColor:
    if (theme.themeSelect === "t1"){
        "#64B5F6"
    } else if (theme.themeSelect === "t2"){
        "#F8BBD0"
    } else {
        "#FFD54F"
    }

    readonly property color backgroundColor:
    if (theme.themeSelect === "t1"){
        "#E1F5FE"
    } else if (theme.themeSelect === "t2"){
        "#FFEBEE"//"#F9FBE7"
    } else {
        "#FFF9C4"
    }

    readonly property color playBarColor:
    if (theme.themeSelect === "t1"){
        "#4FC3F7"
    } else if (theme.themeSelect === "t2"){
        "#FFCDD2"
    } else {
        "#FFF176"
    }

    readonly property color menuBackgroundColor:
    if (theme.themeSelect === "t1"){
        Qt.lighter(topBarColor)
    } else if (theme.themeSelect === "t2"){
        "antiquewhite"
    } else {
        "moccasin"
    }

    readonly property color buttonBackgroundColor:
    if (theme.themeSelect === "t1"){
        "#BBDEFB" //#B3E5FC
    } else if (theme.themeSelect === "t2"){
        "#FCE4EC"//"#FFEBEE"
    } else {
        "#F0F4C3"
    }
    readonly property color buttonBackgroundSelectedColor: "red"

    readonly property color playlistPaneColor:
    if (theme.themeSelect === "t1"){
        Qt.lighter(playBarColor)
    } else if (theme.themeSelect === "t2"){
        "antiquewhite"
    } else {
        Qt.lighter("gold")
    }

}
