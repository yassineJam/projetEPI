import QtQuick 2.9
import QtQuick.Controls 2.2



ApplicationWindow {
	id: window
	background: Rectangle {
        color: "darkGray"
    }

    visible: true
    width: 1280
    height: 720
    title: "Projet EPI"

    header: ToolBar {
    	id: toolB
    	Row {

	        ToolButton {
	        id: toolButton
	        	width : 50
	        	flat:true
	            text: qsTr("\u2630")
	            onClicked: drawer.open()
	        }

	        Rectangle{
	        	width: toolB.width - 2*toolButton.width
	        	height: toolB.height
	        	color:"#e0e0e0"
	        	Text { 
	        		anchors.centerIn: parent
                    text: "Logiciel de Gestion des EPIs" 
                } 
	        }
		}
	}

    Drawer {
    	id: drawer
        width: window.width * 0.2
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("")
                width: parent.width
                onClicked: {
                    stackView.push("Home.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Home")
                width: parent.width
                onClicked: {
                    stackView.push("Home.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Affichage EPIs")
                width: parent.width
                onClicked: {
                    stackView.push("Affichage.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Modifier les EPIs")
                width: parent.width
                onClicked: {
                    stackView.push("Modifier.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Exporter la BDD")
                width: parent.width
                onClicked: {
                    stackView.push("Export.qml")
                    drawer.close()
                }
            }
        }


    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Home {}
    }
}



    