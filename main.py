# -*- coding: utf-8 -*-
import bddCreation as bd
from api import * 


def main():
    #bd.creationGlobal() 
    #changementAttribut(1, Couleur = 'noir', TypeEpi = 'accroche')
    ajoutTypeEPI('accroche')
    print(TYPE_EPI)
    #remplissage()

if __name__ == "__main__":
    main()