import QtQuick 2.0

Item {
    id: root
    width: 420
    height: 190

    property int currentIndex: 0
    property bool isPlaying: false

    Rectangle {
        id: duration
        width: 360
        height: 5
        radius: 5
        color: "white"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 30
        }
    }

    Rectangle {
        id: position
        width: 180
        height: 6
        radius: 5
        color: "cyan"
        anchors {
            left: duration.left
            verticalCenter: duration.verticalCenter
        }
    }

    Rectangle {
        id: time
        width: 16
        height: 16
        radius: 8
        anchors{
            verticalCenter: position.verticalCenter
            left: position.right
            leftMargin: -8
        }
        color: "cyan"
    }

    Image {
        id: playButton
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: duration.bottom
            topMargin: 50
        }
        source: playButton.sourceImg()
        sourceSize.width: 50
        sourceSize.height: 50
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                root.isPlaying = !root.isPlaying
            }
        }
        function sourceImg(){
            return "qrc:/img/" + (root.isPlaying ? "img_play.png" : "img_pause.png")
        }
    }

    Image {
        id: nextButton
        anchors {
            top: playButton.top
            left: playButton.right
            leftMargin: 50
        }
        source: "qrc:/img/img_next.png"
        sourceSize.width: 50
        sourceSize.height: 50
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                root.currentIndex = root.currentIndex == 7 ? 0 : (root.currentIndex + 1)
            }
        }
    }

    Image {
        id: preButton
        anchors {
            top: playButton.top
            right: playButton.left
            rightMargin: 50
        }
        source: "qrc:/img/img_previous.png"
        sourceSize.width: 50
        sourceSize.height: 50
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                root.currentIndex = root.currentIndex == 0 ? 7 : (root.currentIndex - 1)
            }
        }
    }
}
