from lxml import etree
import sqlite3

class xmlGestion():
    def __init__(self):
        self.__fichier = etree.parse("../data.xml")
        self.__epis = self.__fichier.getroot()

    def ajout(self,liste,idVal):
        epi = etree.Element("EPI")
        id = etree.SubElement(epi, "id")
        id.text = str(idVal)
        typeepi = etree.SubElement(epi,"type")
        typeepi.text = liste[0]
        num = etree.SubElement(epi,"numSerie")
        num.text = str(liste[1])
        dateFab = etree.SubElement(epi,"dateFab")
        dateFab.text = str(liste[2])
        dataAchat = etree.SubElement(epi,"dateAchat")
        dataAchat.text = str(liste[3])
        datePremUse = etree.SubElement(epi,"datePremUse")
        datePremUse.text = str(liste[4])
        dateRebut = etree.SubElement(epi, "dateRebut")
        dateRebut.text = str(liste[5])
        modele = etree.SubElement(epi,"modele")
        modele.text = str(liste[6])
        dureeVie = etree.SubElement(epi,"dureeVie")
        dureeVie.text = str(liste[7])
        dureeUse = etree.SubElement(epi, "dureeUse")
        dureeUse.text = str(liste[8])
        marque = etree.SubElement(epi, "marque")
        marque.text = str(liste[9])
        couleur = etree.SubElement(epi, "couleur")
        couleur.text = str(liste[10])
        stock = etree.SubElement(epi,"stock")
        stock.text= str(liste[11])
        statutLoc = etree.SubElement(epi, "statutLoc")
        if(liste[12] == False):
            statutLoc.text = "0"
        else:
            statutLoc.text = "1"
        service = etree.SubElement(epi, "service")
        if(liste[13] == False):
            service.text = "0"
        else:
            service.text = "1"
        retrait = etree.SubElement(epi, "retrait")
        if(liste[14] == False):
            retrait.text = "0"
        else:
            retrait.text = "1"
        rebut = etree.SubElement(epi, "rebut")
        if(liste[15] == False):
            rebut.text = "0"
        else:
            rebut.text = "1"
        self.__epis.append(epi)
        self.__fichier.write("../data.xml")
    
    def modif(self,valId):
        print(valId)
        print(type(valId))
        element = self.__fichier.findall("EPIs/EPI[id ='1']")
        print(element)
