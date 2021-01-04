import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Rectangle {
	id:root
    anchors.fill: parent
    radius: 10
    property int idR: index
    Row{
    	id:rowData
    	Rectangle{
    		radius: 10
    		width: root.width*0.05; 
    		height: root.height 
    		Text{
    			text: api.listeEPI[idR][0]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
    	}
	    Rectangle{ 
	    	width: root.width*0.13; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][1]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{ 
	    	width: root.width*0.13; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][2]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{ 
	    	width: root.width*0.06; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][3]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{
	    	width: root.width*0.06; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][4]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{
	    	width: root.width*0.09; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][5]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{
	    	width: root.width*0.06; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][6]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{
	    	width: root.width*0.12; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][7]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{
	    	width: root.width*0.05; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][8]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{
	    	width: root.width*0.05;
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][9]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{
	    	width: root.width*0.07; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][10]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{
	    	width: root.width*0.07; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][11]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
	    Rectangle{
	    	width: root.width*0.06; 
	    	height: root.height 
	    	Text{
    			text: api.listeEPI[idR][12]
    			anchors.centerIn: parent
    			font.pixelSize: 20
    			color: "#4A6572"
    		}
	    }
    }

}