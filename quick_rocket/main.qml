import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    id: root
    width: rectangle.width
    height: rectangle.height
    title: 'Rocket'
    minimumHeight: rocket.height
    minimumWidth: rocket.width
    maximumHeight: Screen.height
    maximumWidth: Screen.width

    onHeightChanged: rectangle.height = height
    onWidthChanged: rectangle.width = width, console.log ( 'height:' , rectangle.height )


    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }

        onWheel: {
            console.log ( 'height: ' + rectangle.height + ' width: ' + rectangle.width)
            console.log ( 'text height:' , text_rocket.height )
            console.log ( 'rocket height:' , rocket.height )
        }
    }

    Rectangle {
        id : rectangle
        width: rocket.width
        height: rocket.height + text_rocket.height
        color : "#BB8BB8"

        Image {
            id : rocket
            source : '../images/rocket.png'
            anchors.centerIn: rectangle
        }

        Text {
            id: text_rocket
            anchors.top: rocket.bottom
            height: 24
            width : rectangle.width
            horizontalAlignment : Text.AlignHCenter
            text : 'Rocket'
            color : "green"
        }
    }
}

