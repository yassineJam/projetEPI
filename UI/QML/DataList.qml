import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Rectangle{
	id: root
	anchors.fill: parent
	border.width:1
	border.color:"red"

	property int exp :0
    ListModel{
    	id: epiList
    }

    function create(){
    	for(var i = 0; i < 110; ++i) {
			epiList.insert(i,{name: "EPi"+i, isSelected: false})
		}
    }

    Rectangle{
    	id: mainRect
    	Component.onCompleted: create()
    	anchors.fill: parent
    	clip: true

    	TopData{
    		id: topData
    	}
    	
	    DropShadow {
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
	        source: topData
	    }

    	ListView {
	        id: view
	        width: root.width
	        height: root.height - 90
	        y:90
	        anchors.margins: 5
	        clip: true
	        model: epiList
	        delegate: DataTuple{}
	        spacing: 10

	        ScrollBar.vertical: ScrollBar { }
    	}
    }
}