import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0





Rectangle{
	id: rectRoot

    property string textMenu: ""
    signal clicked

    radius: 15
    state: "notPress"
    color: "#F9AA33"

	height: 70
    width: 300
    anchors.centerIn: parent 

    Text {
    	x: 120
    	anchors.verticalCenter: rectRoot.verticalCenter
	    text: textMenu
	    font.pixelSize: 25
	    color: "white"
	}

    MouseArea{
        id: area
        hoverEnabled: true
        width: rectRoot.width
        height: rectRoot.height
        onClicked:{
            PropertyAnimation:{
                target: opa
                properties: "opacity"
                to: 0
                duration: 300 
                easingType: Easing.OutExpo 
            }  
            rectRoot.clicked() 
        } 
        onHoveredChanged: containsMouse ? opa.opacity = 0.5 : opa.opacity = 0;
        onPressed: {rectShadow.samples= 30; rectShadow.radius = 20; spread: 0 }
        onReleased: {rectShadow.samples= 16; rectShadow.radius = 8; spread: 0.3 }
    }

    Rectangle{
    	id: opa
        radius: 15
		anchors.fill: parent
		color:"#F2F2F2"
		opacity: 0
	}

    DropShadow {
        id: rect3D
        spread: 1
        anchors.fill: source
        cached: true
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 16
        color: "#F9AA33"
        opacity: 0.16
        smooth: true
        source: rectRoot
    }

    DropShadow {
        id: rectShadow
        spread: 0.3 
        anchors.fill: source
        cached: true
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 16
        color: "#000000"
        opacity: 0.16
        smooth: true
        source: rectRoot
    }
}

