#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 19:17:20 2020

@author: eva
"""
import sqlite3
import csv
import datetime


#Afficher la liste de tout le matériel

def _affichage(tableau,curseur):
	flag = 1
	nomsColonne =['Id_epi','TypeEpi', 'NumSerie','DateDeFabrication', 'DateAchat', 'DatePremiereUtilisation', 'DateMiseAuRebut', 'Modele', 'DureeDeVie', 'DureeUtilisation','Marque', 'Couleur', 'NombreDansLeLot', 'StatutLocation', 'MisEnService', 'RetraitEPI', 'MiseEnRebut']
	for item in tableau:
		for i in range(1,16):
			curseur.execute('SELECT MAX(LENGTH({})) FROM EPI'.format(nomsColonne[i]))
			longueurColonneMax = curseur.fetchall()[0][0]
			if type(item[i])==str:
				print(item[i].rjust(longueurColonneMax)+ " |", end = '')
			else:
				print(str(item[i]).rjust(longueurColonneMax) + " |", end='')
		flag = 0
		print("\n")
				
def afficheEPI():
	try:
		connection = sqlite3.connect('base_EPI.db')
		curseur = connection.cursor()
		curseur.execute('SELECT * From EPI')
		rows = curseur.fetchall()
		_affichage(rows,curseur)
	except Exception as e:
		print("Exception levée : ")
		print(e)
	finally :
		#on ferme la connection avec la base de donnée
		connection.commit()
		connection.close()
	return()
		
#afficher la liste de matériel d'un type donné

def afficheType(typeEPI):
	typeEPI = typeEPI.lower()
	try :
		connection = sqlite3.connect('base_EPI.db')
		curseur = connection.cursor()
		curseur.execute('SELECT * From EPI Where TypeEPI = ? OR TypeEPI = ?',(typeEPI,typeEPI.capitalize()))
		rows = curseur.fetchall()
		_affichage(rows,curseur)
	except Exception as e:
		print("Exception levée : ")
		print(e)
	finally :
		#on ferme la connection avec la base de donnée
		connection.commit()
		connection.close()
	return()
	
#afficher la liste de matériel emprunté

def afficheEmprunt():
	try : 
		connection = sqlite3.connect('base_EPI.db')
		curseur = connection.cursor()
		curseur.execute('SELECT * From EPI WHERE StatutLocation = 1')
		rows = curseur.fetchall()
		_affichage(rows,curseur)
	except Exception as e:
		print("Exception levée : ")
		print(e)
	finally :
		#on ferme la connection avec la base de donnée
		connection.commit()
		connection.close()
	return()
		
#afficher la liste de matériel en maintenance 

def afficheMaintenance():
	try : 
		connection = sqlite3.connect('base_EPI.db')
		curseur = connection.cursor()
		curseur.execute('SELECT * From Maintenance')
		rows = curseur.fetchall()
		_affichage(rows,curseur)
	except Exception as e:
		print("Exception levée : ")
		print(e)
	finally :
		#on ferme la connection avec la base de donnée
		connection.commit()
		connection.close()
	return()
	
#afficher la liste de matériel en rebut
def afficheRebut():
	try : 
		connection = sqlite3.connect('base_EPI.db')
		curseur = connection.cursor()
		curseur.execute('SELECT * From EPI Where MiseEnRebut = 1')
		rows = curseur.fetchall()
		_affichage(rows,curseur)
	except Exception as e:
		print("Exception levée : ")
		print(e)
	finally :
		#on ferme la connection avec la base de donnée
		connection.commit()
		connection.close()
	return()

#afficher la liste de matériel en retrait = matériel ayant besoin d'un contrôle complémentaire
def afficheRetrait():
	try :
		connection = sqlite3.connect('base_EPI.db')
		curseur = connection.cursor()
		curseur.execute('SELECT * From EPI Where RetraitEPI = 1')
		rows = curseur.fetchall()
		_affichage(rows,curseur)
	except Exception as e:
		print("Exception levée : ")
		print(e)
	finally :
		#on ferme la connection avec la base de donnée
		connection.commit()
		connection.close()
	return()

#afficher les informations d’un matériel précis
def afficheInfo(IdEpi):
	try :
		connection = sqlite3.connect('base_EPI.db')
		curseur = connection.cursor()
		curseur.execute('SELECT * From EPI Where Id_epi = ? ',(IdEpi,))
		rows = curseur.fetchall()
		_affichage(rows,curseur)
	except Exception as e:
		print("Exception levée : ")
		print(e)
	finally :
		#on ferme la connection avec la base de donnée
		connection.commit()
		connection.close()
	return()
	

 
