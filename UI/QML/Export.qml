import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Page {
    title: qsTr("Export")

    Rectangle{
    	id: root
    	anchors.fill: parent
        Rectangle{
            id: center
            width : root.width * 0.5
            height: root.height * 0.5
            anchors.centerIn: parent
            radius: 20

            Label{
                x:40
                y: 50
                text: "Export de la BDD en .mk"
                font.pixelSize: 35
                color: "#8692A0"
            }
            TextField {
                id: input
                x: 40
                y: 200
                width: center.width*0.6
                height: 50
                focus: true
                font.pixelSize: 25
                color: "#8692A0"
                placeholderText: qsTr("Nom du fichier")
            }

            Rectangle{
                id: bouttonExport
                height : 50
                width : 150
                x: center.width - 200
                y: 200
                color:"#F9AA33"
                radius: 15
                Text {
                    x: 120
                    anchors.centerIn: parent
                    text: "Exporter"
                    font.pixelSize: 25
                    color: "white"
                }
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
	        source: center
	    }

    }
}