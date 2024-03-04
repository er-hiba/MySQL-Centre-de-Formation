mysql> use centre_formation;
Database changed
mysql> select * from etudiant;
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| numCINEtu | nomEtu        | prenomEtu    | dateNaissance | adressEtu                             | villeEtu   | niveauEtu  |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| AB234567  | Alami         | Ahmad        | 1986-01-01    | Rue du port, 13                       | Tanger     | Bac        |
| C0987265  | Souni         | Sanaa        | 1998-04-30    | Place du peuple N2                    | Tanger     | Niveau Bac |
| D2356903  | Idrissi Alami | Mohammed     | 1996-05-05    | Lotissement Najah, Rue N12 Immeuble 3 | Rabat      | Bac + 4    |
| F9827363  | Boudiaf       | Fatima Zohra | 1997-01-10    | Immeuble Iftikhar, N13 Ettakadoum     | Rabat      | Bac + 2    |
| G5346789  | Toumi         | Aicha        | 2000-03-12    | N12 Immeuble Jaouhara                 | Casablanca | Master     |
| J3578902  | Ben Omar      | Abdallah     | 1990-06-25    | Villa Amina, N12 Bir Rami             | Kenitra    | Phd        |
| Y1234987  | Ouled Thami   | Ali          | 1979-12-04    | La ville haute, rue Chouhada N6       | Tanger     | Bachelor   |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
7 rows in set (0.00 sec)

mysql> select numCINEtu, niveauEtu from etudiant
    -> where niveauEtu in ('Master', 'Bachelor', 'Phd');
+-----------+-----------+
| numCINEtu | niveauEtu |
+-----------+-----------+
| G5346789  | Master    |
| J3578902  | Phd       |
| Y1234987  | Bachelor  |
+-----------+-----------+
3 rows in set (0.01 sec)

mysql> update etudiant
    -> set niveauETu = 'Bac + 5'
    -> where numCINEtu = 'G5346789';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update etudiant
    -> set niveauETu = 'Bac + 4'
    -> where numCINEtu = 'Y1234987';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update etudiant
    -> set niveauETu = 'Doctorat'
    -> where numCINEtu = 'J3578902';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from etudiant ;
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| numCINEtu | nomEtu        | prenomEtu    | dateNaissance | adressEtu                             | villeEtu   | niveauEtu  |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| AB234567  | Alami         | Ahmad        | 1986-01-01    | Rue du port, 13                       | Tanger     | Bac        |
| C0987265  | Souni         | Sanaa        | 1998-04-30    | Place du peuple N2                    | Tanger     | Niveau Bac |
| D2356903  | Idrissi Alami | Mohammed     | 1996-05-05    | Lotissement Najah, Rue N12 Immeuble 3 | Rabat      | Bac + 4    |
| F9827363  | Boudiaf       | Fatima Zohra | 1997-01-10    | Immeuble Iftikhar, N13 Ettakadoum     | Rabat      | Bac + 2    |
| G5346789  | Toumi         | Aicha        | 2000-03-12    | N12 Immeuble Jaouhara                 | Casablanca | Bac + 5    |
| J3578902  | Ben Omar      | Abdallah     | 1990-06-25    | Villa Amina, N12 Bir Rami             | Kenitra    | Doctorat   |
| Y1234987  | Ouled Thami   | Ali          | 1979-12-04    | La ville haute, rue Chouhada N6       | Tanger     | Bac + 4    |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
7 rows in set (0.00 sec)

mysql> select * from formation ;
+----------+------------------------+-----------+----------+
| codeForm | titreForm              | dureeForm | prixForm |
+----------+------------------------+-----------+----------+
|       11 | Programming Java       |        12 |     3600 |
|       12 | web developpment       |        14 |     4200 |
|       13 | Anglais technique      |        15 |     3750 |
|       14 | Communication          |        10 |     2500 |
|       15 | Base de données Oracle |        20 |     6000 |
|       16 | Soft skills            |        12 |     3000 |
+----------+------------------------+-----------+----------+
6 rows in set (0.00 sec)

mysql> update formation
    -> set titreForm = 'Développement Java'
    -> where codeForm = 11 ;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

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
6 rows in set (0.00 sec)

mysql> desc inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | YES  | MUL | NULL    |       |
| numCINEtu | varchar(10) | YES  | MUL | NULL    |       |
| TypeCours | varchar(10) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.02 sec)

mysql> alter table inscription
    -> add column numInscription varchar(12);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc inscription;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| codeSess       | int         | YES  | MUL | NULL    |       |
