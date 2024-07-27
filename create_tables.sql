-- Tabla de todos los usuarios --
CREATE TABLE Customer (
    user_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    sexo VARCHAR(255) not null,
    telefono VARCHAR(255) not NULL,
    fecha_nacimiento DATE,
    documento BIGINT unique not null,
    tipo VARCHAR(255) NOT null -- Determina si el usuario es Seller o Buyer --
);

-- Tabla de usuarios tipo Seller o Vendedor --
CREATE TABLE Seller (
    seller_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Customer(user_id)
);

-- Tabla de usuarios tipo Buyer o Comprador --
CREATE TABLE Buyer (
    buyer_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(user_id)
);

-- Tabla de pedidos --
CREATE TABLE Order (
    order_id SERIAL PRIMARY KEY,
    seller_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_bill FLOAT NOT NULL,
    store VARCHAR(255),
    shipment_address VARCHAR(255),
    zip_code BIGINT,
    buyer_id INT NOT NULL,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id)
);

-- Tabla de categorias --
CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    category_1 VARCHAR(255) NOT NULL, -- Subcategoria 1 --
    category_2 VARCHAR(255), -- Subcategoria 2 --
    category_3 VARCHAR(255) -- Subcategoria 3 --
);

-- Tabla de items o productos --
CREATE TABLE Item (
    item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    price FLOAT NOT NULL,
    weight FLOAT NOT NULL DEFAULT 100,
    stock_available BIGINT,
    FOREIGN KEY (order_id) REFERENCES Order(order_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
