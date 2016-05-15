import QtQuick 2.5

Image {
    id: background
    source: "../images/background.png"
    width: 400
    height: 600

    MouseArea {
        anchors.fill: parent
        onClicked: pin_wheel.rotation += 360
    }

    Image {
        id: aggregated_pinwheel
        anchors.fill: parent

        Component.onCompleted: {
            console.log("center_x")
        }

        Image {
            id: pole
            source: "../images/pole.gif"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            width: pin_wheel.width / 4
            height: pin_wheel.height
        }

        Image {
            id: pin_wheel
            source: "../images/pinwheel.png"
            width: background.width / 2
            height: background.width / 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Behavior on rotation {
                NumberAnimation {
                    duration: 1000
                }
            }
        }
    }
}