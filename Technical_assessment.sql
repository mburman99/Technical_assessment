/*Create the tables*/

CREATE TABLE store_revenue ( id int NOT null PRIMARY KEY AUTO_INCREMENT, date datetime, brand_id int, store_location varchar(250), revenue float);

CREATE TABLE marketing_data ( id int not null primary key auto_increment, date datetime, geo varchar(2), impressions float, clicks float );

/*Insert Data in tables*/

INSERT INTO store_revenue VALUES(1,'01-01-2016',1,'United States-CA',100);
INSERT INTO store_revenue VALUES(2,'01-01-2016',1,'United States-TX',420);
INSERT INTO store_revenue VALUES(3,'01-01-2016',1,'United States-NY',142);
INSERT INTO store_revenue VALUES(4,'01-02-2016',1,'United States-CA',231);
INSERT INTO store_revenue VALUES(5,'01-02-2016',1,'United States-TX',2342);
INSERT INTO store_revenue VALUES(6,'01-02-2016',1,'United States-NY',232);
INSERT INTO store_revenue VALUES(7,'01-03-2016',1,'United States-CA',100);
INSERT INTO store_revenue VALUES(8,'01-03-2016',1,'United States-TX',420);
INSERT INTO store_revenue VALUES(9,'01-03-2016',1,'United States-NY',3245);
INSERT INTO store_revenue VALUES(10,'01-04-2016',1,'United States-CA',34);
INSERT INTO store_revenue VALUES(11,'01-04-2016',1,'United States-TX',3);
INSERT INTO store_revenue VALUES(12,'01-04-2016',1,'United States-NY',54);
INSERT INTO store_revenue VALUES(13,'01-05-2016',1,'United States-CA',45);
INSERT INTO store_revenue VALUES(14,'01-05-2016',1,'United States-TX',423);
INSERT INTO store_revenue VALUES(15,'01-05-2016',1,'United States-NY',234);
INSERT INTO store_revenue VALUES(16,'01-01-2016',2,'United States-CA',234);
INSERT INTO store_revenue VALUES(17,'01-01-2016',2,'United States-TX',234);
INSERT INTO store_revenue VALUES(18,'01-01-2016',2,'United States-NY',142);
INSERT INTO store_revenue VALUES(19,'01-02-2016',2,'United States-CA',234);
INSERT INTO store_revenue VALUES(20,'01-02-2016',2,'United States-TX',3423);
INSERT INTO store_revenue VALUES(21,'01-02-2016',2,'United States-NY',2342);
INSERT INTO store_revenue VALUES(22,'01-03-2016',2,'United States-CA',234234);
INSERT INTO store_revenue VALUES(23,'01-06-2016',3,'United States-TX',3);
INSERT INTO store_revenue VALUES(24,'01-03-2016',2,'United States-TX',3);
INSERT INTO store_revenue VALUES(25,'01-03-2016',2,'United States-CA',234);
INSERT INTO store_revenue VALUES(26,'01-04-2016',2,'United States-CA',2);
INSERT INTO store_revenue VALUES(27,'01-04-2016',2,'United States-TX',2354);
INSERT INTO store_revenue VALUES(28,'01-04-2016',2,'United States-NY',45235);
INSERT INTO store_revenue VALUES(29,'01-05-2016',2,'United States-CA',23);
INSERT INTO store_revenue VALUES(30,'01-05-2016',2,'United States-TX',4);
INSERT INTO store_revenue VALUES(31,'01-05-2016',2,'United States-NY',124);

INSERT INTO marketing_data VALUES(1,'01-01-2016','TX',2352,45);
INSERT INTO marketing_data VALUES(2,'01-01-2016','CA',3425,63);
INSERT INTO marketing_data VALUES(3,'01-01-2016','NY',3532,25);
INSERT INTO marketing_data VALUES(4,'01-01-2016','MN',1342,784);
INSERT INTO marketing_data VALUES(5,'01-02-2016','TX',3643,23);
INSERT INTO marketing_data VALUES(6,'01-02-2016','CA',1354,53);
INSERT INTO marketing_data VALUES(7,'01-02-2016','NY',4643,85);
INSERT INTO marketing_data VALUES(8,'01-02-2016','MN',2366,85);
INSERT INTO marketing_data VALUES(9,'01-03-2016','TX',2353,57);
INSERT INTO marketing_data VALUES(10,'01-03-2016','CA',5258,36);
INSERT INTO marketing_data VALUES(11,'01-03-2016','NY',4735,63);
INSERT INTO marketing_data VALUES(12,'01-03-2016','MN',5783,87);
INSERT INTO marketing_data VALUES(13,'01-04-2016','TX',5783,47);
INSERT INTO marketing_data VALUES(14,'01-04-2016','CA',7854,85);
INSERT INTO marketing_data VALUES(15,'01-04-2016','NY',4754,36);
INSERT INTO marketing_data VALUES(16,'01-04-2016','MN',9345,24);
INSERT INTO marketing_data VALUES(17,'01-05-2016','TX',2535,63);
INSERT INTO marketing_data VALUES(18,'01-05-2016','CA',4678,73);
INSERT INTO marketing_data VALUES(19,'01-05-2016','NY',2364,33);
INSERT INTO marketing_data VALUES(20,'01-05-2016','MN',3452,25);


/*Quesion 0*/
SELECT * FROM marketing_data LIMIT 2;

/*Quesion 1*/
SELECT SUM(clicks) AS 'SUM of Clicks' FROM marketing_data;

/*Quesion 2*/
SELECT store_location, SUM(revenue) FROM store_revenue GROUP BY store_location;

/*Quesion 3*/
SELECT SUM(a.revenue), b.impressions, b.clicks FROM store_revenue a JOIN marketing_data b ON b.id = a.id GROUP BY b.geo, b.date;

/*Quesion 4*/
SELECT store_location, ROUND(AVG(revenue), 0) AS AVG_revenue, SUM(revenue) AS total_revenue, COUNT(store_location) FROM store_revenue GROUP BY store_location;

SELECT geo, AVG(impressions), SUM(impressions), AVG(clicks), SUM(clicks), SUM(impressions/clicks) FROM marketing_data GROUP BY geo;

/*
There are different ways we can look at the efficiency of a store dependign on how you want to look at it. I have decided to look at both of the datasets in order to determine this. 
Starting with the revenue from the different locations. California has both the highest total and average revenue, I wanted to look at both of these since if a store is visited fewer times, or is in a less popular area it could lead to the store having less in total revenue but still have a high average revenue, and in that was still be an efficent store. 
Since there is no store that has a significant difference in the number of times a store has revenue in it, I beleive that we can focus on the total revenue for the store. With this it shows that California has the highest revenue followed by New York and Texas.
I also wanted to look at the marketing data, however I beleive that this would be interesting if there was some more background data in order to see if there are different strategies or cost assosiated with each gorgraphic location or if each location is in charge for their own marketing or if the marketing decisions are made on a bigger scale. 
Since there are only 3 of the states in the dataset that are generating revenue; CA, NY and TX I have decided to only look at those 3 states. Out of these 3 California is the highest in average and total impressions, and clicks.
Since California is performing the best out of the states in terms of revenue and in marketing impressions and clicks I beleive that California (United States-CA) is the most effcient store location.
*/


/*Quesion 5*/
SELECT store_location, SUM(revenue) AS total_revenue, RANK() OVER(ORDER BY revenue) AS ranking FROM store_revenue WHERE revenue IS NOT NULL GROUP BY store_location LIMIT 10;