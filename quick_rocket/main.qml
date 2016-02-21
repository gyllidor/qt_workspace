import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    id: root
    width: rectangle.width
    height: rectangle.height
    title: rocket

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Rectangle {
        id : rectangle
        width : rocket.width; height : text_rocket.height + text_rocket.y
        color : "#BB8BB8"

        Image {
            id : rocket
            source : '../images/rocket.png'
        }

        Text {
            id: text_rocket
            y : rocket.x + rocket.height + 20
            width : rectangle.width
            horizontalAlignment : Text.AlignHCenter
            text : 'Rocket'
            color : "green"
        }
    }
}
