import QtQuick 2.9
import QtQuick.Controls 2.2

ItemDelegate {
 
    width: parent.width
    property string textB: ""
    property int indexSV: 0

    text: qsTr(textB)

    onClicked: {
        swipeView.currentIndex = indexSV
    }
    Rectangle{
    	id:r1
    	anchors.fill: parent
    	color: "white"
    	opacity: swipeView.currentIndex == indexSV ? 1:0
    }
    Rectangle{
    	id:rect1
    	anchors.fill: parent
    	color: "white"
    	opacity: 0
    }
    onHoveredChanged: hovered ? rect1.opacity = 0.5 : rect1.opacity = 0;
}