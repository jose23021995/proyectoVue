-- eMarket - INSERTs en orden de dependencias (FK)
-- Ejecutar sobre la BD emarket con tablas ya creadas (ej. por Sequelize sync)
-- Desde la carpeta server: mysql -u root -p emarket < seed/seed-inserts.sql
-- Para generar versión completa con descripciones largas: npm run seed:sql

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Companies
DELETE FROM Companies;
INSERT INTO Companies (id,name,email,phoneNo,icon,logo,code,header,motive,details,location) VALUES (1,'E Market BD','support@emarket.com','+8801710000000','','http://localhost:8081/public/company/emarket/logo.png','emarket','Find what you need here','emarket is just a software project. It is developed to learn how to build a web application. I''ve included all these data randomly from the internet from different source.','Large text here. about the emarket','45/A, New town<br/>Anywhere, Somewhere.<br/>');
INSERT INTO Companies (id,name,email,phoneNo,icon,logo,code,header,motive,details,location) VALUES (2,'SUPER MARKET','support@supermarket.com','+8801700000000','','','supermarket','Find what you need here','SUPER MARKET sub title here','Large text here. about SUPER MARKET','29/D, Sahid Sarak<br/>Farmgate, Dhaka.<br/>');

-- 2. Users
DELETE FROM Users;
INSERT INTO Users (id,username,firstName,lastName,email,phoneNo,password,registerToken,resetPasswordToken,profileImage,userType,variant,priority,CompanyId) VALUES (1,'admin','Md.','Rony','admin@gmail.com','+8801700100000','12345678','','','http://localhost:8081/public/user-image/default-man.png','Admin','dark',1,1);
INSERT INTO Users (id,username,firstName,lastName,email,phoneNo,password,registerToken,resetPasswordToken,profileImage,userType,variant,priority,CompanyId) VALUES (2,'ronyku','Md.','Rony','rony@gmail.com','+8801700100001','12345678','','','http://localhost:8081/public/user-image/default-man.png','Customer','warning',2,1);
INSERT INTO Users (id,username,firstName,lastName,email,phoneNo,password,registerToken,resetPasswordToken,profileImage,userType,variant,priority,CompanyId) VALUES (3,'hossain','Md.','Hossain','hossain@gmail.com','+8801700100002','12345678','','','http://localhost:8081/public/user-image/default-man.png','Customer','warning',2,1);
INSERT INTO Users (id,username,firstName,lastName,email,phoneNo,password,registerToken,resetPasswordToken,profileImage,userType,variant,priority,CompanyId) VALUES (4,'sahin255','Sheikh','Sahin','sahin@gmail.com','+8801700100003','12345678','','','http://localhost:8081/public/user-image/default-man.png','Customer','warning',2,1);
INSERT INTO Users (id,username,firstName,lastName,email,phoneNo,password,registerToken,resetPasswordToken,profileImage,userType,variant,priority,CompanyId) VALUES (5,'asad','Md.','Asad','asad@gmail.com','+8801700100004','12345678','','','http://localhost:8081/public/user-image/default-man.png','Customer','warning',2,1);

-- 3. Categories
DELETE FROM Categories;
INSERT INTO Categories (id,name) VALUES (1,'Electronics');
INSERT INTO Categories (id,name) VALUES (2,'TV & Multimedia');
INSERT INTO Categories (id,name) VALUES (3,'Home & Furniture');
INSERT INTO Categories (id,name) VALUES (4,'Sports & Books');
INSERT INTO Categories (id,name) VALUES (5,'Tools & Hardware');
INSERT INTO Categories (id,name) VALUES (6,'Clothes');
INSERT INTO Categories (id,name) VALUES (7,'Flowers');
INSERT INTO Categories (id,name) VALUES (8,'Accessories');
INSERT INTO Categories (id,name) VALUES (9,'Baby & Kids');
INSERT INTO Categories (id,name) VALUES (10,'Sports & Beauty');
INSERT INTO Categories (id,name) VALUES (11,'Car Appliances');
INSERT INTO Categories (id,name) VALUES (12,'Outdoors');
INSERT INTO Categories (id,name) VALUES (13,'Home Appliances');
INSERT INTO Categories (id,name) VALUES (14,'Health Products');

-- 4. SubCategories
DELETE FROM SubCategories;
INSERT INTO SubCategories (id,name,CategoryId) VALUES (1,'Mobiles',1);
INSERT INTO SubCategories (id,name,CategoryId) VALUES (2,'Mobile Accessories',1);
INSERT INTO SubCategories (id,name,CategoryId) VALUES (3,'Computer Accessories',1);
INSERT INTO SubCategories (id,name,CategoryId) VALUES (4,'Tvs Brand',2);
INSERT INTO SubCategories (id,name,CategoryId) VALUES (5,'Washing Machine',3);

-- 5. SubSubCategories
DELETE FROM SubSubCategories;
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (1,'Samsung',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (2,'Xiaomi',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (3,'Realme',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (4,'Nokia',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (5,'Huawei',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (6,'oppo',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (7,'Apple',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (8,'Vivo',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (9,'Pixel',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (10,'Walton',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (11,'LG',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (12,'Mobile Charger',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (13,'Mobile Cover',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (14,'Power Bank',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (15,'Memory Card',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (16,'Data Cable',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (17,'Screenguard',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (18,'Headphones',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (19,'External Hard Disk',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (20,'Pendrive',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (21,'Laptop Skins',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (22,'Laptop Bags',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (23,'Mouse',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (24,'Keyboard',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (25,'Samsung',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (26,'LG',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (27,'Sony',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (28,'Micromax',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (29,'Mi',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (30,'Thomson',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (31,'Fully Automatic Front',5);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (32,'Semi Automatic Top',5);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (33,'Fully Automatic Top',5);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (3,'Realme',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (4,'Nokia',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (5,'Huawei',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (6,'oppo',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (7,'Apple',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (8,'Vivo',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (9,'Pixel',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (10,'Walton',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (11,'LG',1);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (12,'Mobile Charger',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (13,'Mobile Cover',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (14,'Power Bank',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (15,'Memory Card',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (16,'Data Cable',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (17,'Screenguard',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (18,'Headphones',2);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (19,'External Hard Disk',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (20,'Pendrive',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (21,'Laptop Skins',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (22,'Laptop Bags',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (23,'Mouse',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (24,'Keyboard',3);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (25,'Samsung',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (26,'LG',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (27,'Sony',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (28,'Micromax',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (29,'Mi',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (30,'Thomson',4);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (31,'Fully Automatic Front',5);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (32,'Semi Automatic Top',5);
INSERT INTO SubSubCategories (id,name,SubCategoryId) VALUES (33,'Fully Automatic Top',5);
