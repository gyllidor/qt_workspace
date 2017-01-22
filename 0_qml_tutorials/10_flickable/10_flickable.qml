import QtQuick 2.6
import QtQuick.Window 2.2

Item {
    width: 640
    height: 320

    Flickable {
        width: parent.width
        height: parent.height
        contentWidth: parent.width * 2
        contentHeight: parent.width * 2
        interactive: true

        Image {
            id: idBackground
            anchors.fill: parent
            source: "../images/batman.png"
            sourceSize.width: parent.contentWidth
            sourceSize.height: parent.contentHeight
        }
    }
}
