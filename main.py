# -*- coding: utf-8 -*-
import bddCreation as bd


def creationDeLaBDD():
	print("Creation de la base dans un fichier 'base_EPI.bd' ")
	bd.creationBDD()
	bd.creationTableEPI()
	bd.creationTablePersonne()
	bd.creationTableControleur()
	bd.creationTableControle()
	bd.creationTableContratLocation()


def main():
    #creationDeLaBDD()
    bd.creationGlobal()
    print("La base de donnée a été crée ")

if __name__ == "__main__":
    main()