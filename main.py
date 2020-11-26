# -*- coding: utf-8 -*-
from api import * 
from fonctionAffichageEva import *
from remplissage import *

#mettre lower partout 
def main():  
	while(1):
		print("\nAPI du logiciel de gestion des EPI ")
		print("=================================\n")
		print("1 - Affichage \t 2 - Gestion \t 3 - Quitter\n")

		choix = int(input("Choix : "))


		if choix == 1:
			print("\n Affichage \n")
			print("   1 - Afficher tout les EPI \t \t"," 2 - Afficher les Epi d'un type donné")
			print("   3 - Afficher les EPI empruntés \t ","4 - Afficher les Epi en maintenance")
			print("   5 - Afficher les EPI en rebut \t ","6 - Afficher les infos d'un EPI")
			print("   7 - Afficher les EPI en retrait \n")
			choixAffichage = int(input("Votre choix : "))
			
			if  choixAffichage == 1:
				afficheEPI()
			elif choixAffichage == 2:
				typeEntre = input("quel type souhaitez vous filtrer : ")
				afficheType(typeEntre)
			elif choixAffichage == 3:
				afficheEmprunt()
			elif choixAffichage == 4:
				afficheMaintenance()
			elif choixAffichage == 5:
				afficheRebut()
			elif choixAffichage == 6:
				idepi = input("quel est l'id de l'epi à afficher : ")
				afficheInfo(idepi)
			elif choixAffichage == 7:
				afficheRetrait()
			else: 
				print("valeur incorect \n")

		elif choix == 2:
			print("\n Gestion \n")
			print("   1  - Changer les attributs d'un EPI  ","  2 - Ajouter un type d'EPI")
			print("   3  - Supprimer un Type d'EPI  ","\t   4 - Ajouter une marque d'EPI")
			print("   5  - Supprimer une marque d'EPI\t "," 6 - Ajouter un EPI")
			print("   7  - Supprimer un EPI \t", "\t   8 - Ajouter une personne")
			print("   9  - Supprimer une personne \t", "\t   10 - Ajouter un controleur")
			print("   11 - Supprimer un controleur \t", "  12 - Ajouter une reservation")
			print("   13 - Supprimer une reservation \t", "  14 - Effectuer un controle")
			choixGestion = input("Vore choix : ")

			if choixGestion == 1:
				idEPI = input("Id de l'attribut à modifier")
				attribut = input("attribut à modifier :")
				valeur = input("Valeur de cette attriut ")
				changementAttribut(idEPI, valeur = attribut)
			elif choixGestion == 2:
				typeEPI = input("Quel est le type que vous souhaitez ajouter : ")
				ajoutTypeEPI(typeEPI)
			elif choixGestion == 3:
				typeEPI = input("Quel est le type d'EPI que vous souhaitez supprimer : ")
				supprimerTypeEPI(typeEPI)
			elif choixGestion == 4:
				marque = input("Quel est la marque que vous souhaitez ajouter : ")
				ajoutMarqueEPI(marque)
			elif choixGestion == 5:
				marque = input("Quel est la marque que vous souhaitez supprimer : ")
				supprimerMarqueEPI(marque)
			elif choixGestion == 6:
				ajoutEPI()
			elif choixGestion == 7:
				idEPI = input("Quel est l'ID de l'EPI à supprimer : ")
				supprimerEPI(idEPI)
			elif choixGestion == 8:
				prenom = input("Quel est le prenom de la personne à ajouter : ")
				nom = input("Quel est le nom de la personne à ajouter : ")
				ajoutPersonne(prenom,nom)
			elif choixGestion == 9:
				choixSupprimer = input("1 - Supprimer à l'aide de l'ID","\t 2 - Supprimer avec le nom prenom")
				if choixSupprimer == 1 :
					idPersonne = input("Entrer l'ID : ")
					supprimerPersonneID(idPersonne)
				elif choixSupprimer == 2:
					prenom = input("Quel est le prenom de la personne à ajouter : ")
					nom = input("Quel est le nom de la personne à ajouter : ")
					supprimerPersonne(prenom,nom)
				else:
					print("Erreur de valeur")	
			elif choixGestion == 10:
				prenom = input("Quel est le prenom du controleur à ajouter : ")
				nom = input("Quel est le nom du controleur à ajouter : ")
				ajoutControleur(prenom,nom)
			elif choixGestion == 11:
				choixSupprimer = input("1 - Supprimer à l'aide de l'ID","\t 2 - Supprimer avec le nom prenom")
				if choixSupprimer == 1 :
					idPersonne = input("Entrer l'ID : ")
					supprimerControleurID(idPersonne)
				elif choixSupprimer == 2:
					prenom = input("Quel est le prenom de la personne à ajouter : ")
					nom = input("Quel est le nom de la personne à ajouter : ")
					supprimerControleur(prenom,nom)
				else:
					print("Erreur de valeur")			
			elif choixGestion == 12:
				dateloc = input("Date de debut de location (YYYY-MM-DD) : ")
				dateRet = input("Date de retour de reservation : ")
				prenom = input("Prenom de l'emprunteur : ")
				nom = input("Nom de l'emprunteur : ")
				idEPI = input("Id de l'EPI à emprunter : ")
				remarque = input("Remarque eventuelles : ")
				ajoutReservation(dateloc,dateRet,prenom,nom,idEPI,remarque)
			elif choixGestion == 13:
				idcont = input("Id du contrat à supprimer")
				supprimerReservation(idcont)
			elif choixGestion == 14:
				idEPI = input("Id de l'EPI sur laquel on effectue le controle : ")
				nom = input("Nom du controleur : ")
				prenom = input("Prenom du controleur : ")
				typeControle = input("Type du controle : ")
				date = input("Date du controle : ")
				analyse = input("analyse : ")
				remarque = input("Remarque eventuelles : ")
				effectuerControle(idEPI,nom,prenom,typeControle,date,analyse,remarque)
			else:
				print("valeur incorect \n")

		elif choix == 3:
			print("\n Programme terminer \n")
			break;
		else:
			print("Mauvaise valeur entrée")


if __name__ == "__main__":
	main()