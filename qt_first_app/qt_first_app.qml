import QtQuick 2.0
import QtQuick.Window 2.2

Window {
    id: main_window
    visible: true
    width: wolf_img.width
    height: wolf_img.height
    maximumHeight: wolf_img.height
    maximumWidth: wolf_img.width

    MouseArea {
        anchors.fill: parent
        onClicked:
        {
            wolf_img.rotation += 90
            zhenya.rotation -= 45
        }
    }

    Image {
        id: wolf_img
        source: "wolf.jpg"
        anchors.centerIn: parent


        Behavior on rotation {
            NumberAnimation {
                duration: 1000
            }
        }

    }

    Text {
        id: zhenya
        text: qsTr("Zhenia rotation")
        anchors.centerIn: parent
        color: "yellow"

        Behavior on rotation {
            NumberAnimation {
                duration: 200
            }
        }
    }
}
