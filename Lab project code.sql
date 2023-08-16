------------------------------
-- CREATE DATABSE INVENTORY --
------------------------------
CREATE Database inventory
------------------
-- USE DATABASE --
------------------
Use inventory
-----------------------
-- CREATE TABLE USER --
-----------------------
Create table User_(
     User_id_ BIGINT NOT NULL,
	 Role_id INT NOT NULL,
	 FirstName varchar(256) NULL Default NULL,
	 SecondName varchar(256) NULL Default NULL,
	 UserName varchar(256) NULL Default NULL,
	 Mobile varchar(50) NULL,
	 Email varchar(50) NULL,
	 PasswordHASH VARCHAR(32) NOT NULL,
	 registeredAt DATETIME NOT NULL,
	 INTRO TEXT NULL Default NULL,
	 _Profile TEXT NULL Default NULL,

	 Primary Key (User_id_)
)
--------------------------
-- CREATE TABLE PRODUCT --
--------------------------
Create table Product(
     Product_ID BIGINT NOT NULL,
	 Title VARCHAR(75) NOT NULL,
	 summary TEXT NULL,
	 Type int NOT NULL DEFAULT 0,
	 createdAt DATETIME NOT NULL,
     updatedAt DATETIME NULL DEFAULT NULL,

	 Primary Key (Product_ID)
)
-------------------------------
-- CREATE TABLE PRODUCT_META --
-------------------------------
Create table Product_meta(
     Meta_ID BIGINT NOT NULL,
	 Product_ID BIGINT NOT NULL,
	 Key_ varchar(99) NOT NULL,
	 content TEXT NULL DEFAULT NULL,

	 Primary Key (Meta_ID),
	 CONSTRAINT fk_meta_product
	 FOREIGN KEY (Product_ID)
	 REFERENCES Product(Product_ID)
)
---------------------------
-- CREATE TABLE CATEGORY --
---------------------------
Create table Category(
     category_id BIGINT NOT NULL,
	 Parent_id BIGINT NULL DEFAULT NULL,
	 Title VARCHAR(75) NOT NULL,
	 meta_title VARCHAR(100) NULL DEFAULT NULL,
	 slug VARCHAR(100) NOT NULL,
     content TEXT NULL DEFAULT NULL,

	 Primary Key (category_id),
	 CONSTRAINT fk_category
	 FOREIGN KEY (Parent_id)
	 REFERENCES Category(category_id)
)
-----------------------------------
-- CREATE TABLE PRODUCT_CATEGORY --
-----------------------------------
create table product_category(
     Product_ID BIGINT NOT NULL,
     category_id BIGINT NOT NULL,

	 PRIMARY KEY (Product_Id, category_id),
	 CONSTRAINT fk_pc_product
	 FOREIGN KEY (Product_ID)
	 REFERENCES Product(Product_ID),

	 CONSTRAINT fk_pc_category
	 FOREIGN KEY (category_id)
	 REFERENCES Category(category_id)
)
------------------------
-- CREATE TABLE BRAND --
------------------------
Create table Brand(
     brand_ID BIGINT NOT NULL,
	 Title VARCHAR(75) NOT NULL,
	 summary TEXT NULL,
	 createdAt DATETIME NOT NULL,
     updatedAt DATETIME NULL DEFAULT NULL,

	 PRIMARY KEY (brand_ID)
)
------------------------
-- CREATE TABLE ORDER --
------------------------
Create table Order_(
     Order_ID BIGINT NOT NULL,
	 User_id_ BIGINT NOT NULL,
	 Type_ int NOT NULL DEFAULT 0,
	 Status_ int NOT NULL DEFAULT 0,
	 subTotal FLOAT NOT NULL DEFAULT 0,
	 item_desc FLOAT NOT NULL DEFAULT 0,
	 tax FLOAT NOT NULL DEFAULT 0,
     shipping FLOAT NOT NULL DEFAULT 0,
	 Total FLOAT NOT NULL DEFAULT 0,
	 content TEXT NULL DEFAULT NULL,

	 PRIMARY KEY (Order_ID),
	 CONSTRAINT fk_Order
	 FOREIGN KEY (User_id_)
	 REFERENCES User_(User_id_)
)
--------------------------
-- CREATE TABLE ADDRESS --
--------------------------
Create table Address_(
     Address_ID BIGINT NOT NULL,
     User_id_ BIGINT NOT NULL,
	 Order_ID BIGINT NOT NULL,
	 FirstName varchar(256) NULL Default NULL,
	 SecondName varchar(256) NULL Default NULL,
	 Mobile varchar(50) NULL,
	 Email varchar(50) NULL,
	 Line1 VARCHAR(50) NULL DEFAULT NULL,
	 Line2 VARCHAR(50) NULL DEFAULT NULL,
	 city VARCHAR(50) NULL DEFAULT NULL,
	 Province VARCHAR(50) NULL DEFAULT NULL,
	 Postal_code BIGINT NOT NULL DEFAULT 0,

	 PRIMARY KEY (Address_ID),
	 
	 CONSTRAINT fk_Add_user
	 FOREIGN KEY (User_id_)
	 REFERENCES User_(User_id_),

	 CONSTRAINT fk_Add_Order
	 FOREIGN KEY (Order_ID)
	 REFERENCES Order_(Order_ID)
)
-----------------------
-- CREATE TABLE ITEM --
-----------------------
Create Table item(
     Item_ID BIGINT NOT NULL,
	 Product_ID BIGINT NOT NULL,
	 brand_ID BIGINT NOT NULL,
	 Order_ID BIGINT NOT NULL,
	 Supplier_ID BIGINT NOT NULL,
	 Stock_unit VARCHAR(100) NULL DEFAULT NULL,
	 createdBy BIGINT NOT NULL,
     updatedBy BIGINT DEFAULT NULL,
	 retail_price FLOAT NOT NULL DEFAULT 0,
     discount FLOAT NOT NULL DEFAULT 0,
     price FLOAT NOT NULL DEFAULT 0,
	 quantity INT NOT NULL DEFAULT 0,
     sold INT NOT NULL DEFAULT 0,
	 available INT NOT NULL DEFAULT 0,

	 PRIMARY KEY (Item_ID),

	 CONSTRAINT fk_ITEM_product
	 FOREIGN KEY (Product_ID)
	 REFERENCES Product(Product_ID),

	 CONSTRAINT fk_ITEM_BRAND
	 FOREIGN KEY (brand_ID)
	 REFERENCES Brand(brand_ID),

	 CONSTRAINT fk_ITEM_Order
	 FOREIGN KEY (Order_ID)
	 REFERENCES Order_(Order_ID),

	 CONSTRAINT fk_ITEM_user
	 FOREIGN KEY (Supplier_ID)
	 REFERENCES User_(User_id_),
)
-----------------------------
-- CREATE TABLE ORDER_ITEM --
-----------------------------
Create Table Order_item(
     O_item_ID BIGINT NOT NULL,
	 Product_ID BIGINT NOT NULL,
	 Item_ID BIGINT NOT NULL,
	 Order_ID BIGINT NOT NULL,
	 sku VARCHAR(100) NOT NULL,
     price FLOAT NOT NULL DEFAULT 0,
     discount FLOAT NOT NULL DEFAULT 0,
     quantity INT NOT NULL DEFAULT 0,
	 content TEXT NULL DEFAULT NULL,
     
	 PRIMARY KEY (O_item_ID),

	 CONSTRAINT fk_O_ITEM_product
	 FOREIGN KEY (Product_ID)
	 REFERENCES Product(Product_ID),

	 CONSTRAINT fk_O_ITEM_item
	 FOREIGN KEY (Item_ID)
	 REFERENCES item(Item_ID),

	 CONSTRAINT fk_O_ITEM_Order
	 FOREIGN KEY (Order_ID)
	 REFERENCES Order_(Order_ID),
)
------------------------------
-- CREATE TABLE TRANSACTION --
------------------------------
Create Table Transaction_(
     trans_ID BIGINT NOT NULL,
	 User_id_ BIGINT NOT NULL,
	 Order_ID BIGINT NOT NULL,
	 code VARCHAR(100) NOT NULL,
     type INT NOT NULL DEFAULT 0,
     mode INT NOT NULL DEFAULT 0,
     status INT NOT NULL DEFAULT 0,

	 PRIMARY KEY (trans_ID),

	 CONSTRAINT fk_trans_user
	 FOREIGN KEY (User_id_)
	 REFERENCES User_(User_id_),

     CONSTRAINT fk_trans_Order
	 FOREIGN KEY (Order_ID)
	 REFERENCES Order_(Order_ID)
)
---------------------------------
-- INSERT VALUES IN USER TABLE --
---------------------------------
INSERT INTO User_(User_id_, Role_id, FirstName, SecondName, UserName, Mobile, Email, PasswordHASH, registeredAt, INTRO, _Profile) 
                  VALUES (101, 01, 'Sher', 'Asghar', 'Sher Asghar', '0322-5098802', 'SherAsghar3@gmail.com', '12345678', '12-11-2020','','')
