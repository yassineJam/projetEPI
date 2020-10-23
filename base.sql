

CREATE TABLE EPI(
	Id_epi INTEGER PRIMARY KEY AUTOINCREMENT,
	TypeEpi TEXT,
	NumSerie INT,
	DateDeFabrication DATE,
	DateAchat DATE,
	DatePremiereUtilisation DATE,
	DateMiseAuRebut DATE,
	Modele TEXT,
	DureeDeVie INT,
	DureeUtilisation INT,
	Marque TEXT,
	Couleur TEXT,
	NombreDansLeLot INT,
	StatutLocation BOOLEAN,
	MisEnService BOOLEAN,
	RetraitEPI BOOLEAN,
	MiseEnRebut BOOLEAN
);

CREATE TABLE Personne(
	Id_personne INTEGER PRIMARY KEY AUTOINCREMENT,
	Nom TEXT,
	Prenom TEXT
);

CREATE TABLE Controleur(
	Id_controleur INTEGER PRIMARY KEY AUTOINCREMENT,
	Id_personne INT,
	FOREIGN KEY(Id_personne) REFERENCES Personne(Id_personne)
);

CREATE TABLE Controle(
	Id_controle INTEGER PRIMARY KEY AUTOINCREMENT,
	TypeControle TEXT,
	Analyse TEXT,
	DateControle DATE,
	Remarque TEXT,
	Id_epi INT ,
	Id_controleur INT,
	FOREIGN KEY(Id_epi) REFERENCES EPI(Id_epi),
	FOREIGN KEY(Id_controleur) REFERENCES Controleur(Id_controleur)
);

CREATE TABLE ContratLocation(
	Id_contrat INTEGER PRIMARY KEY AUTOINCREMENT,
	DateLocation DATE,
	DateRetour DATE,
	Remarque TEXT,
	Id_personne INT,
	Id_epi INT,
	FOREIGN KEY(Id_personne) REFERENCES Personne(Id_personne),
	FOREIGN KEY(Id_epi) REFERENCES EPI(Id_epi)
);

CREATE TABLE Mainteance(
	NumMaintenance INTEGER PRIMARY KEY,
	Id_epi INTEGER,
	FOREIGN KEY(Id_epi) REFERENCES EPI(Id_personne)
);

CREATE TABLE TypeEPI(
	Id_type INTEGER PRIMARY KEY AUTOINCREMENT,
	TypeEPI TEXT
);

CREATE TABLE MarqueEPI(
	Id_marque INTEGER PRIMARY KEY AUTOINCREMENT,
	Marque TEXT
);