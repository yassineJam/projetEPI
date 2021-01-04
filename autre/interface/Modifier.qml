import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    title: qsTr("Affichage")

    header: ToolBar {
        id: tbh
        ToolButton {
            id: toolButton
            text: "\u03A7"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                while (stackView.depth>1){
                    stackView.pop()
                }
            }
        }
        Label {
            text: "Affichage EPIs"
            anchors.centerIn: parent
        }
    }

    Rectangle{
        id: menu
        anchors.left: parent.left
        height: window.height
        width : 220
        color:"#e0e0e0"

        Column {
            anchors.fill: parent
            BouttonMenu{
                id: bm1
                textB: "Changer les attributs d'un EPI"
                indexSV: 0
            }
            BouttonMenu{
                id: bm2
                textB: "Ajouter un type d'EPI"
                indexSV: 1
            }
            BouttonMenu{
                id: bm3
                textB: "Supprimer un Type d'EPI"
                indexSV: 2
            }
            BouttonMenu{
                id: bm4
                textB: "Ajouter une marque d'EPI"
                indexSV: 3
            }
            BouttonMenu{
                id: bm5
                textB: "Supprimer une marque d'EPI"
                indexSV: 4
            }
            BouttonMenu{
                id: bm6
                textB: "Ajouter un EPI"
                indexSV: 5
            }
            BouttonMenu{
                id: bm7
                textB: "Supprimer un EPIt"
                indexSV: 6
            }
            BouttonMenu{
                id: bm8
                textB: "Ajouter une personne"
                indexSV: 7
            }
            BouttonMenu{
                id: bm9
                textB: "Supprimer une personne"
                indexSV: 8
            }
            BouttonMenu{
                id: bm10
                textB: "Ajouter un controleur"
                indexSV: 9
            }
            BouttonMenu{
                id: bm11
                textB: "Supprimer un controleur"
                indexSV: 10
            }
            BouttonMenu{
                id: bm12
                textB: "Ajouter une reservation"
                indexSV: 11
            }
            BouttonMenu{
                id: bm13
                textB: "Supprimer une reservation"
                indexSV: 12
            }
            BouttonMenu{
                id: bm14
                textB: "Effectuer un controle"
                indexSV: 13
            }
        }
    }

    Rectangle{
        id:ttaffiche
        anchors.left: menu.right 
        width: window.width - menu.width 
        height: window.height - tbh.height - toolB.height

        color:"white"
        visible:true
        clip: true

        SwipeView {
            id: swipeView
            anchors.fill: parent

            Item{
                Rectangle{
                    height: ttaffiche.height*0.94
                    width: ttaffiche.width*0.94
                    anchors.centerIn: parent
                    color: "gainsboro"
                }

                Label {
                    anchors.centerIn: parent
                    text: qsTr("Affichage de tout les EPIs")
                }
            }
            Item{
                Rectangle{
                    height: ttaffiche.height*0.94
                    width: ttaffiche.width*0.94
                    anchors.centerIn: parent
                    color: "gainsboro"
                }

                Label {
                    anchors.centerIn: parent
                    text: qsTr("Affichage des Epi d'un type")
                }
            
            }Item{
                Rectangle{
                    height: ttaffiche.height*0.94
                    width: ttaffiche.width*0.94
                    anchors.centerIn: parent
                    color: "gainsboro"
                }

                Label {
                    anchors.centerIn: parent
                    text: qsTr("Affichage des EPIs empruntés")
                }
            }Item{
                Rectangle{
                    height: ttaffiche.height*0.94
                    width: ttaffiche.width*0.94
                    anchors.centerIn: parent
                    color: "gainsboro"
                }

                Label {
                    anchors.centerIn: parent
                    text: qsTr("Affichage des EPIs en maintenance")
                }
            }Item{
                Rectangle{
                    height: ttaffiche.height*0.94
                    width: ttaffiche.width*0.94
                    anchors.centerIn: parent
                    color: "gainsboro"
                }

                Label {
                    anchors.centerIn: parent
                    text: qsTr("Affichage des EPIs en rebut")
                }
            }Item{
                Rectangle{
                    height: ttaffiche.height*0.94
                    width: ttaffiche.width*0.94
                    anchors.centerIn: parent
                    color: "gainsboro"
                }

                Label {
                    anchors.centerIn: parent
                    text: qsTr("Affichage des d'une EPI")
                }
            }Item{
                Rectangle{
                    height: ttaffiche.height*0.94
                    width: ttaffiche.width*0.94
                    anchors.centerIn: parent
                    color: "gainsboro"
                }

                Label {
                    anchors.centerIn: parent
                    text: qsTr("Affichage des EPIs en retrait")
                }
            }
        }
        
        PageIndicator {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            currentIndex: swipeView.currentIndex
            count: swipeView.count
        }
    }


   
}