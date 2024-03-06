mysql> use centre_formation;
Database changed
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

mysql> -- Combien y-a t'il d'étudiants --
mysql> select count(numCINEtu) as Total from etudiant ;
+-------+
| Total |
+-------+
|     7 |
+-------+
1 row in set (0.02 sec)

mysql> -- Donner l'âge de chacun des étudiants --
mysql> select numCINEtu, nomEtu, prenomEtu, dateNaissance, DATEDIFF(CURDATE(), dateNaissance)/365.25 as age
    -> from etudiant ;
+-----------+---------------+--------------+---------------+---------+
| numCINEtu | nomEtu        | prenomEtu    | dateNaissance | age     |
+-----------+---------------+--------------+---------------+---------+
| AB234567  | Alami         | Ahmad        | 1987-01-02    | 37.1745 |
| C0987265  | Souni         | Sanaa        | 1998-04-30    | 25.8508 |
| D2356903  | Idrissi Alami | Mohammed     | 1996-05-05    | 27.8357 |
| F9827363  | Boudiaf       | Fatima Zohra | 1997-01-10    | 27.1513 |
| G5346789  | Toumi         | Aicha        | 2000-03-12    | 23.9836 |
| J3578902  | Ben Omar      | Abdallah     | 1990-06-25    | 33.6975 |
| Y1234987  | Ouled Thami   | Ali          | 1979-12-04    | 44.2546 |
+-----------+---------------+--------------+---------------+---------+
7 rows in set (0.01 sec)

mysql> -- Donner l'âge de chacun des étudiants --
mysql> select numCINEtu, nomEtu, prenomEtu, dateNaissance, TIMESTAMPDIFF(YEAR, dateNaissance, CURDATE()) AS age
    -> from etudiant ;
+-----------+---------------+--------------+---------------+------+
| numCINEtu | nomEtu        | prenomEtu    | dateNaissance | age  |
+-----------+---------------+--------------+---------------+------+
| AB234567  | Alami         | Ahmad        | 1987-01-02    |   37 |
| C0987265  | Souni         | Sanaa        | 1998-04-30    |   25 |
| D2356903  | Idrissi Alami | Mohammed     | 1996-05-05    |   27 |
| F9827363  | Boudiaf       | Fatima Zohra | 1997-01-10    |   27 |
| G5346789  | Toumi         | Aicha        | 2000-03-12    |   23 |
| J3578902  | Ben Omar      | Abdallah     | 1990-06-25    |   33 |
| Y1234987  | Ouled Thami   | Ali          | 1979-12-04    |   44 |
+-----------+---------------+--------------+---------------+------+
7 rows in set (0.01 sec)

mysql> -- Donner l'âge de chacun des étudiants --
mysql> select numCINEtu, nomEtu, prenomEtu, dateNaissance, FLOOR(DATEDIFF(CURDATE(), dateNaissance)/365.25) as age
    -> from etudiant ;
+-----------+---------------+--------------+---------------+------+
| numCINEtu | nomEtu        | prenomEtu    | dateNaissance | age  |
+-----------+---------------+--------------+---------------+------+
| AB234567  | Alami         | Ahmad        | 1987-01-02    |   37 |
| C0987265  | Souni         | Sanaa        | 1998-04-30    |   25 |
| D2356903  | Idrissi Alami | Mohammed     | 1996-05-05    |   27 |
| F9827363  | Boudiaf       | Fatima Zohra | 1997-01-10    |   27 |
| G5346789  | Toumi         | Aicha        | 2000-03-12    |   23 |
| J3578902  | Ben Omar      | Abdallah     | 1990-06-25    |   33 |
| Y1234987  | Ouled Thami   | Ali          | 1979-12-04    |   44 |
+-----------+---------------+--------------+---------------+------+
7 rows in set (0.00 sec)

mysql> select * from formation ;
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

mysql> -- Quelle est la plus chère des formations --
mysql> select * from formation
    -> where prixForm = (select max(prixForm) from formation ) ;
+----------+------------------------+-----------+----------+
| codeForm | titreForm              | dureeForm | prixForm |
+----------+------------------------+-----------+----------+
|       15 | Base de données Oracle |        20 |     6000 |
+----------+------------------------+-----------+----------+
1 row in set (0.00 sec)

mysql> -- Quelle est la moins chère des formations --
mysql> select * from formation
    -> where prixForm = (select min(prixForm) from formation ) ;
+----------+---------------+-----------+----------+
| codeForm | titreForm     | dureeForm | prixForm |
+----------+---------------+-----------+----------+
|       14 | Communication |        10 |     2500 |
+----------+---------------+-----------+----------+
1 row in set (0.00 sec)

mysql> -- Si un étudiant est inscrit dans toutes les formations, combien il doit payer --
mysql> select sum(prixForm) as total
    -> from formation ;
+-------+
| total |
+-------+
| 23050 |
+-------+
1 row in set (0.00 sec)

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
31 rows in set (0.01 sec)

mysql> -- Donner le nombre des étudiants inscrits dans chacune des sessions --
mysql> select codeSess, count(numCINEtu) as Nbr_Etudiants
    -> from inscription
    -> group by codeSess ;
+----------+---------------+
| codeSess | Nbr_Etudiants |
+----------+---------------+
|     1101 |             7 |
|     1201 |             6 |
|     1302 |             5 |
|     1401 |             6 |
|     1501 |             7 |
+----------+---------------+
5 rows in set (0.01 sec)

mysql> -- Donner la liste des numéros CIN des étudiants qui sont inscrits au moins une fois --
mysql> select distinct numCINEtu from inscription ;
+-----------+
| numCINEtu |
+-----------+
| AB234567  |
| C0987265  |
| D2356903  |
| F9827363  |
| G5346789  |
| J3578902  |
| Y1234987  |
+-----------+
7 rows in set (0.01 sec)

mysql> -- Donner pour chacun des etudiants le nombre d'inscriptions --
mysql> select numCINEtu, count(numCINEtu) as Nbr_Inscriptions
    -> from inscription
    -> group by numCINEtu ;
+-----------+------------------+
| numCINEtu | Nbr_Inscriptions |
+-----------+------------------+
| AB234567  |                4 |
| C0987265  |                5 |
| D2356903  |                5 |
| F9827363  |                3 |
| G5346789  |                5 |
| J3578902  |                4 |
| Y1234987  |                5 |
+-----------+------------------+
7 rows in set (0.00 sec)

mysql> -- Donner pou chaque session le nombre d'inscriptions distancielles et présentielles --
mysql> SELECT codeSess,
    -> count(case when TypeCours = 'Distanciel' then 1 end) as Insc_Distancielles,
    -> count(case when TypeCours = 'Présentiel' then 1 end) as Insc_Présentielles
    -> from inscription
    -> group by codeSess ;
+----------+--------------------+--------------------+
| codeSess | Insc_Distancielles | Insc_Présentielles |
+----------+--------------------+--------------------+
|     1101 |                  7 |                  0 |
|     1201 |                  1 |                  5 |
|     1302 |                  1 |                  4 |
|     1401 |                  6 |                  0 |
|     1501 |                  3 |                  4 |
+----------+--------------------+--------------------+
5 rows in set (0.00 sec)

mysql>