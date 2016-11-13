import QtQuick 2.6
import QtQuick.Window 2.2

Window
{
    visible: true
    id: item_id
    width: 640
    height: 480

    Item {
        anchors.fill: parent

        Rectangle {
            objectName: "rect_name"
            id: rect_id
            color: "red"
            anchors.fill: parent
        }

        Text {
            id: text_id
            text: qsTr("wooo hooo")
            anchors.centerIn: parent
        }
    }
}

