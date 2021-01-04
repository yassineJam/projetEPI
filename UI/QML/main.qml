import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 1600
    height: 900
	FontLoader { id: robotoR; source: "../ressources/font//Roboto-Regular.ttf" }

    menuBar: ToolBar {
    	id: tb
        height: 30
 		background: Rectangle{
 			anchors.fill: parent
 			color: "#232F34"
 		}
    }

    header: Rectangle{
    	id: hd
    	height: 90
    	color: "#344955"
    	Button{
    		width:100
    		background: Rectangle{
	 			anchors.fill: parent
	 			color: "transparent"
 			}
    		height: hd.height
    		icon.color:"white"
    		icon.source: "../ressources/icon/menu.svg"
    		icon.width: 35
    		icon.height: 35
    		onClicked: drawer.open()
    	}
    }

    Drawer{
    	id: drawer
    	width: window.width > window.height ? 400 : 300
    	height: window.height 
    	background:Rectangle{
    		anchors.fill: parent
    		color: "white"
    	}
        Column {
            anchors.fill: parent
            ItemDelegate {
                text: qsTr("")
                height: 130
                width: parent.width
            }
            BouttonMenu{
                id: bm2
                textMenu: "Home"
                iconUrl: "../ressources/icon/home.svg"
                onClicked: {
                    stackView.push("Home.qml")
                    drawer.close()
                }
            }
            BouttonMenu{
                id: bm3
                textMenu: "Affichage"
                iconUrl: "../ressources/icon/monitor.svg"
                onClicked: {
                    stackView.push("Affichage.qml")
                    drawer.close()
                }
            }
            BouttonMenu{
                id: bm4
                textMenu: "Gestion"
                iconUrl: "../ressources/icon/settings.svg"
                onClicked: {
                    stackView.push("Gestion.qml")
                    drawer.close()
                }
            }
            BouttonMenu{
                id: bm1
                textMenu: "Export"
                iconUrl: "../ressources/icon/export.svg"
                onClicked: {
                    stackView.push("Export.qml")
                    drawer.close()
                }
            }            
        }
    }

    StackView {
        id: stackView
        initialItem: Home {}
        anchors.fill: parent 
    }
    DropShadow {
        id: rectShadow
        spread: 0.3
        anchors.fill: source
        horizontalOffset: 1
        verticalOffset: 3
        radius: 10
        samples: 16
        color: "#000000"
        opacity: 0.3
        smooth: true
        source: hd
    }
 }