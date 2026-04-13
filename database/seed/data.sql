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
--Example data

INSERT INTO categories (name, description, status) VALUES
                                                       ('Phong Thủy', 'Đá phong thủy tự nhiên', 1),
                                                       ('Trang Sức', 'Đá dùng làm trang sức', 1),
                                                       ('Trưng Bày', 'Đá trang trí nội thất', 1);

INSERT INTO stones
(category_id, name, code, price, image_url, description, status)
VALUES

    (1, 'Thạch Anh Tím', 'TA001', 500000,
     'https://via.placeholder.com/300',
     'Đá giúp tăng trí tuệ, giảm stress và mang lại năng lượng tích cực',
     1),

    (1, 'Thạch Anh Hồng', 'TA002', 450000,
     'https://via.placeholder.com/300',
     'Tượng trưng cho tình yêu, giúp cải thiện mối quan hệ',
     1),

    (1, 'Đá Mắt Hổ', 'TA003', 600000,
     'https://via.placeholder.com/300',
     'Mang lại sự tự tin, may mắn và tài lộc',
     1),

    (2, 'Ngọc Bích', 'TS001', 1200000,
     'https://via.placeholder.com/300',
     'Mang lại bình an, thường dùng làm trang sức cao cấp',
     1),

    (1, 'Đá Obsidian', 'TA004', 300000,
     'https://via.placeholder.com/300',
     'Bảo vệ khỏi năng lượng xấu, tăng sự tập trung',
     1),

    (2, 'Đá Lapis Lazuli', 'TS002', 900000,
     'https://via.placeholder.com/300',
     'Giúp tăng trí tuệ và khả năng giao tiếp',
     1),

    (1, 'Đá Citrine', 'TA005', 700000,
     'https://via.placeholder.com/300',
     'Thu hút tài lộc, phù hợp người kinh doanh',
     1),

    (2, 'Đá Garnet', 'TS003', 550000,
     'https://via.placeholder.com/300',
     'Tăng năng lượng sống, giúp cơ thể khỏe mạnh',
     1),

    (3, 'Đá Moonstone', 'TB001', 800000,
     'https://via.placeholder.com/300',
     'Mang lại cân bằng cảm xúc và sự bình yên',
     1),

    (3, 'Đá Aquamarine', 'TB002', 1100000,
     'https://via.placeholder.com/300',
     'Giúp tâm trí bình tĩnh, giảm căng thẳng',
     1);