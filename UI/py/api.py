# -*- coding: utf-8 -*-
import sqlite3
import datetime
#import mysql.connector as MC


class API():
    def __init__(self):
        self.__connexion = sqlite3.connect("../base_EPI.db")
        self.__curseur = self.__connexion.cursor()

    def changementAttribut(self,idEPI,**table):
        '''
            Fonction permetant de changer un ou plusieur attribut d'une EPI

            arguments:

            idEPI -- Il s'agit de la clé primaire de l'EPI, indispensable pour l'identifier
            table -- Dictionnaire conteant pour clé la colonne et pour valeur la valeur de la colonne a attribuer
        '''
        print("Nous modifions l'EPI de numeroId : {} ".format(idEPI))
        for attribut, valAttribut in table.items():
            if (attribut == 'TypeEPI'): 
                self.__curseur.execute('SELECT TypeEPI FROM TypeEPI')
                listeType = self.__curseur.fetchall()
                if (valAttribut,) not in listeType:
                    raise sqlite3.OperationalError(" %s n'est pas dans la liste des Type EPI" % valAttribut)
            self.__curseur.execute("UPDATE EPI SET %s = ? WHERE Id_epi =? " %(attribut),(valAttribut,idEPI))
        self.__connexion.commit()
        print("changement effectué(s) !")


    def ajoutTypeEPI(self,typeEPI):
        '''
            Fonction permetant d'ajouter un type d'EPI à la base

            arguments:

            typeEPI -- Il s'agit du type d'EPI que l'on shouaite ajouter
        '''
        if type(typeEPI) != str:
            print("erreur ce n'est pas une chaine de caractere")
        else:
            self.__curseur.execute('SELECT TypeEPI FROM TypeEPI')
            listeType = self.__curseur.fetchall()
            typeEPI = typeEPI.lower()
            if (typeEPI,) in listeType:
                print("{} est deja dans la liste des types d'EPI".format(typeEPI))
            else :
                print("{} n'est pas dans la liste on l'ajoute".format(typeEPI))
                self.__curseur.execute('INSERT INTO TypeEPI(TypeEPI) VALUES (?)',(typeEPI,))
                self.__connexion.commit()

    def supprimerTypeEPI(self,typeEPI):
        '''
            Fonction permetant de supprimer un type d'EPI à la base

            arguments:

            typeEPI -- Il s'agit du type d'EPI que m'on shouaite supprimer 
        '''
        self.__curseur.execute('SELECT TypeEPI FROM TypeEPI')
        listeType = self.__curseur.fetchall()
        if (typeEPI,) in listeType:
            self.__curseur.execute('DELETE FROM TypeEPI WHERE TypeEPI = ?',(typeEPI,))
            print("Le type '{}' a été supprimer de la liste des types EPI".format(typeEPI))
        else:
            print("{} ne peut etre supprimer car il ne fait pas partie de la liste des type EPI".format(typeEPI))
        self.__connexion.commit()

    def ajoutMarqueEPI(self,marque):
        '''
            Fonction permetant d'ajouter unn marque d'EPI à la base

            arguments:

            marque -- Il s'agit de la marque d'EPI que l'on shouaite ajouter
        '''
        if type(marque) != str:
            print("erreur ce n'est pas une chaine de caractere")
        else:
            self.__curseur.execute('SELECT Marque FROM MarqueEPI')
            listeMarque = self.__curseur.fetchall()
            marque = marque.lower()
            if (marque,) in listeMarque:
                print("{} est deja dans la liste des marque d'EPI".format(marque))
            else :
                print("{} n'est pas dans la liste on l'ajoute".format(marque))
                self.__curseur.execute('INSERT INTO MarqueEPI(Marque) VALUES (?)',(marque,))
                self.__connexion.commit()

    def supprimerMarqueEPI(self,marque):
        '''
            Fonction permetant de supprimer une marque d'EPI à la base

            arguments:

            marque -- Il s'agit de la marque d'EPI que m'on shouaite supprimer 
        '''
        self.__curseur.execute('SELECT Marque FROM MarqueEPI')
        listeMarque = self.__curseur.fetchall()
        if (marque,) in listeMarque:
            self.__curseur.execute('DELETE FROM MarqueEPI WHERE Marque = ?',(marque,))
            print("La marque '{}' a été supprimer de la liste des marques EPI".format(marque))
        else:
            print("{} ne peut etre supprimer car elle ne fait pas partie de la liste des marques d'EPI".format(marque))
        self.__connexion.commit()

    def ajoutEPI(self,typeEPI,numSerie,dateFabri,dateAchat,datePremUse,dateMiseRebut,modele,dureeVie,dureeUse,marque,couleur,nombreLot,statutloc,service,retrait,rebut):
        '''
        '''
        self.__curseur.execute('SELECT Marque FROM MarqueEPI')
        listeMarque = self.__curseur.fetchall()
        self.__curseur.execute('SELECT TypeEPI FROM TypeEPI')
        listeType = self.__curseur.fetchall()

        if( (typeEPI,) not in listeType or (marque,) not in listeMarque):
            print("Cette marque ou ce type n'existe pas, ajouter le/la/les d'abord")
        else:
            self.__curseur.execute('''INSERT INTO 
                EPI(TypeEpi,NumSerie,DateDeFabrication,DateAchat,DatePremiereUtilisation,DateMiseAuRebut,Modele,DureeDeVie,DureeUtilisation,Marque,Couleur,NombreDansLeLot,StatutLocation,MisEnService,RetraitEPI,MiseEnRebut)
                VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)''',(typeEPI,numSerie,dateFabri,dateAchat,datePremUse,dateMiseRebut,modele,dureeVie,dureeUse,marque,couleur,nombreLot,statutloc,service,retrait,rebut))
            self.__connexion.commit()
            print("EPI ajouté")
            return 1


    def supprimerEPI(self,idEPI):
        '''
            Fonction permetant de supprimer un EPI à l'aide de son ID

            argumennts:

            idEPI -- l'identificateur de l'EPI à supprimer
        '''
        self.__curseur.execute('SELECT Id_epi FROM EPI')
        listeID = self.__curseur.fetchall()
        if (idEPI,) in listeID:
            self.__curseur.execute('DELETE FROM EPI WHERE Id_epi = ?',(idEPI,))
            print("L'EPI d'ID {} a été supprimé".format(idEPI))
        else:
            print("Aucun EPI n'a comme ID {}".format(idEPI))
        self.__connexion.commit()


    def ajoutPersonne(self,prenom,nom):
        '''
            Fonctions permettant d'ajouter une personne à la base de donné

            arguments:

            nom -- nom de la personne
            prenom -- prenom de la personne
        '''
        if(type(prenom) != str or type(nom) != str):
            print("le nom et prenom doivent etre des chaines de caractere")
        else:
            self.__curseur.execute('SELECT Prenom FROM Personne')
            listePrenom = self.__curseur.fetchall()
            self.__curseur.execute('SELECT Nom FROM Personne')
            listeNom = self.__curseur.fetchall()

            if ((prenom,) in listePrenom and (nom,) in listeNom):
                print("{} {} existe déja".format(prenom,nom))
            else:
                self.__curseur.execute('INSERT INTO Personne(Nom, Prenom) VALUES(?,?)',(nom,prenom))
                print("{} {} a été ajouter à la liste des personnes".format(prenom,nom))
        self.__connexion.commit()

    def supprimerPersonne(self,prenom="",nom=""):
        '''
            Fonctions permettant de supprimer une personne de la base de donné à l'aide de son nom et prenom

            arguments:

            nom -- nom de la personne à supprimer
            prenom -- prenom de la personne à supprimer
        '''
        if(prenom == "" or nom == ""):
            print("Il faut le nom ET le prenom pour identifier la personne à supprimer")
        else:
            self.__curseur.execute('SELECT Prenom FROM Personne')
            listePrenom = self.__curseur.fetchall()
            self.__curseur.execute('SELECT Nom FROM Personne')
            listeNom = self.__curseur.fetchall()

            if ((prenom,) in listePrenom and (nom,) in listeNom):
                self.__curseur.execute('DELETE FROM Personne WHERE Prenom = ? AND Nom = ?',(prenom,nom))
                print(" {} {} a été supprimé de la liste des personnes".format(prenom,nom))
            else:
                print("{} {} n'est pas dans la liste".format(prenom,nom))
            self.__connexion.commit()

    def supprimerPersonneID(self,idPersonne):
        '''
            Fonction permettant de supprimer une personne de la base de donné à l'aide de son ID

            arguments:

            idPersonne -- id de la personne à supprimer
        '''
        self.__curseur.execute('SELECT Id_personne FROM Personne')
        listeID = self.__curseur.fetchall()
        if (idPersonne,) not in listeID:
            print("aucune personne ne possede l'ID {}".format(idPersonne))
        else:
            self.__curseur.execute('DELETE FROM Personne WHERE Id_personne = ?',(idPersonne,))
            print(" La personne d'ID {} a été supprimée de la liste des personne".format(idPersonne))
        self.__connexion.commit()

    def ajoutControleur(self,prenom,nom):
        '''
            Fonction permettant d'ajouter des controleurs en donnant un nom et un prenom

            arguments:

            prenom -- prenom du controlleur
            nom -- nom du controlleur
        '''
        self.__curseur.execute('SELECT Prenom FROM Personne')		
        listePrenom = self.__curseur.fetchall()
        self.__curseur.execute('SELECT Nom FROM Personne')
        listeNom = self.__curseur.fetchall()

        if ((prenom,) in listePrenom and (nom,) in listeNom):
            self.__curseur.execute('SELECT Id_personne FROM Personne WHERE Prenom = ? AND Nom = ?',(prenom,nom))
            idPersonne = self.__curseur.fetchone()[0]
            self.__curseur.execute('SELECT Id_personne FROM Controleur')
            listeID = self.__curseur.fetchall()
            if (idPersonne,) in listeID:
                print("Cette personne est déja un controleur")
            else:
                self.__curseur.execute('INSERT INTO Controleur(Id_personne) VALUES(?)',(idPersonne,))
                print("{} {} a été rajouté à la liste des controleurs".format(prenom,nom))
                self.__connexion.commit()
        else:
            print("{} {} ne fait pas partie de la liste personne, vous devez d'abord lancer la fonction 'ajoutPersonne(prenom,nom)'".format(prenom,nom))

    def supprimerControleurID(self,idControleur):
        '''
            Fonction permettant de supprimer une personne des controleurs à l'aide de son ID

            arguments:

            idControleur -- id du controleur à supprimer
        '''
        self.__curseur.execute('SELECT Id_controleur FROM Controleur')
        listeID = self.__curseur.fetchall()
        if (idControleur,) not in listeID:
            print("aucune personne ne possede l'ID {}".format(idControleur))
        else:
            self.__curseur.execute('DELETE FROM Controleur WHERE Id_controleur = ?',(idControleur,))
            print(" Le controleur d'ID {} a été supprimée de la liste des controleurs".format(idControleur))
        self.__connexion.commit()

    def supprimerControleur(self,prenom,nom):
        '''
            Fonctions permettant de supprimer une personne des controleurs à l'aide de son nom et prenom

            arguments:

            nom -- nom de la personne à supprimer de controleur
            prenom -- prenom de la personne à supprimer de controleur
        '''
        if(prenom == "" or nom == ""):
            print("Il faut le nom ET le prenom pour identifier la personne à supprimer")
        else:
            self.__curseur.execute('SELECT Prenom FROM Personne')
            listePrenom = curseur.fetchall()
            self.__curseur.execute('SELECT Nom FROM Personne')
            listeNom = self.__curseur.fetchall()

            if ((prenom,) in listePrenom and (nom,) in listeNom):
                self.__curseur.execute('SELECT Id_personne FROM Personne WHERE Nom = ? AND Prenom = ?',(nom,prenom))
                idPersonne = self.__curseur.fetchone()[0]
                self.__curseur.execute('DELETE FROM Controleur WHERE Id_personne = ?',(idPersonne,))
                print(" {} {} a été supprimé de la liste des controleurs".format(prenom,nom))
            else:
                print("{} {} n'est pas dans la liste".format(prenom,nom))
            self.__connexion.commit()

    def ajoutReservation(self,dateLocation,dateRetour,prenom, nom,idEPI,remarque =""):
        '''
            Fonction ajoute un contrat de location d'unEPI d'une personne

            arguments:

            dateLocation -- date debut de la location 	YYYY-MM-DD
            dateRetour -- date du retour de la location 	YYYY-MM-DD
            nom -- nom de la personne qui emprunte le materiel
            prenom -- prenom de la personne qui emprunte le materiel
            idEPI -- id de l'epi a louer
            remarque -- remarque eventuelle
        '''
        self.__curseur.execute('SELECT Prenom FROM Personne')
        listePrenom = curseur.fetchall()
        self.__curseur.execute('SELECT Nom FROM Personne')
        listeNom = curseur.fetchall()
        self.__curseur.execute('SELECT Id_EPI FROM EPI')
        listeID = self.__curseur.fetchall()
        if (((prenom,) not in listePrenom ) or ((nom,) not in listeNom)):
            print("{} {} ne fait pas partie de la liste des personnes donc on l'ajoute".format(prenom,nom))
            ajoutPersonne(prenom,nom)

        if (idEPI,) not in listeID:
            print("l'EPI d'ID {} n'existe pas".format(idEPI))
        else:
            self.__curseur.execute('SELECT StatutLocation,MisEnService,RetraitEPI,MiseEnRebut FROM EPI WHERE Id_EPI = ?',(idEPI,))
            statutLoc,service,retrait,rebus = curseur.fetchall()[0]
            if statutLoc == 0:
                if service == 1:
                    if retrait == 0:
                        if rebus == 0:
                            self.__curseur.execute('SELECT Id_personne FROM Personne WHERE Nom = ? AND Prenom = ?',(nom,prenom))
                            idPersonne = self.__curseur.fetchone()[0]
                            self.__curseur.execute('INSERT INTO ContratLocation(DateLocation,DateRetour,Id_personne,Id_EPI,Remarque) VALUES (?,?,?,?,?)',(dateLocation,dateRetour,idPersonne,idEPI,remarque))
                            self.__connexion.commit()
                            changementAttribut(idEPI, StatutLocation = 1)
                            print("Contrat de location ajouté")	
                        else:
                            print("L'EPI est en rebut")
                    else:
                        print("L'EPI est en retrait")
                else:
                    print("L'EPI n'est plus en service")
            else:
                print("L'Epi est en location")	
        self.__connexion.commit()

    def supprimerReservation(self,idContrat):
        '''
            Fonction permettant de supprimer un contrat à l'aide de son Id

            arguments:

            idContrat -- id du contrat a supprimer
        '''
        self.__curseur.execute('DELETE FROM ContratLocation WHERE Id_contrat = ?',(idContrat,))
        print("Contrat supprimé")
        self.__connexion.commit()

    def effectuerControle(self,idEPI,nomControleur,prenomControleur,typeDeControle,dateControle,analyse="",remarque=""):
        '''
            Fonction permetant d'ajouter un controle à un EPI

            arguments:

            idEPI -- Il s'agit de la clé primaire de l'EPI, indispensable pour l'identifier
            nomControleur -- on identife le controlleur
            prenomControleur -- son prenom
            typedeControle -- on notifie le type de controle (operationnel, maintenance ...)
            analyse --
            dateControle -- date a laquel est effectuer le controle
            remarque -- eventuel remarque
        '''
        self.__curseur.execute('SELECT Id_EPI FROM EPI')
        listeId = self.__curseur.fetchall()
        typeDeControle = typeDeControle.lower()
        if (idEPI,) not in listeId:
            print("Aucun EPI ne possède cette Id")
        else:
            if typeDeControle in ["maintenance","operationnel","rebut"]:
                self.__curseur.execute('SELECT * FROM Personne WHERE Nom = ? AND Prenom = ?',(nomControleur,prenomControleur))
                personne = self.__curseur.fetchall()
                if personne == []:
                    print("aucune personne ne possède ce nom/prenom")
                else:
                    idPersonne = personne[0][0]
                    self.__curseur.execute('SELECT Id_personne FROM Controleur')

                    if((idPersonne,) in self.__curseur.fetchall()):
                        self.__curseur.execute('SELECT Id_controleur FROM Controleur WHERE Id_personne = ?',(idPersonne,))
                        idControleur = curseur.fetchall()[0][0]
                        self.__curseur.execute('INSERT INTO Controle(TypeControle,Id_controleur,Id_epi,Remarque,Analyse,DateControle) VALUES (?,?,?,?,?,?)',(typeDeControle,idControleur,idEPI,remarque,analyse,dateControle))
                        self.__connexion.commit()
                        self.__connexion.close()
                        if typeDeControle == "maintenance":
                            changementAttribut(idEPI, MiseEnRebut = 0, RetraitEPI = 1, MisEnService = 0)
                        elif typeDeControle == "operationnel":
                            changementAttribut(idEPI, MiseEnRebut = 0, RetraitEPI = 0, MisEnService = 1)
                        elif typeDeControle == "rebut":
                            changementAttribut(idEPI, MiseEnRebut = 1, RetraitEPI = 0, MisEnService = 0)
                        print("Controle ajouté")
                    else:
                        print("cette personne n'est pas un controleur")
            else:
                print("Ce type de controle n'existe pas, choisissez entre mainteance rebut et operationnel")

                
    def recupererMarque(self):
        self.__curseur.execute('SELECT * From MarqueEPI')
        rows = self.__curseur.fetchall()
        maListe = []
        for row in rows:
            maListe.append(row[1])
        return maListe
    
    def recupererType(self):
        self.__curseur.execute('SELECT * From TypeEPI')
        rows = self.__curseur.fetchall()
        maListe = []
        for row in rows:
            maListe.append(row[1])
        return maListe

    def getLastId(self):
        self.__curseur.execute('SELECT * From EPI ORDER BY Id_epi DESC')
        valeur = self.__curseur.fetchone()
        return valeur[0]






