import QtQuick 2.6

Rectangle {
    id: idRoot
    width: 320
    height: 240

    Image {
        id: idBackground
        anchors.fill: idRoot
        source: "../images/background.jpg"
        fillMode: Image.Stretch
    }

    Rectangle {
        id: idButton
        width: idRoot.width / 4
        height: idRoot.height / 6
        anchors.centerIn: idRoot
        radius: 4
        border.width: 4
        border.color: "blue"
        antialiasing: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "blue" }
            GradientStop { position: 0.5; color: "orange" }
            GradientStop { position: 1.0; color: "yellow" }
        }

        Text {
            id: idText
            clip: true
            text: "<b>boom</b>"
            color: "white"
            elide: Text.ElideRight
            anchors.centerIn: idButton
            font.capitalization: Font.Capitalize
            width: idButton.width
            height: idButton.height
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: Math.round(idButton.width / 6)
        }
    }
}
