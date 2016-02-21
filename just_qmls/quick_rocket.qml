import QtQuick 2.0

Rectangle {
    id : root
    width : 200; height : 350
    color : "#BB8BB8"

    Image {
        id : rocket
        x : (root.width - width) / 2; y : 40
        source : '../images/rocket.png'
    }

    Text {
        y : rocket.x + rocket.height + 20
        width : root.width
        horizontalAlignment : Text.AlignHCenter
        text : 'Rocket'
        color : "green"
    }
}
