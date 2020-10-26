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

def AfficheEPI():
    try:
        connection = sqlite3.connect('/Users/eva/Documents/Centrale/COURS/EI2/INFO/PAPPL/base_EPI.db')
        curseur = connection.cursor()
        curseur.execute('SELECT * From EPI')
        rows = curseur.fetchall()
        for row in rows :
            print (row)
    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        #on ferme la connection avec la base de donnée
        curseur.commit()
        curseur.close()
    return()
        
#afficher la liste de matériel d'un type donné

def AfficheType(Type):
    try :
        connection = sqlite3.connect('/Users/eva/Documents/Centrale/COURS/EI2/INFO/PAPPL/base_EPI.db')
        curseur = connection.cursor()
        curseur.execute('SELECT * From EPI Where TypeEPI = Type')
        rows = curseur.fetchall()
        for row in rows :
            print (row)
    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        #on ferme la connection avec la base de donnée
        curseur.commit()
        curseur.close()
    return()
    
#afficher la liste de matériel emprunté

def AfficheEmprunt():
    try : 
        connection = sqlite3.connect('/Users/eva/Documents/Centrale/COURS/EI2/INFO/PAPPL/base_EPI.db')
        curseur = connection.cursor()
        curseur.execute('SELECT * From EPI Where StatutLocation = 1')
        rows = curseur.fetchall()
        for row in rows :
            print (row)
    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        #on ferme la connection avec la base de donnée
        curseur.commit()
        curseur.close()
    return()
        
#afficher la liste de matériel en maintenance 

def AfficheMaintenance():
    try : 
        connection = sqlite3.connect('/Users/eva/Documents/Centrale/COURS/EI2/INFO/PAPPL/base_EPI.db')
        curseur = connection.cursor()
        curseur.execute('SELECT * From Maintenance')
        rows = curseur.fetchall()
        for row in rows :
            print (row)
    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        #on ferme la connection avec la base de donnée
        curseur.commit()
        curseur.close()
    return()
    
#afficher la liste de matériel en rebut
def AfficheRebut():
    try : 
        connection = sqlite3.connect('/Users/eva/Documents/Centrale/COURS/EI2/INFO/PAPPL/base_EPI.db')
        curseur = connection.cursor()
        curseur.execute('SELECT * From EPI Where MiseEnRebut = 1')
        rows = curseur.fetchall()
        for row in rows :
            print (row)
    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        #on ferme la connection avec la base de donnée
        curseur.commit()
        curseur.close()
    return()

#afficher la liste de matériel en retrait = matériel ayant besoin d'un contrôle complémentaire
def AfficheRetrait():
    try :
        connection = sqlite3.connect('/Users/eva/Documents/Centrale/COURS/EI2/INFO/PAPPL/base_EPI.db')
        curseur = connection.cursor()
        curseur.execute('SELECT * From EPI Where RetraitEPI = 1')
        rows = curseur.fetchall()
        for row in rows :
            print (row)
    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        #on ferme la connection avec la base de donnée
        curseur.commit()
        curseur.close()
    return()

#afficher les informations d’un matériel précis
def AfficheInfo(IdEpi):
    try :
        connection = sqlite3.connect('/Users/eva/Documents/Centrale/COURS/EI2/INFO/PAPPL/base_EPI.db')
        curseur = connection.cursor()
        curseur.execute('SELECT * From EPI Where IdEPI = IdEpi')
        rows = curseur.fetchall()
        for row in rows :
            print (row)
    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        #on ferme la connection avec la base de donnée
        curseur.commit()
        curseur.close()
    return()
    

 
