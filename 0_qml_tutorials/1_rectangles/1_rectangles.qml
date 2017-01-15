import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    id: root
    width: 320
    height: 240

    Image {
        width: root.width
        height: root.height
        id: idImageBackground
        source: "../images/batman.png"
        anchors.fill: root
    }

    Rectangle {
        id: idCurtain
        width: root.width
        height: root.height
        anchors.fill: root
        color: "orange"
    }

    MouseArea {
        anchors.fill: root
        onClicked: {
            console.log(idText.width)
        }
    }

    Rectangle {
        width: idText.width + 10
        height: idText.height * 2
        anchors.centerIn: idText
        radius: getRadius()
        border.width: 3
        gradient: Gradient {
            GradientStop { position: 0.0; color: "blue" }
            GradientStop { position: 0.5; color: "yellow" }
            GradientStop { position: 1.0; color: "white" }
        }

        function getRadius() {
            var radius = idText.width * 0.1
            console.log(radius)
            return radius
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log(idText.text)
                idText.text = composeText(idText.text)

                updateTransparency()
            }

            function composeText(oldText) {
                console.log(idText.width)
                if (idText.width > root.width / 2)
                    return "r "
                else
                    return oldText + " " + oldText
            }

            function updateTransparency() {
                if (idCurtain.color.a <= 0)
                    idCurtain.color.a = 1
                else
                    idCurtain.color.a -= 0.1
            }
        }
    }

    Text {
        id: idText
        anchors.centerIn: parent
        text: "wh"
    }
}
