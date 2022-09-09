
                                             /* User Tables:- */

/* Creates the zip_street table */                    
create table F21_S003_5_user_zip_street(zip int primary key, street varchar(50) not null);

/* Creates the user table which consists of zip as the foreign key */
create table F21_S003_5_users(user_id varchar(50) primary key, fname char(15) not null, mname char(15), lname char(15) not null, blood_group varchar(3) not null, state char(20) not null,city varchar(50), zip int not null);

/* Adds zip as the foreign key to the users table */
alter table F21_S003_5_users add foreign key(zip) references F21_S003_5_user_zip_street(zip);

/* Creates the user_email table which consists of users email_id*/
create table F21_S003_5_user_email(user_id varchar(50) not null, email varchar(50) not null, primary key(user_id, email));

/* Adds user_id as the foreign key to the user_email table*/
alter table F21_S003_5_user_email add foreign key(user_id) references F21_S003_5_users(user_id);

/* Creates the user_contact table which consists of users contact no*/
create table F21_S003_5_user_contact(user_id varchar(50) not null, contact int not null, primary key(user_id, contact));

/* Adds user_id as the foreign key to the user_contact */
alter table F21_S003_5_user_contact add foreign key(user_id) references F21_S003_5_users(user_id);


                                             /* REQUESTER:- */

/* Creates the requester table which consists of requester details */
create table F21_S003_5_blood_requester(rid varchar(50) primary key, userno varchar(50) not null, priority int not null, requester_date Date);

/* Adds userno as the foreign key to the requester table */
alter table F21_S003_5_blood_requester add foreign key(userno) references F21_S003_5_users(user_id);

/* Creates the requester_causes table which consists of causes for blood request */
create table F21_S003_5_requester_causes(rid varchar(50) not null, accident char(4), health_related char(4), primary key(rid,accident,health_related));
 
/* Adds rid as the foreign key to the requester_causes table*/
alter table F21_S003_5_requester_causes add foreign key(rid) references F21_S003_5_blood_requester(rid);

                      
                                              /* DONOR:- */

/* creates the donor table which consists of the donor_details */
create table F21_S003_5_donors(D_id varchar(50) primary key, userno varchar(50) not null, weight int not null, age int not null, previous_date Date not null);

/* Adds user_no as the foreign key to donors table*/
alter table F21_S003_5_donors add foreign key(userno) references F21_S003_5_users(user_id);

                                                           
                                              /* SYSTEM_ADMIN:- */

/* Creates the table for F21_S003_5_admin_zip_street */
create table F21_S003_5_admin_zip_street(zip int primary key, street varchar(50) not null);

/* creates the admin table which consists of the admin details */
create table F21_S003_5_admin(admin_id varchar(50) primary key, rno varchar(50) not null, dno varchar(50) not null, name varchar(50) not null, city varchar(50) not null, zip int, state char(20) not null);

/* creates the admin_email table which consists of the admin email_id */
create table F21_S003_5_admin_email(admin_id varchar(50) not null, email varchar(50) not null, primary key(admin_id, email));

/* Add zip as the foreign key which references F21_S003_5_admin_zip_street */
alter table F21_S003_5_admin add foreign key(zip) references F21_S003_5_admin_zip_street(zip);

/* Adds rno as the foreign key which references to blood_requester table */
alter table F21_S003_5_admin add foreign key(rno) references F21_S003_5_blood_requester(rid);

/* Adds dno as the foreign key which references f21_s003_5_donors */
alter table F21_S003_5_admin add foreign key(dno) references F21_S003_5_donors(D_id);

/* Adds admin_id as the foreign key */
alter table F21_S003_5_admin_email add foreign key(admin_id) references F21_S003_5_admin(admin_id);



                                                         /*  BLOOD_BANK: */

/* Creates table for F21_S003_5_Blood_bankk */
create table F21_S003_5_Blood_bankk(bb_id varchar(50) primary key, dno varchar(50), bb_name varchar(50) not null, a_pos_blood_remaining float, a_neg_blood_remaining float, b_pos_blood_remaining float, b_neg_blood_remaining float, ab_pos_blood_remaining float, ab_neg_blood_remaining float, o_pos_blood_remaining float, o_neg_blood_remaining float);

/* Creates Table for F21_S003_5_blood_bank_contact_no */
create table F21_S003_5_blood_bank_contact_no(bb_id varchar(50) not null, contact_no int not null, primary key(bb_id, contact_no));

/* Adds dno foreign key and references it to the table F21_S003_5_donors */
alter table F21_S003_5_Blood_bankk add foreign key(dno) references F21_S003_5_donors(D_id);

/* Adds bb_id foreign key and references it to the table F21_S003_5_Blood_bankk */
alter table F21_S003_5_blood_bank_contact_no add foreign key(bb_id) references F21_S003_5_Blood_bankk(bb_id);

   
                                                     /*     HOSPITAL: */
/* Creates table for F21_S003_5_hospital_details*/
create table F21_S003_5_hospital_details(h_id varchar(50) primary key, h_name varchar(50) not null, bb_id varchar(50),admin_id varchar(50), a_pos_blood_remaining float, a_neg_blood_remaining float, b_pos_blood_remaining float, b_neg_blood_remaining float, ab_pos_blood_remaining float, ab_neg_blood_remaining float, o_pos_blood_remaining float, o_neg_blood_remaining float);

/* Adds bb_id foreign key and references it to the table F21_S003_5_Blood_bankk */
alter table F21_S003_5_hospital_details add foreign key(bb_id) references F21_S003_5_Blood_bankk(bb_id);

/* Adds admin_id foreign key and references it to the table F21_S003_5_admin */
alter table F21_S003_5_hospital_details add foreign key(admin_id) references F21_S003_5_admin(admin_id);

/* Creates table for F21_S003_5_hospital_adress*/
create table F21_S003_5_hospital_adress(h_id varchar(50) not null, physical varchar(50) , mailing varchar(50), primary key(h_id, physical, mailing));

/* Adds h_id foreign key and references it to the table F21_S003_5_hospital_details */
alter table F21_S003_5_hospital_adress add foreign key(h_id) references F21_S003_5_hospital_details(h_id);


                                                       /*  REPORT: */
/* Creates table for F21_S003_5_reports */
create table F21_S003_5_reports(report_id varchar(50) primary key, report_date Date, dno varchar(50));

/* Adds dno foreign key and references it to the table F21_S003_5_donors */
alter table F21_S003_5_reports add foreign key(dno) references F21_S003_5_donors(D_id);







