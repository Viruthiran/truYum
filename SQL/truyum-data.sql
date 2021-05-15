#1.View menu item list admin
#Inserting all the details to the menu_item_details table and displaying it

insert into menu_item_details
values (1,"Sandwich", 99.00, true, '2017-03-15', 'Main Course', true),
       (2,"Burger", 129.00, true, '2017-12-23', 'Main Course', false),
       (3,"Pizza", 149.00, true, '2017-08-21', 'Main Course', false),
       (4,"French Fries", 57.00, false, '2017-07-02', 'Starters', true),
       (5,"Chocolate Brownie", 32.00, false, '2022-11-02', 'Dessert', true);

select * from menu_item_details;


#2.View menu item list customer
#Displaying active menu items after launching date

select *
from menu_item_details
where date_of_launch >= current_date();


#3.Edit menu item
#Displaying menu items and updating all the columns based on the menu id in the menu_item_details table

select * 
from menu_item_details
group by menu_item_id
having menu_item_id = 3;

update menu_item_details 
set item_name = 'Burrito', price = 149.00, date_of_launch = '2021-05-05',category = 'Main Course', free_delivery = false
where menu_item_id = 2;

select * from menu_item_details;


#4.Add to Cart
#Inserting values to the user and cart tables based on the sql constraints given

insert into user_details
values (1001, "Viruthiran",'9043447168'),
		(1002, "Sathya",'9578241196');

select * from user_details;

insert into cart_details 
values (1001,1,"Sandwich", 99.00, true, '2017-03-15', 'Main Course', true),
		(1001, 3,"Pizza", 149.00, true, '2017-08-21', 'Main Course', false),
		(1001, 4,"French Fries", 57.00, false, '2017-07-02', 'Starters', true);

insert into cart_details (user_id)
values (1002);

select * from cart_details;


#5.View Cart
#Displaying cart details and summing up the total amounts

select *
from cart_details
where user_id in (select user_id from user_details);

select user_id,sum(price)
from cart_details
where user_id in (select user_id from user_details)
group by user_id;


#6.Remove Item From Cart
#Removing item from cart based on the user id and menu item id

delete from cart_details
where user_id = 1001 and menu_item_id = 3;

select * from cart_details;