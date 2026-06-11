create database ola;
use ola;

# 1. Retrieve all successful bookings:
create view successful_Booking As
SELECT * FROM  ola 
WHERE Booking_status = 'success';

Select * from successful_Booking;


#2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
SELECT vehicle_type, AVG(Ride_Distance)
as avg_distance FROM ola
GROUP BY vehicle_type;

Select * from ride_distance_for_each_vehicle;


# 3. Get the total number of canceled rides by customers:
create view canceled_by_customers As
select count(*) from ola 
where Booking_status = 'canceled  by customers';

select * from canceled_by_customers;


#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select customer_id, count(booking_id) as total_rides
from ola
group by customer_id
order by total_rides desc limit 5;

select * from top_5_customers;


# 5. Get the number of rides canceled by drivers due to personal and car-related
create view rides_canceled_by_drivers_p_c_issues as
select count(*) from ola
where canceled_rides_by_driver = 'personal & car-related issue'; 

select * from rides_canceled_by_drivers_p_c_issues;



# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view driver_ratings as
select max(driver_ratings) as max_rating,
min(driver_ratings) as min_rating
from ola where vehicle_type = 'prime sedan';

select * from driver_ratings;



#7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as
select * from ola
where payment_method ='UPI';

select * from UPI_payment;


# 8. Find the average customer rating per vehicle type:
create view AVG_customer_rating as
SELECT Vehicle_Type, AVG (Customer_Rating) as avg_customer_rating
FROM ola
GROUP BY Vehicle_Type;

select * from AVG_customer_rating;


# 9. Calculate the total booking value of rides completed successfully:
create view total_successful_rides_value as
select sum(booking_value) as total_successful_value
from ola
where booking_status = 'success';

select * from total_successful_rides_value;


# 10. List all incomplete rides along with the reason:
create view incomplete_rides as
select booking_id, incomplete_rides_reason 
from ola
where incomplete_rides = 'yes';

select * from incomplete_rides;














