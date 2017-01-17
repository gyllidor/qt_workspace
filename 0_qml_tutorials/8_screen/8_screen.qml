import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: idWindow
    visible: true
    width: 640
    height: 480
    minimumWidth: 320
    minimumHeight: 240

    Image {
        source: "../images/batman.png"
        anchors.fill: parent
    }

    Rectangle {
        id: idRect
        anchors.centerIn: parent
        width: parent.width / 2
        height: parent.height / 2
        color: "#50FF0005"
    }

    Text {
        id: idText
        text: "<b>" + getText() + "</b>"
        anchors.top: idRect.bottom
        anchors.horizontalCenter: idRect.horizontalCenter
        color: "#FF0000"
        font.pixelSize: 16
    }

    function getText() {
        var w = Screen.width
        var h = Screen.height
        var r = w + " " + h

        console.log(r)
        return r
    }

    MouseArea {
        anchors.fill: idText
        property int increaser: 2

        onClicked: {
            console.log("click click")

            idText.font.pixelSize = getFontSize()
        }

        function getFontSize() {
            var size = idText.font.pixelSize

            if (size > 36) increaser = -2
            if (size < 8) increaser = 2

            console.log(size)
            var newSize = size + increaser
            console.log(newSize)
            return newSize
        }
    }
}
