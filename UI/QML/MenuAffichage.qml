import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15

Rectangle {
	id:root
    anchors.fill: parent
   
   	ListModel{
   		id:modelList
   		ListElement{ name:"" ; isSelected: false}
   		ListElement{ name:"Tout les EPIs"; isSelected: true}
   		ListElement{ name:"Type donné"; isSelected: false}
   		ListElement{ name:"Empruntés"; isSelected: false}
   		ListElement{ name:"En maintenance"; isSelected: false}
   		ListElement{ name:"Rébut"; isSelected: false}
   		ListElement{ name:"En retrait"; isSelected: false}
   	}

    ListView{
    	id:view
    	anchors.fill: parent
    	model: modelList
    	delegate: numberDelegate
    }  

    Component{
    	id: numberDelegate

    	Rectangle{
    		id:recRoot
    		width: root.width
    		height: 50
    		Label{
    			id:nameText
    			text: name
    			x: 30
    			anchors.verticalCenter: recRoot.verticalCenter
    			font.pixelSize: 25
	    		color: "#707070"
    		}

    		states: State{
		    	name: "selected"
		    	when: isSelected
		    	PropertyChanges{ target : nameText; color: "#F9AA33"}
		    	PropertyChanges{ target : nameText; font.underline: true}
		    }

    		MouseArea {
		        anchors.fill: parent
		        hoverEnabled: true
		        onClicked: {
		        	for(var i=0 ; i<modelList.count;i++){
	    				modelList.get(i).isSelected = false
	    			}
		        	if(isSelected == false){
		        		modelList.get(index).isSelected = true
	        		}else{
	        			modelList.get(index).isSelected = false
	        		}
		        }  
		        onHoveredChanged: containsMouse ? opa.visible = true : opa.visible = false;
		    }

		    Rectangle{
		    	id:opa
		    	anchors.fill: parent
		    	color:"#F9AA33"
		    	opacity: 0.1
		    	visible:false
		    }
    	}
    }
}