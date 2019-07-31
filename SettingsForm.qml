import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import Qt.labs.settings 1.1
import Theme 1.0

Page {
    id: settings
    title: Theme.menuSettingsText
    padding: 10
    background: Rectangle {
        color: Theme.backgroundColor
    }

    ButtonGroup {
        id: group
        onClicked: {
            Theme.selectedTheme = column.state
        }
    }

    ColumnLayout {
        id: column

        Label {
            text: Theme.settingsSelectThemeText
        }


        RadioButton {
            id: radioButtonBoy
            text: Theme.settingsTheme1Text
            checked: Theme.selectedTheme === "t1"
            ButtonGroup.group: group
        }

        RadioButton {
            id: radioButtonGirl
            text: Theme.settingsTheme2Text
            checked: Theme.selectedTheme === "t2"
            ButtonGroup.group: group
        }

        RadioButton {
            id: radioButtonBoth
            text: Theme.settingsTheme3Text
            checked: Theme.selectedTheme !== "t1" && Theme.selectedTheme !== "t2"
            ButtonGroup.group: group
        }

        states: [
            State {
                name: "t1"
                when: radioButtonBoy.checked
            },
            State {
                name: "t2"
                when: radioButtonGirl.checked
            },
            State {
                name: "t3"
                when: radioButtonBoth.checked

            }
        ]

    }

}

