import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    title: qsTr("Affichage")

	 header: ToolBar {
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

            ItemDelegate {
                text: qsTr("Afficher tout les EPI")
                width: parent.width

                onClicked: {
                    swipeView.currentIndex = 0
                }
                Rectangle{
                	id:r1
                	anchors.fill: parent
                	color: "white"
                	opacity: swipeView.currentIndex == 0 ? 1	 : 0
                }
                Rectangle{
                	id:rect1
                	anchors.fill: parent
                	color: "white"
                	opacity: 0
                }
                onHoveredChanged: hovered ? rect1.opacity = 0.5 : rect1.opacity = 0;

            }
            ItemDelegate {
                text: qsTr("Afficher les Epi d'un type donné")
                width: parent.width
                onClicked: {
                    swipeView.currentIndex = 1
                }
                Rectangle{
                	id:r2
                	anchors.fill: parent
                	color: "white"
                	opacity: swipeView.currentIndex == 1 ? 1	 : 0
                }
                Rectangle{
                	id:rect2
                	anchors.fill: parent
                	color: "white"
                	opacity: 0
                }
                onHoveredChanged: hovered ? rect2.opacity = 0.5 : rect2.opacity = 0;
            }
            ItemDelegate {
                text: qsTr("Affichage les EPI emprunté")
                width: parent.width
                onClicked: {
                    swipeView.currentIndex = 2
                }
                Rectangle{
                	id:r3
                	anchors.fill: parent
                	color: "white"
                	opacity: swipeView.currentIndex == 2 ? 1	 : 0
                }
                Rectangle{
                	id:rect3
                	anchors.fill: parent
                	color: "white"
                	opacity: 0
                }
                onHoveredChanged: hovered ? rect3.opacity = 0.5 : rect3.opacity = 0;

            }
            ItemDelegate {
                text: qsTr("Afficher les Epi en maintenance")
                width: parent.width
                onClicked: {
                    swipeView.currentIndex = 3
                }
                Rectangle{
                	id:r4
                	anchors.fill: parent
                	color: "white"
                	opacity: swipeView.currentIndex == 3 ? 1	 : 0
                }
                Rectangle{
                	id:rect4
                	anchors.fill: parent
                	color: "white"
                	opacity: 0
                }
                onHoveredChanged: hovered ? rect4.opacity = 0.5 : rect4.opacity = 0;
            }
            ItemDelegate {
                text: qsTr("Afficher les EPI en rebut")
                width: parent.width
                onClicked: {
                    swipeView.currentIndex = 4
                }
                Rectangle{
                	id:r5
                	anchors.fill: parent
                	color: "white"
                	opacity: swipeView.currentIndex == 4 ? 1	 : 0
                }
                Rectangle{
                	id:rect5
                	anchors.fill: parent
                	color: "white"
                	opacity: 0
                }
                onHoveredChanged: hovered ? rect5.opacity = 0.5 : rect5.opacity = 0;
            }
            ItemDelegate {
                text: qsTr("Afficher les infos d'un EPI")
                width: parent.width
                onClicked: {
                    swipeView.currentIndex = 5
                }
                Rectangle{
                	id:r6
                	anchors.fill: parent
                	color: "white"
                	opacity: swipeView.currentIndex == 5 ? 1	 : 0
                }
                Rectangle{
                	id:rect6
                	anchors.fill: parent
                	color: "white"
                	opacity: 0
                }
                onHoveredChanged: hovered ? rect6.opacity = 0.5 : rect6.opacity = 0;
            }
            ItemDelegate {
                text: qsTr("Afficher les Epi en retrait")
                width: parent.width
                onClicked: {
                    swipeView.currentIndex = 6
                }
                Rectangle{
                	id:r7
                	anchors.fill: parent
                	color: "white"
                	opacity: swipeView.currentIndex == 6 ? 1	 : 0
                }
                Rectangle{
                	id:rect7
                	anchors.fill: parent
                	color: "white"
                	opacity: 0
                }
                onHoveredChanged: hovered ? rect7.opacity = 0.5 : rect7.opacity = 0;
            }
        }
    }

    Rectangle{
    	id:ttaffiche
    	anchors.left: menu.right 
	    width: window.width - menu.width 
    	height: window.height*0.8
    	color:"white"
    	visible:true

    	SwipeView {
        	id: swipeView
        	anchors.fill: parent

	        Item{

	        }
	        Item{
	        
	        }Item{

	        }Item{

	        }Item{

	        }Item{

	        }Item{

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