import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: circleShape
        color: "teal"
        width: 400
        height: 400
        radius: 200
        anchors.centerIn: parent
        focus: true

        Rectangle {
            id: centerCirle
            color: "white"
            z: 1
            width: 20
            height: 20
            radius: 20
            anchors.centerIn: parent

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

            RotationAnimation {
                id: minuteAni
                target: minuteHand
                loops: Animation.Infinite
                from: minuteHand.rotation
                to: minuteHand.rotation + 360
                direction: RotationAnimation.Clockwise
                duration: 6000
                running: false
            }
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

            RotationAnimation {
                id: hourAni
                target: hourHand
                loops: Animation.Infinite
                from: hourHand.rotation
                to: hourHand.rotation + 360
                direction: RotationAnimation.Clockwise
                duration: 32000
                running: false
            }
        }

//        Keys.onUpPressed: {
//            hourAni.start()
//            minuteAni.start()
//        }

//        Keys.onDownPressed: {
//            hourAni.pause()
//            minuteAni.pause()
//        }
    }

    Rectangle {
        id: control
        color: "green"
        width: 50
        height: 50

        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: {
                minuteAni.running = !minuteAni.running
                hourAni.running = !hourAni.running
            }
        }
    }
}
