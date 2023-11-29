import QtQuick 2.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0

Window {
    id: root
    visible: true
    width: 430
    height: 730
    title: qsTr("BT_1_NCL")

    property bool isPlay: false

    Rectangle {
        id: box
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
            horizontalCenter: box.horizontalCenter
            top: box.top
            topMargin: 25
        }
    }

    Item {
        id: img
        width: 300
        height: 300
        anchors {
            horizontalCenter: box.horizontalCenter
            top: title.bottom
            topMargin: 80
        }

        Rectangle {
            id: mask
            width: 300
            height: 300
            radius: 300
            visible: false
        }

        Image {
            id: songImg
            source: "qrc:/img/img1.png"
            sourceSize: Qt.size(parent.width, parent.height)
            visible: false
        }

        OpacityMask {
            anchors.fill: songImg
            source: songImg
            maskSource: mask
        }

        RotationAnimation {
            id: imgAni
            target: img
            loops: Animation.Infinite
            from: img.rotation
            to: 360
            direction: RotationAnimation.Clockwise
            duration: 6000
            running: false
        }
    }

    Text {
        id: name
        text: qsTr("Ten bai hat")
        font.pixelSize: 25
        anchors {
            horizontalCenter: box.horizontalCenter
            top: img.bottom
            topMargin: 50
        }
    }

    Rectangle {
        id: duration
        width: 360
        height: 5
        radius: 5
        color: "white"
        anchors {
            horizontalCenter: box.horizontalCenter
            top: name.bottom
            topMargin: 40
        }

        Rectangle {
            id: time
            width: 15
            height: 15
            radius: 15
            anchors.verticalCenter: parent.verticalCenter
            color: "cyan"
        }

        PropertyAnimation {
            id: timeAni
            target: time
            property: "x"
//            from: duration.left
            to: duration.width
            duration: 6000
            running: false
        }
    }

    Image {
        id: playButton
        anchors {
            horizontalCenter: box.horizontalCenter
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
                isPlay = !isPlay
                imgAni.running = !imgAni.running
                timeAni.running = !timeAni.running

            }
        }
        function sourceImg(){
            return "qrc:/img/" + (isPlay ? "img_play.png" : "img_pause.png")
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
        }
    }

    ListMusic {
        id: listMusic
        anchors {
            horizontalCenter: box.horizontalCenter
            top: box.top
        }
        visible: false
    }

    Image {
        id: listButton
        width: 30
        height: 30
        anchors {
            verticalCenter: title.verticalCenter
            right: box.right
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
}
