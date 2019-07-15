
pragma Singleton

import QtQuick 2.12


QtObject {
    id: theme

    property string themeSelect: "boy"
    property alias selectedTheme: theme.themeSelect

    readonly property color categoryTitleColor: "bisque"
    readonly property color playbarIconColor: "black"

    readonly property color backgroundColor:
    if (theme.themeSelect === "boy"){
        "aliceblue"
    } else if (theme.themeSelect === "girl"){
        "antiquewhite"
    } else {
        "lightcyan"
    }

    readonly property color topBarColor:
    if (theme.themeSelect === "boy"){
        "royalblue"
    } else if (theme.themeSelect === "girl"){
        "lightsalmon"
    } else {
        "gold"
    }

    readonly property color playBarColor:
    if (theme.themeSelect === "boy"){
        topBarColor
    } else if (theme.themeSelect === "girl"){
        topBarColor
    } else {
        topBarColor
    }

    readonly property color menuBackgroundColor:
    if (theme.themeSelect === "boy"){
        Qt.lighter(topBarColor)
    } else if (theme.themeSelect === "girl"){
        Qt.lighter(topBarColor)
    } else {
        Qt.lighter(topBarColor)
    }

    readonly property color buttonBackgroundColor:
    if (theme.themeSelect === "boy"){
        "paleturquoise"
    } else if (theme.themeSelect === "girl"){
        "bisque"
    } else {
        "gold"
    }

    readonly property color playlistPaneColor:
    if (theme.themeSelect === "boy"){
        Qt.lighter(playBarColor)
    } else if (theme.themeSelect === "girl"){
        Qt.lighter(playBarColor)
    } else {
        Qt.lighter(playBarColor)
    }

}
