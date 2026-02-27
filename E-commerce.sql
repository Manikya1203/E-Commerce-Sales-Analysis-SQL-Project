create database Ecommerce_sales;

create table customers (
customer_id int not null,
customer_name text  not null ,
city text not null,
gender text not null,
age int not null,
primary key (customer_id) );

create table orders(
order_id int not null,
customer_id int not null,
order_date date not null,
order_status text not null,
primary key (order_id) ,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) );

create table products(
product_id INT NOT NULL,
product_name text not null,
category text not null,
price DECIMAL not null,
PRIMARY KEY (product_id));

create table order_items(
order_item_id int not null,
order_id int not null,
product_id int not null,
quantity int not null,
primary key (order_item_id) ,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id) );