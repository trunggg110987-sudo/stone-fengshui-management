CREATE DATABASE fengshui_stone_db;

use fengshui_stone_db;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50),
                       password VARCHAR(255),
                       full_name VARCHAR(100),
                       role VARCHAR(20),
                       status INT,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            name VARCHAR(100),
                            description TEXT,
                            status INT
);

CREATE TABLE elements (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(50)
);

CREATE TABLE stones (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        category_id INT,
                        name VARCHAR(100),
                        code VARCHAR(50),
                        price DECIMAL(10,2),
                        image_url VARCHAR(255),
                        description TEXT,
                        status INT,
                        FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE contact_requests (
                                  id INT AUTO_INCREMENT PRIMARY KEY,
                                  full_name VARCHAR(100),
                                  phone VARCHAR(20),
                                  email VARCHAR(100),
                                  subject VARCHAR(255),
                                  message TEXT,
                                  stone_id INT,
                                  status VARCHAR(20),
                                  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  FOREIGN KEY (stone_id) REFERENCES stones(id)
);
ALTER TABLE users ADD email VARCHAR(100);
ALTER TABLE users ADD phone VARCHAR(20);
select * from stones;