import QtQuick 2.0

Item {
    id: idMyButton

    property string btnColor
    property string btnText

    signal btnClicked

    Rectangle {
        width: parent.width
        height: parent.height
        color: btnColor

        Text {
            anchors.centerIn: parent
            text: btnText
        }

        MouseArea {
            anchors.fill: parent

            onPressed: {
                parent.color = "red"
            }

            onReleased: {
                parent.color = btnColor
            }

            onClicked: {
                console.log("click")
                btnClicked()
            }
        }
    }
}
