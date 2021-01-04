import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15


Window {
    id: root
    property int id:0
    property var array:[]
    function create(){
        for(let i=0; i< 100; i++){
            array[i] = api.listeEPI[i];
        }    
    }
    

    property var textEPI: api.listeEPI[id][0] + " " +api.listeEPI[id][1] +" " + api.listeEPI[id][2] +" " + api.listeEPI[id][3] + " " +api.listeEPI[id][4] + " " +api.listeEPI[id][5] + " " +api.listeEPI[id][6] + " " +api.listeEPI[id][7] + " " +api.listeEPI[id][8] + " " +api.listeEPI[id][9] + " " +api.listeEPI[id][10] + " " +api.listeEPI[id][11] + " " +api.listeEPI[id][12] +" " + api.listeEPI[id][13] +" " + api.listeEPI[id][14] + " " +api.listeEPI[id][15] +" " + api.listeEPI[id][16]

    width: 1280
    height: 480
    visible:true
    Rectangle{
        Component.onCompleted: create()
        id: rect
        height: root.height
        width: root.width*0.8
        border.width:2
        border.color: "red"
        clip: true
        ListView {
            anchors.fill: parent
            model: 100
            delegate: numberDelegate
            spacing: 5
        }

        Component {
            id: numberDelegate

            Rectangle{
                
                border.width:1
                width :400
                height: 50
                Label{
                    anchors.centerIn: parent
                    text: array[index][0] + " " + array[index][1]
                }
            }
        }  
    }      
}
