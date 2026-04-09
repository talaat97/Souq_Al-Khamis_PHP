-- Use your database (replace with your actual database)
USE `if0_40768796_ecommerce`;

-- ========================
-- TABLES
-- ========================

-- Users table
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(100) NOT NULL,
  `user_email` VARCHAR(100) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `user_phone` VARCHAR(100) NOT NULL,
  `user_verfiycode` INT(100) NOT NULL,
  `users_approve` TINYINT(4) NOT NULL DEFAULT 0,
  `user_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Categories table
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(100) NOT NULL,
  `cat_name_ar` VARCHAR(100) NOT NULL,
  `cat_img` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Items table
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` INT(11) NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(100) NOT NULL,
  `item_name_ar` VARCHAR(100) NOT NULL,
  `item_price` DECIMAL(10,2) NOT NULL,
  `item_desc` TEXT,
  `item_desc_ar` TEXT,
  `item_img` VARCHAR(255),
  `item_cat_id` INT(11) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Address table (foreign key added later)
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `address_name` VARCHAR(255) NOT NULL,
  `address_phone` VARCHAR(100) NOT NULL,
  `address_city` VARCHAR(100) NOT NULL,
  `address_country` VARCHAR(100) NOT NULL,
  `address_state` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Cart table
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `item_id` INT(11) NOT NULL,
  `item_qty` INT(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Orders table
CREATE TABLE IF NOT EXISTS `customerorders` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `address_id` INT(11) NOT NULL,
  `order_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` VARCHAR(50) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ========================
-- ADD FOREIGN KEYS
-- ======================== 

ALTER TABLE `items`
  ADD CONSTRAINT `fk_items_cat` FOREIGN KEY (`item_cat_id`) REFERENCES `categories`(`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_user` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cart_item` FOREIGN KEY (`item_id`) REFERENCES `items`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `customerorders`
  ADD CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_address` FOREIGN KEY (`address_id`) REFERENCES `address`(`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- ========================
-- VIEWS (optional)
-- ========================

CREATE OR REPLACE VIEW `cartview` AS
SELECT c.cart_id, u.user_name, i.item_name, c.item_qty, i.item_price, (c.item_qty*i.item_price) AS total
FROM cart c
JOIN users u ON c.user_id = u.user_id
JOIN items i ON c.item_id = i.item_id;
