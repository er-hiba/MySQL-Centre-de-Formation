mysql> use centre_formation;
Database changed
mysql> -- Consulter le contenu de toutes les tables du schéma "centre_formation" --
mysql> show tables;
+----------------------------+
| Tables_in_centre_formation |
+----------------------------+
| catalogue                  |
| etudiant                   |
| formation                  |
| inscription                |
| session                    |
| specialite                 |
+----------------------------+
6 rows in set (0.02 sec)

mysql> select * from catalogue;
+----------+----------+
| codeSpec | codeForm |
+----------+----------+
|      101 |       11 |
|      101 |       12 |
|      102 |       15 |
|      101 |       15 |
|      103 |       13 |
|      104 |       13 |
|      104 |       14 |
|      104 |       16 |
+----------+----------+
8 rows in set (0.00 sec)

mysql> select * from etudiant;
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| numCINEtu | nomEtu        | prenomEtu    | dateNaissance | adressEtu                             | villeEtu   | niveauEtu  |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| AB234567  | Alami         | Ahmad        | 1987-01-02    | Rue du port, 13                       | Kenitra    | Bac        |
| C0987265  | Souni         | Sanaa        | 1998-04-30    | Place du peuple N2                    | Tanger     | Niveau Bac |
| D2356903  | Idrissi Alami | Mohammed     | 1996-05-05    | Lotissement Najah, Rue N12 Immeuble 3 | Rabat      | Bac + 4    |
| F9827363  | Boudiaf       | Fatima Zohra | 1997-01-10    | Immeuble Iftikhar, N13 Ettakadoum     | Rabat      | Bac + 2    |
| G5346789  | Toumi         | Aicha        | 2000-03-12    | N12 Immeuble Jaouhara                 | Casablanca | Bac + 5    |
| J3578902  | Ben Omar      | Abdallah     | 1990-06-25    | Villa Amina, N12 Bir Rami             | Kenitra    | Doctorat   |
| Y1234987  | Ouled Thami   | Ali          | 1979-12-04    | La ville haute, rue Chouhada N6       | Tanger     | Bac + 4    |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
7 rows in set (0.01 sec)

mysql> select * from formation;
+----------+------------------------+-----------+----------+
| codeForm | titreForm              | dureeForm | prixForm |
+----------+------------------------+-----------+----------+
|       11 | Développement Java     |        12 |     3600 |
|       12 | web developpment       |        14 |     4200 |
|       13 | Anglais technique      |        15 |     3750 |
|       14 | Communication          |        10 |     2500 |
|       15 | Base de données Oracle |        20 |     6000 |
|       16 | Soft skills            |        12 |     3000 |
+----------+------------------------+-----------+----------+
6 rows in set (0.01 sec)

