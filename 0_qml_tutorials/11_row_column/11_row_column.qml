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
            id: idRow
            spacing: 4
            focus: true
            Keys.onSpacePressed: {
                idYellowRect.visible = !idYellowRect.visible
            }

            move: Transition {
                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                }
            }

            add: Transition {
                NumberAnimation {
                    properties: "x,y"
                    duration: 2000
                }
            }

            Rectangle {
                color: "blue"
                width: idRoot.width / 3
                height: idRoot.height / 3
            }

            Rectangle {
                id: idYellowRect
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
    }
}
