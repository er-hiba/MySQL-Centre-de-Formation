mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centre_formation   |
| hiba               |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| online_shop        |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| tramway            |
| world              |
+--------------------+
13 rows in set (0.09 sec)

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
6 rows in set (0.03 sec)

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
8 rows in set (0.03 sec)

mysql> select * from formation;
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
6 rows in set (0.01 sec)

mysql> select * from session ;
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

mysql> select * from specialite ;
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

mysql> desc etudiant;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| numCINEtu     | varchar(10) | NO   | PRI | NULL    |       |
| nomEtu        | varchar(45) | YES  |     | NULL    |       |
| prenomEtu     | varchar(45) | YES  |     | NULL    |       |
| dateNaissance | date        | YES  |     | NULL    |       |
| adressEtu     | varchar(45) | YES  |     | NULL    |       |
| villeEtu      | varchar(45) | YES  |     | NULL    |       |
| niveauEtu     | varchar(45) | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
7 rows in set (0.02 sec)

mysql> insert into etudiant
    -> values
    -> ('AB234567' , 'Alami', 'Ahmad' , '1986/01/01', 'Rue du port, 13', 'Tanger', 'Bac'),
    -> ('G5346789' , 'Toumi', 'Aicha' , '2000/03/12', 'N12 Immeuble Jaouhara' , 'Casablanca', 'Master'),
    -> ('C0987265' , 'Souni' , 'Sanaa', '1998/04/30', 'Place du peuple N2' , 'Tanger', 'Niveau Bac'),
    -> ('D2356903' , 'Idrissi Alami', 'Mohammed', '1996/05/05' , 'Lotissement Najah, Rue N12 Immeuble 3', 'Rabat', 'Bac + 4'),
    -> ('Y1234987' , 'Ouled Thami', 'Ali', '1979/12/04', 'La ville haute, rue Chouhada N6', 'Tanger', 'Bachelor'),
    -> ('J3578902' , 'Ben Omar', 'Abdallah', '1990/06/05', 'Villa Amina, N12 Bir Rami', 'Kenitra', 'Phd'),
    -> ('F9827363' , 'Boudiaf', 'Fatima Zohra', '1997/01/10', 'Immeuble Iftikhar, N13 Ettakadoum', 'Rabat', 'Bac + 2');
