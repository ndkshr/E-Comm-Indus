# E-Comm
A simple E-commerce platform using JSP to render the pages and Java as the backend.

### MySQL Setup (Hardcoded into the project files)

`username` : root
`password` : root


### MySQL commands

mysql>>> `use ecomm;`
mysql>>> `desc users;`

+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| username | varchar(100) | NO   | PRI | NULL    |       |
| password | varchar(30)  | YES  |     | NULL    |       |
| wallet   | int(11)      | YES  |     | NULL    |       |
| name     | varchar(50)  | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+

mysql>>> `desc itemlist;`

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
