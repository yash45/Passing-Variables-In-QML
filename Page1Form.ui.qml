import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    property alias name: firstName.text

        header: Label {
            text: qsTr("Page 1")
            font.pixelSize: Qt.application.font.pixelSize * 2
            padding: 10
        }

        Label {
            text: qsTr("You are on Page 1.")
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Column {
            id: column
            y: 41
            width: 200
            height: 79
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                id: label
                text: qsTr("Enter your name")
            }

            TextField {
                id: firstName
            }
        }}
