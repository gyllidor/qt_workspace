import QtQuick 2.6

Rectangle {
    id: idRoot
    width: 320
    height: 240

    Image {
        id: idBackground
        source: "../images/background.jpg"
        anchors.fill: idRoot
    }

    MyButton {
        width: idRoot.width / 4
        height: idRoot.height / 6
        anchors.centerIn: parent
        btnColor: "orange"
        btnText: "push me"

        onBtnClicked: {
            console.log("woohoo, I`m a signal")
        }
    }
}
