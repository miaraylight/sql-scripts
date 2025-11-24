-- SQL Murder Mystery
-- Can you find out whodunnit?
USE game;

SELECT * 
FROM crime_scene_report 
WHERE date = 20180115 AND type='murder' AND city = 'SQL City';

-- Security footage shows that there were 2 witnesses. 
-- The first witness lives at the last house on "Northwestern Dr". 
-- The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT *
FROM person
WHERE name LIKE('%Annabel%');

-- 16371ﾠAnnabel Millerﾠ490173ﾠ103ﾠFranklin Aveﾠ318771143

SELECT *
FROM person
WHERE address_street_name = "Northwestern Dr" AND address_number = (
																	SELECT MAX(address_number)
																	FROM person
																	WHERE address_street_name = "Northwestern Dr");

-- 14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949

SELECT * 
FROM interview
WHERE person_id = 16371 OR person_id = 14887;

-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
-- The membership number on the bag started with "48Z". Only gold members have those bags.
-- The man got into a car with a plate that included "H42W".

-- I saw the murder happen, and I recognized the killer from my gym when 
-- I was working out last week on January the 9th.

SELECT * 
FROM get_fit_now_member 
JOIN get_fit_now_check_in ON get_fit_now_member.id = get_fit_now_check_in.membership_id
WHERE id LIKE('48Z%') AND check_in_date = 20180109;

-- 48Z7A	28819	Joe Germuska	20160305	gold	48Z7A	20180109	1600	1730
-- 48Z55	67318	Jeremy Bowers	20160101	gold	48Z55	20180109	1530	1700

SELECT * 
FROM person
WHERE id = 28819 OR id = 67318;

-- id	name	license_id	address_number	address_street_name	ssn
-- 28819	Joe Germuska	173289	111	Fisk Rd	138909730
-- 67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279

SELECT * 
FROM drivers_license
WHERE id = 173289 OR id = 423327 AND plate_number LIKE('%H42W%');

-- id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
-- 423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS

SELECT * 
FROM interview
WHERE person_id = 67318;

-- I was hired by a woman with a lot of money. 
-- I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. 
-- I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT * 
FROM drivers_license
JOIN person ON drivers_license.id = person.license_id
JOIN income ON person.ssn = income.ssn
WHERE height BETWEEN 65 AND 67 AND car_make = 'Tesla';

-- id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model	id	name	license_id	address_number	address_street_name	ssn	ssn	annual_income
-- 918773	48	65	black	red	female	917UU3	Tesla	Model S	78881	Red Korb	918773	107	Camerata Dr	961388910	961388910	278000
-- 202298	68	66	green	red	female	500123	Tesla	Model S	99716	Miranda Priestly	202298	1883	Golden Ave	987756388	987756388	310000

SELECT *
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert' AND 
date BETWEEN 20171201 AND 20171231 AND 
person_id = 99716;

-- Miranda Priestly

-- Congrats, you found the brains behind the murder! 
-- Everyone in SQL City hails you as the greatest SQL detective of all time. 
-- Time to break out the champagne!