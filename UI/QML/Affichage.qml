import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Page {
    title: qsTr("Affichage")

    Rectangle{
    	id: root
    	anchors.fill: parent

    	Rectangle{
    		id: data
    		anchors.left : menu.right
    		anchors.right : filtre.left
    		anchors.top : search.bottom
    		height: filtre.height 
    		DataList{
    			id:dataL
    		}   		
    	}

    	Rectangle{
    		id: filtre
    		width : 240
    		height : root.height - search.height
    		anchors.top: search.bottom
    		anchors.right: root.right
    		FiltreMenu{
    			id:fm
    		}
    	}
	    DropShadow {
	        spread: 0.3 
	        anchors.fill: source
	        cached: true
	        horizontalOffset: 1
	        verticalOffset: 1
	        radius: 8.0
	        samples: 16
	        color: "#000000"
	        opacity: 0.1
	        smooth: true
	        source: filtre
	    }

    	

    	Rectangle{
    		id: search
    		height: 50
    		width: root.width - menu.width
    		anchors.left: menu.right
    		
    		Rectangle{
    			anchors.fill: parent
	    		Label{
	    			x:40
	    			text: "Recherche"
	    			anchors.verticalCenter: parent.verticalCenter
	    			font.pixelSize: 25
		    		color: "#8692A0"
	    		}
	    		Image{
	    			id:searchImg
					anchors.verticalCenter: parent.verticalCenter
					x: search.width - searchImg.width - 30
			    	source: "../ressources/icon/loupe.svg"
			    	width: 25
			    	height: 25
			    }
    		}	
    	}
    	
    	DropShadow {
	        spread: 0.5 
	        anchors.fill: source
	        cached: true
	        horizontalOffset: 1
	        verticalOffset: 1
	        radius: 10
	        samples: 16
	        color: "#000000"
	        opacity: 0.1
	        smooth: true
	        source: search
	    }

	    Rectangle{
    		id: menu
    		height:root.height
    		width: 250
    		MenuAffichage{
    			id:mA
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
	        source: menu
	    }

    	BouttonAdd{
    		id:bA
    		x: window.width - bA.width - 170
    		y: window.height - bA.height - 150
    	}

    	

    }
}