-- DDL 
CREATE DATABASE IF NOT EXISTS online_store;

USE online_store;

-- TABLES
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(150) NOT NULL,
    birth_date DATE NOT NULL
);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id),
    creation_date DATE NOT NULL
);

CREATE TABLE sales(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_order INT NOT NULL,
    FOREIGN KEY (id_order) REFERENCES orders(id),
    amount DECIMAL NOT NULL,
    date DATE NOT NULL
);

CREATE TABLE categories(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL    
);

CREATE TABLE products(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0),
    unit_price DECIMAL NOT NULL CHECK (unit_price >= 0),
    id_category INT NOT NULL,
    FOREIGN KEY (id_category) REFERENCES categories(id)
);

CREATE TABLE order_detail(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_order INT NOT NULL,
	FOREIGN KEY (id_order) REFERENCES orders(id),
    id_product INT NOT NULL,
    FOREIGN KEY (id_product) REFERENCES products(id),
    added_date DATE NOT NULL
);

-- DML

DESC users;
SELECT * FROM users;

-- INSERT

INSERT INTO users (name, email, birth_date) VALUES
('Juan Gonzales', 'juan@gmail.com', '1996-05-12'),
('María López', 'maria@hotmail.com', '1990-08-25'),
('Pedro Martínez', 'pedro@yahoo.com', '1985-12-10'),
('Ana Ramírez', 'ana.ramirez@gmail.com', '1993-03-18'),
('Luisa Torres', 'luisa.torres@hotmail.com', '1988-07-02'),
('Carlos Sánchez', 'carlos.sanchez@gmail.com', '1997-09-14'),
('Laura Pérez', 'laura.perez@yahoo.com', '1994-11-30'),
('Javier Rodríguez', 'javier.rodriguez@gmail.com', '1987-02-22'),
('Lucía García', 'lucia.garcia@hotmail.com', '1991-06-05'),
('Pablo López', 'pablo.lopez@gmail.com', '1989-04-15'),
('Elena Martín', 'elena.martin@yahoo.com', '1995-10-08'),
('Mario Hernández', 'mario.hernandez@hotmail.com', '1992-01-17'),
('Sofía Díaz', 'sofia.diaz@gmail.com', '1986-09-03'),
('Alejandro Ruiz', 'alejandro.ruiz@yahoo.com', '1998-03-28'),
('Carmen Gómez', 'carmen.gomez@hotmail.com', '1999-07-20');

DESC orders;
SELECT * FROM orders;

INSERT INTO orders (id_user, creation_date) VALUES
(1, '2024-05-15'),
(2, '2024-06-20'),
(3, '2024-07-05'),
(1, '2024-07-10'),
(4, '2024-06-25'),
(2, '2024-07-15'),
(5, '2024-05-30'),
(3, '2024-06-05'),
(1, '2024-06-12'),
(4, '2024-06-18'),
(2, '2024-07-01'),
(5, '2024-07-08'),
(3, '2024-07-20'),
(1, '2024-07-25'),
(4, '2024-06-30');

DESC sales;
SELECT * FROM sales;

INSERT INTO sales (id_order, amount, date) VALUES
(1, 500.5, '2024-06-07'),
(2, 700.2, '2024-06-10'),
(3, 300.8, '2024-06-15'),
(4, 900.0, '2024-06-20'),
(5, 1200.75, '2024-06-25'),
(6, 400.25, '2024-06-28'),
(7, 600.0, '2024-07-02'),
(8, 850.3, '2024-07-05'),
(9, 1100.6, '2024-07-08'),
(10, 950.1, '2024-07-12'),
(11, 300.0, '2024-07-15'),
(12, 800.4, '2024-07-18'),
(13, 600.9, '2024-07-20'),
(14, 400.7, '2024-07-22'),
(15, 1000.2, '2024-07-25');


ALTER TABLE sales
MODIFY COLUMN amount DECIMAL (15,2) NOT NULL;

DESC categories;
SELECT * FROM categories;

INSERT INTO categories (name) VALUES
('Electrónicos'),
('Ropa'),
('Libros'),
('Hogar'),
('Juguetes'),
('Deportes'),
('Automóviles'),
('Música'),
('Electrodomésticos'),
('Videojuegos'),
('Salud y Belleza'),
('Alimentos y Bebidas'),
('Mascotas'),
('Viajes'),
('Arte y Cultura');

DESC products;

