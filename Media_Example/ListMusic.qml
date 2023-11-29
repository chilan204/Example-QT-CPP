import QtQuick 2.0

Item {
    id: root
    width: 420
    height: 450
    clip: true

    property var listMs: [
        "Nang tho",
        "Thang tu la noi doi cua em - Ha Anh Tuan",
        "Suyt nua thi",
        "Va ngay nao do",
        "Con mo bang gia",
        "Hoa tan tinh tan",
        "Ben tren tang lau",
        "Cat doi noi sau"
    ]

    property string currentMusic: listMs[root.currentIndex]
    property int currentIndex

    Rectangle {
        id: background
        width: 410
        height: 450
        anchors.centerIn: parent
        color: "lavender"
    }

    ListView {
        anchors.fill: background
        model: listMs
        delegate: ItemMusic {
            nameMusic: listMs[index]
            isCurrent: root.currentIndex == index
        }
    }

}
