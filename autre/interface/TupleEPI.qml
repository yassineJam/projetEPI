import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15


Rectangle {
	FontLoader { id: roboto; source: "Roboto-Regular.ttf" }
    id: rectRoot
    property int idR: 0
    anchors.centerIn: parent
    width: parent.width * 0.90
    height: 40
    color: "darkGray"
    clip: true
    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 6
        
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 35
            color: 'teal'
            Layout.minimumWidth: 10
            Layout.preferredWidth: 20  
            Text {
                color:"white"
                anchors.centerIn: parent
                text: api.listeEPI[idR][0]
            }
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 35
            color: 'teal'
            Layout.minimumWidth: 30
            Layout.preferredWidth: 40  
            Text {
                color:"white"
                font.family: "roboto"; font.pointSize: 20;
                anchors.centerIn: parent
                text: api.listeEPI[idR][1]
            }
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 35
            color: 'teal'
            Layout.minimumWidth: 30
            Layout.preferredWidth: 40  

            Text {
                color:"white"
                anchors.centerIn: parent
                text: api.listeEPI[idR][1]
            }
        }
    }
}