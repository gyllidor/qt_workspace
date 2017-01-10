import QtQuick 2.5

Rectangle {
    width: 320
    height: 240

    Text {
        id: idText
        anchors.centerIn: parent
        text: qsTr("<b>Hello Gyll</b>")
        font.underline: true
        font.italic: true
        font.pixelSize: 26
        color: "red"
        textFormat: Text.StyledText
    }

    Grid {
        columns: 2
        spacing: 10
        anchors.fill: parent
        Text { font.pointSize: 24; text: "Normal" }
        Text { font.pointSize: 24; text: "Raised"; style: Text.Raised; styleColor: "#AAAAAA" }
        Text { font.pointSize: 24; text: "Outline"; style: Text.Outline; styleColor: "yellow" }
        Text { font.pointSize: 24; text: "Sunken"; style: Text.Sunken; styleColor: "blue" }
    }

    MouseArea {
        id: idMouseArea
        anchors.fill: parent
        onClicked: {
            console.log("quit")
            Qt.quit();
        }
    }
}

