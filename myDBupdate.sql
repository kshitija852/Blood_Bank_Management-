

/* It will update the age according to the donor id */
 update F21_S003_5_donors set age=23 where d_id in('fy212', 'ah752', 'tk856');

 update F21_S003_5_donors set age=25 where d_id in('ai212', 'gj127', 'rk219', 'vs822');

 update F21_S003_5_donors set age=30 where d_id in('ul243', 'ki242', 'pb802');

/* It will update the weight according to the donor id */
update F21_S003_5_donors set weight = 45 where d_id in('bn037', 'rk219', 'pb802');

/* It will update the priorities according to the rid */
update F21_S003_5_blood_requester set priority=2 where rid in('ye417', 'dr259', 'nz272');

/* with this command , we can change the amount of blood remaining for a particular blood group corresponding to the bloodbank having  id ='yj319' */
update table F21_S003_5_Blood_bankk set a_pos_blood_remaining='500' where bb_id='yj319';


