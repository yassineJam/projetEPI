import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.XmlListModel 2.0


Window {
    id: root
    
    width: 640
    height: 480
    visible: true
    title: "Hello Python World!"
    
    XmlListModel {
        id: xmlModel
        source: "monData.xml"
        query: "/rss/EPIs/EPI"
        XmlRole { name: "type"; query: "type/string()" }
        XmlRole { name: "couleur"; query: "couleur/string()" }
    }

    ListView {
        width: root.width*0.90
        height: root.height*0.90
        clip: true
        model: xmlModel
        delegate: numberDelegate
    }

    Component {
        id: numberDelegate
        Rectangle{
            border.width:1
            width :400
            height: 50
            Label{
                anchors.centerIn: parent
                text: type + " " + couleur
            }
        }
    }  

}
