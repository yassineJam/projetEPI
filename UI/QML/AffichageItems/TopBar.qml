import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Rectangle{
    id: topbar
    height: 60
    y: 20
    width : parent.width * 0.98
    anchors.horizontalCenter : parent.horizontalCenter
    Text{ text: "Affichage des EPIs"; font.pixelSize: 30; color: "#4A6572"; anchors.verticalCenter : topbar.verticalCenter }
    Rectangle{
        id: bouttonAdd
        width: 150
        height: topbar.height*0.8
        color: "#F9AA33"
        radius: 20
        anchors.verticalCenter: topbar.verticalCenter
        anchors.right: topbar.right
        Text{
            text: "+    Ajouter"
            color: "white"
            font.pixelSize: 25
            anchors.verticalCenter: bouttonAdd.verticalCenter
            anchors.horizontalCenter: bouttonAdd.horizontalCenter

        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onHoveredChanged: containsMouse ? opa.visible = true : opa.visible = false;
            onClicked:{
                popUp.open()
            }
        }
        Rectangle{
            id:opa
            radius:20
            anchors.fill :parent
            color:"white"
            opacity:0.35
            visible:false
        }
    }
    DropShadow {
        spread: 0.5 
        anchors.fill: source
        cached: true
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#000000"
        opacity: 0.1
        smooth: true
        source: bouttonAdd
    }
}
