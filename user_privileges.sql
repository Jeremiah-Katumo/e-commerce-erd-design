-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS EcommerceDB;
USE EcommerceDB;

-- Create admin user with full privileges
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPass123';
GRANT ALL PRIVILEGES ON EcommerceDB.* TO 'admin_user'@'localhost';

-- Create product manager user with privileges to manage products, categories, brands, etc.
CREATE USER 'product_manager'@'localhost' IDENTIFIED BY 'ProdMgrPass123';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.product TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.product_category TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.brand TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.product_image TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.product_variation TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.product_item TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.product_attribute TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.attribute_type TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.attribute_category TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.color TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.size_category TO 'product_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.size_option TO 'product_manager'@'localhost';

-- Create inventory manager user with privileges to manage stock
CREATE USER 'inventory_manager'@'localhost' IDENTIFIED BY 'InvMgrPass123';
GRANT SELECT ON EcommerceDB.product TO 'inventory_manager'@'localhost';
GRANT SELECT ON EcommerceDB.product_variation TO 'inventory_manager'@'localhost';
GRANT SELECT, UPDATE ON EcommerceDB.product_item TO 'inventory_manager'@'localhost';

-- Create sales user with read-only access to product information
CREATE USER 'sales_user'@'localhost' IDENTIFIED BY 'SalesPass123';
GRANT SELECT ON EcommerceDB.product TO 'sales_user'@'localhost';
GRANT SELECT ON EcommerceDB.product_category TO 'sales_user'@'localhost';
GRANT SELECT ON EcommerceDB.brand TO 'sales_user'@'localhost';
GRANT SELECT ON EcommerceDB.product_image TO 'sales_user'@'localhost';
GRANT SELECT ON EcommerceDB.product_variation TO 'sales_user'@'localhost';
GRANT SELECT ON EcommerceDB.product_item TO 'sales_user'@'localhost';
GRANT SELECT ON EcommerceDB.product_attribute TO 'sales_user'@'localhost';

-- Create user manager with privileges to manage users and roles
CREATE USER 'user_manager'@'localhost' IDENTIFIED BY 'UserMgrPass123';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.users TO 'user_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.roles TO 'user_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON EcommerceDB.user_roles TO 'user_manager'@'localhost';

-- Apply the privileges
FLUSH PRIVILEGES; 