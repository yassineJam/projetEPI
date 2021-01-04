import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

//TODO SUR LE RELACHEMENT DE START CARRE BLANC

Page {
    title: qsTr("Home")
    id:pH
    Rectangle{
    	id:banner
    	y:100
    	width : parent.width /2
    	height: 230
    	radius: 10
        clip: true
    	anchors.horizontalCenter: parent.horizontalCenter
    	Label{
    		y: 50
            width:banner.width
            horizontalAlignment:  Text.AlignHCenter
    		text: "Logiciel de Gestion des EPIs de COC Escalade"
    		font.pixelSize:  pH.width > pH.height ? banner.width*0.05 : 25    
	    	color: "#707070"
            wrapMode: Text.WordWrap
    	}
    	Text{
    		y: 180
            width:banner.width
    		text: "En collaboration avec l'Ecole Centrale de Nantes"
    		font.pixelSize: pH.width > pH.height ? 19 : 15
    		horizontalAlignment: Text.AlignHCenter
	    	color: "#707070"
            wrapMode: Text.WordWrap
    	}
    }

    DropShadow {
        id: rectShadow1
        anchors.fill: source
        cached: true
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 8
        color: "#000000"
        opacity: 0.16
        smooth: true
        source: banner
	}

    Rectangle{
    	id : buttonStart
    	y: 400
    	radius: 15
    	width: 300
    	height: 50
    	color:"#F9AA33"
    	anchors.horizontalCenter: parent.horizontalCenter
    	Label{
    		color:"white"
    		text: "START !"
    		font.pixelSize:20
    		anchors.centerIn: parent
    	}

    	MouseArea {
	        id: area
	        hoverEnabled: true
	        width: buttonStart.width
	        height: buttonStart.height
	        onClicked: {
	        	drawer.open()
	        }
	        onHoveredChanged: containsMouse ? opa.opacity = 0.25 : opa.opacity = 0;
	        onPressed: opa.opacity = 1
	    }

	    Rectangle{
	    	id: opa
			anchors.fill: parent
			color:"#F2F2F2"
			opacity: 0
		}
    }

    DropShadow {
        id: rectShadow2
        anchors.fill: source
        cached: true
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 8
        color: "#000000"
        opacity: 0.16
        smooth: true
        source: buttonStart
	}

    Rectangle{
    	id : buttonAbout
    	x: pH.width - buttonAbout.width -  50
    	y: pH.height - buttonAbout.height - 50
    	radius: 15
    	width: 180
    	height: 50
    	color:"#F9AA33"
    	Label{
    		color:"white"
    		text: "ABOUT"
    		font.pixelSize:20
    		anchors.centerIn: parent
    	}

    	MouseArea {
	        id: area2
	        hoverEnabled: true
	        width: buttonAbout.width
	        height: buttonAbout.height
	        onClicked: {
	        	dialog.open()
	        }
	        onHoveredChanged: containsMouse ? opa2.opacity = 0.25 : opa2.opacity = 0;
	    }

	    Rectangle{
	    	id: opa2
			anchors.fill: parent
			color:"#F2F2F2"
			opacity: 0
		}
    }

    DropShadow {
        id: rectShadow3
        anchors.fill: source
        cached: true
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 8
        color: "#000000"
        opacity: 0.16
        smooth: true
        source: buttonAbout
	}

	Dialog {
	    id: dialog
	    title: "About"
	    Text{
	    	anchors.centerIn: parent
	    	text: "Application coder .."
	    }
	    standardButtons: Dialog.Ok | Dialog.Cancel
	    anchors.centerIn: parent
	        modal: true

	    onAccepted: print("Ok clicked")
	    onRejected: print("Cancel clicked")
	}
    	
}