# -*- coding: utf-8 -*-
import sqlite3
import csv


def _connexion():
	try:
		connexion = sqlite3.connect("base_EPI.db")
		curseur = connexion.cursor()
		return connexion, curseur

	except Exception as e:
		print("Exceptions levée(s)")
		print(e)
		print(type(e))
		
def remplissageTypeEPI():
	connexion, curseur = _connexion()
	typeConnu = [ 'connecteur','degaines','frein','harnais','casque','cordelette','longe']
	sqlRequete = "INSERT INTO TypeEPI VALUES(?,?)"
	print(curseur.lastrowid)
	for types in typeConnu:
		if curseur.lastrowid == None:
			curseur.execute(sqlRequete,(0,types))
		else:
			curseur.execute(sqlRequete,(curseur.lastrowid+1,types))
	connexion.commit()
	print("types ajouter")
	connexion.close()

def remplissageCSV():

	connexion, curseur = _connexion()

	sqlRequete = "INSERT INTO EPI VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
 
	with open('testEPI.csv') as monFichierCSV:
		lecture = csv.reader(monFichierCSV, delimiter=';')
		numeroLigne = 0
		for ligne in lecture:
			if numeroLigne == 0:
				print("debut remplissage")
				numeroLigne+=1
			else:
				if curseur.lastrowid == None:
					ligne.insert(0, 1)	
					curseur.execute(sqlRequete,ligne)
				else:
					ligne.insert(0, curseur.lastrowid+1)	
					curseur.execute(sqlRequete,ligne)
				numeroLigne+=1
	connexion.commit()
	print("valeur ajoutés")
	connexion.close()