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
        width: idText.width
        height: idText.height
        radius: 20
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#F00000" }
            GradientStop { position: 0.16; color: "#0F0000" }
            GradientStop { position: 0.32; color: "#00F000" }
            GradientStop { position: 0.48; color: "#000F00" }
            GradientStop { position: 0.64; color: "#0000F0" }
            GradientStop { position: 1.0; color: "#00000F" }
        }

        Drag.active: true
    }

    Text {
        id: idText
        text: getText()
        anchors.top: idRect.top
        anchors.horizontalCenter: idRect.horizontalCenter
        color: "white"
        font.pixelSize: 16
        padding: 20
        Drag.active: true
    }

    function getText() {
        var w = Screen.width
        var h = Screen.height
        var r = w + " " + h
        var add = "Screen.name " + Screen.name
                + "\nScreen.orientation " + Screen.orientation
                + "\nScreen.desktopAvailableHeight " + Screen.desktopAvailableHeight
                + "\nScreen.desktopAvailableWidth " + Screen.desktopAvailableWidth
                + "\nScreen.logicalPixelDensity " + Screen.logicalPixelDensity
                + "\nScreen.pixelDensity " + Screen.pixelDensity
                + "\nScreen.primaryOrientation " + Screen.primaryOrientation
                + "\nScreen.devicePixelRatio " + Screen.devicePixelRatio

        console.log(r)
        return r + "\n" + add
    }

    MouseArea {
        anchors.fill: idText
        property int increaser: 2

        drag.target: idRect
        drag.axis: Drag.XAndYAxis
        drag.minimumX: 0
        drag.minimumY: 0
        drag.maximumX: idWindow.width - idRect.width
        drag.maximumY: idWindow.height - idRect.height

        onPressed: {
            idRect.anchors.centerIn = undefined
        }

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
