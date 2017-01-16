import QtQuick 2.6

Rectangle {
    id: idRoot
    width: 320
    height: 240
    color: "lightblue"

    Image {
        id: idImage
        source: "http://cdn4.designbyhumans.com/product/design/u213523/pr70212-2-1192454-190x285-b-p.jpg"
        sourceSize.width: parent.width / 3
        sourceSize.height: parent.height / 2
        anchors.centerIn: parent
        mirror: true

//        onProgressChanged: {
//            if (progress < 1)
//                idText.text = "in progress"

//            if (progress === 1)
//                idText.text = "loaded"
//        }

        onStatusChanged: {
            switch(idImage.status)
            {
            case Image.Null:
                idText.text = "no image"; break

            case Image.Ready:
                idText.text = "image loaded"; break

            case Image.Loading:
                idText.text = "image loading"; break

            case Image.Error:
                idText.text = "erro occurred"; break
            }
        }
    }

    Text {
        id: idText
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: idImage.top
            margins: 10
        }
    }
}
