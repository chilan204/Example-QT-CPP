import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    visible: true
    width: 720
    height: 640
    title: qsTr("Hello World")

    property int durAni: 60*60*1000 / 20

    Image {
        id: circleShape
        anchors.centerIn: parent
        source: "qrc:/clock_bg.png"
    }

    Rectangle {
        id: minuteHand
        color: "yellow"
        width: 10
        height: 175
        border.color: "black"
        border.width: 1
        radius: 10
        anchors.horizontalCenter: circleShape.horizontalCenter
        anchors.bottom: circleShape.verticalCenter
        transformOrigin: Item.Bottom
        rotation: 0
    }

    Rectangle {
        id: hourHand
        color: "red"
        width: 15
        height: 100
        border.color: "black"
        border.width: 1
        radius: 15
        anchors.horizontalCenter: circleShape.horizontalCenter
        anchors.bottom: circleShape.verticalCenter
        transformOrigin: Item.Bottom
        rotation: 0
        focus: true
        Keys.onReturnPressed: {
            clockAnimation.running = !clockAnimation.running
        }
    }


    Rectangle {
        id: centerCirle
        color: "green"
        width: 20
        height: 20
        radius: 20
        anchors.centerIn: parent
    }

    ParallelAnimation {
        id: clockAnimation
        loops: Animation.Infinite
        running: false
        RotationAnimation {
            target: minuteHand
            to: minuteHand.rotation + 360*60
            direction: RotationAnimation.Clockwise
            duration: root.durAni
        }
        RotationAnimation {
            target: hourHand
            to: hourHand.rotation + 360
            direction: RotationAnimation.Clockwise
            duration: root.durAni
        }
    }
}
