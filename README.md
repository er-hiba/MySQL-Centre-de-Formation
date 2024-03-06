## Description
This repository contains MySQL scripts related to a fictional training center ('Centre de Formation') database. The scripts include queries to create tables, insert data, and retrieve information for practice purposes. These scripts are part of my learning journey in MySQL.  
*The data in the database, including table and field names, is in French.*

## Tables in the database
- catalogue: Contains the mapping between specialty codes and formation codes.
- etudiant: Stores information about students, including their CIN, name, date of birth, address, city, and educational level.
- formation: Includes details about the training courses, such as the course code, title, duration in days, and price.
- inscription: Records student enrollments in sessions, specifying the session code, student CIN, course type, and enrollment number.
- session: Stores information about training sessions, including the session code, name, start date, end date, and course code.
- specialite: Contains details about specialties, including the specialty code, name, description, and active status."

## MySQL Queries
[File 1 (query_data.sql)](query_data.sql) contains queries to:
- View the contents of all tables in the "centre_formation" schema.
- List students who are from the city of Tanger.
- List formations that cost more than 3000 Dhs.
- Calculate the daily price for each formation (assuming the duration is in days).
- List open sessions for the formation with code 11.
- List student ID numbers (CIN) of students enrolled in session 1302, sorted alphabetically.
- List active specialities.

[File 2 (CF_queries.sql)](CF_queries.sql) contains queries to:
- Count the total number of students.
- Calculate the age of each student.
- Find the most expensive formation.
- Find the least expensive formation.
- Calculate the total cost for a student if they are enrolled in all formations.
- Count the number of students enrolled in each session.
- List the CIN numbers of students who are enrolled at least once.
- Count the number of enrollments for each student.
- Count the number of in-person and online enrollments for each session.
