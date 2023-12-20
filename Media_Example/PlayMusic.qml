import QtQuick 2.0

Item {
    id: root
    width: 420
    height: 190

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
        width: 0
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
        color: "cyan"
        anchors{
            verticalCenter: position.verticalCenter
            left: position.right
            leftMargin: -8
        }
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
                CTRL.isPlaying ? CTRL.pause() : CTRL.play()
                positionAni.start()
            }
        }
        function sourceImg(){
            return "qrc:/img/" + (CTRL.isPlaying ? "img_play.png" : "img_pause.png")
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
                CTRL.next()
                positionAni.restart()
                if ( !CTRL.isPlaying ) positionAni.pause()
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
                CTRL.pre()
                positionAni.restart()
                if ( !CTRL.isPlaying ) positionAni.pause()
            }
        }
    }

    NumberAnimation {
        id: positionAni
        target: position
        property: "width"
        from: 0
        to: 360
        duration: CTRL.duration
        running: true
        loops: Animation.Infinite
    }
}
