import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 720
    height: 480
    title: qsTr("BT_1_NCL")

    Rectangle {
        id: khung
        width: 600
        height: 360
        color: "lavender"
        border.color: "blue"
        border.width: 1
    }

    Rectangle {
        id: tgian
        x: 60
        y: 250
        width: 480
        height: 5
        color: "cyan"
        border.color: "blue"
        border.width: 1
    }

    Rectangle {
        id: hinhanh
        x: 100
        y: 50
        width: 400
        height: 180
        color: "white"
        border.color: "blue"
        Image {
            id: img1
            source: "qrc:/img/img1.png"
            anchors.fill: hinhanh
        }
    }

    Image {
        id: img_play
        x: 275
        y: 275
        source: "qrc:/img/img_play.png"
        sourceSize.width: 50
        sourceSize.height: 50
        MouseArea {
            anchors.fill: img_play
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                img_play.source = (img_play.source == "qrc:/img/img_play.png" ? "qrc:/img/img_pause.png" : "qrc:/img/img_play.png")
            }
        }
    }

    Image {
        id: img_next
        x: 375
        y: 275
        source: "qrc:/img/img_next.png"
        sourceSize.width: 50
        sourceSize.height: 50
        MouseArea {
            anchors.fill: img_next
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
        }
    }

    Image {
        id: img_previous
        x: 175
        y: 275
        source: "qrc:/img/img_previous.png"
        sourceSize.width: 50
        sourceSize.height: 50
        MouseArea {
            anchors.fill: img_previous
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
        }
    }
}
