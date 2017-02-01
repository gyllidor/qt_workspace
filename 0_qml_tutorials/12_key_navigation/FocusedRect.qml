import QtQuick 2.0

Item {
    width: rectWidth
    height: rectHeight

    property int rectWidth: 100
    property int rectHeight: 100
    property bool rectFocused: focus

    function getColor(focused) {
//        console.log("getColor")
        return focused ? Qt.rgba(Math.random(), Math.random(), Math.random(), Math.random()) : "grey"
    }

    function getRadius(focused) {
//        console.log("getRadius " + Math.random())
        return focused ? Math.random() * 100 : 0
    }

    Rectangle {
        anchors.fill: parent
        color: getColor(parent.focus)
        radius: getRadius(parent.focus)
    }
}
