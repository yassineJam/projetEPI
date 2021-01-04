import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15

Rectangle{
	id:topData
	width: mainRect.width
	height: 70
	color:"#F9AA33"

	Rectangle{
		id: root
		//color: "transparent"
		height: 70
		width: topData.width - 50

		ListModel{
	    	id: listData
	    	ListElement{name: "Id"; widthIndex:0.05}
	    	ListElement{name: "Type"; widthIndex:0.13}
	    	ListElement{name: "NumSerie"; widthIndex:0.13}
	    	ListElement{name: "Fab"; widthIndex:0.06}
	    	ListElement{name: "Achat"; widthIndex:0.06}
	    	ListElement{name: "PremUtili"; widthIndex:0.09}
	    	ListElement{name: "Rébut"; widthIndex:0.06}
	    	ListElement{name: "Modele"; widthIndex:0.12}
	    	ListElement{name: "Vie"; widthIndex:0.05}
	    	ListElement{name: "Util"; widthIndex:0.05}
	    	ListElement{name: "Marque"; widthIndex:0.07}
	    	ListElement{name: "Couleur"; widthIndex:0.07}
	    	ListElement{name: "Lot"; widthIndex:0.06}
	    }

	    ListView {
	        id: view
	        anchors.fill: parent
	        model: listData
	        delegate: numberDelegate
	        orientation:ListView.Horizontal
    	}

    	Component{
    		id: numberDelegate
    		Rectangle{
	    		width: root.width*widthIndex; 
	    		height: 70
	    		color: "#F9AA33" 
	    		Text{
	    			text: name
	    			anchors.centerIn: parent
	    			font.pixelSize: 20
	    			color: "white"
	    		}
	    	}	
    	}
    }
}