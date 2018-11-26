# E-Comm
e commerce using jsp and java

MySQL username : root


MySQL password : root



use ecomm;



mysql> desc users;


+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| username | varchar(100) | NO   | PRI | NULL    |       |
| password | varchar(30)  | YES  |     | NULL    |       |
| wallet   | int(11)      | YES  |     | NULL    |       |
| name     | varchar(50)  | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+



mysql> desc itemlist;


+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| itemName   | varchar(100) | YES  |     | NULL    |                |
| itemType   | varchar(50)  | YES  |     | NULL    |                |
| itemSeller | varchar(100) | YES  |     | NULL    |                |
| itemPrice  | int(11)      | YES  |     | NULL    |                |
| itemBuyer  | varchar(100) | YES  |     | NULL    |                |
| itemId     | int(11)      | NO   | PRI | NULL    | auto_increment |
+------------+--------------+------+-----+---------+----------------+