mysql> select * from inscription;
+----------+-----------+------------+----------------+
| codeSess | numCINEtu | TypeCours  | numInscription |
+----------+-----------+------------+----------------+
|     1101 | AB234567  | Distanciel | 1101AB234567   |
|     1101 | G5346789  | Distanciel | 1101G5346789   |
|     1101 | C0987265  | Distanciel | 1101C0987265   |
|     1101 | D2356903  | Distanciel | 1101D2356903   |
|     1101 | Y1234987  | Distanciel | 1101Y1234987   |
|     1101 | J3578902  | Distanciel | 1101J3578902   |
|     1101 | F9827363  | Distanciel | 1101F9827363   |
|     1201 | AB234567  | Présentiel | 1201AB234567   |
|     1201 | G5346789  | Distanciel | 1201G5346789   |
|     1201 | C0987265  | Présentiel | 1201C0987265   |
|     1201 | D2356903  | Présentiel | 1201D2356903   |
|     1201 | Y1234987  | Présentiel | 1201Y1234987   |
|     1201 | J3578902  | Présentiel | 1201J3578902   |
|     1302 | AB234567  | Présentiel | 1302AB234567   |
|     1302 | G5346789  | Distanciel | 1302G5346789   |
|     1302 | C0987265  | Présentiel | 1302C0987265   |
|     1302 | D2356903  | Présentiel | 1302D2356903   |
|     1302 | Y1234987  | Présentiel | 1302Y1234987   |
|     1401 | G5346789  | Distanciel | 1401G5346789   |
|     1401 | C0987265  | Distanciel | 1401C0987265   |
|     1401 | D2356903  | Distanciel | 1401D2356903   |
|     1401 | Y1234987  | Distanciel | 1401Y1234987   |
|     1401 | J3578902  | Distanciel | 1401J3578902   |
|     1401 | F9827363  | Distanciel | 1401F9827363   |
|     1501 | AB234567  | Distanciel | 1501AB234567   |
|     1501 | G5346789  | Distanciel | 1501G5346789   |
|     1501 | C0987265  | Distanciel | 1501C0987265   |
|     1501 | D2356903  | Présentiel | 1501D2356903   |
|     1501 | Y1234987  | Présentiel | 1501Y1234987   |
|     1501 | J3578902  | Présentiel | 1501J3578902   |
|     1501 | F9827363  | Présentiel | 1501F9827363   |
+----------+-----------+------------+----------------+
31 rows in set (0.00 sec)

mysql> select * from session;
+----------+--------------+------------+------------+----------+
| codeSess | nomSess      | DateDebut  | DateFin    | codeForm |
+----------+--------------+------------+------------+----------+
|     1101 | Session 1101 | 2022-01-02 | 2022-01-14 |       11 |
|     1102 | Session 1102 | 2022-02-03 | 2022-02-15 |       11 |
|     1104 | Session 1104 | 2022-10-15 | 2022-10-27 |       11 |
|     1201 | Session 1201 | 2022-03-04 | 2022-03-18 |       12 |
|     1202 | Session 1202 | 2022-04-05 | 2022-04-19 |       12 |
|     1203 | Session 1203 | 2022-11-16 | 2022-11-30 |       12 |
|     1204 | Session 1204 | 2022-12-17 | 2022-12-31 |       12 |
|     1301 | Session 1301 | 2022-01-06 | 2022-01-21 |       13 |
|     1302 | Session 1302 | 2022-05-07 | 2022-05-22 |       13 |
|     1303 | Session 1303 | 2022-06-08 | 2022-06-23 |       13 |
|     1401 | Session 1401 | 2022-09-01 | 2022-09-11 |       14 |
|     1402 | Session 1402 | 2022-08-08 | 2022-08-18 |       14 |
|     1501 | Session 1501 | 2022-11-11 | 2022-12-01 |       15 |
|     1502 | Session 1502 | 2022-09-12 | 2022-10-02 |       15 |
|     1601 | Session 1601 | 2022-09-13 | 2022-09-25 |       16 |
|     1602 | Session 1602 | 2022-10-14 | 2022-10-26 |       16 |
+----------+--------------+------------+------------+----------+
16 rows in set (0.01 sec)

mysql> select * from specialite;
+----------+---------------+---------------------------------+--------+
| codeSpec | nomSpec       | descSpec                        | Active |
+----------+---------------+---------------------------------+--------+
|      101 | GL            | Genie logiciel et developpement |      1 |
|      102 | Data          | Data engineering                |      1 |
|      103 | Langues       | Anglais, Français               |      1 |
|      104 | Communication | Communication                   |      1 |
|      105 | Securite      | Reseaux et securite             |      0 |
+----------+---------------+---------------------------------+--------+
5 rows in set (0.01 sec)

mysql> -- Donner la liste des étudiants qui sont de la ville de Tanger --
mysql> select * from etudiant
    -> where villeEtu = 'Tanger' ;
