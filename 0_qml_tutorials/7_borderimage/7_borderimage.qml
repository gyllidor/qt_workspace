import QtQuick 2.6

Rectangle {
    id: idRoot
    width: 640
    height: 480

    property string urlImage: "../images/grid.png"

    BorderImage {
        id: idBorderImage
        source: urlImage
        width: parent.width / 3
        height: parent.width / 3
        border.left: 25; border.top: 25
        border.right: 25; border.bottom: 25

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Round
    }

    Image {
        id: idImage
        source: urlImage
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width / 3
        height: parent.width / 3
    }
}