| numCINEtu      | varchar(10) | YES  | MUL | NULL    |       |
| TypeCours      | varchar(10) | YES  |     | NULL    |       |
| numInscription | varchar(12) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select * from inscription;
+----------+-----------+------------+----------------+
| codeSess | numCINEtu | TypeCours  | numInscription |
+----------+-----------+------------+----------------+
|     1101 | AB234567  | Distanciel | NULL           |
|     1101 | G5346789  | Distanciel | NULL           |
|     1101 | C0987265  | Distanciel | NULL           |
|     1101 | D2356903  | Distanciel | NULL           |
|     1101 | Y1234987  | Distanciel | NULL           |
|     1101 | J3578902  | Distanciel | NULL           |
|     1101 | F9827363  | Distanciel | NULL           |
|     1201 | AB234567  | Présentiel | NULL           |
|     1201 | G5346789  | Présentiel | NULL           |
|     1201 | C0987265  | Présentiel | NULL           |
|     1201 | D2356903  | Présentiel | NULL           |
|     1201 | Y1234987  | Présentiel | NULL           |
|     1201 | J3578902  | Présentiel | NULL           |
|     1302 | AB234567  | Présentiel | NULL           |
|     1302 | G5346789  | Distanciel | NULL           |
|     1302 | C0987265  | Présentiel | NULL           |
|     1302 | D2356903  | Présentiel | NULL           |
|     1302 | Y1234987  | Présentiel | NULL           |
|     1401 | G5346789  | Distanciel | NULL           |
|     1401 | C0987265  | Distanciel | NULL           |
|     1401 | D2356903  | Distanciel | NULL           |
|     1401 | Y1234987  | Distanciel | NULL           |
|     1401 | J3578902  | Distanciel | NULL           |
|     1401 | F9827363  | Distanciel | NULL           |
|     1501 | AB234567  | Distanciel | NULL           |
|     1501 | G5346789  | Présentiel | NULL           |
|     1501 | C0987265  | Distanciel | NULL           |
|     1501 | D2356903  | Présentiel | NULL           |
|     1501 | Y1234987  | Présentiel | NULL           |
|     1501 | J3578902  | Présentiel | NULL           |
|     1501 | F9827363  | Présentiel | NULL           |
+----------+-----------+------------+----------------+
31 rows in set (0.00 sec)

mysql> update inscription
    -> set numInscription = concat(codeSess, numCINEtu);
Query OK, 31 rows affected (0.02 sec)
Rows matched: 31  Changed: 31  Warnings: 0

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
|     1201 | G5346789  | Présentiel | 1201G5346789   |
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
|     1501 | G5346789  | Présentiel | 1501G5346789   |
|     1501 | C0987265  | Distanciel | 1501C0987265   |
|     1501 | D2356903  | Présentiel | 1501D2356903   |
|     1501 | Y1234987  | Présentiel | 1501Y1234987   |
|     1501 | J3578902  | Présentiel | 1501J3578902   |
|     1501 | F9827363  | Présentiel | 1501F9827363   |
+----------+-----------+------------+----------------+
31 rows in set (0.01 sec)

mysql> select * from etudiant ;
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| numCINEtu | nomEtu        | prenomEtu    | dateNaissance | adressEtu                             | villeEtu   | niveauEtu  |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| AB234567  | Alami         | Ahmad        | 1986-01-01    | Rue du port, 13                       | Tanger     | Bac        |
| C0987265  | Souni         | Sanaa        | 1998-04-30    | Place du peuple N2                    | Tanger     | Niveau Bac |
| D2356903  | Idrissi Alami | Mohammed     | 1996-05-05    | Lotissement Najah, Rue N12 Immeuble 3 | Rabat      | Bac + 4    |
| F9827363  | Boudiaf       | Fatima Zohra | 1997-01-10    | Immeuble Iftikhar, N13 Ettakadoum     | Rabat      | Bac + 2    |
| G5346789  | Toumi         | Aicha        | 2000-03-12    | N12 Immeuble Jaouhara                 | Casablanca | Bac + 5    |
| J3578902  | Ben Omar      | Abdallah     | 1990-06-25    | Villa Amina, N12 Bir Rami             | Kenitra    | Doctorat   |
| Y1234987  | Ouled Thami   | Ali          | 1979-12-04    | La ville haute, rue Chouhada N6       | Tanger     | Bac + 4    |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
7 rows in set (0.00 sec)

mysql> update etudiant
    -> set dateNaissance = '1987-01-02' , villeEtu = 'Kenitra'
    -> where numCINEtu = 'AB234567';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

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
7 rows in set (0.00 sec)

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
|     1201 | G5346789  | Présentiel | 1201G5346789   |
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
|     1501 | G5346789  | Présentiel | 1501G5346789   |
|     1501 | C0987265  | Distanciel | 1501C0987265   |
|     1501 | D2356903  | Présentiel | 1501D2356903   |
|     1501 | Y1234987  | Présentiel | 1501Y1234987   |
|     1501 | J3578902  | Présentiel | 1501J3578902   |
|     1501 | F9827363  | Présentiel | 1501F9827363   |
+----------+-----------+------------+----------------+
31 rows in set (0.00 sec)

mysql> update inscription
    -> set TypeCours = 'Distanciel'
    -> where numCINEtu = 'G5346789';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 5  Changed: 2  Warnings: 0

mysql> select numCINEtu , TypeCours from inscription
    -> where numCINEtu = 'G5346789' ;
+-----------+------------+
| numCINEtu | TypeCours  |
+-----------+------------+
| G5346789  | Distanciel |
| G5346789  | Distanciel |
| G5346789  | Distanciel |
| G5346789  | Distanciel |
| G5346789  | Distanciel |
+-----------+------------+
5 rows in set (0.01 sec)

mysql>
