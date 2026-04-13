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

UPDATE categories
SET name = 'Chưa đặt tên'
WHERE name IS NULL;

ALTER TABLE categories
    MODIFY name VARCHAR (100) NOT NULL;

UPDATE categories
SET status = 1
WHERE status IS NULL;

ALTER TABLE categories
    MODIFY status INT DEFAULT 1;

-- Example data --

INSERT INTO categories (name, description, status) VALUES
                                                       ('Phong Thủy', 'Đá phong thủy tự nhiên', 1),
                                                       ('Trang Sức', 'Đá dùng làm trang sức', 1),
                                                       ('Trưng Bày', 'Đá trang trí nội thất', 1);

INSERT INTO stones
(category_id, name, code, price, image_url, description, status)
VALUES

    (2, 'Vòng tay Thạch Anh Tím', 'VT001', 550000,
     'images/amethyst_bracelet.jpg',
     'Vòng tay thạch anh tím giúp tăng trí tuệ, giảm stress và thu hút năng lượng tích cực',
     1),

    (2, 'Vòng tay Thạch Anh Hồng', 'VT002', 480000,
     'images/rose_quartz_bracelet.jpg',
     'Trang sức tượng trưng cho tình yêu, giúp cải thiện các mối quan hệ',
     1),

    (2, 'Vòng tay Đá Mắt Hổ', 'VT003', 650000,
     'images/tiger_eye_bracelet.jpg',
     'Mang lại sự tự tin, may mắn và tài lộc cho người đeo',
     1),

    (2, 'Dây chuyền Ngọc Bích', 'DC001', 1300000,
     'images/jade_necklace.jpg',
     'Trang sức cao cấp mang lại bình an và bảo vệ sức khỏe',
     1),

    (2, 'Vòng tay Obsidian', 'VT004', 350000,
     'images/obsidian_bracelet.jpg',
     'Giúp xua đuổi năng lượng xấu và tăng sự tập trung',
     1),

    (2, 'Dây chuyền Lapis Lazuli', 'DC002', 950000,
     'images/lapis_necklace.jpg',
     'Giúp tăng trí tuệ, sự sáng suốt và khả năng giao tiếp',
     1),

    (2, 'Vòng tay Citrine', 'VT005', 750000,
     'images/citrine_bracelet.jpg',
     'Thu hút tài lộc, phù hợp cho người kinh doanh',
     1),

    (2, 'Nhẫn Garnet', 'NH001', 600000,
     'images/garnet_ring.jpg',
     'Trang sức giúp tăng năng lượng sống và sự nhiệt huyết',
     1),

    (2, 'Dây chuyền Moonstone', 'DC003', 850000,
     'images/moonstone_necklace.jpg',
     'Mang lại sự cân bằng cảm xúc và bình yên nội tâm',
     1),

    (2, 'Vòng tay Aquamarine', 'VT006', 1150000,
     'images/aquamarine_bracelet.jpg',
     'Giúp tâm trí bình tĩnh, giảm căng thẳng và tăng sự tự tin',
     1);

select * from stones;