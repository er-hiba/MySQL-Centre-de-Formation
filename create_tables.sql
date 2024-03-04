mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> create database centre_formation;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centre_formation   |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> use centre_formation;
Database changed
mysql> create table ETUDIANT(
    -> numCINEtu varchar(10),
    -> nomEtu varchar(45),
    -> prenomEtu varchar(45),
    -> dateNaissance date,
    -> adressEtu varchar(45),
    -> villeEtu varchar(45),
    -> niveauEtu varchar(45),
    -> primary key (numCINEtu)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> desc ETUDIANT;
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
7 rows in set (0.03 sec)

mysql> create table SESSION(
    -> codeSess int,
    -> nomSess  varchar(45),
    -> dateDebut date,
    -> dateFin varchar(45),
    -> primary key (codeSess)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> desc SESSION;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | NO   | PRI | NULL    |       |
| nomSess   | varchar(45) | YES  |     | NULL    |       |
| dateDebut | date        | YES  |     | NULL    |       |
| dateFin   | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> create table Inscription(
    -> codeSess int,
    -> numCINEtu varchar(10),
    -> typeCours varchar(45),
    -> foreign key (codeSess) references SESSION(codeSess),
    -> foreign key (numCINEtu) references ETUDIANT(numCINEtu)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> desc Inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | YES  | MUL | NULL    |       |
| numCINEtu | varchar(10) | YES  | MUL | NULL    |       |
| typeCours | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table Formation(
    -> codeForm int,
    -> titreForm varchar(45),
    -> dureeForm double,
    -> prixForm double,
    -> codeSess int,
    -> primary key (codeForm),
    -> constraint fk_SESSION_codeSess foreign key (codeSess) references SESSION(codeSess) on delete cascade
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> desc Formation;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeForm  | int         | NO   | PRI | NULL    |       |
| titreForm | varchar(45) | YES  |     | NULL    |       |
| dureeForm | double      | YES  |     | NULL    |       |
| prixForm  | double      | YES  |     | NULL    |       |
| codeSess  | int         | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> create table SPECIALITE(
    -> codeSpec int,
    -> nomSpec varchar(45),
    -> descSpec varchar(45),
    -> primary key (codeSpec)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> desc SPECIALITE;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| codeSpec | int         | NO   | PRI | NULL    |       |
| nomSpec  | varchar(45) | YES  |     | NULL    |       |
| descSpec | varchar(45) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table Catalogue(
    -> codeSpec int,
    -> codeForm int,
    -> foreign key (codeSpec) references SPECIALITE(codeSpec),
    -> foreign key (codeForm) references Formation(codeForm)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> desc Catalogue;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| codeSpec | int  | YES  | MUL | NULL    |       |
| codeForm | int  | YES  | MUL | NULL    |       |
+----------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

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
6 rows in set (0.00 sec)

mysql> alter table Inscription
    -> modify column typeCours varchar(45) not null;
Query OK, 0 rows affected (0.16 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | YES  | MUL | NULL    |       |
| numCINEtu | varchar(10) | YES  | MUL | NULL    |       |
| typeCours | varchar(45) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter table session
    -> add check (dateFin > dateDebut);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc session;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | NO   | PRI | NULL    |       |
| nomSess   | varchar(45) | YES  |     | NULL    |       |
| dateDebut | date        | YES  |     | NULL    |       |
| dateFin   | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table specialite
    -> add column Active tinyint(1) default(1);
Query OK, 0 rows affected, 1 warning (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> desc specialite;
+----------+-------------+------+-----+---------+-------------------+
| Field    | Type        | Null | Key | Default | Extra             |
+----------+-------------+------+-----+---------+-------------------+
| codeSpec | int         | NO   | PRI | NULL    |                   |
| nomSpec  | varchar(45) | YES  |     | NULL    |                   |
| descSpec | varchar(45) | YES  |     | NULL    |                   |
| Active   | tinyint(1)  | YES  |     | 1       | DEFAULT_GENERATED |
+----------+-------------+------+-----+---------+-------------------+
4 rows in set (0.00 sec)

mysql> exit;
