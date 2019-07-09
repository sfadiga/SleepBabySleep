
pragma Singleton

import QtQuick 2.12

QtObject {
    id: theme

    property string themeSelect: "girl"

    readonly property color categoryTitleColor: "bisque"

    readonly property color playbarIconColor: "black"

    readonly property color plalistPaneColor: "gray"

    readonly property color backgroundColor:
    if (theme.themeSelect === "boy"){
        "beige"
    } else if (theme.themeSelect === "girl"){
        "antiquewhite"
    } else {
        "lightcyan"
    }

    readonly property color topBarColor:
    if (theme.themeSelect === "boy"){
        "darkkhaki"
    } else if (theme.themeSelect === "girl"){
        "lightsalmon"
    } else {
        "gold"
    }

    readonly property color playBarColor:
    if (theme.themeSelect === "boy"){
        "darkkhaki"
    } else if (theme.themeSelect === "girl"){
        "lightsalmon"
    } else {
        "gold"
    }

    readonly property color menuBackgroundColor:
    if (theme.themeSelect === "boy"){
        "khaki"
    } else if (theme.themeSelect === "girl"){
        "lightpink"
    } else {
        "lightgold"
    }

    readonly property color buttonBackgroundColor:
    if (theme.themeSelect === "boy"){
        "antiquewhite"
    } else if (theme.themeSelect === "girl"){
        "bisque"
    } else {
        "gold"
    }


}
