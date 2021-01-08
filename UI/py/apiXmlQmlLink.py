from PySide2.QtCore import QObject, Signal, Slot, Property
import sqlite3
#import envoieDonne as insertion
import api as api
import xmlGestion as xmlG
import envoieDonne as ed


class Link(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.__listeNouvelEPI= []
        #self.__liste_type_EPI =[]
        self.__monApi = api.API()
        self.__xmlg = xmlG.xmlGestion()

    # GESTION DE L'AJOUT D'UN NOUVEL EPI
    @Signal
    def listeNouvelEPIChanged(self):
        pass

    @Slot(list)
    def setListeNouvelEPI(self,nouvelListe):
        self.set_Liste_NouvelEPI(nouvelListe) 

    def set_Liste_NouvelEPI(self, nouvelListe):
        self.__listeNouvelEPI = nouvelListe
        self.listeNouvelEPIChanged.emit()
        self.insertion()#on insere le nouvel epi dans la bdd / xml
    
    def get_Liste_nouvelEPI(self):
        return self.__listeNouvelEPI

    def insertion(self):
        sucess = self.__monApi.ajoutEPI(self.__listeNouvelEPI[0],self.__listeNouvelEPI[1],self.__listeNouvelEPI[2],self.__listeNouvelEPI[3],self.__listeNouvelEPI[4],self.__listeNouvelEPI[5],self.__listeNouvelEPI[6],self.__listeNouvelEPI[7],self.__listeNouvelEPI[8],self.__listeNouvelEPI[9],self.__listeNouvelEPI[10],self.__listeNouvelEPI[11],self.__listeNouvelEPI[12],self.__listeNouvelEPI[13],self.__listeNouvelEPI[14],self.__listeNouvelEPI[15])
        if(sucess):
            self.__xmlg.ajout(self.__listeNouvelEPI,self.__monApi.getLastId())

    nouvelEPI = Property(list, get_Liste_nouvelEPI, set_Liste_NouvelEPI, notify = listeNouvelEPIChanged)
    #===================================

    # GESTION DE LECTURE DES MARQUES D'EPI
    marqueChanged = Signal(list)

    def get_marque(self):
        return self.__monApi.recupererMarque()

    listeMarque = Property(list, get_marque, notify = marqueChanged)
    #===================================

    # GESTION DE LECTURE DES TYPES D'EPI
    typeChanged = Signal(list)

    def get_type(self):
        return self.__monApi.recupererType()

    listeTypeEPI = Property(list, get_type, notify = typeChanged)
    #===================================
    
    # GESTION DE LA MODIFICATION DES  EPIs
    @Signal
    def modifChanged(self):
        pass

    @Slot(list)
    def setNouvelEPI(self,epiVal):
        self.set_nouvelEPI(epiVal)
    
    def set_nouvelEPI(self,epiVal):
        #faire changement
        self.__monApi.changementAttribut(epiVal[0],TypeEpi = epiVal[1], NumSerie = epiVal[2], DateDeFabrication = epiVal[3], DateAchat = epiVal[4],DatePremiereUtilisation= epiVal[5],DateMiseAuRebut = epiVal[6], Modele = epiVal[7], DureeDeVie = epiVal[8], DureeUtilisation = epiVal[9], Marque = epiVal[10], Couleur = epiVal[11], NombreDansLeLot = epiVal[12], StatutLocation = epiVal[13], MisEnService = epiVal[14], RetraitEPI = epiVal[15], MiseEnRebut = epiVal[16])
        self.modifChanged.emit()
        #changement sur xml
        #self.__xmlg.modif(epiVal[0])

    
    def getModif(self):
        return

    modifEPI = Property(list, getModif, set_nouvelEPI, notify = modifChanged)
    #===================================


    @Signal
    def listeChanged(self):
        pass
    

    @Signal
    def reservationChanged(self):
        pass

    def getAll(self):
        connexion = sqlite3.connect("../base_EPI.db")
        curseur = connexion.cursor()
        curseur.execute('SELECT * From EPI')
        rows = curseur.fetchall()
        maListe = []
        for row in rows:
            maListe.append(list(row))
        return maListe
          

    def getResa(self):
        connexion = sqlite3.connect("../base_EPI.db")
        curseur = connexion.cursor()
        curseur.execute('SELECT * From ContratLocation')
        rows = curseur.fetchall()
        maListe = []
        for row in rows:
            maListe.append(list(row))
        return maListe

   

   

    listeTypeChanged = Signal(int)

    

    def get_liste_type(self):
        connexion = sqlite3.connect("../base_EPI.db")
        curseur = connexion.cursor()
        curseur.execute('SELECT * From TypeEPI')
        rows = curseur.fetchall()
        for row in rows:
            self.__liste_type_EPI.append(row[1])
        return self.__liste_type_EPI
    
    def __set_liste_type(self,liste):
        self.__liste_type_EPI = liste
        self.listeTypeChanged.emit(self.__liste_type_EPI)

    @Signal
    def listeChanged(self):
        pass

    #READ AND WRITE
    #listeEPIs = Property(list, getAll, notify=listeChanged)



    #listeControleur = Property()
    #listePersonne = Property()
    #listeControle = Property()
    listeReservation = Property(list, getResa, notify = reservationChanged)
