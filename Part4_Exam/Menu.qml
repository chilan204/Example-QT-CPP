import QtQuick 2.0

Rectangle {
    id: menu
    anchors.top: box.top
    anchors.topMargin: 10
    anchors.right: box.right
    anchors.rightMargin: 10
    width: 300
    height: 300
    color: "cyan"
    border.color: "blue"
    border.width: 1

    Text {
        id: title
        text: qsTr("Danh Sach Phat")
        anchors.horizontalCenter: menu.horizontalCenter
        anchors.top: menu.top
        anchors.topMargin: 10
        font.pointSize: 20
    }

    Column {
        anchors.left: menu.left
        anchors.leftMargin: 25
        anchors.top: menu.top
        anchors.topMargin: 60
        spacing: 15

        List_of_Music {
            text: qsTr("Bai hat so 1")
        }
        List_of_Music {
            text: qsTr("Bai hat so 2")
        }
        List_of_Music {
            text: qsTr("Bai hat so 3")
        }
        List_of_Music {
            text: qsTr("Bai hat so 4")
        }
        List_of_Music {
            text: qsTr("Bai hat so 5")
        }
        List_of_Music {
            text: qsTr("Bai hat so 6")
        }
    }
}
