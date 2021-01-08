import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0


Rectangle{
	id: root
	property var epi : ["","","","","","","","","","","","","","","","",""]
	property var listeval: ["","","","","","","","","","","","","","",""]
	anchors.fill: parent
	property string queryXML: "/EPIs/EPI"

	function createTypeEPI(size){
		for(var i = 0; i < size ; ++i) {
			typeEPI.insert(i,{ text : api.listeTypeEPI[i]})
		}
	}

	function createMarqueEPI(size){
		for(var i = 0; i < size ; ++i) {
			marqueEPI.insert(i,{ text : api.listeMarque[i]})
		}
	}

	function refresh(){
		xmlModel.reload();
	}

    Rectangle{
    	id: mainRect
    	anchors.fill: parent
    	clip: true

		XmlListModel {
			id: xmlModel
			source: "../data.xml"
			query: queryXML
			XmlRole { name: "id"; query: "id/string()" }
			XmlRole { name: "type"; query: "type/string()" }
			XmlRole { name: "numSerie"; query: "numSerie/string()" }
			XmlRole { name: "dateFab"; query: "dateFab/string()" }
			XmlRole { name: "dateAchat"; query: "dateAchat/string()" }
			XmlRole { name: "datePremUse"; query: "datePremUse/string()" }
			XmlRole { name: "dateRebut"; query: "dateRebut/string()" }
			XmlRole { name: "modele"; query: "modele/string()" }
			XmlRole { name: "dureeVie"; query: "dureeVie/string()" }
			XmlRole { name: "dureeUse"; query: "dureeUse/string()" }
			XmlRole { name: "marque"; query: "marque/string()" }
			XmlRole { name: "couleur"; query: "couleur/string()" }
			XmlRole { name: "stock"; query: "stock/string()" }
			XmlRole { name: "statutLoc"; query: "statutLoc/string()" }
			XmlRole { name: "service"; query: "service/string()" }
			XmlRole { name: "retrait"; query: "retrait/string()" }
			XmlRole { name: "rebut"; query: "rebut/string()" }
		}


		ListView {
			id: view
			anchors.fill: parent
			clip: true
			model: xmlModel
			delegate: numberDelegate
		}

		Component {
			id: numberDelegate
			// DATA IMPORTANTE : id  - type - numSerie - modele - marque - stock - filtre - plus
			// VALEUR LARGEUR  : 0.0255 - 0.2  -  0.3 -- 0.15 -- 0.15  - 0.05 - 0025 - 0.1
			Rectangle{
				width: root.width
				height: 50
				
				Row{			
					Rectangle{ clip:true; width :root.width*0.025; height: 50; Label{anchors.centerIn: parent; text: id; color:"#4A6572"} }
					Rectangle{ clip:true; width :root.width*0.2  ; height: 50; Label{anchors.centerIn: parent; text: type; color:"#4A6572"} }
					Rectangle{ clip:true; width :root.width * 0.3; height: 50; Label{anchors.centerIn: parent; text: numSerie; color:"#4A6572"} }
					Rectangle{ clip:true; width :root.width * 0.15; height: 50; Label{anchors.centerIn: parent; text: modele ; color:"#4A6572"} }
					Rectangle{ clip:true; width :root.width * 0.15; height: 50; Label{anchors.centerIn: parent; text: marque; color:"#4A6572"} }
					Rectangle{ clip:true; width :root.width * 0.05; height: 50; Label{anchors.centerIn: parent; text: stock; color:"#4A6572"} }
	
					Rectangle{ 
						id: colorStatus
						width :root.width * 0.075
						height: 50
						Rectangle{
							height: 16; 
							width : 16; 
							radius: 8; 
							color: if(service == "1" && statutLoc =="0" ){"#7AA579"} else if(retrait =="1"){"#AC5A5A"}else if(statutLoc == "1"){"#ADAA59"}else if(rebut =="1"){"#798CA5"}else "white"
							anchors.centerIn: parent
						} 
					}
					
					Rectangle{
						id: modifierEPI
						width :root.width * 0.05
						height: 50
						Label{ text: "+"; anchors.centerIn: parent; font.pixelSize: 20; color: "#4A6572"}
						MouseArea{
							hoverEnabled: true
							anchors.fill: parent
							onClicked: {
								epi= [id, type,numSerie, dateFab,dateAchat,datePremUse,dateRebut, modele, dureeVie,dureeUse, marque,couleur,stock,statutLoc,service,retrait,rebut]
								popUpInfoEPI.open()
							}
							onHoveredChanged: containsMouse ? opa.visible = true : opa.visible = false;
						}
					}
				}
				Rectangle{id: opa; width: root.width; height: 50; color:"#F9AA33"; opacity: 0.3; visible: false}
			}		
		}  

		

		Popup{
			id: popUpInfoEPI
			width: 1000
			height: 500
			modal: true
			focus: true
			x: Math.round((parent.width - width) / 2)

			Rectangle{
				id: rootRec
				anchors.fill: parent

				Rectangle{id: titre; width: rootRec.width-25; height : 50; x: 20; Text{ text: "EPI numero  " + epi[0]; anchors.verticalCenter:parent.verticalCenter; font.pixelSize: 30; color: "#4A6572"}}

				Rectangle{
					width: rootRec.width
					height: rootRec.height-50
					anchors.top: titre.bottom
					Grid {
						y: 10
						x: 20
						columns: 5
						spacing: 50				
						ComboBox{ id:typeField; width: rootRec.width*0.15; displayText:epi[1] 
							Component.onCompleted: createTypeEPI(api.listeTypeEPI.length)
							model: ListModel {id: typeEPI	}
						}
						TextField{id:numSerieField; width: rootRec.width*0.15; text: epi[2]; focus: true}
						Rectangle{id: dateFabField; z:2; width: rootRec.width*0.15; height: 40; CalendrierField{id: cal1} }
						Rectangle{id: dateAchatField; z:2; width: rootRec.width*0.15; height: 40; CalendrierField{id: cal2} }
						Rectangle{id: datePremUtilisationField; z:2; width: rootRec.width*0.15; height: 40; CalendrierField{id: cal3} }

						Rectangle{id: dateMiseRebutField; z:3; width: rootRec.width*0.15; height: 40; CalendrierField{id: cal4} }
						TextField{id: modeleField; width: rootRec.width*0.15; text:  epi[7]; focus: true}
						TextField{id: dureeVieField; width: rootRec.width*0.15;z:1; text: epi[8]; focus: true}
						TextField{id: dureeUtilisationField; width: rootRec.width*0.15; text: epi[9]; focus: true}
						ComboBox{ id:marqueField; width: rootRec.width*0.15;  
							Component.onCompleted: createMarqueEPI(api.listeMarque.length)
							model: ListModel {id: marqueEPI}
						}
						TextField{id: couleurField; width: rootRec.width*0.15;  text: epi[11]; focus: true}
						TextField{id: stockField; width: rootRec.width*0.15;  text: epi[12]; focus: true}
						Rectangle{id: empty1; z:1; width: rootRec.width*0.15; height: 40}
						Rectangle{id: empty2; z:1; width: rootRec.width*0.15; height: 40}
						Rectangle{id: empty3; z:1; width: rootRec.width*0.15; height: 40}

						Rectangle{id:statutLocField; width:rootRec.width*0.15; height: 40;Switch{id:s1; text: "En location"} }
						Rectangle{id:enServiceField; width:rootRec.width*0.15; height: 40;Switch{id: s2; text: "En Service"} }
						Rectangle{id:retraitField; width:rootRec.width*0.15; height: 40;Switch{id: s3; text: "En Retrait"} }

						Rectangle{id:rebutField; width:rootRec.width*0.15; height: 40;Switch{id: s4;text: "En Rebut"} }
						}

					Rectangle{
						id: boutonValiderModificationEPI
						width: 200
						height: 50
						radius: 10
						color:"#F9AA33"
						Text{ text : "Valider"; color: "white"; font.pixelSize: 20; anchors.centerIn: parent}
						x: rootRec.width - 250
						y: rootRec.height - 120
						MouseArea{
							anchors.fill: parent
							onClicked:{
								listeval[0]= epi[0]
								listeval[1] = typeField.currentText
								listeval[2] = numSerieField.text
								listeval[3] = cal1.getText()
								listeval[4] = cal2.getText()
								listeval[5] = cal3.getText()
								listeval[6] = cal4.getText()
								listeval[7] = modeleField.text
								listeval[8] = dureeVieField.text
								listeval[9] = dureeUtilisationField.text
								listeval[10] = marqueField.currentText
								listeval[11] = couleurField.text
								listeval[12] = stockField.text
								listeval[13] = s1.checked
								listeval[14]= s2.checked
								listeval[15]= s3.checked
								listeval[16]= s4.checked
								xmlModel.reload()
								api.setNouvelEPI(listeval)
								popUpInfoEPI.close()
							}
						}
					}
				}
			}
			closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
		}
    }
}