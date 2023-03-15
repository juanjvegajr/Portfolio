#Creating database for practice questions
CREATE DATABASE sql_practice;
USE sql_practice;

#Creating tables
CREATE TABLE candidates (
	candidate_id integer,
    skill varchar(225)
);
INSERT INTO candidates
VALUES
	(123, 'Python'),
    (123, 'Tableau'),
    (123, 'PostgreSQL'),
    (234, 'R'),
    (234, 'PowerBI'),
	(234, 'SQL Server'),
	(345, 'Python'),
	(345, 'Tableau'),
	(147, 'Python'),
	(147, 'PostgreSQL'),
	(147, 'Tableau'),
	(147, 'Java'),
	(168, 'Python'),
	(256, 'Tableau');
CREATE TABLE pages (
	page_id integer,
    page_name varchar(225)
);
INSERT INTO pages
VALUES
	(20001, 'SQL Solutions'),
	(20045, 'Brain Exercises'),
	(20701, 'Tips for Data Analysts'),
	(31111, 'Postgres Crash Course'),
	(32728, 'Break the thread');
CREATE TABLE page_likes (
	user_id integer,
    page_id integer,
    liked_date datetime
);
INSERT INTO page_likes
VALUES
	(111, 20001, STR_TO_DATE('04/08/2022 00:00:00','%m/%d/%Y %H:%i:%s')),
	(121, 20045, STR_TO_DATE('03/12/2022 00:00:00','%m/%d/%Y %H:%i:%s')),
	(156, 20001, STR_TO_DATE('07/25/2022 00:00:00','%m/%d/%Y %H:%i:%s')),
	(255, 20045, STR_TO_DATE('07/19/2022 00:00:00','%m/%d/%Y %H:%i:%s')),
	(125, 20001, STR_TO_DATE('07/19/2022 00:00:00','%m/%d/%Y %H:%i:%s')),
	(144, 31111, STR_TO_DATE('06/21/2022 00:00:00','%m/%d/%Y %H:%i:%s')),
	(125, 31111, STR_TO_DATE('07/04/2022 00:00:00','%m/%d/%Y %H:%i:%s'));
