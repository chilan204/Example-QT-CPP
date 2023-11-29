import QtQuick 2.0

Item {
    id: root
    width: 420
    height: 480
    clip: true

    property var listMs: [
        "Nang tho",
        "Thang tu la noi doi cua em - Ha Anh Tuan",
        "Nang tho2",
        "Nang tho3",
        "Nang tho4",
        "Nang tho5",
        "Nang tho6",
    ]

    Rectangle {
        id: background
        anchors.fill: parent
        color: "lavender"
        border.color: "blue"
        border.width: 1
        opacity: 0.9
    }


    Text {
        id: title
        text: qsTr("MUSIC LIST")
        anchors {
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 25
        }
        font.pixelSize: 25
        font.bold: true
    }

    Column {
        width: 300
        height: 240
        anchors {
            top: root.top
            topMargin: 60
        }

        Repeater {
            id: listMusic
            model: 7
            ItemMusic {
            }
        }

        Component.onCompleted: {
            for (var i = 0; i < listMs.length ;i++) {
                listMusic.itemAt(i).nameMusic = listMs[i]
            }
        }
    }
}
