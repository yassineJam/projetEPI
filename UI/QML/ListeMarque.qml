import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Rectangle{
    id: root
    anchors.fill: parent
    property string titre: ""
    property var liste : []
    radius: 10
    color: "transparent"
    Text{
        id:title
        font.pixelSize: 25
        color: "#4A6572"
        text : titre+ " des EPIs"
        topPadding: 10
        leftPadding : 20
    }

    Rectangle{
        width: root.width
        color: "#707070"
        height:1
        anchors.bottom : marqueData.top
    }

    function create(){
        //liste = api.listeMarque
    	for(var i = 0; i < liste.length ; ++i) {
			theModel.insert(i,{ number : 0})
		}
        
    }

    ListModel {
        id: theModel
    }

    Rectangle{
        id : marqueData
        radius: 10
        color: "transparent"
        Component.onCompleted: create()
        width: root.width
        anchors.bottom: root.bottom
        height: root.height - 60

        ListView {
            id: view
            anchors.fill: parent
            clip: true
            model: theModel
            delegate: numberDelegate
        }

        Component {
            id: numberDelegate
            Rectangle {
                id: data
                width: marqueData.width
                height: 50
                color: "transparent"

                Text {
                    anchors.verticalCenter: data.verticalCenter
                    font.pixelSize: 20
                    leftPadding : 20
                    color:"#8597A0"
                    text:  liste[index]
                }

                Rectangle{
                    id: supprimer
                    width: data.height
                    height: data.height
                    color: "transparent"
                    anchors.right: data.right
                    Image{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../ressources/icon/trash.png"
                        width: data.height -30
                        height: data.height -30
                    }
                }
                Rectangle{
                    width: data.width
                    height:1
                    color: "#707070"
                    anchors.bottom : data.bottom
                }
            }
        }
    }
    
}