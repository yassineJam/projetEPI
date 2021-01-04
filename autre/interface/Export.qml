import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    title: qsTr("Export")
    
    Label {
        anchors.centerIn: parent
        text: qsTr("Export Page")
        anchors.verticalCenterOffset: 118
        anchors.horizontalCenterOffset: 0
    }
    
   

     TextInput {
           id: textInput
           x: 149
           y: 149
           width: 343
           height: 26
           text: qsTr("Saisir le nom du fichier d'export de la base de données :")
           anchors.verticalCenter: parent.verticalCenter
           font.pixelSize: 12
           anchors.verticalCenterOffset: -70
           anchors.horizontalCenterOffset: 0
           anchors.horizontalCenter: parent.horizontalCenter
     }
     
     Button {
         id: button
         x: 270
         y: 247
         text: qsTr("Exporter")
         anchors.verticalCenter: parent.verticalCenter
         anchors.verticalCenterOffset: 20
         anchors.horizontalCenter: parent.horizontalCenter
	 onClicked: exporter()
     }
       TextField {
           id: textField
           x: 220
           y: 194
           anchors.verticalCenter: parent.verticalCenter
           anchors.verticalCenterOffset: -30
           anchors.horizontalCenter: parent.horizontalCenter
           placeholderText: qsTr("Text Field")
	   onAccepted: ExportPossible(True)
       }
	function ExportPossible(booleen)
	{
	//var exportPossible : True
	if (booleen == False)
	{
		//exportPossible= False
		TextInput {
           		id: textInput2
           		x: 149
           		y: 149
           		width: 343
           		height: 26
           		text: qsTr("Le nom saisi ne permet pas l'export")
           		anchors.verticalCenter: parent.verticalCenter
           		font.pixelSize: 12
           		anchors.verticalCenterOffset: -90
           		anchors.horizontalCenterOffset: 0
           		anchors.horizontalCenter: parent.horizontalCenter
		
		}
	}
	return exportPossible
	}
	
	function exporter()
	{
	if (exportPossible = True)
	{
	//connecter à la fonction de l'API codée par G.LEGRAIN
	}
	}
	
   }