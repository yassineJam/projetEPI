# -*- coding: utf-8 -*-
import sqlite3

TYPE_EPI = ['harnais','sangle'] 

def remplissage():
	connexion = sqlite3.connect("base_EPI.db")
	curseur = connexion.cursor()
	sqlRequete = "INSERT INTO EPI VALUES(4,'sangle', 14, 01-01-2001, 01-01-2001,01-01-2001,01-01-2001,'',1,1,'','bleu',2,TRUE,TRUE,TRUE,TRUE)"
	curseur.execute(sqlRequete)
	connexion.commit()
	print("valeur ajoutés")
	connexion.close()



def changementAttribut(idEPI,**table):
 	'''
		Fonction permetant de changer un ou plusieur attribut d'une EPI

		arguments:

		idEPI -- Il s'agit de la clé primaire de l'EPI, indispensable pour l'identifier
		table -- Dictionnaire conteant pour clé la colonne et pour valeur la valeur de la colonne a attribuer
 	'''
	try:
		connexion = sqlite3.connect("base_EPI.db")
		curseur = connexion.cursor()

		print("Nous modifions l'EPI de numeroId : {} ".format(idEPI))

		for attribut, valAttribut in table.items():
			if (attribut == 'TypeEpi' and valAttribut not in TYPE_EPI):
				print(TYPE_EPI)
				raise sqlite3.OperationalError(" %s n'est pas dans la liste des Type EPI" % valAttribut)

			curseur.execute("UPDATE EPI SET %s = ? WHERE Id_epi =? " %(attribut),(valAttribut,idEPI))
		connexion.commit()
		print("changement effectué(s) !")

	except sqlite3.OperationalError as oe:
		print("Erreur d'opperation")
		print(oe)
	except Exception as e:
		print("Exceptions levée(s)")
		print(e)
		print(type(e))
	finally:
		connexion.close()


def ajoutTypeEPI(typeEPI):
	if type(typeEPI) == str:
		TYPE_EPI.append(typeEPI)
	print(TYPE_EPI)
	