import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
        }
    }

    ListModel {
        id: idModel

        ListElement {
            name: "test"
        }
    }

    function getWidth() {
        return 50
    }

    ListView {
        id: idListView
        orientation: ListView.Vertical
        spacing: 2
        anchors.fill: parent
        model: idModel
        removeDisplaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 100 }
        }

        addDisplaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 100 }
        }

        delegate: Rectangle {
            id: idTab
            width: 100
            height: 20
            color: focus ? "yellow" : "red"


            onFocusChanged: {
                console.log("onFocus")
                idTab.color = idTab.focus ? Qt.darker("yellow") : "red"
            }

            Text {
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                text: name
            }
        }

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

            onClicked: {

                var itemIdx = idListView.indexAt(mouseX, mouseY)
                if (itemIdx === -1)
                    return

                if (mouse.button === Qt.LeftButton) {
                    idListView.currentIndex = itemIdx
                }

                if (mouse.button === Qt.MiddleButton) {
                    idModel.insert(itemIdx + 1, {"name": idListView.itemAt(mouseX, mouseY).focus ? idModel.get(itemIdx).name : "woohoo" })
                }

                if (mouse.button === Qt.RightButton) {
                    idModel.remove(idListView.indexAt(mouseX, mouseY), 1)
                    if (idListView.count === 0)
                        idModel.append({"name": "new" })
                }
            }
        }
    }
}
