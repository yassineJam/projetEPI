# -*- coding: utf-8 -*-
import sqlite3
import csv
#import mysql.connector as MC


# connexion avec SQLite
def _connexion():
	try:
		connexion = sqlite3.connect("base_EPI.db")
		curseur = connexion.cursor()
		return connexion, curseur

	except Exception as e:
		print("Exceptions levée(s)")
		print(e)
		print(type(e))


# connexion avec MYSQL
'''
def _connexion():
	try:
		connexion = MC.connect(
			host = 'localhost', database = "base_EPI", user = "root", password = "")
		curseur = connexion.cursor()
		return connexion,cursor

	except Exception as e:
		print("Exceptions levée(s)")
		print(e)
		print(type(e))
'''


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



def changementAttribut(idEPI,**table):
	'''
		Fonction permetant de changer un ou plusieur attribut d'une EPI

		arguments:

		idEPI -- Il s'agit de la clé primaire de l'EPI, indispensable pour l'identifier
		tab
		le -- Dictionnaire conteant pour clé la colonne et pour valeur la valeur de la colonne a attribuer
	'''
	connexion, curseur = _connexion()
	print("Nous modifions l'EPI de numeroId : {} ".format(idEPI))
	for attribut, valAttribut in table.items():
		if (attribut == 'TypeEpi'): 
			# gerer abscence de epi dans la table typeepi
			raise sqlite3.OperationalError(" %s n'est pas dans la liste des Type EPI" % valAttribut)

		curseur.execute("UPDATE EPI SET %s = ? WHERE Id_epi =? " %(attribut),(valAttribut,idEPI))
	connexion.commit()
	print("changement effectué(s) !")
	connexion.close()


def ajoutTypeEPI(typeEPI):
	if type(typeEPI) == str:
		TYPE_EPI.append(typeEPI)
	print(TYPE_EPI)
	
