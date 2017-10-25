drop table if exists bookings;
drop table if exists rides;
drop table if exists users;

create table bookings (
    booking_id bigint not null auto_increment,
    booking_at datetime not null,
    driver_comment varchar(255),
    driver_rating integer,
    number_of_seats integer not null,
    passenger_comment varchar(255),
    passenger_rating integer,
    passenger_id bigint not null,
    ride_id bigint not null,
    primary key (booking_id)
);

create table rides (
    ride_id bigint not null auto_increment,
    arrival_at datetime not null,
    departure_at datetime not null,
    distance_in_mile double precision not null,
    dropoff_lat double precision not null,
    dropoff_lng double precision not null,
    dropoff_point varchar(100) not null,
    luggage_size varchar(1) not null,
    max_number_of_seats integer not null,
    note varchar(255),
    pickup_flexibility_in_minutes integer not null,
    pickup_lat double precision not null,
    pickup_lng double precision not null,
    pickup_point varchar(100) not null,
    price_per_seat double precision not null,
    status integer not null,
    driver_id bigint not null,
    primary key (ride_id)
);

create table users (
    user_id bigint not null auto_increment,
    authority varchar(5) not null,
    birthdate date,
    email varchar(255) not null,
    first_name varchar(50) not null,
    gender varchar(1) not null,
    last_name varchar(50) not null,
    password varchar(64) not null,
    primary key (user_id)
);

alter table users 
    add constraint users_email_uk unique (email);

alter table bookings 
    add constraint bookings_passenger_fk
    foreign key (passenger_id) 
    references users (user_id);

alter table bookings 
    add constraint bookings_ride_fk
    foreign key (ride_id) 
    references rides (ride_id);

alter table rides 
    add constraint rides_driver_fk
    foreign key (driver_id) 
    references users (user_id);
    
insert into users (authority, avatar, birthdate, email, first_name, gender, last_name, password) 
values ('ADMIN', NULL, '2017-01-21', 'admin@gmail.com', 'Admin', 'M', 'Role', '$2a$10$Uz8jvJ2uR/HrJRVxKXP3SOeHo3j58hN7G/AAxYpIQ1fDdEMh4i.GC');


