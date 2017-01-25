import QtQuick 2.6
import QtQuick.Window 2.2

Item {
    id: idRoot
    width: 640
    height: 320
    focus: true

    Keys.onPressed: {
        if (event.key === Qt.Key_Up) {
            event.accepted = true
            idCthulhu.y = Math.max(0, idCthulhu.y - 20)
        }

        if (event.key === Qt.Key_Down) {
            event.accepted = true
            idCthulhu.y = Math.min(idFlick.contentHeight - idCthulhu.height, idCthulhu.y + 20)
        }

        if (event.key === Qt.Key_Left) {
            event.accepted = true
            idCthulhu.x = Math.max(0, idCthulhu.x - 20)
        }

        if (event.key === Qt.Key_Right) {
            event.accepted = true
            idCthulhu.x = Math.min(idFlick.contentWidth - idCthulhu.width, idCthulhu.x + 20)
        }
    }

    Flickable {
         id: idFlick
        anchors.fill: parent
        contentWidth: parent.width * 2
        contentHeight: parent.height * 2
        interactive: true
        boundsBehavior: Flickable.DragAndOvershootBounds
        contentY: Math.min(contentHeight - height, Math.max(0, idCthulhu.y - height / 2))
        contentX: Math.min(contentWidth - width, Math.max(0, idCthulhu.x - width / 2))

        Image {
            id: idBackground
            anchors.fill: parent
            source: "../images/batman.png"
            sourceSize.width: parent.contentWidth
            sourceSize.height: parent.contentHeight
        }

        Image {
            id: idCthulhu
            x: idRoot.width / 2
            y: idRoot.height / 2
            width: 60
            height: 60
            source: "../images/cthulhu.png"
        }
    }

}

//Flickable {
//    width: 150
//    height: 150
//    contentWidth: 300
//    contentHeight: 300

//    rebound: Transition {
//        NumberAnimation {
//            properties: "x,y"
//            duration: 1000
//            easing.type: Easing.OutBounce
//        }

//    }

//    Rectangle {
//        width: 300
//        height: 300

//        gradient: Gradient {
//            GradientStop { position: 0.0; color: "red" }
//            GradientStop { position: 1.0; color: "orange" }
//        }
//    }
//}
