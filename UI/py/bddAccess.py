from PySide2.QtCore import QObject, Signal, Slot, Property
import sqlite3

class Api(QObject):
	def __init__(self):
		QObject.__init__(self)

	def _connexion(self):
		try:
			connexion = sqlite3.connect("../base_EPI.db")
			curseur = connexion.cursor()
			self.__curseur= curseur
			self.__connexion = connexion

		except Exception as e:
			print("Exceptions levée(s)")
			print(e)
			print(type(e))

	@Signal
	def listeChanged(self):
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

	listeEPI = Property(list, getAll, notify=listeChanged)