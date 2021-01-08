import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0

import "AffichageItems"

Page {
    title: qsTr("Affichage")
	property var listeValeur: ["","","","","","","","","","","","","","",""]

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

    Rectangle{
    	id: root
    	anchors.fill: parent

    	Rectangle{
    		id: data
    		color: "white"
    		height: root.height *0.95
			width: root.width*0.9
			radius: 10
			anchors.centerIn: parent

			TopBar{
				id:tb
			}

			Rectangle{
				id: filtre
				height: 40
				anchors.top: tb.bottom
				width: data.width
				Rectangle{
					id: rootFiltre
					anchors.fill: parent
					ListModel {
						id: theModel
						ListElement { name: "TOUT"; query: "/EPIs/EPI" ; isSelected: true}
						ListElement { name: "EMPRUNTE"; query: "/EPIs/EPI[statutLoc = '1']" ;isSelected: false}
						ListElement { name: "REBUT"; query: "/EPIs/EPI[rebut = '1']"; isSelected: false}
						ListElement { name: "RETRAIT"; query: "/EPIs/EPI[retrait = '1']"; isSelected: false}
					}

					ListView {
						anchors.fill: parent
						clip: true
						model: theModel
						orientation: ListView.Horizontal
						delegate: numberDelegate
					}

					Component {
						id: numberDelegate
						Rectangle{
							height: rootFiltre.height
							width: 120
							Text{
								text:name
								anchors.horizontalCenter:parent.horizontalCenter
								anchors.bottom: parent.bottom
								font.pixelSize: 15
								font.bold: isSelected ? true : false
								color: isSelected ? "#F9AA33" : "#8597A0"
							}

							MouseArea{
								anchors.fill: parent
								onClicked: {
									dataL.queryXML = query
									for(var i =0; i<4; i++){
										theModel.get(i).isSelected = false
									}
									theModel.get(index).isSelected = true
								}
							}
							Rectangle{
								height:1
								color:"#F9AA33"
								width: 60
								anchors.horizontalCenter : parent.horizontalCenter
								anchors.bottom : parent.bottom
								visible: isSelected ? true : false
							}
						}
					}
				}
			}

			Rectangle{
			// DATA IMPORTANTE : id  - type - numSerie - modele - marque - stock - filtre - plus
			// VALEUR LARGEUR  : 0.0255 - 0.2  -  0.3 -- 0.15 -- 0.15  - 0.05 - 0025 - 0.1
				id: topData
				height: 60
				anchors.top: filtre.bottom
				width: data.width
				Row{
					Rectangle{height: topData.height; width: topData.width*0.025; Text{text: "id"; anchors.centerIn: parent; font.pixelSize: 20; color: "#8597A0"}}
					Rectangle{height: topData.height; width: topData.width*0.2; Text{text: "Type"; anchors.centerIn: parent; font.pixelSize: 20; color: "#8597A0"}}
					Rectangle{height: topData.height; width: topData.width*0.3; Text{text: "Numero de serie"; anchors.centerIn: parent; font.pixelSize: 20; color: "#8597A0"}}
					Rectangle{height: topData.height; width: topData.width*0.15; Text{text: "Modèle"; anchors.centerIn: parent; font.pixelSize: 20; color: "#8597A0"}}
					Rectangle{height: topData.height; width: topData.width*0.15; Text{text: "Marque"; anchors.centerIn: parent; font.pixelSize: 20; color: "#8597A0"}}
					Rectangle{height: topData.height; width: topData.width*0.05; Text{text: "Stock"; anchors.centerIn: parent; font.pixelSize: 20; color: "#8597A0"}}
				}
				Rectangle{
					height: 1
					width: topData.width
					color:"#CBCBCB"
				}
			}

			Rectangle{anchors.bottom : topData.bottom; height: 1; width: topData.width; color:"#CBCBCB"}
			
			Rectangle{
				id: dataEPI
				height: data.height - tb.height - filtre.height - topData.height - 20
				anchors.top: topData.bottom
				width: data.width
				DataList{
					id: dataL
				}
			}
			 

			/*Rectangle{
				id: dataEPI
				height: data.height - tb.height - filtre.height - topData.height - 20
				anchors.top: topData.bottom
				width: data.width
				
				Rectangle{
					id: root1
					
					anchors.fill: parent

					Rectangle{
						id: mainRect
						anchors.fill: parent
						clip: true

						XmlListModel {
							id: xmlModel
							source: "../py/data.xml"
							onSourceChanged: reload();
							//query: "/EPIs/EPI[type = 'Connecteur']"
							query: queryXML
							XmlRole { name: "id"; query: "id/string()";isKey: true }
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
							delegate: numberDelegate1
						}

						Component {
							id: numberDelegate1
							// DATA IMPORTANTE : id  - type - numSerie - modele - marque - stock - filtre - plus
							// VALEUR LARGEUR  : 0.0255 - 0.2  -  0.3 -- 0.15 -- 0.15  - 0.05 - 0025 - 0.1
							Rectangle{
								width: root1.width
								height: 50
								
								Row{			
									Rectangle{ clip:true; width :root1.width*0.025; height: 50; Label{anchors.centerIn: parent; text: id; color:"#4A6572"} }
									Rectangle{ clip:true; width :root1.width*0.2  ; height: 50; Label{anchors.centerIn: parent; text: type; color:"#4A6572"} }
									Rectangle{ clip:true; width :root1.width * 0.3; height: 50; Label{anchors.centerIn: parent; text: numSerie; color:"#4A6572"} }
									Rectangle{ clip:true; width :root1.width * 0.15; height: 50; Label{anchors.centerIn: parent; text: modele ; color:"#4A6572"} }
									Rectangle{ clip:true; width :root1.width * 0.15; height: 50; Label{anchors.centerIn: parent; text: marque; color:"#4A6572"} }
									Rectangle{ clip:true; width :root1.width * 0.05; height: 50; Label{anchors.centerIn: parent; text: stock; color:"#4A6572"} }
					
									Rectangle{ 
										id: colorStatus
										width :root1.width * 0.075
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
										width :root1.width * 0.05
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
								id: rootRec1
								anchors.fill: parent

								Rectangle{id: titre; width: rootRec1.width-25; height : 50; x: 20; Text{ text: "EPI numero  " + epi[0]; anchors.verticalCenter:parent.verticalCenter; font.pixelSize: 30; color: "#4A6572"}}

								Rectangle{
									width: rootRec1.width
									height: rootRec1.height-50
									anchors.top: titre.bottom
									Grid {
										y: 10
										x: 20
										columns: 5
										spacing: 50				
										TextField{ width: rootRec1.width*0.15; objectName: " Connecteur"; placeholderText: epi[1] ; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " NumSerie"; placeholderText: epi[2]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Modele"; placeholderText: epi[3]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Marque"; placeholderText: epi[4]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Couleur"; placeholderText: epi[5]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Achat"; placeholderText: epi[6]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " DureeVie"; placeholderText: epi[7]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Modele"; placeholderText: epi[8]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Marque"; placeholderText: epi[9]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Couleur"; placeholderText: epi[10]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Connecteur"; placeholderText: epi[11]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " NumSerie"; placeholderText: epi[12]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Modele"; placeholderText: epi[13]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Marque"; placeholderText: epi[14]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Couleur"; placeholderText: epi[15]; focus: true}
										TextField{ width: rootRec1.width*0.15; objectName: " Couleur"; placeholderText: epi[16]; focus: true}
									}

									Rectangle{
										id: boutonValiderModificationEPI
										width: 200
										height: 50
										radius: 10
										color:"#F9AA33"
										Text{ text : "Valider"; color: "white"; font.pixelSize: 20; anchors.centerIn: parent}
										x: rootRec1.width - 250
										y: rootRec1.height - 120
										MouseArea{
											hoverEnabled: true
											onHoveredChanged: containsMouse ? opa.visible = true : opa.visible = false;
											anchors.fill: parent
											onClicked:{
												xmlModel.reload()
											}
										}
										Rectangle{
											anchors.fill: parent
											color: "white"
											opacity:0.2
											radius:10
											visible: false
										}
									}
								}
							}
							closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
						}
					}
				}
				
			}*/		
    	}

		DropShadow {
	        spread: 0.5 
	        anchors.fill: source
	        cached: true
	        horizontalOffset: 0
	        verticalOffset: 0
	        radius: 10
	        samples: 16
	        color: "#000000"
	        opacity: 0.1
	        smooth: true
	        source: data
	    }
	 }

	Popup{
		id:popUp
		width: 1000
		height: 400
		modal: true
		focus: true
		x: Math.round((parent.width - width) / 2)
		Rectangle{
			id: rootRec
			anchors.fill: parent

			Rectangle{
				width: rootRec.width
				height: rootRec.height
				Grid {
					y: 10
					x: 20
					columns: 5
					spacing: 50
					ComboBox{ id:typeField; width: rootRec.width*0.15;  
					    Component.onCompleted: createTypeEPI(api.listeTypeEPI.length)
						model: ListModel {id: typeEPI	}
					}
					TextField{id:numSerieField; width: rootRec.width*0.15; objectName: "NumSerie"; placeholderText: "NumSerie"; focus: true}
					Rectangle{id: dateFabField; z:2; width: rootRec.width*0.15; height: 40; CalendrierField{id: cal1} }
					Rectangle{id: dateAchatField; z:2; width: rootRec.width*0.15; height: 40; CalendrierField{id: cal2} }
					Rectangle{id: datePremUtilisationField; z:2; width: rootRec.width*0.15; height: 40; CalendrierField{id: cal3} }

					Rectangle{id: dateMiseRebutField; z:3; width: rootRec.width*0.15; height: 40; CalendrierField{id: cal4} }
					TextField{id: modeleField; width: rootRec.width*0.15; placeholderText:  "Modele"; focus: true}
					TextField{id: dureeVieField; width: rootRec.width*0.15;z:1; placeholderText: "Durée de vie"; focus: true}
					TextField{id: dureeUtilisationField; width: rootRec.width*0.15; placeholderText: "Durée utilisation"; focus: true}
					ComboBox{ id:marqueField; width: rootRec.width*0.15;  
						Component.onCompleted: createMarqueEPI(api.listeMarque.length)
						model: ListModel {id: marqueEPI}
					}
					TextField{id: couleurField; width: rootRec.width*0.15;  placeholderText: "Couleur"; focus: true}
					TextField{id: stockField; width: rootRec.width*0.15; placeholderText: "Stock"; focus: true}
					Rectangle{id: empty1; z:1; width: rootRec.width*0.15; height: 40}
					Rectangle{id: empty2; z:1; width: rootRec.width*0.15; height: 40}
					Rectangle{id: empty3; z:1; width: rootRec.width*0.15; height: 40}

					Rectangle{id:statutLocField; width:rootRec.width*0.15; height: 40;Switch{id:s1; text: "En location"} }
					Rectangle{id:enServiceField; width:rootRec.width*0.15; height: 40;Switch{id: s2; text: "En Service"} }
					Rectangle{id:retraitField; width:rootRec.width*0.15; height: 40;Switch{id: s3; text: "En Retrait"} }

					Rectangle{id:rebutField; width:rootRec.width*0.15; height: 40;Switch{id: s4;text: "En Rebut"} }
				}

				Rectangle{
					width: 200
					height: 50
					radius: 10
					z:1
					color:"#F9AA33"
					Text{
						text : "Valider"
						color: "white"
						font.pixelSize: 20
						anchors.centerIn: parent
					}
					x: rootRec.width - 250
					y: rootRec.height - 60
					MouseArea{
						id: mouseArea
						anchors.fill:parent
						hoverEnabled: true
						onHoveredChanged: containsMouse ? opa.visible = true : opa.visible = false;
						onClicked:{
							listeValeur = [typeField.currentText, numSerieField.text, cal1.getText(),cal2.getText(), cal3.getText(),cal4.getText(),modeleField.text,dureeVieField.text,dureeUtilisationField.text, marqueField.currentText,couleurField.text,stockField.text, s1.checked,s2.checked, s3.checked, s4.checked]
							api.setListeNouvelEPI(listeValeur);
							dataL.refresh()
							popUp.close()
						}
					}
					Rectangle{
						id: opa
						anchors.fill: parent
						radius: 10
						visible: false
						color: "white"
						opacity: 0.3
					}
				}
			}
		}
		closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
	}
}