import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Stack")


    property string name: ""

    StackView {
        id: stackView
        initialItem: "Page1Form.ui.qml"
        anchors.fill: parent

        //editor
        Page1Form{
            id:page1
            Component.onCompleted: {
                name = window.name
            }
        }
        //display
        Page2Form{
            id:page2
        }
        onCurrentItemChanged : {
            console.log(currentItem)

            //page1
            if(currentItem === 0){
                window.name = page2.name
                page1.name = window.name
            }
            //page2
            if(currentItem === 1){
                window.name = page1.name
                page2.name = window.name
            }
        }
    }


    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.ui.qml")
                    drawer.close()
                }
            }
        }
    }




}
