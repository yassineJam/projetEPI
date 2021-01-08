from lxml import etree
import sqlite3



def myFunction():
    print("maj")
    connexion = sqlite3.connect("../base_EPI.db")
    curseur = connexion.cursor()
  
    fichier = etree.parse("../data.xml")
    epis = fichier.getroot()
    curseur.execute("SELECT * FROM EPI")
    rows = curseur.fetchall()

    for row in rows: 
        print(row)
        epi = etree.Element("EPI")
        id = etree.SubElement(epi, "id")
        id.text = str(row[0])

        typeepi = etree.SubElement(epi,"type")
        typeepi.text = row[1]

        num = etree.SubElement(epi,"numSerie")
        num.text = str(row[2])

        dateFab = etree.SubElement(epi,"dateFab")
        dateFab.text = str(row[3])

        dataAchat = etree.SubElement(epi,"dateAchat")
        dataAchat.text = str(row[4])

        datePremUse = etree.SubElement(epi,"datePremUse")
        datePremUse.text = str(row[5])

        dateRebut = etree.SubElement(epi, "dateRebut")
        dateRebut.text = str(row[6])

        modele = etree.SubElement(epi,"modele")
        modele.text = str(row[7])

        dureeVie = etree.SubElement(epi,"dureeVie")
        dureeVie.text = str(row[8])

        dureeUse = etree.SubElement(epi, "dureeUse")
        dureeUse.text = str(row[9])

        marque = etree.SubElement(epi, "marque")
        marque.text = str(row[10])

        couleur = etree.SubElement(epi, "couleur")
        couleur.text = str(row[11])

        stock = etree.SubElement(epi,"stock")
        stock.text= str(row[12])

        statutLoc = etree.SubElement(epi, "statutLoc")
        if(row[13] == False):
            statutLoc.text = "0"
        else:
            statutLoc.text = "1"

        service = etree.SubElement(epi, "service")
        if(row[14] == False):
            service.text = "0"
        else:
            service.text = "1"
        
        retrait = etree.SubElement(epi, "retrait")
        if(row[15] == False):
            retrait.text = "0"
        else:
            retrait.text = "1"

        rebut = etree.SubElement(epi, "rebut")
        if(row[16] == False):
            rebut.text = "0"
        else:
            rebut.text = "1"
        
        epis.append(epi)
    fichier.write("../data.xml")
    
if __name__ == '__main__':
    myFunction()