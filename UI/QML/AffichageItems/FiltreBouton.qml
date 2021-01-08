import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
			

Rectangle{
    id: root
    anchors.fill: parent
     ListModel {
        id: theModel
        ListElement { name: "TOUT"; query: "/EPIs/EPI" ; isSelected: true}
        ListElement { name: "EMPRUNTE"; query: "/EPIs/EPI" ;isSelected: false}
        ListElement { name: "MAINTENANCE"; query: "/EPIs/EPI"; isSelected: false}
        ListElement { name: "REBUT"; query: "/EPIs/EPI"; isSelected: false}
        ListElement { name: "RETRAIT"; query: "/EPIs/EPI"; isSelected: false}
    }

    ListView {
        anchors.fill: parent
        clip: true
        model: theModel
        orientation: ListView.Horizontal
        delegate: numberDelegate
    }


    Component {
        id: numberDelegate
        Rectangle{
            height: root.height
            width: 120
            Text{
                text:name
                anchors.horizontalCenter:parent.horizontalCenter
                anchors.bottom: parent.bottom
                font.pixelSize: 15
                color: isSelected ? "#F9AA33" : "#8597A0"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: xmlModel.query = query
            }
        }
    }
}
