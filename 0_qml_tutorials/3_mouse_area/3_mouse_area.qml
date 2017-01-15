import QtQuick 2.5

Rectangle {
    id: idRoot
    width: 320
    height: 240

    Image {
        id: idBackground
        source: "../images/background.jpg"
        anchors.fill: idRoot
    }

    property color topGradientColor: "yellow"
    property color bottomGradientColor: "green"
    property color tempColor: "black"

    Rectangle {
        id: idButton
        width: idRoot.width / 4
        height: idRoot.height / 6
        border.width: 4
        radius: 4
        anchors.centerIn: idRoot
        gradient: Gradient {
            GradientStop { position: 0.0; color: topGradientColor }
            GradientStop { position: 1.0; color: bottomGradientColor }
        }

        Text {
            id: idButtonText
            text: qsTr("push me")
            color: "black"
            anchors.centerIn: idButton
        }
    }

    MouseArea {
        id: idButtonMouseArea
        anchors.fill: idButton
        hoverEnabled: true
        drag.target: idButton
        drag.axis: Drag.XAndYAxis
        drag.smoothed: true
        drag.minimumX: 0
        drag.minimumY: 0
        drag.maximumX: idRoot.width - idButton.width
        drag.maximumY: idRoot.height - idButton.height
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MidButton

        onEntered: {
            idButton.border.color = "grey"
            idButton.border.width = 2
            idButtonMouseArea.cursorShape = Qt.CrossCursor
        }

        onExited: {
            idButton.border.color = "black"
            idButton.border.width = 4
        }

        onPressed: {
            swapGradientColors()
            idButton.anchors.centerIn = undefined
        }

        onReleased: {
            swapGradientColors()
            idButton.anchors.centerIn = idRoot
        }

        function swapGradientColors() {
            tempColor = topGradientColor
            topGradientColor = bottomGradientColor
            bottomGradientColor = tempColor
        }

        onClicked: {
            console.log("clicked")
        }
    }
}
