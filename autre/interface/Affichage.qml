import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    title: qsTr("Affichage")

	header: ToolBar {
	 	id: tbh
        ToolButton {
            id: toolButton
            text: "\u03A7"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
            	while (stackView.depth>1){
            		stackView.pop()
            	}
            }
        }
        Label {
            text: "Affichage EPIs"
            anchors.centerIn: parent
        }
    }

    Rectangle{
    	id: menu
        anchors.left: parent.left
    	height: window.height
    	width : 220
	    color:"#e0e0e0"

	    Column {
            anchors.fill: parent
            BouttonMenu{
                id: bm1
                textB: "Afficher tout les EPIs"
                indexSV: 0
            }
            BouttonMenu{
                id: bm2
                textB: "Afficher les Epi d'un type donné"
                indexSV: 1
            }
            BouttonMenu{
                id: bm3
                textB: "Affichage les EPI emprunté"
                indexSV: 2
            }
            
            BouttonMenu{
                id: bm4
                textB: "Afficher les Epi en maintenance"
                indexSV: 3
            }
            BouttonMenu{
                id: bm5
                textB: "Afficher les EPI en rebut"
                indexSV: 4
            }
            BouttonMenu{
                id: bm6
                textB: "Afficher les infos d'un EPI"
                indexSV: 5
            }
            BouttonMenu{
                id: bm7
                textB: "Afficher les Epi en retrait"
                indexSV: 6
            }
        }
    }

    Rectangle{
    	id:ttaffiche
    	anchors.left: menu.right 
	    width: window.width - menu.width 
    	height: window.height - tbh.height - toolB.height

    	color:"white"
    	visible:true
    	clip: true

    	SwipeView {
        	id: swipeView
        	anchors.fill: parent

	        Item{
	        	Rectangle{
	        		height: ttaffiche.height*0.94
	        		width: ttaffiche.width*0.94
	        		anchors.centerIn: parent
	        		color: "gainsboro"
	        	}

	        	Label {
			        anchors.centerIn: parent
			        text: qsTr("Affichage de tout les EPIs")
			    }
	        }
	        Item{
	        	Rectangle{
	        		height: ttaffiche.height*0.94
	        		width: ttaffiche.width*0.94
	        		anchors.centerIn: parent
	        		color: "gainsboro"
	        	}

	        	Label {
			        anchors.centerIn: parent
			        text: qsTr("Affichage des Epi d'un type")
			    }
	        
	        }Item{
	        	Rectangle{
	        		height: ttaffiche.height*0.94
	        		width: ttaffiche.width*0.94
	        		anchors.centerIn: parent
	        		color: "gainsboro"
	        	}

	        	Label {
			        anchors.centerIn: parent
			        text: qsTr("Affichage des EPIs empruntés")
			    }
	        }Item{
	        	Rectangle{
	        		height: ttaffiche.height*0.94
	        		width: ttaffiche.width*0.94
	        		anchors.centerIn: parent
	        		color: "gainsboro"
	        	}

	        	Label {
			        anchors.centerIn: parent
			        text: qsTr("Affichage des EPIs en maintenance")
			    }
	        }Item{
	        	Rectangle{
	        		height: ttaffiche.height*0.94
	        		width: ttaffiche.width*0.94
	        		anchors.centerIn: parent
	        		color: "gainsboro"
	        	}

	        	Label {
			        anchors.centerIn: parent
			        text: qsTr("Affichage des EPIs en rebut")
			    }
	        }Item{
	        	Rectangle{
	        		height: ttaffiche.height*0.94
	        		width: ttaffiche.width*0.94
	        		anchors.centerIn: parent
	        		color: "gainsboro"
	        	}

	        	Label {
			        anchors.centerIn: parent
			        text: qsTr("Affichage des d'une EPI")
			    }
	        }Item{
	        	Rectangle{
	        		height: ttaffiche.height*0.94
	        		width: ttaffiche.width*0.94
	        		anchors.centerIn: parent
	        		color: "gainsboro"
	        	}

	        	Label {
			        anchors.centerIn: parent
			        text: qsTr("Affichage des EPIs en retrait")
			    }
	        }
		}
        
    	PageIndicator {
	        anchors.bottom: parent.bottom
	        anchors.horizontalCenter: parent.horizontalCenter

	        currentIndex: swipeView.currentIndex
	        count: swipeView.count
	    }
    }


   
}