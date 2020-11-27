import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    background: Rectangle{
        border.color: "red"
        border.width : 3
    }
    title: qsTr("Modif")

     header: ToolBar {

         ToolButton {
            id: toolButton
            text: "\u03A7"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                while (stackView.depth>1){
                    stackView.pop()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }
   
}