CREATE TABLE parts_assembly (
	part varchar(225),
    finish_date datetime,
    assembly_step integer
);
INSERT INTO parts_assembly
VALUES
	('battery', STR_TO_DATE('01/22/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 1),
	('battery', STR_TO_DATE('02/22/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 2),
	('battery', STR_TO_DATE('03/22/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 3),
	('bumper', STR_TO_DATE('01/22/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 1),
	('bumper', STR_TO_DATE('02/22/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 2),
	('bumper', NULL, 3),
	('bumper', NULL, 4),
	('door	', STR_TO_DATE('01/22/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 1),
	('door	', STR_TO_DATE('02/22/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 2),
	('engine', STR_TO_DATE('01/01/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 1),
	('engine', STR_TO_DATE('01/25/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 2),
	('engine', STR_TO_DATE('02/28/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 3),
	('engine', STR_TO_DATE('04/01/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 4),
	('engine', NULL, 5);
CREATE TABLE viewership (
	user_id integer,
    device_type varchar(225),
    view_time datetime
);
INSERT INTO viewership
VALUES
	(123, 'tablet',	STR_TO_DATE('01/02/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),					
	(125, 'laptop',	STR_TO_DATE('01/07/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),					
	(128, 'laptop',	STR_TO_DATE('02/09/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),					
	(129, 'phone', STR_TO_DATE('02/09/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),				
	(145, 'tablet',	STR_TO_DATE('02/24/2022 00:00:00', '%m/%d/%Y %H:%i:%s'));
CREATE TABLE posts (
	user_id integer,
    post_id integer,
    post_content varchar(225),
    post_date datetime
);
INSERT INTO posts
VALUES
	(151652, 111766, 'its always winter, but never Christmas.' , STR_TO_DATE('12/01/2021 11:00:00', '%m/%d/%Y %H:%i:%s')),	
	(661093, 442560, 'Bed. Class 8-12. Work 12-3. Gym 3-5 or 6. Then class 6-10. Another day thats gonna fly by. I miss my girlfriend' , STR_TO_DATE('09/08/2021 10:00:00', '%m/%d/%Y %H:%i:%s')),	
	(661093, 624356, 'Happy valentines!' , STR_TO_DATE('02/14/2021 00:00:00', '%m/%d/%Y %H:%i:%s')),	
	(151652, 599415, 'Need a hug' , STR_TO_DATE('01/28/2021 00:00:00', '%m/%d/%Y %H:%i:%s')),	
	(178425, 157336, 'Im so done with these restrictions - I want to travel!!!' , STR_TO_DATE('03/24/2021 11:00:00', '%m/%d/%Y %H:%i:%s')),	
	(423967, 784254, 'Just going to cry myself to sleep after watching Marley and Me.' , STR_TO_DATE('05/05/2021 00:00:00', '%m/%d/%Y %H:%i:%s')),	
	(151325, 613451, 'Happy new year all my friends!' , STR_TO_DATE('01/01/2022 11:00:00', '%m/%d/%Y %H:%i:%s')),	
	(151325, 987562, 'The global surface temperature for June 2022 was the sixth-highest in the 143-year record. This is definitely global warming happening.' , STR_TO_DATE('07/01/2022 10:00:00', '%m/%d/%Y %H:%i:%s')),	
	(661093, 674356, 'Cant wait to start my freshman year - super excited!' , STR_TO_DATE('08/18/2021 10:00:00', '%m/%d/%Y %H:%i:%s')),	
	(151325, 451464, 'Garage sale this Saturday 1 PM. All welcome to check out!' , STR_TO_DATE('10/25/2021 10:00:00', '%m/%d/%Y %H:%i:%s')),	
	(151652, 994156, 'Does anyone have an extra iPhone charger to sell?' , STR_TO_DATE('04/01/2021 10:00:00', '%m/%d/%Y %H:%i:%s'));
CREATE TABLE messages (
	message_id integer,
    sender_id integer,
    receiver_id integer,
    content varchar(225),
    sent_date datetime
);
INSERT INTO messages
VALUES
	(100, 2520, 6987, 'Send this out now!', STR_TO_DATE('08/16/2021 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(922, 3601, 4500, 'Get on the call', STR_TO_DATE('08/10/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(819, 2310, 4500, 'Whats the status on this?', STR_TO_DATE('07/10/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(743, 3601, 8752, 'Lets take this offline', STR_TO_DATE('06/14/2022 00:30:00', '%m/%d/%Y %H:%i:%s')),
	(902, 4500, 3601, 'Only if youre buying', STR_TO_DATE('08/03/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(901, 3601, 4500, 'You up?', STR_TO_DATE('08/03/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(966, 3601, 7852, 'Meet me in five!', STR_TO_DATE('08/17/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(942, 2520, 3561, 'How much do you know about Data Science?', STR_TO_DATE('08/17/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(888, 3601, 7855, 'DataLemur has awesome user base!', STR_TO_DATE('08/12/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(898, 2520, 9630, 'Are you ready for your upcoming presentation?', STR_TO_DATE('08/13/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(990, 2520, 8520, 'Maybe it was done by the automation process.', STR_TO_DATE('08/19/2022 00:00:00', '%m/%d/%Y %H:%i:%s'));
CREATE TABLE trades (
	order_id integer,
    user_id integer,
    quantity integer,
    status varchar(225),
    timestamp datetime,
    price decimal(5,2)
);
INSERT INTO trades
VALUES
	(100101, 111, 10, 'Cancelled', STR_TO_DATE('08/17/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 9.80),
	(100102, 111, 10, 'Completed', STR_TO_DATE('08/17/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 10.00),
	(100264, 148, 40, 'Completed', STR_TO_DATE('08/26/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 4.80),
	(100305, 300, 15, 'Completed', STR_TO_DATE('09/05/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 10.00),
	(100909, 488, 1, 'Completed', STR_TO_DATE('07/05/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 6.50),
	(100259, 148, 35, 'Completed', STR_TO_DATE('08/25/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 5.10),
	(100900, 148, 50, 'Completed', STR_TO_DATE('07/14/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 9.78),
	(101432, 265, 10, 'Completed', STR_TO_DATE('08/16/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 13.00),
	(102533, 488, 25, 'Cancelled', STR_TO_DATE('11/10/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 22.40),
	(100565, 265, 2, 'Completed', STR_TO_DATE('09/27/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 8.70),
	(100400, 178, 32, 'Completed', STR_TO_DATE('09/17/2022 12:00:00', '%m/%d/%Y %H:%i:%s'), 12.00),
	(100777, 178, 60, 'Completed', STR_TO_DATE('07/25/2022 17:47:00', '%m/%d/%Y %H:%i:%s'), 3.56);
CREATE TABLE users (
	user_id integer,
    city varchar(225),
    email varchar(225),
    signup_date datetime
);
INSERT INTO users
VALUES
	(111, 'San Francisco', 'rrok10@gmail.com', STR_TO_DATE('08/03/2021 12:00:00', '%m/%d/%Y %H:%i:%s')),
	(148, 'Boston', 'sailor9820@gmail.com', STR_TO_DATE('08/20/2021 12:00:00', '%m/%d/%Y %H:%i:%s')),
	(178, 'San Francisco', 'harrypotterfan182@gmail.com', STR_TO_DATE('01/05/2022 12:00:00', '%m/%d/%Y %H:%i:%s')),
	(265, 'Denver', 'shadower_@hotmail.com', STR_TO_DATE('02/26/2022 12:00:00', '%m/%d/%Y %H:%i:%s')),
	(300, 'San Francisco', 'houstoncowboy1122@hotmail.com', STR_TO_DATE('06/30/2022 12:00:00', '%m/%d/%Y %H:%i:%s')),
	(488, 'New York', 'empire_state78@outlook.com', STR_TO_DATE('07/03/2022 12:00:00', '%m/%d/%Y %H:%i:%s'));
CREATE TABLE reviews (
	review_id integer,
    user_id integer,
    submit_date datetime,
    product_id integer,
    stars integer
);
INSERT INTO reviews
VALUES
	(6171, 123, STR_TO_DATE('06/08/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 50001, 4),
	(7802, 265, STR_TO_DATE('06/10/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 69852, 4),
	(5293, 362, STR_TO_DATE('06/18/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 50001, 3),
	(6352, 192, STR_TO_DATE('07/26/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 69852, 3),
	(4517, 981, STR_TO_DATE('07/05/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 69852, 2),
	(2501, 142, STR_TO_DATE('06/21/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 12580, 5),
	(4582, 562, STR_TO_DATE('06/15/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 12580, 4),
	(2536, 136, STR_TO_DATE('07/04/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 11223, 5),
	(1200, 100, STR_TO_DATE('05/17/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 25255, 4),
	(2555, 232, STR_TO_DATE('05/31/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 25600, 4),
	(2556, 167, STR_TO_DATE('05/31/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 25600, 5),
	(1301, 120, STR_TO_DATE('05/18/2022 00:00:00', '%m/%d/%Y %H:%i:%s'), 25600, 4);
CREATE TABLE events (
	app_id integer,
    event_type varchar(225),
    timestamp datetime
);
INSERT INTO events
VALUES
	(123, 'impression', STR_TO_DATE('07/18/2022 11:36:12', '%m/%d/%Y %H:%i:%s')),	
	(123, 'impression', STR_TO_DATE('07/18/2022 11:37:12', '%m/%d/%Y %H:%i:%s')),	
	(123, 'click', STR_TO_DATE('07/18/2022 11:37:42', '%m/%d/%Y %H:%i:%s')),	
	(234, 'impression', STR_TO_DATE('08/18/2022 14:15:12', '%m/%d/%Y %H:%i:%s')),	
	(234, 'click', STR_TO_DATE('08/18/2022 14:16:12', '%m/%d/%Y %H:%i:%s')),	
	(123, 'impression', STR_TO_DATE('10/23/2021 12:11:56', '%m/%d/%Y %H:%i:%s')),	
	(123, 'click', STR_TO_DATE('10/23/2021 12:22:12', '%m/%d/%Y %H:%i:%s')),	
	(123, 'impression', STR_TO_DATE('04/06/2022 13:13:13', '%m/%d/%Y %H:%i:%s')),	
	(123, 'click', STR_TO_DATE('04/07/2022 12:20:30', '%m/%d/%Y %H:%i:%s')),	
	(234, 'impression', STR_TO_DATE('02/09/2022 10:05:02', '%m/%d/%Y %H:%i:%s')),	
	(234, 'impression', STR_TO_DATE('05/20/2022 12:00:00', '%m/%d/%Y %H:%i:%s'));
CREATE TABLE emails (
	email_id integer,
    user_id integer,
    signup_date datetime
);
INSERT INTO emails
VALUES
	(125, 7771, STR_TO_DATE('06/14/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(236, 6950, STR_TO_DATE('07/01/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(433, 1052, STR_TO_DATE('07/09/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(450, 8963, STR_TO_DATE('08/02/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(555, 8963, STR_TO_DATE('08/09/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(741, 1235, STR_TO_DATE('07/25/2022 00:00:00', '%m/%d/%Y %H:%i:%s'));
CREATE TABLE texts (
	text_id integer,
    email_id integer,
    signup_action varchar(225),
    action_date datetime
);
INSERT INTO texts
VALUES
	(6878, 125, 'Confirmed', STR_TO_DATE('06/14/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(6997, 433, 'Not confirmed', STR_TO_DATE('07/09/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(7000, 433, 'Confirmed', STR_TO_DATE('07/10/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(9841, 236, 'Confirmed', STR_TO_DATE('07/01/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(2800, 555, 'Confirmed', STR_TO_DATE('08/11/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(1568, 741, 'Confirmed', STR_TO_DATE('07/26/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(1255, 555, 'Not confirmed', STR_TO_DATE('08/09/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(1522, 741, 'Not confirmed', STR_TO_DATE('07/25/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(6800, 450, 'Not confirmed', STR_TO_DATE('08/02/2022 00:00:00', '%m/%d/%Y %H:%i:%s')),
	(2660, 555, 'Not confirmed', STR_TO_DATE('08/09/2022 00:00:00', '%m/%d/%Y %H:%i:%s'));
CREATE TABLE monthly_cards_issued (
	card_name varchar(225),
    issued_amount integer,
    issue_month integer,
    issue_year integer    
);
INSERT INTO monthly_cards_issued
VALUES
	('Chase Sapphire Reserve', 160000, 12, 2020),
	('Chase Sapphire Reserve', 170000, 1, 2021),
	('Chase Sapphire Reserve', 175000, 2, 2021),
	('Chase Sapphire Reserve', 180000, 3, 2021),
	('Chase Freedom Flex', 55000, 1, 2021),
	('Chase Freedom Flex', 60000, 2, 2021),
	('Chase Freedom Flex', 65000, 3, 2021),
	('Chase Freedom Flex', 70000, 4, 2021),
	('Chase Sapphire Reserve', 150000, 11, 2020);
CREATE TABLE items_per_order (
	order_occurrences integer,
    item_count integer
);
INSERT INTO items_per_order
VALUES
	(500, 1),
	(1000, 2),
	(800, 3),
	(1000, 4),
	(500, 5),
	(550, 6),
	(400, 7),
	(200, 8),
	(10, 9);
CREATE TABLE pharmacy_sales (
	product_id integer,
    units_sold integer,
    total_sales decimal(15,2),
    cogs decimal(9,2),
    manufacturer varchar(225),
    drug varchar(225)
);
INSERT INTO pharmacy_sales
VALUES
	(156, 89514, 3130097.00, 3427421.73, 'Biogen', 'Acyclovir'),
	(25, 222331, 2753546.00, 2974975.36, 'AbbVie', 'Lamivudine and Zidovudine'),
	(50, 90484, 2521023.73, 2742445.90, 'Eli Lilly', 'Dermasorb TA Complete Kit'),
	(41, 189925, 3499574.92, 3692136.66, 'AbbVie', 'Clarithromycin'),
	(63, 93513, 2104765.00, 2462370.76, 'Johnson & Johnson', 'Pepcid AC Acid Reducer'),
	(8, 177270, 2930134.52, 3035522.06, 'Johnson & Johnson', 'Nicorobin Clean and Clear'),
	(75, 164674, 1184664.57, 1285326.93, 'Eli Lilly', 'RED GINSENG FERMENTED ESSENCE BB'),
	(91, 97765, 1115255.32, 1201044.27, 'Roche', 'Hydrochlorothiazide'),
	(26, 126866, 1499768.09, 1573992.41, 'Eli Lilly', 'LBel'),
	(16, 51707, 1304837.86, 1378790.53, 'Roche', 'Topcare Tussin'),
	(80, 61467, 3740527.69, 3804542.20, 'Biogen', 'Losartan Potassium'),
	(148, 104637, 837620.18, 931084.25, 'Johnson & Johnson', 'Motrin'),
	(95, 128494, 723841.23, 779520.88, 'Biogen', 'Wal-Zan'),
	(56, 86598, 1755300.92, 1806344.97, 'Eli Lilly', 'Spot Repairing Serum'),
	(71, 126265, 2564743.39, 2593528.67, 'Bayer', 'ENALAPRIL MALEATE'),
	(35, 87449, 86938.27, 99811.26, 'Johnson & Johnson', 'Sanitary Wipes Plus'),
	(70, 167190, 1119479.36, 1313174.69, 'Johnson & Johnson', 'Zyrtec Ultra-Strength'),
	(15, 118901, 2717420.96, 2707620.02, 'Biogen', 'Clotrimazole'),
	(33, 149895, 949514.05, 921206.75, 'Bayer', 'Levofloxacin'),
	(179, 125006, 1825970.00, 1769907.97, 'Biogen', 'Lancome Paris Renergie Lift Volumetry'),
	(21, 50550, 697276.33, 640063.57, 'Pfizer', 'Venlafaxine Hydrochloride'),
	(125, 101102, 566696.00, 508144.71, 'AbbVie', 'Lidocaine Hydrochloride and Epinephri'),
	(76, 87699, 3257976.38, 3389863.82, 'Johnson & Johnson', 'EltaMD SPF 150 Sun Screen'),
	(136, 144814, 1084258.00, 1006447.73, 'Biogen', 'Burkhart'),
	(34, 94698, 600997.19, 521182.16, 'AstraZeneca', 'Surmontil'),
	(61, 77023, 500101.61, 419174.97, 'Biogen', 'Varicose Relief'),
	(9, 37410, 293452.54, 208876.01, 'Eli Lilly', 'Zyprexa'),
	(67, 87756, 1112253.82, 1021908.39, 'Biogen', 'Pramipexole Dihydrochloride'),
	(105, 97736, 537795.00, 426539.59, 'Pfizer', 'Diaper Rash Skin Protectant Crema Cer'),
	(107, 160617, 2538701.50, 2414037.51, 'Biogen', 'N - TIME SINUS'),
	(89, 61832, 1084996.13, 940593.68, 'Sanofi', 'Locoid'),
	(30, 142661, 1615518.35, 1439533.27, 'Sanofi', 'Oxaprozin'),
	(47, 130448, 461623.76, 282038.76, 'Eli Lilly', 'Night Time Cherry Syrup'),
	(146, 71159, 1778024.00, 1598276.66, 'AstraZeneca', 'PDI Sani-Hands for Kids'),
	(52, 47310, 1151498.60, 956693.99, 'AstraZeneca', 'Armour Thyroid'),
	(183, 155058, 1220029.58, 1023275.76, 'AbbVie', 'Lexapro'),
	(113, 122655, 1358711.57, 1161623.36, 'Novartis', 'Famotidine'),
	(29, 217652, 3106931.54, 2898165.87, 'AstraZeneca', 'MiraLAX'),
	(171, 177686, 632705.44, 413382.39, 'AstraZeneca', 'lansoprazole'),
	(2, 284705, 523311.90, 302721.56, 'Novartis', 'Imatinib'),
	(126, 165665, 586961.45, 365016.10, 'AbbVie', 'Hamamelis Virginiana Kit Refill'),
	(122, 187110, 681903.65, 458208.23, 'GlaxoSmithKline', 'eszopiclone'),
	(144, 110672, 841911.12, 616632.58, 'Bayer', 'Acyclovir Sodium'),
	(14, 55657, 933692.06, 707891.52	, 'Bayer', 'Triple Complex Brain Tonic'),
	(97, 128893, 1114438.97, 887895.38, 'AbbVie', 'Sodium Iodide I 123'),
	(111, 152231, 2708053.52, 2467067.02, 'Eli Lilly', 'Divalproex Sodium'),
	(31, 94969, 1104640.13, 848011.39, 'Biogen', 'Orsythia'),
	(51, 95572, 2582349.00, 2322161.57, 'Pfizer', 'Methadone Hydrochloride'),
	(181, 104441, 1045454.54, 772824.85	, 'Merck', 'FLU KIDS RELIEF'),
	(135, 160565, 2524229.00, 2249571.00, 'Bayer', 'Meloxicam'),
	(22, 143516, 3147031.19, 2864248.62, 'Sanofi', 'Synthroid'),
	(37, 232228, 507628.50, 212607.07, 'Johnson & Johnson', 'Hand wash'),
	(154, 96249, 1408872.02, 1105672.68, 'Eli Lilly', 'Potassium Chloride in Dextrose and So'),
	(59, 215282, 3059122.36, 2755697.86, 'Johnson & Johnson', 'Common Sagebrush'),
	(81, 117947, 1559816.00, 1233306.52, 'Merck', 'DHEA'),
	(3, 192608, 2851411.66, 2522812.85, 'Eli Lilly', 'Treflan'),
	(53, 121093, 1460189.98, 1124982.66, 'Biogen', 'Active-Medicated specimen collection'),
	(160, 97520, 1415772.18, 1067854.28, 'AbbVie', 'Olay Total Effects Pore Minimizing CC'),
	(46, 189293, 1528747.03, 1172798.04, 'Pfizer', 'Stay Awake'),
	(85, 112969, 2996318.23, 2614556.03, 'Bayer', 'Lovastatin'),
	(143, 180697, 1364046.09, 961852.31, 'Eli Lilly', 'Western Family Pain Relieving'),
	(83, 106994, 1803199.39, 1397575.13, 'Eli Lilly', 'IOPE RETIGEN MOISTURE FOUNDATION'),
	(165, 121043, 961716.20, 553770.53, 'Bayer', 'PROMETHAZINE HYDROCHLORIDE'),
	(42, 116447, 2429913.00, 2002106.22, 'Biogen', 'Gelato Topical Anesthetic'),
	(157, 197527, 2204939.12, 1749148.23, 'Biogen', 'Non Aspirin PM'),
	(11, 135549, 2792775.10, 2327541.25, 'Biogen', 'AVAPRO'),
	(49, 95307, 700562.13, 221803.73, 'Biogen', 'Brucella Remedy'),
	(115, 102792, 821214.25, 321027.88, 'Pfizer', 'Methylphenidate Hydrochloride'),
	(18, 58580, 1342015.48, 838168.71, 'AstraZeneca', 'Enalapril Maleate'),
	(119, 214488, 657085.12, 152614.97, 'Johnson & ohnon', 'Hand Sanitizer with Moisturizers'),
	(137, 128175, 822716.26, 316753.86, 'AbbVie', 'Warfarin Sodium'),
	(169, 95653, 1270441.66, 757724.19, 'Eli Lilly', 'Multi Symptom Cold'),
	(164, 89816, 1080726.88, 565920.33, 'Biogen', 'RED ORANGE SUN'),
	(117, 191289, 778332.70, 256621.14, 'Bayer', 'Diphenhydramine HCL'),
	(106, 103889, 1698544.77, 1164637.24, 'Roche', 'Crab'),
	(120, 148170, 1094440.19, 560320.28, 'Bayer', 'Gabapentin'),
	(10, 123832, 1518343.00, 981993.64, 'Novartis', 'Amoxicillin and Clavulanate Potassium'),
	(6, 64028, 1253627.93, 715430.59, 'Bayer', 'Riociguat'),
	(68, 109814, 1933300.64, 1392442.04, 'Merck', 'Losartan Potassium'),
	(186, 150221, 3116140.22, 2560951.38, 'Novartis', 'ANASTROZOLE'),
	(139, 38522, 674397.16, 92756.59, 'Merck', 'METHOCARBAMOL'),
	(100, 212506, 3091720.63, 2509926.79, 'Pfizer', 'Ropinirole Hydrochloride'),
	(84, 174098, 2752163.00, 2146503.01, 'Pfizer', 'Tranexamic Acid'),
	(45, 144352, 708891.28, 95912.97, 'Roche', 'Dorzolamide HCl'),
	(112, 92168, 1194250.01, 575583.41, 'Novartis', 'Alimta'),
	(167, 186778, 904145.00, 240493.13, 'Biogen', 'Monistat Complete Care Instant Itch R'),
	(28, 113370, 1379945.10, 712265.84, 'AstraZeneca', 'Thyroid Assist'),
	(188, 123956, 1658835.03, 991099.63, 'Roche', 'Nivolumab'),
	(94, 132362, 2041758.41, 1373721.70, 'Biogen', 'UP and UP'),
	(98, 110746, 813188.82, 140422.87, 'Biogen', 'Medi-Chord'),
	(65, 151901, 967632.61, 278350.32, 'AbbVie', 'Moxifloxacin Hydrochloride'),
	(124, 59167, 1033654.77, 344270.00, 'Bayer', 'MooreBrand Ibuprofen'),
	(23, 72264, 1892705.42, 1202177.41, 'Roche', 'Cloves'),
	(149, 171975, 1727624.67, 1024897.45, 'Johnson & Johnson', 'SunZone Work Sunscreen SPF-60'),
	(64, 69702, 1425027.99, 710573.44, 'AbbVie', 'Allopurinol'),
	(118, 131788, 1336647.60, 595485.21, 'AbbVie', 'Chlorzoxazone'),
	(123, 125721, 1796908.48, 1041602.54, 'Novartis', 'Diltiazem Hydrochloride'),
	(88, 175710, 1443369.73, 670011.51, 'Bayer', 'Oxygen'),
	(24, 289121, 937901.50, 163610.19, 'AstraZeneca', 'BANANA BOAT SUNSCREEN'),
	(60, 260823, 2341257.97, 1553229.42, 'Eli Lilly', 'Metoclopramide'),
	(172, 78481, 985931.00, 192743.12, 'Bayer', 'Xarelto'),
	(161, 175833, 1201626.71, 407210.29, 'AbbVie', 'Citalopram'),
	(184, 40007, 875514.67, 64948.76, 'Biogen', 'Imraldi'),
	(127, 139627, 2912543.88, 2095983.81, 'AstraZeneca', 'Pravastatin Sodium'),
	(20, 201740, 2937100.00, 2117864.70, 'Eli Lilly', 'Levothyroxine Sodium'),
	(180, 88653, 2115658.00, 1278017.17, 'Pfizer', 'Ciprofloxacin'),
	(69, 72195, 1862729.02, 1021659.26, 'Biogen', 'Prednisone'),
	(72, 159597, 1752274.54, 907074.49, 'Johnson & Johnson', 'Flu-Cold'),
	(1, 166050, 1857681.77, 999626.88, 'Eli Lilly', 'Keflex'),
	(48, 157217, 2878612.16, 2020543.63	, 'Sanofi', 'Persantine'),
	(27, 153025, 1793428.19, 908662.72, 'Eli Lilly', 'Cefaclor'),
	(99, 104368, 1146201.60, 250683.09, 'AbbVie', 'Hydralazine Hydrochloride'),
	(43, 176445, 1355861.10, 412421.37, 'Bayer', 'Citalopram Hydrobromide'),
	(176, 71329, 2529937.41, 1584233.81, 'Biogen', 'RHIZOPUS ARRHIZUS VAR ARRHIZUS'),
	(40, 136973, 2723073.91, 1765245.63, 'Pfizer', 'Selegiline Hydrochloride'),
	(131, 48864, 1540350.32, 569738.58, 'Biogen', 'ESIKA'),
	(116, 76115, 2510105.00, 1505831.15, 'Biogen', 'Namenda'),
	(93, 175376, 2218026.75, 1206180.64, 'Biogen', 'ProBLEN Estrogen and Progesterone'),
	(170, 107101, 1958490.97, 914881.77, 'AstraZeneca', 'Double Antibiotic'),
	(54, 68593, 1545347.97, 482212.61, 'Eli Lilly', 'Diclofenac Sodium'),
	(44, 131514, 3080474.64, 2014858.59, 'Biogen', 'Alprazolam'),
	(17, 121564, 1466145.44, 387524.97, 'AstraZeneca', 'SPRYCEL'),
	(86, 147885, 1808978.69, 720231.01, 'Pfizer', 'Divalproex Sodium Extended-Release'),
	(178, 109829, 2786292.44, 1693474.52, 'Roche', 'Motion Sickness II'),
	(87, 110248, 1485507.76, 352858.53, 'AbbVie', 'Night-Time Original'),
	(104, 182090, 3217507.49, 2069390.45, 'AbbVie', 'Stavudine'),
	(109, 118696, 1433109.50, 263857.96, 'Eli Lilly', 'Tizanidine Hydrochloride'),
	(150, 201167, 2468436.00, 1298844.51, 'Biogen', 'Nefazodone Hydrochloride'),
	(155, 167357, 2257132.08, 1072766.97, 'AstraZeneca', 'Zavesca'),
	(128, 103246, 2700252.00, 1511930.53, 'Biogen', 'QUETIAPINE FUMARATE'),
	(96, 102627, 1879590.38, 669228.79, 'AstraZeneca', 'Listerine Ultraclean Antiseptic'),
	(141, 113510, 2748508.00, 1519635.54, 'Eli Lilly', 'Kentucky Bluegrass (June), Standardiz'),
	(57	, 139567, 2928590.94, 1698018.23, 'AbbVie', 'Valproic Acid'),
	(140, 210120, 2944223.22, 1649161.98, 'Roche', 'Lucentis'),
	(66, 134990, 1734572.00, 436399.12, 'Novartis', 'Antiseptic Hand Gel'),
	(77, 66608, 1406533.69, 107902.51, 'Johnson & Johnson', 'Budpak Petroleum Jelly'),
	(185, 137096, 2582356.00, 1281909.78, 'Pfizer', 'clobetasol propionate'),
	(138, 154713, 1743859.96, 398395.47, 'Eli Lilly', 'Treatment Set TS34711'),
	(142, 122444, 1428293.39, 82371.13, 'Roche', 'Herceptin'),
	(134, 37293, 3485649.76, 2128714.17, 'Eli Lilly', 'Eldepryl'),
	(159, 109063, 1780520.27, 423335.39, 'Eli Lilly', 'Levetiracetam'),
	(102, 71484, 1442991.59, 82418.43, 'AstraZeneca', 'Naproxen Sodium'),
	(5, 231084, 1825783.98, 453989.65, 'Biogen', 'DIPHENHYDRAMINE HYDROCHLORIDE'),
	(78, 107503, 2108286.00, 694560.97, 'Eli Lilly', 'Rimmel London'),
	(90, 129019, 2543749.63, 1096231.45, 'Biogen', 'KADCYLA	'),
	(38, 85086, 3358913.43, 1898929.25, 'Eli Lilly', 'STEMPHYLIUM SOLANI'),
	(187, 144880, 2604075.00, 1130014.83, 'Eli Lilly', 'DIVALPROEX SODIUM'),
	(151, 204188, 3208125.00, 1731552.31, 'Johnson & Johnson', 'Niacin'),
	(168, 118682, 2292546.89, 789582.98, 'Biogen', 'Lamotrigine'),
	(147, 164693, 3023426.00, 1485390.52, 'Biogen', 'Nortriptyline Hydrochloride'),
	(174, 99442, 3303186.78, 1754344.77, 'Eli Lilly', 'Clobetasol Propionate'),
	(13, 216001, 2807831.05, 1242490.08, 'Johnson & Johnson', 'Gold Bond Ultimate Healing Concentrate'),
	(152, 75583, 3379737.80, 1774390.90, 'GlaxoSmithKline', 'Isoniazid'),
	(133, 81228, 2016118.04, 375550.19, 'Eli Lilly', 'Methylphenidate Hydrochloride'),
	(7, 224342, 2313335.25, 588699.33, 'Johnson & Johnson', 'Ibuprofen'),
	(110, 155316, 1893117.08, 134244.15, 'Johnson & Johnson', 'Remicade'),
	(153, 178254, 1995651.94, 123085.04, 'Biogen', 'Haloperidol'),
	(12, 164685, 2938804.92, 1065324.19, 'AstraZeneca', 'SKIN FOUNDATION MINERAL MAKEUP'),
	(79, 140129, 3560527.35, 1582876.55, 'AstraZeneca', 'Green Guard Stomach Relief'),
	(166, 62913, 4701990.22, 2705112.11, 'Bayer', 'Amitriptyline Hydrochloride'),
	(129, 116649	, 2933877.00	, 934986.87, 'Biogen', 'Cuvposa'),
	(36, 128104, 2896459.68, 862377.49, 'Eli Lilly', 'Pfizerpen'),
	(162, 130946, 3189843.38, 1058358.52, 'Eli Lilly', 'Morphine Sulfate'),
	(132, 92089, 2443119.04, 225171.93, 'Eli Lilly', 'OLUX-E'),
	(62, 140625, 3417877.93, 1177021.82, 'Pfizer', 'MUCOR PLUMBEUS'),
	(173, 147808, 2738142.96, 493523.99, 'AstraZeneca', 'Furosemide'),
	(73, 117857, 2517600.95, 195721.74, 'Biogen', 'Fumaderm'),
	(163, 165666, 2843262.48, 509536.85, 'Pfizer', 'TAMSULOSIN HYDROCHLORIDE'),
	(103, 102027, 3025655.00, 675055.50, 'Eli Lilly', 'Androgel'),
	(108, 136804, 3401782.44, 992181.28, 'Bayer', 'Sheep Sorrel Pollen'),
	(114, 86112, 2825302.00, 412654.26, 'Bayer', 'Claritin'),
	(55, 161870, 2835232.18, 384241.13, 'Johnson & Johnson', 'Childrens Ibuprofen'),
	(130, 150704, 3556698.88, 1083810.04, 'Johnson & Johnson', 'Medi-First Cold Relief'),
	(92, 109858, 3283823.00, 679925.49, 'Eli Lilly', 'Naratriptan'),
	(19, 128656, 3179533.50, 410405.24, 'Bayer', 'Ibuprofen PM'),
	(82, 128037, 2969088.25, 186886.44, 'Eli Lilly', 'Ciprofloxacin'),
	(4, 206134, 3786377.00, 796869.55, 'Sanofi', 'Lovenox'),
	(121, 140287, 3329242.48, 261606.11, 'AbbVie', 'Glipizide'),
	(39, 244224, 3581454.82, 417476.74, 'Johnson & Johnson', 'JUNIPERUS ASHEI POLLEN'),
	(32, 124071, 3765829.00, 156664.74, 'Johnson & Johnson', 'XtraCare Foaming Facial Cleanser'),
	(158, 79869	, 7925929.18, 3825914.37, 'Merck', 'Divalproex sodium'),
	(192, 498342, 9654492.33, 3189863.82, 'Eli Lilly', 'Cialis'),
	(177, 123213, 14759462.01, 7083504.56, 'Novartis', 'Xanax'),
	(191, 274342, 12654492.33, 1437439.99, 'Sanofi', 'Dupixent'),
	(190, 240704, 13759462.01, 2137439.99, 'Merck', 'Keytruda'),
	(189, 99858, 84759462.01, 3243809.46, 'AbbVie', 'Humira');

/*
Given the CANDIDATES table, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

Assumption: There are no duplicates in the candidates table.
*/

SELECT
  candidate_id
FROM candidates
WHERE
  skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING count(candidate_id) = 3;

/*
Assume you are given the PAGES and PAGE_LIKES table. Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.
*/

SELECT p.page_id
FROM pages as p
LEFT JOIN page_likes as pl
  ON p.page_id = pl.page_id
WHERE liked_date IS NULL
ORDER BY p.page_id ASC;

/*
Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data. Given the PARTS_ASSEMBLY table, write a query that determines which parts have begun the assembly process but are not yet finished.

Assumption 1: Table parts_assembly contains all parts in production.
Assumption 2: A part with no finish_date is an unfinished part.
*/

SELECT part
FROM parts_assembly
WHERE finish_date IS NULL
GROUP BY part;

/*
Assume that you are given the VIEWERSHIP table. Define “mobile” as the sum of tablet and phone viewership numbers. Write a query to compare the viewership on laptops versus mobile devices.

Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".
*/

SELECT
  count(device_type) as laptop_view,
  (SELECT
    count(device_type) as mobile_view
    FROM viewership
    WHERE device_type != 'laptop'
  ) as mobile_view
FROM viewership
WHERE device_type = 'laptop';

/*
Given the POSTS table, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021.

Output the user and number of the days between each user's first and last post.
*/

SELECT 
	user_id,
    DATEDIFF(MAX(DATE(post_date)), MIN(DATE(post_date))) AS days_between
FROM posts
WHERE YEAR(post_date) = 2021 
GROUP BY user_id
HAVING COUNT(post_id) > 1;

/*
Using the MESSAGES table, write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent.

Output the results in descending count of the messages.

Assumption: No two users has sent the same number of messages in August 2022.
*/

SELECT
	sender_id,
    count(message_id) as message_count
FROM messages
WHERE MONTH(sent_date) = 08 AND YEAR(sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;

/*
Given the TRADES and USERS tables, write a query to list the top three cities that have the most completed trade orders in descending order.

Output the city and number of orders.
*/

SELECT
	u.city as city,
    count(t.order_id) as total_orders
FROM users as u
LEFT JOIN trades as t
	ON u.user_id = t.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;

/*
Given the REVIEWS table, write a query to get the average stars for each product every month.

The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. Sort the output based on month followed by the product id.
*/

SELECT
	MONTH(submit_date) as mth,
    product_id as product,
    ROUND(avg(stars), 2) as avg_stars
FROM reviews
GROUP BY
	mth,
    product
ORDER BY
	mth,
    product;

/*
Given the EVENTS table, write a query to get the app’s click-through rate (CTR %) in 2022. Output the results in percentages rounded to 2 decimal places.

Notes:
--Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
--To avoid integer division, you should multiply the click-through rate by 100.0, not 100.
*/

SELECT
	app_id,
    ROUND(100.0*sum(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) / 
		sum(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2) as CTR
FROM events
WHERE YEAR(timestamp) = 2022
GROUP BY app_id;

/*
New TikTok users sign up with their emails and each user receives a text confirmation to activate their account.

Given the EMAILS and TEXTS tables, write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.

Assumption: action_date is the date when the user activated their account and confirmed their sign-up through the text.
*/

SELECT e.user_id
FROM emails as e
JOIN texts as t
	ON e.email_id = t.email_id
WHERE t.action_date = DATE_ADD(e.signup_date, INTERVAL 1 DAY) AND t.signup_action = 'Confirmed';

/*
Your team at JPMorgan Chase is soon launching a new credit card, and to gain some context, you are analyzing how many credit cards were issued each month. You are given the MONTHLY_CARDS_ISSUED table.

Write a query that outputs the name of each credit card and the difference in issued amount between the month with the most cards issued, and the least cards issued. Order the results according to the biggest difference.
*/

SELECT
	card_name,
	max(issued_amount) - min(issued_amount) as difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;

/*
You are trying to find the mean number of items bought per order on Alibaba, rounded to 1 decimal place.

However, instead of doing analytics on all Alibaba orders, you have access to ITEMS_PER_ORDER table, which describes how many items were in an order (item_count), and the number of orders that had that many items (order_occurrences).
*/

SELECT
	ROUND(sum(order_occurrences * item_count) / sum(order_occurrences), 1) as mean
FROM items_per_order;


### THE FOLLOWING QUESTIONS ARE USING THE PHARMACY_SALES TABLE ###

/*
CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

Write a query to find the top 3 most profitable drugs sold, and how much profit they made. Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.
*/

SELECT
  drug,
  (total_sales - cogs) as total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;

/*
Write a query to find out which manufacturer is associated with the drugs that were not profitable and how much money CVS lost on these drugs. 

Output the manufacturer, number of drugs and total losses. Total losses should be in absolute value. Display the results with the highest losses on top.
*/

SELECT
  manufacturer,
  count(drug) as drug_count,
  ABS(sum(total_sales - cogs)) as total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
GROUP BY manufacturer
ORDER BY total_loss DESC;

/*
Write a query to find the total sales of drugs for each manufacturer. Round your answer to the closest million, and report your results in descending order of total sales.

Because this data is being directly fed into a dashboard which is being seen by business stakeholders, format your result like this: "$36 million".
*/

SELECT
  manufacturer,
  concat('$', round(sum(total_sales)/1000000), ' million') as sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sum(total_sales) DESC;