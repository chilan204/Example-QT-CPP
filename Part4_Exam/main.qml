import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    visible: true
    width: 720
    height: 480
    title: qsTr("BT_1_NCL")

    property bool isPlay: false

    Rectangle {
        id: box
        width: 600
        height: 360
        anchors.centerIn: parent
        color: "lavender"
        border.color: "blue"
        border.width: 1
    }

    Image {
        id: img
        width: 400
        height: 180
        anchors.horizontalCenter: box.horizontalCenter
        anchors.top: box.top
        anchors.topMargin: 40
        source: "qrc:/img/img1.png"
    }

    Rectangle {
        id: duration
        width: 480
        height: 5
        anchors.horizontalCenter: box.horizontalCenter
        anchors.top: img.bottom
        anchors.topMargin: 20
        radius: 5
        color: "cyan"
        border.color: "blue"
        border.width: 1
    }

    Image {
        id: playButton
        anchors.horizontalCenter: box.horizontalCenter
        anchors.top: duration.bottom
        anchors.topMargin: 30
        source: playButton.sourceImg()
        sourceSize.width: 50
        sourceSize.height: 50
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                isPlay = !isPlay
            }
        }
        function sourceImg(){
            return "qrc:/img/" + (isPlay ? "img_play.png" : "img_pause.png")
        }
    }

    Image {
        id: nextButton
        anchors.top: playButton.top
        anchors.left: playButton.right
        anchors.leftMargin: 50
        source: "qrc:/img/img_next.png"
        sourceSize.width: 50
        sourceSize.height: 50
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
        }
    }

    Image {
        id: preButton
        anchors.top: playButton.top
        anchors.right: playButton.left
        anchors.rightMargin: 50
        source: "qrc:/img/img_previous.png"
        sourceSize.width: 50
        sourceSize.height: 50
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
        }
    }

    ListMusic {
        id: listMusic
        anchors {
            top: box.top
            topMargin: 10
            right: box.right
            rightMargin: 10
        }
        visible: false
    }

    Image {
        id: listButton
        width: 25
        height: 25
        anchors {
            top: box.top
            topMargin: 25
            right: box.right
            rightMargin: 25
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
}
