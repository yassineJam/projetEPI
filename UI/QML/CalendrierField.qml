import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0

Rectangle{
    id: fabricationCalendar
    function getText(){
        return dateFabField.text
    }
    TextField{
        id:dateFabField
        anchors.fill: parent
        text:Qt.formatDate(cal.selectedDate, "dd-MM-yyyy")
    }
    anchors.fill :parent
    height: 40
    border.width:1
    border.color: "#bdbdbd"
    Rectangle{
        color: "transparent"
        height: 40
        width:40
        anchors.right: fabricationCalendar.right
        Text{text: "\u2193";font.pixelSize: 15;color: "#bdbdbd"; anchors.centerIn: parent}
        MouseArea{
            anchors.fill : parent
            onClicked:{cal.visible =true}
        }
    }
    Calendar{
        id: cal
        z:10
        visible: false
        width: 300
        height: 250
        anchors.top:fabricationCalendar.bottom
        selectedDate: new Date()
        onClicked:  {
            dateFabField.text=Qt.formatDate(cal.selectedDate, "dd-MM-yyyy");
            cal.visible=false
        }
    }
}