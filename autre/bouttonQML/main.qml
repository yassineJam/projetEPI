import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0


ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 800

    property int exp :0
    ListModel{
    	id: epiList
    }

    function create(){
    	for(var i = 0; i < 10; ++i) {
			epiList.insert(i,{name: "EPi"+i, isSelected: false})
		}
    }
    
    
    Rectangle{
    	Component.onCompleted: create()
    	id: mainRect
    	width: 700
    	anchors.centerIn: parent
    	height: 700
    	clip: true

    	ListView {
	        id: view
	        anchors.fill: parent
	        anchors.margins: 25
	        clip: true
	        model: epiList
	        delegate: numberDelegate
	        spacing: 10
    	}
    }

    Component {
        id: numberDelegate

	    Rectangle {
	    	id: rec
		    width: 650; height: 50
		    color:"#FFA9A3"
		    y: 50
		    radius: 10
		    Label{
		    	anchors.centerIn: parent
		    	text: name
		    }

		    states: State{
		    	name: "selected"
		    	when: isSelected
		    	PropertyChanges{ target : rec; height: 200}
		    }

		    transitions: Transition{
		    	from: ""
		    	to: "selected"
		    	reversible: true
		    	PropertyAnimation {target: rec; property: "height" ; duration: 300}
		    }

		    Rectangle{
		    	id: deleteB
		    	height: 50
		    	width: 50
		    	color:"#BB2825"
		    	radius:10
		    	anchors.right: parent.right
		    	anchors.bottom: parent.bottom
		    	Label{
			    	anchors.centerIn: parent
			    	text: rec.state == "selected" ? "\u2191" : "\u2193"
			    	font.pixelSize: 20
			    	color: "#FFFFFF"
			    }
			    MouseArea {
			    	function selected(isSelected,exp){
			    		var epi = epiList.get(index)
			    		if(exp == 1){
			    			for(var i=0 ; i<epiList.count;i++){
			    				epiList.get(i).isSelected = false
			    			}
			    		}
			    		epi.isSelected = isSelected
			    	}
			        anchors.fill: parent

			        onClicked: {
			        	if(isSelected == false){
			        		selected(true,exp)
			        		exp=1
			        	}else{
			        		selected(false,exp)
			        	}
			        }
			   
			    }
		    }
		}
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
        source: mainRect
    }
    
}