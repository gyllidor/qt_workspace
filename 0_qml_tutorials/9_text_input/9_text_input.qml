import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    title: "Text input"
    width: Screen.width / 2
    height: Screen.height / 4
    x: Screen.width / 2 - this.width / 2
    y: Screen.height / 2 - this.height / 2

    Rectangle {
        id: idMainRect
        anchors.fill: parent
        color: "black"

        Rectangle {
            id: idTopRect
            width: parent.width
            height: parent.height / 4
            gradient: Gradient {
                GradientStop { position: 0.0; color: "red" }
                GradientStop { position: 1.0; color: "yellow" }
            }
        }

        Rectangle {
            id: idBottomRect
            gradient: Gradient {
                GradientStop { position: 0.0; color: "yellow" }
                GradientStop { position: 1.0; color: "red" }
            }

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: idTopRect.bottom
            anchors.bottom: parent.bottom
        }
    }

    Text {
        id: idHint
        anchors.horizontalCenter: idMainRect.horizontalCenter
        anchors.top: idMainRect.top
        padding: 10
        text: "enter some pew pew:"
        color: "blue"
    }

    Rectangle {
        id: idTextInputRect
        width: getRectWidth()
        height: idTextInput.contentHeight
        anchors.top: idHint.bottom
        anchors.horizontalCenter: idHint.horizontalCenter

        TextInput {
            id: idTextInput
            anchors.fill: parent
            color: "black"
            autoScroll: true
            cursorVisible: true
            selectByMouse: true
            focus: true
            font.pixelSize: 30

            horizontalAlignment: TextInput.AlignLeft

            onAccepted: idEnteredText.text = "pew: " + selectedText
        }

        function getRectWidth() {
            if (idTextInput.contentWidth === 0)
                return 30

            return idTextInput.contentWidth
        }
    }

    Text {
        id: idEnteredText
        anchors.top: idTextInputRect.bottom
        padding: 20
    }
}
