#creation of database called truYum
create database truYum;

#using the truYum database for table creation
use truYum;


drop table menu_item_details;
drop table user_details;
drop table cart_details;

#creating menu items table
create table menu_item_details
(
	menu_item_id int primary key,
    item_name varchar(50),
    price double(5, 2),
    activity_check boolean,
    date_of_launch date,
    category enum('Main Course', 'Starters', 'Dessert', 'Drinks'),
    free_delivery boolean
);

#creating user table
create table user_details
(
	user_id int primary key,
	user_name varchar(50),
    phone_no bigint
);

#creating cart table
create table cart_details
(
	user_id int,
    menu_item_id int,
    item_name varchar(50),
    price double(5, 2),
    activity_check boolean,
    date_of_launch date,
    category enum('Main Course', 'Starters', 'Dessert', 'Drinks'),
    free_delivery boolean,
    foreign key(user_id) references user_details(user_id),
    foreign key(menu_item_id) references menu_item_details(menu_item_id)
);

#total tables in the truYum database
show tables;