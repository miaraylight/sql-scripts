SQL Murder Mystery
Can you find out whodunnit?

select * 
from crime_scene_report 
where date = 20180115 and type='murder' and city = 'SQL City'

--Security footage shows that there were 2 witnesses. 
--The first witness lives at the last house on "Northwestern Dr". 
--The second witness, named Annabel, lives somewhere on "Franklin Ave".

--select *
--from person
--where name like('%Annabel%') or address_street_name = 'Nothwestern Dr'

--16371ﾠAnnabel Millerﾠ490173ﾠ103ﾠFranklin Aveﾠ318771143

--select *
--from person
--where address_street_name = "Northwestern Dr" and address_number = (
--select max(address_number)
--from person
--where address_street_name = "Northwestern Dr")

-- 14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949

--select * 
--from interview
--where person_id = 16371 or person_id = 14887

--I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
--The membership number on the bag started with "48Z". Only gold members have those bags.
--The man got into a car with a plate that included "H42W".

--I saw the murder happen, and I recognized the killer from my gym when 
--I was working out last week on January the 9th.

--select * from get_fit_now_member 
--join get_fit_now_check_in on get_fit_now_member.id = get_fit_now_check_in.membership_id
--where id like('48Z%') and check_in_date = 20180109

--48Z7A	28819	Joe Germuska	20160305	gold	48Z7A	20180109	1600	1730
--48Z55	67318	Jeremy Bowers	20160101	gold	48Z55	20180109	1530	1700

--select * from person
--where id = 28819 or id = 67318

--id	name	license_id	address_number	address_street_name	ssn
--28819	Joe Germuska	173289	111	Fisk Rd	138909730
--67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279

--select * from drivers_license
--where id = 173289 or id = 423327 and plate_number like('%H42W%')

--id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
--423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS

--select * from interview
--where person_id = 67318

--I was hired by a woman with a lot of money. 
--I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
--She has red hair and she drives a Tesla Model S. 
--I know that she attended the SQL Symphony Concert 3 times in December 2017.

--select * from drivers_license
--join person on drivers_license.id = person.license_id
--join income on person.ssn = income.ssn
--where height between 65 and 67 and car_make = 'Tesla'

--id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model	id	name	license_id	address_number	address_street_name	ssn	ssn	annual_income
--918773	48	65	black	red	female	917UU3	Tesla	Model S	78881	Red Korb	918773	107	Camerata Dr	961388910	961388910	278000
--202298	68	66	green	red	female	500123	Tesla	Model S	99716	Miranda Priestly	202298	1883	Golden Ave	987756388	987756388	310000

--select *
--from facebook_event_checkin
--where event_name = 'SQL Symphony Concert' and date between 20171201 and 20171231 and person_id = 99716

--Miranda Priestly

--Congrats, you found the brains behind the murder! 
--Everyone in SQL City hails you as the greatest SQL detective of all time. 
--Time to break out the champagne!