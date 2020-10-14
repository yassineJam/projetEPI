# -*- coding: utf-8 -*-
import sqlite3


def creationGlobal():
	try:
		fichierSQL = open('base.sql','r')
		sql_chaine = fichierSQL.read()

		connexion = sqlite3.connect("base_EPI.db")
		curseur = connexion.cursor()
		curseur.executescript(sql_chaine)
		print("La base de donnée a été crée ")


	except Exception as e:
		print("Exception levée : ")
		print(e)

	finally:
		connexion.close() 

