import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15

Rectangle{
	id:filtreMenu
	anchors.fill: parent
	Column{
		Rectangle{
			width : filtre.width
			height: 65
			Label{
				x:25
				text: "Filtre"
				anchors.verticalCenter: parent.verticalCenter
				font.pixelSize: 25
				color: "#707070"
			}
		}
		Rectangle{
			width : filtre.width
			height: 65
			Rectangle{
				height: 23
				width: 23
				color:"#7AA579"
				anchors.verticalCenter: parent.verticalCenter
				x:30
				radius: 5
			}
			Label{
				x:75
				text: "Disponible"
				anchors.verticalCenter: parent.verticalCenter
				font.pixelSize: 20
				color: "#707070"
			}
		}
		Rectangle{
			width : filtre.width
			height: 65
			Rectangle{
				height: 23
				width: 23
				color:"#798CA5"
				anchors.verticalCenter: parent.verticalCenter
				x:30
				radius: 5
			}
			Label{
				x:75
				text: "En Retrait"
				anchors.verticalCenter: parent.verticalCenter
				font.pixelSize: 20
				color: "#707070"
			}
		}
		Rectangle{
			width : filtre.width
			height: 65
			Rectangle{
				height: 23
				width: 23
				color:"#ADAA59"
				anchors.verticalCenter: parent.verticalCenter
				x:30
				radius: 5
			}
			Label{
				x:75
				text: "En Location"
				anchors.verticalCenter: parent.verticalCenter
				font.pixelSize: 20
				color: "#707070"
			}
		}
		Rectangle{
			width : filtre.width
			height: 65
			Rectangle{
				height: 23
				width: 23
				color:"#AC5A5A"
				anchors.verticalCenter: parent.verticalCenter
				x:30
				radius: 5
			}
			Label{
				x:75
				text: "En rebut"
				anchors.verticalCenter: parent.verticalCenter
				font.pixelSize: 20
				color: "#707070"
			}
		}
	}
}