#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct  9 15:02:56 2020

@author: eva
"""

import csv
with open('BDD_EPI.csv', newline='') as csvfile1:
EPI = csv.reader(csvfile1, delimiter=' ', quotechar='|')
#Affichage

#Afficher la liste de tout le matériel

def AfficheEPI():
    for row in EPI :
        print(', '.join(row))
    return()
    
#afficher la liste de matériel d'un type donné

def AfficheType(Type):
    for row in EPI :
        if (row[1] == Type) : 
            print(', '.join(row))
    return()

#afficher la liste de matériel emprunté

def AfficheEmprunt():
    for row in EPI : 
        if row[13]:
            print(', '.join(row))
        return()
        
#afficher la liste de matériel en maintenance
with open('BDD_Controle.csv', newline='') as csvfile2:
Controle = csv.reader(csvfile2, delimiter=' ', quotechar='|')

def AfficheMaintenance():
    for row in Controle : 
        print(', '.join(row))
    return()
    
#afficher la liste de matériel en rebut
def AfficheRebut():
    for row in EPI :
        if (row[6] <= int(datetime.datetime.today().strftime('%Y-%m-%d')[0:4])) : 
            print(', '.join(row))
    return()

#afficher la liste de matériel en retrait
def AfficheRetrait():
    for row in EPI :
        if row[14]==1 :
             print(','.join(row))
    return()
    
#afficher les epi nécessitant un contrôle
def AfficheBesoinControle()

#afficher les informations d’un matériel précis
def AfficheInfo(IdEpi):
    for row in EPI:
        if row[0]==IdEpi:
            print(','.join(row))
    return()
    
#export markdown



