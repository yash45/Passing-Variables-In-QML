import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400
    property alias name: firstNameDisplay.text

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        id: firstNameDisplay
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }
}
