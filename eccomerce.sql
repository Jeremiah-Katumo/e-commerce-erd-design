-- The tables with their respective history fields(i.e created_at, updated_at, deleted_at)
-- It is also important to identify actions (create, update and delete permissions; identified by
-- created_by, updated_by and deleted_by foreign keys) done by individuals. These tables are important
-- to create when you are beginning to build your application. 

CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL
);


CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL
);


CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    base_price DECIMAL(10,2) NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL,
    UNIQUE(name, brand_id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);


CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    url TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);


CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    hex_code CHAR(7) NOT NULL UNIQUE,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL
);


CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL
);


CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    label VARCHAR(10) NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL,
    FOREIGN KEY (category_id) REFERENCES size_category(id)
);


CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    size_option_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL,
    UNIQUE(product_id, color_id, size_option_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);


CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    variation_id INT NOT NULL,
    stock_quantity INT NOT NULL,
    sku VARCHAR(50) NOT NULL UNIQUE,
    price_override DECIMAL(10,2),
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL,
    FOREIGN KEY (variation_id) REFERENCES product_variation(id)
);


CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL UNIQUE,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL
);


CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL
);


CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    value TEXT NOT NULL,
    type_id INT NOT NULL,
    category_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    deleted_by INT DEFAULT NULL,
    UNIQUE(product_id, name),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (type_id) REFERENCES attribute_type(id),
    FOREIGN KEY (category_id) REFERENCES attribute_category(id)
);

