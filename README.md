WEEK 5 : MYSQL & POSTGRESQL DATABASES

1) We added all the new tables in MYSQL with all the required rows and columns in regards to the mandate we had this week. In all, 8 new tables were created in MYSQL. You can see them in our Rails_Admin dashboard by logging in with an email (for example philippe.bouillon@codeboxx.biz) and a password (123456). You can also see them in MYSQL Workbench. The tables that needed it were assigned primary keys and foreign keys.

2) Multiples sections in the Rails_Admin dashboard were created in relation to the tables that were asked. You can also edit, delete and see the content of the tables in these menus. The relationships between the objects are all visible in the dashboard tables. New data can be entered/created through the dashboard, as well as the website itself.

3) Data was created from scratch with the help of the Mockaroo app. We used this data to populate the tables you see in MySQL and those you will see in Postgresql. The data is in concordance with what was asked in the "Codeboxx : week 5" file.

4) A data warehouse was created on Postgresql and was also linked to our Rails app to stock the data harvested through MySQL from the website or the dashboard. The data was placed in the 4 tables that were asked in the "Codeboxx week 5" file. With the help of the Whenever and PG gems, the content of these tables is updated in Postgresql every 2 minutes. The changes from the MySQL DB are refreshed in real time in the 4 Postgresql tables.

5) The data present in the table is then used with two dimensions (time & customers) to be analyzed and returned with the help of the three queries asked in the "Codeboxx week 5" file. The three queries will returned the answer to the three questions asked in the file.

6) Finally, the three queries will be represented in the "STATS" section of the Website to be analyzed in the form of graphical interfaces.

Have a great time correcting our project ! 
--------------------------------------------
# README
PASSWORDS: The passwords of the users are ALL "123456" by default. Every new user created in the DB has this password. 
Nadya : 123456
Felix-Antoine : 123456
Philippe: 123456
Serge: 123456
Mathieu H.: 123456
Mathieu L.: 123456
Remi: 123456
-------------------------------------------

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
