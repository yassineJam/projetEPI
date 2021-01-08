import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Page {
    title: qsTr("Affichage")

    Rectangle{
    	id: root
    	anchors.fill: parent
        Rectangle{
            id: main
            width : root.width*0.9
            height: root.height*0.98
            anchors.centerIn: parent
            
            Row{
                id: row
                spacing: main.width*0.05
                anchors.centerIn: parent
                Rectangle{
                    id: listeResa
                    border.width: 1
                    height: main.height*0.9
                    radius: 10
                    width: main.width* 0.35
                    ListeReservation{
                        id:lr
                    }
                }

                Rectangle{
                    id: listeReste
                    height: main.height*0.9
                    radius: 10
                    width: main.width* 0.60

                    Grid{
                        id: grid
                        columns : 2
                        spacing: listeReste.width * 0.04
                        Rectangle{ width : listeReste.width*0.48; height: listeReste.height*0.48;border.width: 0.5; border.color:"#707070";radius: 10; ListeMarque{id: lM; liste: api.listeMarque ; titre:"Marque"}}
                        Rectangle{ width : listeReste.width*0.48; height: listeReste.height*0.48;border.width: 0.5; border.color:"#707070";radius: 10; ListeMarque{id: lM2; liste: api.listeTypeEPI; titre: "Type" }}
                        Rectangle{ width : listeReste.width*0.48; height: listeReste.height*0.48;border.width: 0.5; border.color:"#707070";radius: 10; ListeMarque{id: lM3;titre:"Controle" }}
                        Rectangle{ width : listeReste.width*0.48; height: listeReste.height*0.48;border.width: 0.5; border.color:"#707070";radius: 10; ListeMarque{id: lM4 ;titre:"Personne"}}

                    }
                }
            } 
        }
    }
}