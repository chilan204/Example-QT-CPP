import QtQuick 2.0

Text {
    Image {
        source: "qrc:/img/icon_music.png"
        sourceSize.width: 25
        sourceSize.height: 25
    }

    anchors.left: musicIcon.right
    anchors.leftMargin: 50
    text: qsTr("Name of Music")
    font.pointSize: 15
}
