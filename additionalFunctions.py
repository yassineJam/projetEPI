from api import *
import sqlite3
import datetime
from fonctionAffichageEva import _affichage

import pandas as pd


# List EPI types
def listeTypesEPI():
    try:
        connection = sqlite3.connect('base_EPI.db')
        curseur = connection.cursor()
        curseur.execute('SELECT TypeEPI FROM TypeEPI')
        listeType = curseur.fetchall()
        return [ll[0] for ll in listeType]
    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        #on ferme la connection avec la base de donnée
        connection.commit()
        connection.close()
    return()




# Get table row and cursor for a given EPI id
def getRowCurs(IdEpi):
	try :
		connection = sqlite3.connect('base_EPI.db')
		curseur = connection.cursor()
		curseur.execute('SELECT * From EPI Where Id_epi = ? ',(IdEpi,))
		rows = curseur.fetchall()
		return (rows[0],curseur)
	except Exception as e:
		print("Exception levée : ")
		print(e)
	finally :
		#on ferme la connection avec la base de donnée
		connection.commit()
		connection.close()
	return()




# A small adapter class
class EPI_adapter :
    
    
    @staticmethod
    def getAttributes():
        return ['Id_epi', 'TypeEpi', 'NumSerie', 'DateDeFabrication', 'DateAchat', 'DatePremiereUtilisation',\
                'DateMiseAuRebut', 'Modele', 'DureeDeVie', 'DureeUtilisation', 'Marque','Couleur',\
                'NombreDansLeLot', 'StatutLocation', 'MisEnService', 'RetraitEPI', 'MiseEnRebut']
    
    def __init__(self, rowCurs = None):
        
        if not rowCurs:
            self.Id_epi = None #int
            self.TypeEpi = None #text
            self.NumSerie = None #INT
            self.DateDeFabrication = None # DATE,
            self.DateAchat = None # DATE,
            self.DatePremiereUtilisation  = None #DATE,
            self.DateMiseAuRebut = None # DATE,
            self.Modele = None # TEXT,
            self.DureeDeVie = None # INT,
            self.DureeUtilisation = None # INT,
            self.Marque = None # TEXT,
            self.Couleur = None # TEXT,
            self.NombreDansLeLot = None # INT,
            self.StatutLocation = None # BOOLEAN,
            self.MisEnService = None # BOOLEAN,
            self.RetraitEPI = None # BOOLEAN,
            self.MiseEnRebut = None # BOOLEAN
        else:
            self.construct(rowCurs[0], rowCurs[1])

    def construct(self, row,curseur):
        # row = row_[0]
        self.Id_epi =                   row[0]
        self.TypeEpi =                  row[1]
        self.NumSerie =                 row[2]
        self.DateDeFabrication =        row[3]
        self.DateAchat =                row[4]
        self.DatePremiereUtilisation  = row[5]
        self.DateMiseAuRebut =          row[6]
        self.Modele =                   row[7]
        self.DureeDeVie =               row[8]
        self.DureeUtilisation =         row[9]
        self.Marque =                   row[10]
        self.Couleur =                  row[11]
        self.NombreDansLeLot =          row[12]
        self.StatutLocation =           row[13]
        self.MisEnService =             row[14]
        self.RetraitEPI =               row[15]
        self.MiseEnRebut =              row[16]
        
    
    def __str__(self):
        out = '';
        out += 'Type:{} Id:{} No Série:{} Lot: {}\n'.format(self.TypeEpi, self.Id_epi, self.NumSerie, self.NombreDansLeLot)
        out += 'Marque:{} Modèle:{} Couleur:{}\n'.format(self.Marque, self.Modele, self.Couleur)
        out += 'Fab:{} Achat:{}\n'.format(self.DateDeFabrication, self.DateAchat)
        out +=  'Durée de vie:{} Durée utilisation:{}\n'.format(self.DureeDeVie, self.DureeUtilisation)
        out += 'En service:{} Rebut:{} Retrait:{}\n'.format(self.MisEnService, self.MiseEnRebut, self.RetraitEPI)
        out += 'Première utilisation:{} Date Rebut:{}\n'.format(self.DatePremiereUtilisation, self.DateMiseAuRebut)
        return out
        

    def getId(self):
        return self.Id_epi
    
    
    def print(self):
        print('------------------------------------------------------------')
        print(self.__str__())
        print('------------------------------------------------------------')

    
    
    def asList(self):
        return [self.Id_epi,
        self.TypeEpi,
        self.NumSerie,
        self.DateDeFabrication,
        self.DateAchat,
        self.DatePremiereUtilisation,
        self.DateMiseAuRebut,
        self.Modele,
        self.DureeDeVie,
        self.DureeUtilisation,
        self.Marque,
        self.Couleur,
        self.NombreDansLeLot,
        self.StatutLocation,
        self.MisEnService,
        self.RetraitEPI,
        self.MiseEnRebut]




# Extract EPI register
def extractionRegistre(filename):
    try :
        types = listeTypesEPI()
        # print(types)

        connection = sqlite3.connect('base_EPI.db')
        curseur = connection.cursor()

        f = open(filename, 'w')
        f.write('# Registre EPI COC Escalade ' + str(datetime.date.today()) + '\n')

        for type in types:
            # Query database
            curseur.execute('SELECT * From EPI Where TypeEPI = ? OR TypeEPI = ?',(type,type.capitalize()))
            rows = curseur.fetchall()
            # print(rows)

            # Markdown section
            f.write('## '+type+ ' (' + str(len(rows)) +')\n')

            for row in rows:
                epi = EPI_adapter((row, curseur))
                f.write(str(epi)+'\n')
            
            f.write('\n\n')


        f.close()

    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        print('done')
    return()





def prettyExtractionRegistre(filename):
    try :
        types = listeTypesEPI()
        # print(types)

        connection = sqlite3.connect('base_EPI.db')
        curseur = connection.cursor()
        
        # ---------------------------------
        # Fill the whole panda dataframe
        # ---------------------------------
        
        # Create a pandas dataframe
        df_register = pd.DataFrame(columns=EPI_adapter.getAttributes())
        
        # Query database
        curseur.execute('SELECT * From EPI')
        rows = curseur.fetchall()
        
        # Fill the dataframe row by row (efficiency ?)
        for irow, row in enumerate(rows):
            epi = EPI_adapter((row, curseur))
            df_register.loc[irow] = epi.asList()
            
        # print(df_register)
        
        # return df_register
        

        f = open(filename, 'w')
        f.write('# Registre EPI COC Escalade ' + str(datetime.date.today()) + '\n')

        for type in types:
            
            # Filter dataframe (set everything to lower in the test)
            msk = df_register['TypeEpi'].str.lower() == type.lower()
            # print(df_register[msk])
            # print(type)
            
            # Markdown section
            f.write('## '+type+ ' (' + str(msk.sum()) +')\n')
            
            if msk.sum():
                # Export table (ATTENTION: python.tabulate is needed for the export)
                f.write(df_register[msk].to_markdown(index=False))
            
                        
            f.write('\n\n')


        f.close()

    except Exception as e:
        print("Exception levée : ")
        print(e)
    finally :
        print('done')
    return()