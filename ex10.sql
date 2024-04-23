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
6 rows in set (0.01 sec)

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
6 rows in set (0.03 sec)

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
16 rows in set (0.02 sec)

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
31 rows in set (0.02 sec)

mysql> -- Lister pour chaque formation ses sessions ouvertes. Afficher le Titre de la formation, le nom de la session, la date de début et la date fin.
mysql> SELECT f.titreForm AS Formation, s.nomSess AS Session, s.dateDebut AS Date_Debut, s.dateFin AS Date_Fin
    -> FROM Formation f
    -> JOIN Session s ON f.codeForm = s.codeForm
    -> WHERE s.codeSess IN (
    ->     SELECT codeSess
    ->     FROM (
    ->         SELECT codeSess, COUNT(numCINEtu) AS Nombre_Inscriptions
    ->         FROM Inscription
    ->         GROUP BY codeSess
    ->     ) AS inscriptions
    ->     WHERE Nombre_Inscriptions > 10
    -> );
Empty set (0.01 sec)

mysql> -- Lister Les étudiants inscrits dans chacune des formations. Ordonner la liste par titre de formation.
mysql> SELECT f.titreForm AS 'Formation', i.numCINEtu AS 'Numéro CIN Etudiant', e.nomEtu AS 'Nom Etudiant', e.prenomEtu AS 'Prénom Etudiant'
    -> FROM inscription i
    -> JOIN session s ON i.codeSess = s.codeSess
    -> JOIN formation f ON s.codeForm = f.codeForm
    -> JOIN etudiant e ON i.numCINEtu = e.numCINEtu
    -> ORDER BY f.titreForm;
+------------------------+---------------------+---------------+-----------------+
| Formation              | Numéro CIN Etudiant | Nom Etudiant  | Prénom Etudiant |
+------------------------+---------------------+---------------+-----------------+
| Anglais technique      | AB234567            | Alami         | Ahmad           |
| Anglais technique      | C0987265            | Souni         | Sanaa           |
| Anglais technique      | D2356903            | Idrissi Alami | Mohammed        |
| Anglais technique      | G5346789            | Toumi         | Aicha           |
| Anglais technique      | Y1234987            | Ouled Thami   | Ali             |
| Base de données Oracle | AB234567            | Alami         | Ahmad           |
| Base de données Oracle | C0987265            | Souni         | Sanaa           |
| Base de données Oracle | D2356903            | Idrissi Alami | Mohammed        |
| Base de données Oracle | F9827363            | Boudiaf       | Fatima Zohra    |
| Base de données Oracle | G5346789            | Toumi         | Aicha           |
| Base de données Oracle | J3578902            | Ben Omar      | Abdallah        |
| Base de données Oracle | Y1234987            | Ouled Thami   | Ali             |
| Communication          | C0987265            | Souni         | Sanaa           |
| Communication          | D2356903            | Idrissi Alami | Mohammed        |
| Communication          | F9827363            | Boudiaf       | Fatima Zohra    |
| Communication          | G5346789            | Toumi         | Aicha           |
| Communication          | J3578902            | Ben Omar      | Abdallah        |
| Communication          | Y1234987            | Ouled Thami   | Ali             |
| Développement Java     | AB234567            | Alami         | Ahmad           |
| Développement Java     | C0987265            | Souni         | Sanaa           |
| Développement Java     | D2356903            | Idrissi Alami | Mohammed        |
| Développement Java     | F9827363            | Boudiaf       | Fatima Zohra    |
| Développement Java     | G5346789            | Toumi         | Aicha           |
| Développement Java     | J3578902            | Ben Omar      | Abdallah        |
| Développement Java     | Y1234987            | Ouled Thami   | Ali             |
| web developpment       | AB234567            | Alami         | Ahmad           |
| web developpment       | C0987265            | Souni         | Sanaa           |
| web developpment       | D2356903            | Idrissi Alami | Mohammed        |
| web developpment       | G5346789            | Toumi         | Aicha           |
| web developpment       | J3578902            | Ben Omar      | Abdallah        |
| web developpment       | Y1234987            | Ouled Thami   | Ali             |
+------------------------+---------------------+---------------+-----------------+
31 rows in set (0.02 sec)

mysql> -- Pour la formation web développement, calculer le nombre d’inscriptions distancielles et présentielles.
mysql> SELECT codeForm
    -> FROM formation
    -> WHERE titreForm = 'web developpment';
+----------+
| codeForm |
+----------+
|       12 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT
    ->     f.titreForm AS 'Formation',
    ->     SUM(CASE WHEN i.typeCours = 'Distanciel' THEN 1 ELSE 0 END) AS 'Inscriptions Distancielles',
    ->     SUM(CASE WHEN i.typeCours = 'Présentiel' THEN 1 ELSE 0 END) AS 'Inscriptions Présentielles'
    -> FROM
    ->     inscription i
    ->     JOIN session s ON i.codeSess = s.codeSess
    ->     JOIN formation f ON s.codeForm = f.codeForm
    -> WHERE
    ->     f.codeForm = 12;
+------------------+----------------------------+----------------------------+
| Formation        | Inscriptions Distancielles | Inscriptions Présentielles |
+------------------+----------------------------+----------------------------+
| web developpment |                          1 |                          5 |
+------------------+----------------------------+----------------------------+
1 row in set (0.00 sec)

