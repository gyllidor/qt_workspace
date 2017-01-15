import QtQuick 2.5

Rectangle {
    id: idWindow
    width: 320
    height: 240
    color: "yellow"

    Image {
        id: idBackground
        anchors.fill: idWindow
        source: "../images/background.jpg"
    }

    MyButton {
        anchors.centerIn: idWindow
        width: idWindow.width / 4
        height: idWindow.height / 6
        btnColor: "yellow"
        btnBorderColor: "purple"
        btnTextColor: "bisque"
        btnBorderWidth: 2
        btnRadius: 12
        btnText: "pew wep"
        btnFontPixelSize: width * 0.15
    }
}
