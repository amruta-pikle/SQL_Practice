CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    item VARCHAR(50),
    amount INT,
    customer_id INT
);

CREATE TABLE Shippings (
    shipping_id INT PRIMARY KEY,
    status VARCHAR(50),
    customer INT
);