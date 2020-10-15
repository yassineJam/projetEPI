# -*- coding: utf-8 -*-
import sqlite3
import os.path



def creationGlobal():
	try:
		if os.path.isfile('base.sql'):
			print("La base de donnée existe déja !")
		else :
			fichierSQL = open('base.sql','r')
			sql_chaine = fichierSQL.read()
			connexion = sqlite3.connect("base_EPI.db")
			curseur = connexion.cursor()
			curseur.executescript(sql_chaine)
			print("La base de donnée a été crée")
			connexion.close() 

	except Exception as e:
		print("Exception levée : ")
		print(e)
		connexion.close() 



