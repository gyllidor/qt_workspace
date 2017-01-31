import QtQuick 2.2

Rectangle {
    id: idRoot
    width: 360
    height: 240

    Image {
        anchors.fill: parent
        source: "../images/background.jpg"
    }

    Column {
        spacing: 4

        Row {
            spacing: 4

            Rectangle {
                color: "blue"
                width: idRoot.width / 3
                height: idRoot.height / 3
            }

            Rectangle {
                color: "yellow"
                width: idRoot.width / 3
                height: idRoot.height / 3
            }

            Rectangle {
                color: "red"
                width: idRoot.width / 3
                height: idRoot.height / 3
            }
        }

        Rectangle {
            id: idRectMove
            color: "purple"
            width: idRoot.width / 3
            height: idRoot.height / 3
        }
    }
}
