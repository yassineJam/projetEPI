# -*- coding: utf-8 -*-
from api import * 
from remplissage import *

#mettre lower partout 
def main():  
	#remplissageCSV()
	#remplissageTypeEPI()
	#changementAttribut(23, StatutLocation = 0, MiseEnRebut = 0,RetraitEPI = 0,MisEnService = 1)
	#supprimerTypeEPI("connecteur")
	#ajoutTypeEPI('connecteur')
	#supprimerEPI(2)
	#ajoutPersonne("yassine","jamoud")
	#supprimerPesonne("yassine","jamoud")
	#supprimerPersonneID(8)
	#ajoutControleur("yassine",'jamoud')
	#supprimerControleur("yassine", "jamoud")
	#supprimerControleurID(6)
	#ajoutReservation('2019-03-12','2012-04-12','yasine','jamoud',23)
	#supprimerReservation(12)
	#ajoutMarqueEPI("channel")
	#supprimerMarqueEPI("channel")
	#effectuerControle(23,"jamoud","yassine","Maintenance","2020-03-12")
	ajoutEPI("harnais",234,"2019-12-02","2020-12-02","2020-12-02","2021-12-02","yatchy",12,10,"channel","vert",12,0,1,0,0)


if __name__ == "__main__":
	main()