Query OK, 7 rows affected, 7 warnings (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 7

mysql> select * from etudiant;
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| numCINEtu | nomEtu        | prenomEtu    | dateNaissance | adressEtu                             | villeEtu   | niveauEtu  |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
| AB234567  | Alami         | Ahmad        | 1986-01-01    | Rue du port, 13                       | Tanger     | Bac        |
| C0987265  | Souni         | Sanaa        | 1998-04-30    | Place du peuple N2                    | Tanger     | Niveau Bac |
| D2356903  | Idrissi Alami | Mohammed     | 1996-05-05    | Lotissement Najah, Rue N12 Immeuble 3 | Rabat      | Bac + 4    |
| F9827363  | Boudiaf       | Fatima Zohra | 1997-01-10    | Immeuble Iftikhar, N13 Ettakadoum     | Rabat      | Bac + 2    |
| G5346789  | Toumi         | Aicha        | 2000-03-12    | N12 Immeuble Jaouhara                 | Casablanca | Master     |
| J3578902  | Ben Omar      | Abdallah     | 1990-06-05    | Villa Amina, N12 Bir Rami             | Kenitra    | Phd        |
| Y1234987  | Ouled Thami   | Ali          | 1979-12-04    | La ville haute, rue Chouhada N6       | Tanger     | Bachelor   |
+-----------+---------------+--------------+---------------+---------------------------------------+------------+------------+
7 rows in set (0.00 sec)

mysql> update etudiant
    -> set dateNaissance = '1990/06/25' where numCINEtu = 'J3578902' ;
Query OK, 1 row affected, 1 warning (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 1

mysql> select * from etudiant ;
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

mysql> select * from inscription ;
Empty set (0.01 sec)

mysql> desc inscription ;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | YES  | MUL | NULL    |       |
| numCINEtu | varchar(10) | YES  | MUL | NULL    |       |
| TypeCours | varchar(45) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql>  insert into inscription
    -> values
    -> (1101, 'AB234567', 'Distanciel'),
    -> (1101, 'G5346789', 'Distanciel'),
    -> (1101, 'C0987265', 'Distanciel'),
    -> (1101, 'D2356903', 'Distanciel'),
    -> (1101, 'Y1234987', 'Distanciel'),
    -> (1101, 'J3578902', 'Distanciel'),
    -> (1101, 'F9827363', 'Distanciel');
Query OK, 7 rows affected (0.02 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> insert into inscription
    -> values
    -> (1201, 'AB234567', 'Présentiel'),
    -> (1201, 'G5346789', 'Présentiel'),
    -> (1201, 'C0987265', 'Présentiel'),
    -> (1201, 'D2356903', 'Présentiel'),
    -> (1201, 'Y1234987', 'Présentiel'),
    -> (1201, 'J3578902', 'Présentiel');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> insert into inscription
    -> values
    -> (1302, 'AB234567', 'Présentiel'),
    -> (1302, 'G5346789', 'Distanciel'),
    -> (1302, 'C0987265', 'Présentiel'),
    -> (1302, 'D2356903', 'Présentiel'),
    -> (1302, 'Y1234987', 'Présentiel');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into inscription
    -> values
    -> (1401, 'G5346789', 'Distanciel'),
    -> (1401, 'C0987265', 'Distanciel'),
    -> (1401, 'D2356903', 'Distanciel'),
    -> (1401, 'Y1234987', 'Distanciel'),
    -> (1401, 'J3578902', 'Distanciel'),
    -> (1401, 'F9827363', 'Distanciel');
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> insert into inscription
    -> values
    -> (1501, 'AB234567', 'Distanciel'),
    -> (1501, 'G5346789', 'Présentiel'),
    -> (1501, 'C0987265', 'Distanciel'),
    -> (1501, 'D2356903', 'Présentiel'),
    -> (1501, 'Y1234987', 'Présentiel'),
    -> (1501, 'J3578902', 'Présentiel'),
    -> (1501, 'F9827363', 'Présentiel');
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from inscription;
+----------+-----------+------------+
| codeSess | numCINEtu | TypeCours  |
+----------+-----------+------------+
|     1101 | AB234567  | Distanciel |
|     1101 | G5346789  | Distanciel |
|     1101 | C0987265  | Distanciel |
|     1101 | D2356903  | Distanciel |
|     1101 | Y1234987  | Distanciel |
|     1101 | J3578902  | Distanciel |
|     1101 | F9827363  | Distanciel |
|     1201 | AB234567  | Présentiel |
|     1201 | G5346789  | Présentiel |
|     1201 | C0987265  | Présentiel |
|     1201 | D2356903  | Présentiel |
|     1201 | Y1234987  | Présentiel |
|     1201 | J3578902  | Présentiel |
|     1302 | AB234567  | Présentiel |
|     1302 | G5346789  | Distanciel |
|     1302 | C0987265  | Présentiel |
|     1302 | D2356903  | Présentiel |
|     1302 | Y1234987  | Présentiel |
|     1401 | G5346789  | Distanciel |
|     1401 | C0987265  | Distanciel |
|     1401 | D2356903  | Distanciel |
|     1401 | Y1234987  | Distanciel |
|     1401 | J3578902  | Distanciel |
|     1401 | F9827363  | Distanciel |
|     1501 | AB234567  | Distanciel |
|     1501 | G5346789  | Présentiel |
|     1501 | C0987265  | Distanciel |
|     1501 | D2356903  | Présentiel |
|     1501 | Y1234987  | Présentiel |
|     1501 | J3578902  | Présentiel |
|     1501 | F9827363  | Présentiel |
+----------+-----------+------------+
31 rows in set (0.00 sec)

mysql> alter table inscription
    -> modify column TypeCours varchar(10);
Query OK, 31 rows affected (0.25 sec)
Records: 31  Duplicates: 0  Warnings: 0

mysql> desc inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | YES  | MUL | NULL    |       |
| numCINEtu | varchar(10) | YES  | MUL | NULL    |       |
| TypeCours | varchar(10) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
