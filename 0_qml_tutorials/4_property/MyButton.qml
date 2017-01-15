import QtQuick 2.5

Item {
    id: idButton

    property string btnColor
    property string btnBorderColor
    property string btnTextColor
    property string btnText
    property int btnBorderWidth
    property int btnRadius
    property int btnFontPixelSize

    Rectangle {
        id: idBtnRect
        width: idButton.width
        height: idButton.height
        color: idButton.btnColor
        border.width: idButton.btnBorderWidth
        border.color: idButton.btnBorderColor
        radius: idButton.btnRadius

        Text {
            id: idBtnText
            anchors.centerIn: idBtnRect
            text: idButton.btnText
            color: idButton.btnTextColor
            font.pixelSize: idButton.btnFontPixelSize
        }

        MouseArea {
            id: idBtnMouseArea
            anchors.fill: idBtnRect
            hoverEnabled: true

            onEntered: {
                idBtnRect.scale = 1.1
                idBtnRect.color = Qt.lighter(idBtnRect.color, 1.3)
            }

            onExited: {
                idBtnRect.scale = 1
                idBtnRect.color = idButton.btnColor
            }

            onClicked: {
                console.log("pew pew")
            }

        }
    }

}