mysql> -- Lister les formations dont le nombre d’inscriptions distancielles est supérieur ou égale à 3. Ordonner la liste par le nombre d’inscription.
mysql> SELECT
    ->     f.titreForm AS 'Formation',
    ->     COUNT(CASE WHEN i.typeCours = 'Distanciel' THEN 1 END) AS 'Nombre d\'Inscriptions Distancielles'
    -> FROM
    ->     formation f
    ->     JOIN session s ON f.codeForm = s.codeForm
    ->     JOIN inscription i ON s.codeSess = i.codeSess
    -> GROUP BY
    ->     f.titreForm
    -> HAVING
    ->     COUNT(CASE WHEN i.typeCours = 'Distanciel' THEN 1 END) >= 3
    -> ORDER BY
    ->     COUNT(CASE WHEN i.typeCours = 'Distanciel' THEN 1 END) DESC;
+------------------------+-------------------------------------+
| Formation              | Nombre d'Inscriptions Distancielles |
+------------------------+-------------------------------------+
| Développement Java     |                                   7 |
| Communication          |                                   6 |
| Base de données Oracle |                                   3 |
+------------------------+-------------------------------------+
3 rows in set (0.01 sec)

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
5 rows in set (0.02 sec)

mysql> -- Lister pour chaque spécialité active, la liste des formations correspondantes leurs titres, durée et prix. Ordonner la liste par l’ordre alphabétique descendant du nom de la spécialité.
mysql> SELECT
    ->     sp.nomSpec AS 'Spécialité',
    ->     f.titreForm AS 'Formation',
    ->     f.dureeForm AS 'Durée',
    ->     f.prixForm AS 'Prix'
    -> FROM
    ->     specialite sp
    ->     JOIN catalogue c ON sp.codeSpec = c.codeSpec
    ->     JOIN formation f ON c.codeForm = f.codeForm
    -> WHERE
    ->     sp.Active = 1
    -> ORDER BY
    ->     sp.nomSpec DESC, f.titreForm ASC;
+---------------+------------------------+-------+------+
| Spécialité    | Formation              | Durée | Prix |
+---------------+------------------------+-------+------+
| Langues       | Anglais technique      |    15 | 3750 |
| GL            | Base de données Oracle |    20 | 6000 |
| GL            | Développement Java     |    12 | 3600 |
| GL            | web developpment       |    14 | 4200 |
| Data          | Base de données Oracle |    20 | 6000 |
| Communication | Anglais technique      |    15 | 3750 |
| Communication | Communication          |    10 | 2500 |
| Communication | Soft skills            |    12 | 3000 |
+---------------+------------------------+-------+------+
8 rows in set (0.02 sec)

mysql> -- Afficher l’union de la liste en N : 4 avec la liste des formations dont le nombre d’inscriptions présentielles est supérieur ou égal à 4.
mysql> SELECT
    ->     f.titreForm AS 'Formation',
    ->     'Inscriptions Distancielles' AS 'Type',
    ->     COUNT(i.numInscription) AS 'Nombre d\'Inscriptions'
    -> FROM
    ->     inscription i
    ->     JOIN session s ON i.codeSess = s.codeSess
    ->     JOIN formation f ON s.codeForm = f.codeForm
    -> WHERE
    ->     i.typeCours = 'Distanciel'
    -> GROUP BY
    ->     f.codeForm
    -> HAVING
    ->     COUNT(i.numInscription) >= 3
    ->
    -> UNION
    ->
    -> SELECT
    ->     f.titreForm AS 'Formation',
    ->     'Inscriptions Présentielles' AS 'Type',
    ->     COUNT(i.numInscription) AS 'Nombre d\'Inscriptions'
    -> FROM
    ->     inscription i
    ->     JOIN session s ON i.codeSess = s.codeSess
    ->     JOIN formation f ON s.codeForm = f.codeForm
    -> WHERE
    ->     i.typeCours = 'Présentiel'
    -> GROUP BY
    ->     f.codeForm
    -> HAVING
    ->     COUNT(i.numInscription) >= 4;
+------------------------+----------------------------+-----------------------+
| Formation              | Type                       | Nombre d'Inscriptions |
+------------------------+----------------------------+-----------------------+
| Développement Java     | Inscriptions Distancielles |                     7 |
| Communication          | Inscriptions Distancielles |                     6 |
| Base de données Oracle | Inscriptions Distancielles |                     3 |
| web developpment       | Inscriptions Présentielles |                     5 |
| Anglais technique      | Inscriptions Présentielles |                     4 |
| Base de données Oracle | Inscriptions Présentielles |                     4 |
+------------------------+----------------------------+-----------------------+
6 rows in set (0.01 sec)

mysql> -- Calculer le total des prix payés par Année et mois de la date début des sessions
mysql> SELECT
    ->     YEAR(s.dateDebut) AS 'Année',
    ->     MONTH(s.dateDebut) AS 'Mois',
    ->     SUM(f.prixForm) AS 'Total des Prix Payés'
    -> FROM
    ->     session s
    ->     JOIN formation f ON s.codeForm = f.codeForm
    -> GROUP BY
    ->     YEAR(s.dateDebut), MONTH(s.dateDebut);
+-------+------+----------------------+
| Année | Mois | Total des Prix Payés |
+-------+------+----------------------+
|  2022 |    1 |                 7350 |
|  2022 |    2 |                 3600 |
|  2022 |   10 |                 6600 |
|  2022 |    3 |                 4200 |
|  2022 |    4 |                 4200 |
|  2022 |   11 |                10200 |
|  2022 |   12 |                 4200 |
|  2022 |    5 |                 3750 |
|  2022 |    6 |                 3750 |
|  2022 |    9 |                11500 |
|  2022 |    8 |                 2500 |
+-------+------+----------------------+
11 rows in set (0.00 sec)

mysql>
