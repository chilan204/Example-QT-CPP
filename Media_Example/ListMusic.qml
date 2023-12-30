import QtQuick 2.0

Item {
    id: root
    width: 420
    height: 450
    clip: true

    Rectangle {
        id: background
        width: 410
        height: 450
        anchors.centerIn: parent
        color: "lavender"
    }

    ListView {
        anchors.fill: background
        model: CTRL.getListMS().length
        delegate: ItemMusic {
            nameMusic: CTRL.getListMS()[index]
            isCurrent: CTRL.currentIndex == index

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    CTRL.selectSong(index)
                    root.visible = false
                }
            }
        }
    }

}
