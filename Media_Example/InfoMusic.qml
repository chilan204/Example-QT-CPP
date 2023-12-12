import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root
    width: 420
    height: 450

    property int currentIndex: CTRL.currentIndex

    Rectangle {
        id: mask
        width: 300
        height: 300
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 50
        }
        radius: 300
        visible: false
    }

    Image {
        id: img
        source: "qrc:/img/img1.png"
        width: 300
        height: 300
        visible: false
    }

    OpacityMask {
        id: imgSong
        anchors.fill: mask
        source: img
        maskSource: mask
    }

    Text {
        id: name
        width: 380
        text: CTRL.getListMS()[root.currentIndex]
        font.pixelSize: 25
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: mask.bottom
            topMargin: 50
        }
        elide: Text.ElideRight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    RotationAnimation {
        id: imgAni
        target: imgSong
        loops: Animation.Infinite
        from: imgSong.rotation
        to: 360 + imgSong.rotation
        direction: RotationAnimation.Clockwise
        duration: 6000
        running: CTRL.isPlaying
    }

    onCurrentIndexChanged: name.text = CTRL.getListMS()[root.currentIndex]

}
