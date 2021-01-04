import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    title: qsTr("Home")
    Image {
        x: 144
        y: 23
        width: 237
        height: 204
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Image.AlignHCenter
        source: "/Users/eva/Desktop/Logo.jpg"
        anchors.verticalCenterOffset: -23
        anchors.horizontalCenter: parent.horizontalCenter
        	fillMode: Image.PreserveAspectFit
	}
    	Label {
        	anchors.centerIn: parent
            text: qsTr("Home Screen")
            anchors.verticalCenterOffset: 115
            anchors.horizontalCenterOffset: 1
    	}
    	Button {
        	id : buttonHelp
            x: 540
            y: 419
            width: 74
            height: 30
            flat : true
            text : qsTr("Help")
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 31
            anchors.rightMargin: 31
            padding: 6
            highlighted: true        
            Connections {
                target: buttonHelp
                onClicked: console.log("clicked")
            }
        }
} 