INSERT INTO User_ VALUES (102, 02, 'Shehroz', 'NA', 'Shehroz', '0335-9099881', 'mshehroz302@gmail.com', '12345678', '12-11-2020', '','')
INSERT INTO User_ VALUES (103, 03, 'Arshad', 'NA', 'Arshad', '0345-5352123','ABC@gmail.com', '12345678', '12-11-2020', '','')
INSERT INTO User_ VALUES (104, 03, 'Usman', 'khan', 'Maani', '0300-1234567','ABC@gmail.com', '12345678', '1-02-2020', '','')
INSERT INTO User_ VALUES (105, 03, 'Asad', 'kamal', 'kami', '0345-1234567','ABC@gmail.com', '12345678', '2-11-2021', '','')
INSERT INTO User_ VALUES (106, 04, 'Hayat', 'Haleen', 'HH', '0300-9123144', 'HH8881@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (107, 04, 'Zeeshan', 'Saleem', 'Silverstone', '0300-9123144', 'Silverstone81@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (108, 04, 'Waqas', 'Khan', 'Punjab', '0300-9123144', 'punjabtyres81@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (109, 04, 'Qazafi', 'Khan', 'PeshawarTYRE', '0300-9123144', 'ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (110, 04, 'Iran', 'Shah', 'Sawat', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (111, 04, 'Malik', 'Shokat', 'Malik_Shokat', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (112, 04, 'Malik', 'Sulman', 'sulman', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (113, 05, '' ,'' ,'Asad', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (114, 05, '' ,'' ,'Abdullah', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (115, 05, '' ,'' ,'Rashid', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (116, 05, '' ,'' ,'Hamza', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (117, 05, '' ,'' ,'Rehman', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (118, 05, '' ,'' ,'Zehdi', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (119, 05, '' ,'' ,'Ahmed', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')
INSERT INTO User_ VALUES (120, 05, '' ,'' ,'Adil', '0300-9123144','ABC@gmail.com', '12345678', '12-11-2021', '','')

------------------------------------
-- INSERT VALUES IN PRODUCT TABLE --
------------------------------------
INSERT INTO Product(Product_ID, Title, summary, Type, createdAt,updatedAt) 
                    VALUES (13000200001, '175/70R13 COOPER', 'SF-340, GLS', 0, '01-26-2020' ,'10-20-2022')
INSERT INTO Product VALUES (13000200002, '185/70R13 COOPER', 'ER SE', 0, '01-26-2020' ,'10-20-2022')
INSERT INTO Product VALUES (13000200003, '185/80R13 COOPER', 'ER SE', 0, '01-26-2020' ,'10-20-2022')
INSERT INTO Product VALUES (90000003539, '245/40R17 91W', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000003540, '275/40R17 98W', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000003541, '215/45R17XL 91W', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000003542, '225/45R17XL 94W', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000020632, '235/45R17XL 97W', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000003525, '245/45R17 95Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000003543, '205/50R17XL 93Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000003544, '235/50R17 98Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000003545, '255/35R18 90Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000003526, '275/35R18XL 99Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-10-2022')
INSERT INTO Product VALUES (90000003527, '275/35R18XL 90W', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-20-2022')
INSERT INTO Product VALUES (90000003528, '225/40R18XL 92Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-20-2022')
INSERT INTO Product VALUES (90000003529, '235/40R18XL 95Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (90000003530, '245/40R18XL 97Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (90000003531, '255/40R18XL 99Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (90000003532, '275/40R18 99Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (90000003546, '225/45R18XL 95W', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (90000003533, '245/45R18 96Y', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (90000003547, '235/50R18 97W', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (90000003534, '255/35R19XL 96W', 'RS3-S, RS3-A', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (15007700001, '195/65R15 SS 91H/V', 'NS500, NS700, M5', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (15007700002, '205/65R15 SS 96H/V', 'NS500, NS700, M5', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (15007700003, '195/60R15 SS 88H/V', 'NS500, NS700, M5', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (15007700004, '205/60R15 SS 91H/V', 'NS500, NS700, M5', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (15007700005, '215/60R15 SS 95H/V', 'NS500, NS700, M5', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (15007700006, '195/55R15 SS 91H/V', 'NS500, NS700, M5', 0, '01-26-2020' ,'10-30-2022')
INSERT INTO Product VALUES (15007700007, '195/50R15 SS 91H/V', 'NS500, NS700, M5', 0, '01-26-2020' ,'10-20-2022')
INSERT INTO Product VALUES (15007700008, '225/50R15 SS 91H/V', 'NS500, NS700, M5', 0, '01-26-2020' ,'10-10-2022')

-----------------------------------------
-- INSERT VALUES IN PRODUCT_META TABLE --
-----------------------------------------

INSERT INTO Product_meta (Meta_ID, Product_ID, Key_, content)  
                         VALUES (121210001, 15007700001, 'KRUIZER , SYENERGY', '')
INSERT INTO Product_meta VALUES (121210002, 15007700002, 'KRUIZER , SYENERGY', '')
INSERT INTO Product_meta VALUES (121210003, 15007700003, 'KRUIZER , SYENERGY', '')
INSERT INTO Product_meta VALUES (121210004, 15007700004, 'KRUIZER , SYENERGY', '')
INSERT INTO Product_meta VALUES (121210005, 15007700005, 'KRUIZER , SYENERGY', '')
INSERT INTO Product_meta VALUES (121210006, 15007700006, 'KRUIZER , SYENERGY', '')
INSERT INTO Product_meta VALUES (121210007, 15007700007, 'KRUIZER , SYENERGY', '')

-------------------------------------
-- INSERT VALUES IN CATEGORY TABLE --
-------------------------------------

INSERT INTO Category (category_id, Parent_id, Title, meta_title, slug, content) 
                     VALUES (43300001, 43300001, 'ENERGY SAVING TYRES','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')
INSERT INTO Category VALUES (43300002, 43300002, 'HIGH PERFORMANCE TYRES','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')
INSERT INTO Category VALUES (43300003, 43300003, 'RUN FLAT TYRES','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')
INSERT INTO Category VALUES (43300004, 43300004, 'TYRE PATTERNS','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')
INSERT INTO Category VALUES (43300005, 43300005, 'BUDGET TYRES','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')
INSERT INTO Category VALUES (43300006, 43300006, 'MUD TYRES','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')
INSERT INTO Category VALUES (43300007, 43300007, 'ALL SEASON TYRES','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')
INSERT INTO Category VALUES (43300008, 43300008, 'SUMMER TYRES','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')
INSERT INTO Category VALUES (43300009, 43300009, 'WINTER TYRES','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')
INSERT INTO Category VALUES (43300010, 43300010, 'Temporary TYRES','','https://KARACHITRESAUTOCARE-first-site.netlify.app/','')

---------------------------------------------
-- INSERT VALUES IN PRODUCT_CATEGORY TABLE --
---------------------------------------------

INSERT INTO product_category (Product_ID,category_id) 
                             VALUES (13000200001, 43300009)
INSERT INTO product_category VALUES (13000200002, 43300001)
INSERT INTO product_category VALUES (13000200003, 43300010)
INSERT INTO product_category VALUES (90000003539, 43300010)
INSERT INTO product_category VALUES (90000003540, 43300009)
INSERT INTO product_category VALUES (90000003541, 43300002)
INSERT INTO product_category VALUES (90000003542, 43300005)
INSERT INTO product_category VALUES (90000020632, 43300006)
INSERT INTO product_category VALUES (90000003525, 43300002)
INSERT INTO product_category VALUES (90000003543, 43300002)
INSERT INTO product_category VALUES (90000003544, 43300002)
INSERT INTO product_category VALUES (90000003545, 43300002)
INSERT INTO product_category VALUES (90000003526, 43300003)
INSERT INTO product_category VALUES (90000003527, 43300004)
INSERT INTO product_category VALUES (90000003528, 43300006)
INSERT INTO product_category VALUES (90000003529, 43300006)
INSERT INTO product_category VALUES (90000003530, 43300007)
INSERT INTO product_category VALUES (90000003531, 43300004)
INSERT INTO product_category VALUES (90000003532, 43300005)
INSERT INTO product_category VALUES (90000003546, 43300005)
INSERT INTO product_category VALUES (90000003533, 43300004)
INSERT INTO product_category VALUES (90000003547, 43300004)
INSERT INTO product_category VALUES (90000003534, 43300003)
INSERT INTO product_category VALUES (15007700001, 43300002)
INSERT INTO product_category VALUES (15007700002, 43300001)
INSERT INTO product_category VALUES (15007700003, 43300003)
INSERT INTO product_category VALUES (15007700004, 43300006)
INSERT INTO product_category VALUES (15007700005, 43300007)
INSERT INTO product_category VALUES (15007700006, 43300007)
INSERT INTO product_category VALUES (15007700007, 43300008)
INSERT INTO product_category VALUES (15007700008, 43300009)

----------------------------------
-- INSERT VALUES IN BRAND TABLE --
----------------------------------
INSERT INTO Brand (brand_ID,Title,summary,createdAt,updatedAt) 
                  VALUES (80001,'COOPER','MADE IN JAPAN','01-06-2022','')
INSERT INTO Brand VALUES (80002,'SILVERSTONE','MADE IN MALAYSIA','01-06-2022','')
INSERT INTO Brand VALUES (80003,'DUNLOP','MADE IN JAPAN','01-06-2022','')
INSERT INTO Brand VALUES (80004,'BLACKLINE','MADE IN CHINA','01-06-2022','')
INSERT INTO Brand VALUES (80005,'YOKOHAMA','MADE IN JAPAN','01-06-2022','')
INSERT INTO Brand VALUES (80006,'FALCON','MADE IN JAPAN','01-06-2022','')
INSERT INTO Brand VALUES (80007,'MICHELIN','MADE IN SCOTLAND','01-06-2022','')
INSERT INTO Brand VALUES (80008,'BRIDGESTONE','MADE IN INDONASIA','01-06-2022','')
INSERT INTO Brand VALUES (80009,'TOYO','MADE IN TAILAND','01-06-2022','')
INSERT INTO Brand VALUES (80010,'ECOLANDER','MADE IN CHINA','01-06-2022','')
INSERT INTO Brand VALUES (80011,'ROAD KING','MADE IN CHINA','01-06-2022','')
INSERT INTO Brand VALUES (80012,'WHITEWAY','MADE IN CHINA','01-06-2022','')
INSERT INTO Brand VALUES (80013,'SUNFULL','MADE IN CHINA','01-06-2022','')

----------------------------------
-- INSERT VALUES IN ORDER TABLE --
----------------------------------

--New(1), Checkout(2), Paid(3), Failed(4), Shipped(5), Delivered(6), Returned(7), and Complete(8).

INSERT INTO Order_ (Order_ID, User_id_, Type_, Status_, subTotal, item_desc, tax, shipping, Total, content)
                   VALUES (658200001, 106, 1, 1, 1005600, 0, 0, 0,  1005600, 'NEW ')
INSERT INTO Order_ VALUES (658200002, 107, 1, 1, 100000, 0, 0, 0,  100000, 'NEW ')
INSERT INTO Order_ VALUES (658200003, 108, 1, 1, 305600, 0, 0, 0,  305600, 'NEW ')
INSERT INTO Order_ VALUES (658200004, 109, 1, 1, 2205600, 0, 0, 0,  2205600, 'NEW ')
INSERT INTO Order_ VALUES (658200005, 106, 1, 1, 2054600, 0, 0, 0,  2054600, 'NEW ')
INSERT INTO Order_ VALUES (658200006, 110, 1, 1, 105600, 0, 0, 0,  105600, 'NEW ')
INSERT INTO Order_ VALUES (658200007, 111, 1, 1, 103600, 0, 0, 0,  103600, 'NEW ')
INSERT INTO Order_ VALUES (658200008, 112, 1, 1, 5005600, 0, 0, 0,  5005600, 'NEW ')
INSERT INTO Order_ VALUES (658200009, 106, 1, 1, 1045600, 0, 0, 0,  1045600, 'NEW ')
INSERT INTO Order_ VALUES (658200010, 109, 1, 1, 885600, 0, 0, 0,  885600, 'NEW ')
INSERT INTO Order_ VALUES (658200011, 107, 1, 1, 1995600, 0, 0, 0,  1995600, 'NEW ')
INSERT INTO Order_ VALUES (658200012, 113, 2, 3, 60000, 500, 1500, 0,  61000, 'Paid ')
INSERT INTO Order_ VALUES (658200013, 114, 2, 5, 55000, 500, 1500, 1500,  57500, 'Shipped ')
INSERT INTO Order_ VALUES (658200014, 115, 2, 3, 10000, 500, 1500, 0,  11000, 'Paid ')
INSERT INTO Order_ VALUES (658200015, 116, 2, 8, 15600, 500, 1500, 1500,  18100, 'Complete')
INSERT INTO Order_ VALUES (658200016, 117, 2, 5, 88600, 700, 1500, 1500,  90900, 'Shipped')
INSERT INTO Order_ VALUES (658200017, 118, 2, 6, 55600, 600, 1870, 1500,  58270, 'Delivered')
INSERT INTO Order_ VALUES (658200018, 119, 2, 6, 65600, 440, 1560, 1500,  68220, 'Delivered')
INSERT INTO Order_ VALUES (658200019, 120, 2, 5, 105600, 980, 1670, 1500,  107790, 'Shipped')

------------------------------------
-- INSERT VALUES IN ADDRESS TABLE --
------------------------------------

INSERT INTO Address_ (Address_ID, User_id_, Order_ID, FirstName, SecondName , Mobile, Email, Line1, Line2, city, Province, Postal_code) 
                     VALUES (2120001, 113, 658200012, 'Asad','','0300-9123144', 'ABC@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120002, 106, 658200001, 'Hayat', 'Haleen', '0300-9123144', 'HH8881@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120003, 107, 658200011, 'Zeeshan', 'Saleem', '0300-9123144', 'Silverstone81@gmail.com', 'H# 43 STREET 3', '','LHR','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120004, 114, 658200013, 'Abdullah', '' , '0300-9123144','ABC@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120005, 115, 658200014, 'Rashid', '' , '0300-9123144','ABC@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120006, 116, 658200015, 'Hamza', '', '0300-9123144','ABC@gmail.com', 'H# 43 STREET 3',  '','LHR ','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120007, 117, 658200016, 'Rehman', '', '0300-9123144','ABC@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120008, 118, 658200017, 'Zehdi', '', '0300-9123144','ABC@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120009, 119, 658200018, 'Ahmed', '', '0300-9123144','ABC@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120010, 120, 658200019, 'Adil', '', '0300-9123144','ABC@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120011, 108, 658200003, 'Waqas', 'Khan', '0300-9123144', 'punjabtyres81@gmail.com', 'SHOP 64 SADDAR', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120012, 109, 658200004, 'Qazafi', 'Khan', '0300-9123144', 'ABC@gmail.com', 'SHOP 77', '','PESHAWAR','KPK',46000)
INSERT INTO Address_ VALUES (2120013, 110, 658200006, 'Iran', 'Shah', '0300-9123144', 'ABC@gmail.com', 'SHOP 44', '','PESHAWAR','KPK',46000)
INSERT INTO Address_ VALUES (2120014, 111, 658200007, 'Malik', 'Shokat', '0300-9123144', 'ABC@gmail.com', 'SHOP 453', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120015, 112, 658200008, 'Malik', 'Sulman', '0300-9123144', 'ABC@gmail.com', 'SHOP 322', '','ABBOTABAD','KPK',46000)
INSERT INTO Address_ VALUES (2120016, 106, 658200009, 'Hayat', 'Haleen', '0300-9123144', 'HH8881@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120017, 106, 658200005, 'Hayat', 'Haleen', '0300-9123144', 'HH8881@gmail.com', 'H# 43 STREET 3', '','RWP','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120018, 107, 658200002, 'Zeeshan', 'Saleem', '0300-9123144', 'Silverstone81@gmail.com', 'H# 43 STREET 3', '','LHR','PUNJAB',46000)
INSERT INTO Address_ VALUES (2120019, 109, 658200010, 'Qazafi', 'Khan', '0300-9123144', 'ABC@gmail.com', 'SHOP 77', '','PESHAWAR','KPK',46000)

---------------------------------
-- INSERT VALUES IN ITEM TABLE --
---------------------------------

INSERT INTO item (Item_ID, Product_ID, brand_ID, Order_ID, Supplier_ID, Stock_unit, createdBy, updatedBy, retail_price, discount, price, quantity, sold, available)
                 VALUES (48360001, 13000200001, 80001, 658200001, 106, 'YES', 103, '', 50280, 12500 , 263900, 20, 1, 1)
INSERT INTO item VALUES (48360002, 13000200002, 80001, 658200001, 106, 'YES', 104, '', 50280, 12500 , 263900, 20, 1, 1)
INSERT INTO item VALUES (48360003, 13000200003, 80001, 658200001, 106, 'YES', 105,'', 50280, 12500 , 263900, 20, 1, 1)
INSERT INTO item VALUES (48360004, 90000003539, 80001, 658200001, 106, 'YES', 103,'', 50280, 12500 , 263900, 20, 1, 1)
INSERT INTO item VALUES (48360005, 90000003540, 80001, 658200005, 106, 'YES', 104,'', 55140, 20000 , 461120, 32, 1, 1)
INSERT INTO item VALUES (48360006, 90000003541, 80001, 658200005, 106, 'YES', 104,'', 55140, 20000 , 461120, 32, 1, 1)
INSERT INTO item VALUES (48360007, 90000003542, 80001, 658200005, 106, 'YES', 105,'', 55140, 20000 , 461120, 32, 1, 1)
INSERT INTO item VALUES (48360008, 90000020632, 80001, 658200005, 106, 'YES', 103,'', 55140, 20000 , 461120, 32, 1, 1)
INSERT INTO item VALUES (48360009, 90000003525, 80001, 658200005, 106, 'YES', 104,'', 55140, 20000 , 461120, 32, 1, 1)
INSERT INTO item VALUES (48360010, 90000003543, 80001, 658200009, 106, 'YES', 105,'', 43566, 12500 , 273900, 24, 1, 1)
INSERT INTO item VALUES (48360011, 90000003544, 80001, 658200009, 106, 'YES', 103,'', 43566, 12500 , 273900, 24, 1, 1)
INSERT INTO item VALUES (48360012, 90000003545, 80001, 658200009, 106, 'YES', 103,'', 43566, 12500 , 273900, 24, 1, 1)
INSERT INTO item VALUES (48360013, 90000003526, 80001, 658200009, 106, 'YES', 104,'', 43566, 12500 , 273900, 24, 1, 1)
INSERT INTO item VALUES (48360014, 90000003527, 80001, 658200003, 108, 'YES', 104,'', 50933, 10000 , 162800, 12, 1, 1)
INSERT INTO item VALUES (48360015, 90000003528, 80001, 658200003, 108, 'YES', 104,'', 50933, 10000 , 162800, 12, 1, 1)
INSERT INTO item VALUES (48360016, 90000003529, 80001, 658200006, 110, 'YES', 105,'', 105100, 500 , 105600, 4, 1, 1)
INSERT INTO item VALUES (48360017, 90000003530, 80001, 658200007, 111, 'YES', 103,'', 103100, 500 , 103600, 4, 1, 1)
INSERT INTO item VALUES (48360018, 90000003531, 80001, 658200008, 112, 'YES', 104,'', 55617, 166666 , 1835200, 120, 1, 1)
INSERT INTO item VALUES (48360019, 90000003532, 80001, 658200008, 112, 'YES', 103,'', 55617, 166666 , 1835200, 120, 1, 1)
INSERT INTO item VALUES (48360020, 90000003546, 80001, 658200008, 112, 'YES', 103,'', 55617, 166666 , 1835200, 120, 1, 1)
INSERT INTO item VALUES (48360021, 90000003533, 80001, 658200004, 109, 'YES', 103,'', 73800, 28333 , 323533, 16, 1, 1)
INSERT INTO item VALUES (48360022, 90000003547, 80001, 658200004, 109, 'YES', 104,'', 73800, 28333 , 323533, 16, 1, 1)
INSERT INTO item VALUES (48360023, 90000003534, 80001, 658200010, 109, 'YES', 103,'', 73800, 28333 , 323533, 16, 1, 1)
INSERT INTO item VALUES (48360024, 15007700001, 80002, 658200002, 107, 'YES', 105,'', 50000, 7000 , 57000, 4, 1, 1)
INSERT INTO item VALUES (48360025, 15007700002, 80002, 658200002, 107, 'YES', 104,'', 50000, 7000 , 57000, 4, 1, 1)
INSERT INTO item VALUES (48360026, 15007700003, 80002, 658200011, 107, 'YES', 103,'', 55433, 16666 , 349266, 24, 1, 1)
INSERT INTO item VALUES (48360027, 15007700004, 80002, 658200011, 107, 'YES', 105,'', 55433, 16666 , 349266, 24, 1, 1)
INSERT INTO item VALUES (48360028, 15007700005, 80002, 658200011, 107, 'YES', 104,'', 55433, 16666 , 349266, 24, 1, 1)
INSERT INTO item VALUES (48360029, 15007700006, 80002, 658200011, 107, 'YES', 104,'', 55433, 16666 , 349266, 24, 1, 1)
INSERT INTO item VALUES (48360030, 15007700007, 80002, 658200011, 107, 'YES', 103,'', 55433, 16666 , 349266, 24, 1, 1)
INSERT INTO item VALUES (48360031, 15007700008, 80002, 658200011, 107, 'YES', 103,'', 55433, 16666 , 349266, 24, 1, 1)

---------------------------------------
-- INSERT VALUES IN ORDER_ITEM TABLE --
---------------------------------------

INSERT INTO Order_item (O_item_ID , Product_ID, Item_ID, Order_ID, sku, price, discount, quantity, content)
	                   VALUES (64001, 90000003541, 48360006, 658200012, '212122133322', 78000, 1500, 4,'')
INSERT INTO Order_item VALUES (64002, 15007700006, 48360029, 658200013, '212000008722', 89000, 1500, 4,'')
INSERT INTO Order_item VALUES (64003, 15007700008, 48360031, 658200014, '212888899322', 78780, 1500, 4,'')
INSERT INTO Order_item VALUES (64004, 90000003529, 48360016, 658200015, '233333333322', 90000, 1500, 4,'')
INSERT INTO Order_item VALUES (64005, 90000003526, 48360013, 658200016, '212556683322', 90000, 1500, 4,'')
INSERT INTO Order_item VALUES (64006, 90000003543, 48360010, 658200017, '212122136622', 70000, 1500, 4,'')
INSERT INTO Order_item VALUES (64007, 90000003530, 48360017, 658200018, '288977783322', 86770, 1500, 4,'')
INSERT INTO Order_item VALUES (64009, 15007700001, 48360024, 658200019, '212122177722', 90080, 1500, 4,'')

----------------------------------------
-- INSERT VALUES IN TRANSACTION TABLE --
----------------------------------------
-- ONLINE(1) , CASH(2), CARD(3)
INSERT INTO Transaction_ (trans_ID , User_id_, Order_ID, code, type, mode, status)
                         VALUES (87001, 113, 658200012, '5443534', 3, 3, 1)
INSERT INTO Transaction_ VALUES (87002, 114, 658200013, '5645645', 1, 5, 1)
INSERT INTO Transaction_ VALUES (87003, 115, 658200014, '4543534', 2, 3, 2)
INSERT INTO Transaction_ VALUES (87004, 116, 658200015, '4342343', 3, 8, 2)
INSERT INTO Transaction_ VALUES (87005, 117, 658200016, '6456455', 1, 5, 3)
INSERT INTO Transaction_ VALUES (87006, 118, 658200017, '6765467', 1, 6, 2)
INSERT INTO Transaction_ VALUES (87007, 119, 658200018, '6400055', 1, 6, 1)
INSERT INTO Transaction_ VALUES (87008, 120, 658200019, '6411155', 1, 5, 1)

---------------------------
-- SHOW TABLE DATA QUERY --
---------------------------
SELECT * FROM User_
SELECT * FROM Product
SELECT * FROM Product_meta
SELECT * FROM Category
SELECT * FROM product_category
SELECT * FROM Brand
SELECT * FROM Order_
SELECT * FROM Address_
SELECT * FROM item
SELECT * FROM Order_item
SELECT * FROM Transaction_

UPDATE Order_item
SET O_item_ID = 64008 WHERE Product_ID= 15007700001;

SELECT SUM(quantity) AS TOTAT_QUANTITY
FROM item
SELECT SUM(price) AS TOTAT_PRICE
FROM Order_item