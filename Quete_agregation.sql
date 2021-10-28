CREATE DATABASE magasin;

USE magasin;

CREATE TABLE categorie(
	categorie_id INT PRIMARY KEY IDENTITY(1,1),
	nom VARCHAR(50) NOT NULL
);

CREATE TABLE article(
	article_id INT PRIMARY KEY IDENTITY(1,1),
	nom VARCHAR(50) NOT NULL,
	prix DECIMAL(6,2) NOT NULL,
	FK_categorie_id INT NOT NULL,
	FOREIGN KEY(FK_categorie_id) REFERENCES categorie(categorie_id)
);

CREATE TABLE achat(
	achat_id INT PRIMARY KEY IDENTITY(1,1),
	date_achat DATE NOT NULL,
	FK_article_id INT NOT NULL,
	FOREIGN KEY(FK_article_id) REFERENCES article(article_id)
);

INSERT INTO categorie(nom) VALUES
	('informatique'),
	('smartphone'),
	('jeux video');

SELECT * FROM categorie;

INSERT INTO article(nom, prix, FK_categorie_id)VALUES
	('ordinateur fixe', 1519.99, 1),
	('ordinateur protable', 857.95, 1),
	('disque dur', 99.99, 1),
	('iphone', 990.90, 2),
	('samsung', 850.99, 2),
	('xiaomi', 580, 2),
	('zelda BOTW', 60, 3),
	('the last of us', 69.99, 3),
	('god of war', 40, 3);

SELECT * FROM article;

INSERT INTO achat(date_achat, FK_article_id)VALUES
	('2018-01-10', 9),
	('2018-01-24', 8),
	('2019-01-01', 9),
	('2020-03-16', 5),
	('2019-05-02', 4),
	('2019-06-15', 4),
	('2020-06-20', 6),
	('2019-07-05', 7),
	('2019-07-12', 2),
	('2020-07-15', 3),
	('2019-09-20', 8),
	('2019-09-25', 1),
	('2019-11-08', 3),
	('2020-11-14', 1),
	('2019-11-16', 6),
	('2019-12-31', 2),
	('2021-12-06', 7),
	('2021-12-15', 5);

SELECT * FROM achat;

SELECT categorie.nom, COUNT(*) AS "Nombre d'achats", SUM(article.prix) AS "Somme des achats"
FROM achat
INNER JOIN article
ON achat.FK_article_id = article.article_id
INNER JOIN categorie
ON article.FK_categorie_id = categorie.categorie_id
GROUP BY categorie.nom;

SELECT COUNT(achat.date_achat) AS "nombre d'achats entre 2019 et 2020"
FROM achat
WHERE date_achat BETWEEN '2019-01-01' AND '2020-12-31';