import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Rectangle{
    id: root
    anchors.fill: parent
    property var liste : []
    radius: 10
    color: "transparent"

    Text{
        id:title
        font.pixelSize: 25
        color: "#4A6572"
        text : "Liste des reservations"
        topPadding: 10
        leftPadding : 20
    }

    Rectangle{
        id: addBoutton
        width: 110
        radius: 10
        height: 35
        color: "#F9AA33"
        y: 15
        x: root.width - 130
        Text{ font.pixelSize: 20; color: "white"; text: "+ Ajouter"; anchors.centerIn: parent}
        Rectangle{id: opa; anchors.fill :parent; color:"white"; opacity: 0.2; radius: 10}
        MouseArea{
            anchors.fill :parent
            hoverEnabled: true
			onHoveredChanged: containsMouse ? opa.visible = true : opa.visible = false;
            onClicked: {

            }
        }
    }

    Rectangle{
        width: root.width
        color: "#707070"
        height:1
        anchors.bottom : marqueData.top
    }

    Rectangle{
        id:topData
        width: root.width
        color: "transparent"
        height: 40
        anchors.bottom:marqueData.top
        Text{
            leftPadding: 20
            bottomPadding: 5
            anchors.bottom: topData.bottom
            font.pixelSize: 20
            color:"#8597A0"
            text: "ID | Date Location  |  Date retour | Rq | Prsn | EPI"
        }
    }
    function create(){
    	for(var i = 0; i < api.listeReservation.length ; ++i) {
			theModel.insert(i,{ number : 0})
            liste[i] = api.listeReservation[i]
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
        height: root.height - 100

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
                    text:  liste[index][0] + " | " + liste[index][1] + " |  " + liste[index][2] +" | "+ liste[index][3] + " | " + liste[index][4] + " | " + liste[index][5]
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