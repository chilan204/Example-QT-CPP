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
        width: time.x - (30 - time.width / 2)
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
        x: 30 - time.width / 2 + (CTRL.duration == 0 ? 0 : duration.width * CTRL.position / CTRL.duration)
        width: 20
        height: 20
        radius: 10
        color: "cyan"
        border.color: "white"
        border.width: 2
        anchors.verticalCenter: position.verticalCenter
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: {
                parent.scale = 1
                CTRL.setPositionfromUI((time.x - (30 - time.width / 2)) / duration.width)
            }
            drag.target: parent
            drag.minimumX: 30 - time.width / 2
            drag.maximumX: 30 - time.width / 2 + duration.width
        }
    }

    Image {
        id: playButton
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: dur.bottom
            topMargin: 25
        }
        source: "qrc:/img/" + (CTRL.isPlaying ? "img_pause.png" : "img_play.png")
        sourceSize.width: 40
        sourceSize.height: 40
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                CTRL.isPlaying ? CTRL.pause() : CTRL.play()
            }
        }
    }

    Image {
        id: nextButton
        anchors {
            top: playButton.top
            left: playButton.right
            leftMargin: 40
        }
        source: "qrc:/img/img_next.png"
        sourceSize.width: 40
        sourceSize.height: 40
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                CTRL.next()
            }
        }
    }

    Image {
        id: preButton
        anchors {
            top: playButton.top
            right: playButton.left
            rightMargin: 40
        }
        source: "qrc:/img/img_previous.png"
        sourceSize.width: 40
        sourceSize.height: 40
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                CTRL.pre()
            }
        }
    }

    Image {
        id: repeatButton
        anchors {
            top: playButton.top
            left: nextButton.right
            leftMargin: 40
        }
        source: "qrc:/img/img_repeat.png"
        sourceSize.width: 40
        sourceSize.height: 40
        opacity: CTRL.isRepeat ? 1 : 0.3
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                CTRL.setIsRepeat(!CTRL.isRepeat)
            }
        }
    }

    Image {
        id: shuffleButton
        anchors {
            top: playButton.top
            right: preButton.left
            rightMargin: 40
        }
        source: "qrc:/img/img_shuffle.png"
        sourceSize.width: 40
        sourceSize.height: 40
        opacity: CTRL.isShuffle ? 1 : 0.3
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                CTRL.setIsShuffle(!CTRL.isShuffle)
            }
        }
    }

    Text {
        id: dur
        text: formatTime(CTRL.duration)
        font.pixelSize: 20
        anchors {
            top: duration.bottom
            topMargin: 10
            right: parent.right
            rightMargin: 25
        }
    }

    Text {
        id: pos
        text: formatTime(CTRL.position)
        font.pixelSize: 20
        anchors {
            top: duration.bottom
            topMargin: 10
            left: parent.left
            leftMargin: 25
        }
    }

    function formatTime(seconds) {
            var date = new Date(null)
            date.setSeconds(seconds/1000)
            if(seconds >= 3600 * 1000)
                return date.toISOString().substr(11, 8)
            return date.toISOString().substr(14, 5)
        }
}
