import QtQuick 2.4

Rectangle {
    id: idRoot
    width: getRandomSize()
    height: getRandomSize()
    focus: true

    property int rowHeight: idRoot.height / 3
    property int columnWidth: idRoot.width / 3

    function getRandomSize() {
        var value = Math.random() * 1000
        var size = Math.round(Math.max(100, Math.min(1000, Math.random() * 1000)))
        console.log("size " + size)
        return size
    }

    Keys.onSpacePressed: {
        id00.focus = true
        console.log("space pressed " + id00.activeFocus)
        console.log("space pressed " + idRoot.width + " " + idRoot.height)
    }

    Column {
        spacing: 2

        Row {
            id: idRow0
            spacing: 2

            FocusedRect {
                id: id00
                rectHeight: rowHeight
                rectWidth: columnWidth
                KeyNavigation.left: id02
                KeyNavigation.right: id01
                KeyNavigation.up: id20
                KeyNavigation.down: id10
            }

            FocusedRect {
                id: id01
                rectHeight: rowHeight
                rectWidth: columnWidth
                KeyNavigation.left: id00
                KeyNavigation.right: id02
                KeyNavigation.up: id21
                KeyNavigation.down: id11
            }

            FocusedRect {
                id: id02
                rectHeight: rowHeight
                rectWidth: columnWidth
                KeyNavigation.left: id01
                KeyNavigation.right: id00
                KeyNavigation.up: id22
                KeyNavigation.down: id12
            }
        }

        Row {
            id: idRow1
            spacing: 2

            FocusedRect {
                id: id10
                rectHeight: rowHeight
                rectWidth: columnWidth
                KeyNavigation.left: id12
                KeyNavigation.right: id11
                KeyNavigation.up: id00
                KeyNavigation.down: id20
            }

            FocusedRect {
                id: id11
                rectHeight: rowHeight
                rectWidth: columnWidth
                KeyNavigation.left: id10
                KeyNavigation.right: id12
                KeyNavigation.up: id01
                KeyNavigation.down: id21
            }

            FocusedRect {
                id: id12
                rectHeight: rowHeight
                rectWidth: columnWidth
                KeyNavigation.left: id11
                KeyNavigation.right: id10
                KeyNavigation.up: id02
                KeyNavigation.down: id22
            }
        }

        Row {
            id: idRow2
            spacing: 2

            FocusedRect {
                id: id20
                rectHeight: rowHeight
                rectWidth: columnWidth
                KeyNavigation.left: id22
                KeyNavigation.right: id21
                KeyNavigation.up: id10
                KeyNavigation.down: id00
            }

            FocusedRect {
                id: id21
                rectHeight: rowHeight
                rectWidth: columnWidth
                KeyNavigation.left: id20
                KeyNavigation.right: id22
                KeyNavigation.up: id11
                KeyNavigation.down: id01
            }

            FocusedRect {
                id: id22
                rectHeight: rowHeight
                rectWidth: columnWidth
                KeyNavigation.left: id21
                KeyNavigation.right: id20
                KeyNavigation.up: id12
                KeyNavigation.down: id02
            }
        }
    }


}
