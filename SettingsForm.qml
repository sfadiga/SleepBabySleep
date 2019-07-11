import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.1
import Theme 1.0

Page {
    id: settings

    title: qsTr("Settings")

    padding: 10

    ButtonGroup {
        id: group
        onClicked: {
            Theme.selectedTheme = column.state
        }
    }

    ColumnLayout {
        id: column

        Label {
            text: qsTr("Select a theme:")
        }


        RadioButton {
            id: radioButtonBoy
            text: qsTr("Theme 1")
            checked: Theme.selectedTheme === "boy"
            ButtonGroup.group: group
        }

        RadioButton {
            id: radioButtonGirl
            text: qsTr("Theme 2")
            checked: Theme.selectedTheme === "girl"
            ButtonGroup.group: group
        }

        RadioButton {
            id: radioButtonBoth
            text: qsTr("Theme 3")
            checked: Theme.selectedTheme !== "boy" && Theme.selectedTheme !== "girl"
            ButtonGroup.group: group
        }

        states: [
            State {
                name: "boy"
                when: radioButtonBoy.checked
            },
            State {
                name: "girl"
                when: radioButtonGirl.checked
            },
            State {
                name: "both"
                when: radioButtonBoth.checked

            }
        ]

    }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
