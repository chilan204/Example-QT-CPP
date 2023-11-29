import QtQuick 2.0

Item {
    id: root
    width: 410
    height: 80

    property string nameMusic
    property bool isCurrent

    Rectangle {
        anchors.fill: parent
        border.color: "black"
        color: "transparent"
    }

    Image {
        id: img
        width: 40
        height: 40
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 20
        }
        source: "qrc:/img/icon_music.png"
    }

    Text {
        id: name
        width: 310
        anchors {
            verticalCenter: parent.verticalCenter
            left: img.right
            leftMargin: 20
        }
        elide: Text.ElideRight
        text: root.nameMusic
        font.pixelSize: 20
        color: root.isCurrent ? "red" : "black"
    }
}
