import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0


Rectangle{
	id: root
	width: 90
	height: 90
	radius: 45
	color:"#F9AA33"
	Image{
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter
    	source: "../ressources/icon/add.svg"
    	width: 32
    	height: 32
    }

    MouseArea {
        id: area
        hoverEnabled: true
        width: root.width
        height: root.height
        onHoveredChanged: containsMouse ? opa.visible = true : opa.visible = false;
        onPressed: {rectShadow.samples= 30; rectShadow.radius = 20; spread: 0 }
        onReleased: {rectShadow.samples= 16; rectShadow.radius = 8; spread: 0.3 }
    }

    Rectangle{
    	id:opa
    	anchors.fill: parent
    	radius: 45
    	color:"#FFFFFF"
    	opacity: 0.3
    	visible:false
    }

    DropShadow {
        id: rectShadow
        spread: 0.3 
        anchors.fill: source
        cached: true
        horizontalOffset: 0
        verticalOffset: 0
        radius: 8.0
        samples: 16
        color: "#000000"
        opacity: 0.16
        smooth: true
        source: bA
    }

}