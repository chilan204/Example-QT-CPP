import QtQuick 2.0

Item {
    id: root
    width: 300
    height: 40

    property string nameMusic

    Image {
        id: img
        width: 25
        height: 25
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 10
        }
        source: "qrc:/img/icon_music.png"
    }

    Text {
        id: name
        width: 240
        anchors {
            verticalCenter: parent.verticalCenter
            left: img.right
            leftMargin: 10
        }
        elide: Text.ElideRight
        text: root.nameMusic
    }
}
