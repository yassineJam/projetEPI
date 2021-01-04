import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Component {
    id: numberDelegate

    Rectangle {
    	x: 5
    	id: rec
	    width: view.width - 10
	    height: 50 
	    radius: 10
	    Rectangle{
	    	height : rec.height
	    	width: rec.width - expandBoutton.width
	    	radius: 10
			DataEPI{
				id: dataEpi
			}
	    }   
	    states: State{
	    	name: "selected"
	    	when: isSelected
	    	PropertyChanges{ target : rec; height: 400}
	    }

	    transitions: Transition{
	    	from: ""
	    	to: "selected"
	    	reversible: true
	    	PropertyAnimation {target: rec; property: "height" ; duration: 300}
	    }

	    Rectangle{
	    	id: expandBoutton
	    	height: 50
	    	width: 50
	    	radius:10
	    	anchors.right: parent.right
	    	anchors.bottom: parent.bottom
	    	Label{
		    	anchors.centerIn: parent
		    	text: rec.state == "selected" ? "\u2191" : "\u2193"
		    	font.pixelSize: 20
		    	color: "#96A6AD"
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
	    
	    DropShadow {
	        id: rectShadow
	        spread: 0.3 
	        anchors.fill: source
	        cached: true
	        horizontalOffset: 0
	        verticalOffset: 2
	        radius: 8.0
	        samples: 16
	        color: "#000000"
	        opacity: 0.1
	        smooth: true
	        source: rec
	    }

	}
	
}