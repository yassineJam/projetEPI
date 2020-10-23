# -*- coding: utf-8 -*-
import sqlite3
import os.path



def main():
	try:
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

	finally:
		connexion.close()
		



if __name__ == "__main__":
    main()