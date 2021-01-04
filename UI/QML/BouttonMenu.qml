import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15

Rectangle{
	id: rectRoot

	property string textMenu: ""
	property string iconUrl: ""
    signal clicked

	height: 65
    width: parent.width
    Image{
		anchors.verticalCenter: parent.verticalCenter
		x: 45
    	source: iconUrl
    	width: 22
    	height: 22
    }
    
    Text {
    	x: 120
    	anchors.verticalCenter: rectRoot.verticalCenter
	    text: textMenu
	    font.pixelSize: 25
	    color: "#707070"
	}

    MouseArea {
        id: area
        hoverEnabled: true
        width: rectRoot.width
        height: rectRoot.height
        onClicked: {
            rectRoot.clicked()
        }
        onHoveredChanged: containsMouse ? opa.opacity = 0.5 : opa.opacity = 0;
    }

    Rectangle{
    	id: opa
		anchors.fill: parent
		color:"#F2F2F2"
		opacity: 0
	}
}