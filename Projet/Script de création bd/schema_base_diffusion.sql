-------------------------SCHEMA DE CREATION DES TABLES DE DIMENSION------------------------


-----------------table dim_contributeur------------------

CREATE TABLE IF NOT EXISTS dim_contributeur (
  id_contributeur int NOT NULL AUTO_INCREMENT,
  pseudo VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_contributeur)
)

------------------table dim_pnns---------------------------
CREATE TABLE IF NOT EXISTS dim_pnns(
  id_pnns INT NOT NULL AUTO_INCREMENT,
  pnns1 VARCHAR(255),
  pnns2 VARCHAR(255),
  PRIMARY KEY (id_pnns)
)

------------------table dim_date_creation-------------------
CREATE TABLE IF NOT EXISTS dim_date_creation (
  id_date_creation INT NOT NULL AUTO_INCREMENT,
  date_complete_creation date,
  jour_creation tinyint(4),
  mois_creation tinyint(4),
  annee_creation mediumint(4),
  nom_mois_creation VARCHAR(255),
  PRIMARY KEY (id_date_creation)
)

-----------------table dim_date_version-----------------------
CREATE TABLE IF NOT EXISTS dim_date_version (
  id_date_version INT NOT NULL AUTO_INCREMENT,
  date_complete_version,
  jour_version tinyint(4),
  mois_version tinyint(4),
  nom_mois_version VARCHAR(255),
  annee_version mediumint(4),
  PRIMARY KEY (id_date_version)
) 



-------------------------SCHEMA DE CREATION DES TABLES DE FAITS-------------------------------


------------------table fait_produit-----------------------------
CREATE TABLE IF NOT EXISTS fait_produit(
  id_contributeur INT,
  id_pnns INT,
  id_date_creation INT,
  nutrition_score_fr VARCHAR(255),
  KEY fk_id_contributeur(id_contributeur),
  KEY fk_id_pnns(id_pnns),
  KEY fk_id_date_creation(id_date_creation)
) 

------------------table fait_version----------------------------
CREATE TABLE IF NOT EXISTS fait_version(
  id_contributeur INT,
  id_pnns INT,
  id_date_creation INT,
  id_date_version INT,
  nutrition_score_fr VARCHAR(255),
  KEY fk_id_contributeur_v(id_contributeur),
  KEY fk_id_pnns_v(id_pnns),
  KEY fk_id_date_creation_v(id_date_creation),
  KEY fk_id_date_version(`id_date_version)
)
