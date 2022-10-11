CREATE DATABASE demo_bt_user;
USE demo_bt_user;

create table country (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 PRIMARY KEY (id)
);

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country_id int(3),
 PRIMARY KEY (id),
 foreign key (country_id) REFERENCES country(id)
);

insert into country(name) values ('Viet Nam');
insert into country(name) values ('Nhat Ban');

insert into users(name, email, country_id) values('Minh','minh@codegym.vn',1);
insert into users(name, email, country_id) values('Kante','kante@che.uk',2);