import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    visible: true
    width: 430
    height: 730
    title: qsTr("Media Player")

    Rectangle {
        id: background
        width: 420
        height: 720
        anchors.centerIn: parent
        color: "lavender"
        border.color: "blue"
        border.width: 1
    }

    Text {
        id: title
        text: qsTr("MEDIA PLAYER")
        font.pixelSize: 25
        font.bold: true
        anchors {
            horizontalCenter: background.horizontalCenter
            top: background.top
            topMargin: 25
        }
    }

    Image {
        id: listButton
        width: 30
        height: 30
        anchors {
            verticalCenter: title.verticalCenter
            right: background.right
            rightMargin: 30
        }
        source: "qrc:/img/img_list.png"
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                listMusic.visible = !listMusic.visible
            }
        }
    }

    InfoMusic {
        id: infoMusic
        anchors {
            top: background.top
            topMargin: 80
            left: background.left
        }
    }

    PlayMusic {
        id: playMusic
        anchors {
            top: infoMusic.bottom
            left: infoMusic.left
        }
    }

    ListMusic {
        id: listMusic
        anchors {
            top: background.top
            topMargin: 80
            horizontalCenter: background.horizontalCenter
        }
        visible: false
    }
}