+-----------+-------------+-----------+---------------+---------------------------------+----------+------------+
| numCINEtu | nomEtu      | prenomEtu | dateNaissance | adressEtu                       | villeEtu | niveauEtu  |
+-----------+-------------+-----------+---------------+---------------------------------+----------+------------+
| C0987265  | Souni       | Sanaa     | 1998-04-30    | Place du peuple N2              | Tanger   | Niveau Bac |
| Y1234987  | Ouled Thami | Ali       | 1979-12-04    | La ville haute, rue Chouhada N6 | Tanger   | Bac + 4    |
+-----------+-------------+-----------+---------------+---------------------------------+----------+------------+
2 rows in set (0.00 sec)

mysql> -- Donner la liste des formations qui coutent plus de 3000 Dhs --
mysql> select * from formation
    -> where prixForm > 3000 ;
+----------+------------------------+-----------+----------+
| codeForm | titreForm              | dureeForm | prixForm |
+----------+------------------------+-----------+----------+
|       11 | Développement Java     |        12 |     3600 |
|       12 | web developpment       |        14 |     4200 |
|       13 | Anglais technique      |        15 |     3750 |
|       15 | Base de données Oracle |        20 |     6000 |
+----------+------------------------+-----------+----------+
4 rows in set (0.01 sec)

mysql> -- Pour chaque formation, donner le prix journalier (Supposant que la durée renseignée sur la table est en jours) --
mysql> select codeForm, titreForm, dureeForm, prixForm, (dureeForm * prixForm) as prixJournalier
    -> from formation;
+----------+------------------------+-----------+----------+----------------+
| codeForm | titreForm              | dureeForm | prixForm | prixJournalier |
+----------+------------------------+-----------+----------+----------------+
|       11 | Développement Java     |        12 |     3600 |          43200 |
|       12 | web developpment       |        14 |     4200 |          58800 |
|       13 | Anglais technique      |        15 |     3750 |          56250 |
|       14 | Communication          |        10 |     2500 |          25000 |
|       15 | Base de données Oracle |        20 |     6000 |         120000 |
|       16 | Soft skills            |        12 |     3000 |          36000 |
+----------+------------------------+-----------+----------+----------------+
6 rows in set (0.01 sec)

mysql> -- Donner la liste des sessions ouvertes de la formation dont le code est 11 --
mysql> select * from session
    -> where codeForm = 11 ;
+----------+--------------+------------+------------+----------+
| codeSess | nomSess      | DateDebut  | DateFin    | codeForm |
+----------+--------------+------------+------------+----------+
|     1101 | Session 1101 | 2022-01-02 | 2022-01-14 |       11 |
|     1102 | Session 1102 | 2022-02-03 | 2022-02-15 |       11 |
|     1104 | Session 1104 | 2022-10-15 | 2022-10-27 |       11 |
+----------+--------------+------------+------------+----------+
3 rows in set (0.01 sec)

mysql> select codeSess , numCINEtu from inscription
    -> where^C
mysql> -- Donner la liste des numéros CIN des étudiants inscrits dans la session 1302 classés par ordre alphabétique --
mysql> select codeSess, numCINEtu from inscription
    -> where codeSess = 1302
    -> order by numCINEtu asc ;
+----------+-----------+
| codeSess | numCINEtu |
+----------+-----------+
|     1302 | AB234567  |
|     1302 | C0987265  |
|     1302 | D2356903  |
|     1302 | G5346789  |
|     1302 | Y1234987  |
+----------+-----------+
5 rows in set (0.01 sec)

mysql> -- Donner la liste des spécialités Active --
mysql> select * from specialite
    -> where active = 1;
+----------+---------------+---------------------------------+--------+
| codeSpec | nomSpec       | descSpec                        | Active |
+----------+---------------+---------------------------------+--------+
|      101 | GL            | Genie logiciel et developpement |      1 |
|      102 | Data          | Data engineering                |      1 |
|      103 | Langues       | Anglais, Français               |      1 |
|      104 | Communication | Communication                   |      1 |
+----------+---------------+---------------------------------+--------+
4 rows in set (0.00 sec)

mysql>