INSERT INTO products (name, stock, unit_price, id_category) VALUES
('Smartphone X1', 50, 500, 1),
('Smart TV HD', 100, 800, 2),
('Libro Bestseller', 75, 1200, 3),
('Juego de Sábanas', 30, 600, 4),
('Figura de Acción', 200, 1500, 5),
('Balón de Fútbol', 80, 900, 6),
('Kit de Herramientas', 40, 700, 7),
('Batidora Profesional', 150, 2000, 8),
('Consola de Videojuegos', 25, 300, 9),
('Set de Maquillaje', 60, 1100, 10),
('Suplemento Vitamínico', 90, 1300, 11),
('Robot Aspirador', 120, 1000, 12),
('Cámara Fotográfica', 70, 400, 13),
('Bicicleta de Montaña', 180, 1700, 14),
('Billete de Avión', 55, 600, 15),
('Portátil Gaming', 85, 1400, 1),
('Sneakers de Moda', 110, 950, 2),
('Novela Romántica', 65, 850, 3),
('Cubiertos de Plata', 40, 700, 4),
('Película en Blu-ray', 220, 1600, 5),
('Balón de Baloncesto', 75, 950, 6),
('Reloj de Pulsera', 55, 1200, 7),
('Licuadora de Alta Potencia', 130, 1800, 8),
('Teclado Mecánico para Gaming', 30, 400, 9),
('Juego de Mesa Estratégico', 70, 1100, 10),
('Crema Antiedad', 95, 1350, 11),
('Mueble Modular', 150, 750, 12),
('Altavoces Bluetooth', 180, 1300, 13),
('Cuadro de Arte Moderno', 200, 1900, 14),
('Gafas de Sol de Diseñador', 45, 550, 15);

DESC order_detail;

INSERT INTO order_detail (id_order, id_product, added_date) VALUES
(1, 1, '2024-06-07'),
(1, 2, '2024-06-07'),
(1, 3, '2024-06-08'),
(2, 4, '2024-06-08'),
(2, 5, '2024-06-09'),
(3, 6, '2024-06-10'),
(3, 7, '2024-06-11'),
(4, 8, '2024-06-12'),
(4, 9, '2024-06-13'),
(5, 10, '2024-06-14'),
(5, 11, '2024-06-15'),
(6, 12, '2024-06-16'),
(6, 13, '2024-06-17'),
(7, 14, '2024-06-18'),
(7, 15, '2024-06-19');

-- UPDATE
SELECT * FROM users;
UPDATE users SET email = 'juan.perez@nuevogmail.com' WHERE id = 1;

-- DELETE
DELETE FROM users WHERE id = 15;

-- SELECTION
select name, email FROM users WHERE id = 1;

-- ADVANCED QUERIES
-- Statement 1: Obtain the total number of registered users in the Users table.
SELECT COUNT(*) AS total_users FROM users;

-- Statement 2: Calculate the average age of the users registered in the Users table. 
SELECT ROUND(AVG(YEAR(CURDATE()) - YEAR(birth_date) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(birth_date, '%m%d')))) AS average_age
FROM users;

-- Statement 3: Obtain the total orders placed by each user registered in the Users table ordered by the total orders.
SELECT name, COUNT(*) AS total_orders FROM users JOIN orders ON users.id = orders.id_user GROUP BY users.id;

-- FILTERS AND WHERE CONDITIONS
-- Statement 4: Obtain the total orders placed and the total amount of sales.

SELECT * FROM sales;
SELECT COUNT(*) AS total_orders_placed, SUM(amount) AS total_amount_sales FROM sales;

-- Statement 5: Obtain the total number of products by category.

SELECT * FROM p;
SELECT c.name, COUNT(*) AS total_products FROM products p JOIN categories c ON c.id = p.id_category GROUP BY c.name;

-- ORDER BY
-- Statement 6: Obtain the name and age of the registered users in the Users table sorted by age in descending order.
SELECT *, ROUND(YEAR(CURDATE()) - YEAR(birth_date) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(birth_date, '%m%d'))) AS user_age
FROM users ORDER BY user_age DESC;

-- Statement 7: Obtain the minimum and maximum age of the students registered in the Students table.
SELECT  MIN(ROUND(YEAR(CURDATE()) - YEAR(birth_date) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(birth_date, '%m%d')))) AS minimun_user_age,
MAX(ROUND(YEAR(CURDATE()) - YEAR(birth_date) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(birth_date, '%m%d')))) AS maximun_user_age
FROM users;

SELECT * FROM products;

-- Statement 8: Obtain the total orders placed by each user registered in the Users table ordered by the total orders.
SELECT u.name, COUNT(*) AS total_orders FROM orders o JOIN users u ON u.id = o.id_user GROUP BY u.name;

-- UNION QUERIES (JOIN)
-- Statement 9: Obtain the name and category of the products purchased by each user registered in the Users table.
SELECT u.name AS user_name, p.name AS product_name, c.name AS category_name
FROM users u
JOIN orders o ON u.id = o.id_user
JOIN order_detail od ON o.id = od.id_order
JOIN products p ON od.id_product = p.id
JOIN categories c ON p.id_category = c.id;

