

/* To find out the age groups which maximizes in blood donations*/
select age,count(*) from F21_S003_5_donors group by age order by count(*) desc fetch first 3 rows only;



/* To count the list of people who have donated blood and  who are weighted over 50kgs and aged under 50 */
select age,count(weight) from F21_s003_5_donors where weight > 50 and age <=50 group by rollup (age) order by count(weight);


/* Display the details of people who have requested for blood post october 2020 */
Select fname,mname, lname from f21_s003_5_users where user_id in(select userno from f21_s003_5_blood_requester where requester_date >= '01-OCT-20' group by userno);


/*Fetch the donor id and average age using order clause*/
select d_id , avg(age) over (order by userno) as avg_age from f21_s003_5_donors fetch first 5 rows only;


/* Provides the requester first_name and last_name whose priority=1*/
 
select fname, lname, user_id from F21_S003_5_users where user_id in(select userno from F21_S003_5_blood_requester where priority=1);



/* Rollup to find the summation of a+ve and b+ve blood groups remaining in all the bloodbanks */
select bb_id, sum(a_pos_blood_remaining),sum(b_pos_blood_remaining) from f21_s003_5_blood_bankk group by rollup (bb_id);