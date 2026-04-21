-- =========================
-- DROP DATABASE nếu tồn tại
-- =========================
DROP DATABASE IF EXISTS fengshui_stone_db;

-- =========================
-- CREATE DATABASE
-- =========================
CREATE DATABASE fengshui_stone_db;
USE fengshui_stone_db;

-- =========================
-- TABLE: USERS
-- =========================
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50),
                       password VARCHAR(255),
                       full_name VARCHAR(100),
                       email VARCHAR(100),
                       phone VARCHAR(20),
                       role VARCHAR(20),
                       status INT,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- TABLE: CATEGORIES
-- =========================
CREATE TABLE categories (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            name VARCHAR(100),
                            description TEXT,
                            status INT
);

-- =========================
-- TABLE: ELEMENTS
-- =========================
CREATE TABLE elements (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(50)
);

-- =========================
-- TABLE: STONES
-- =========================
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

-- =========================
-- TABLE: CONTACT REQUESTS
-- =========================
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

-- =========================
-- INSERT: CATEGORIES
-- =========================
INSERT INTO categories (name, description, status) VALUES
                                                       ('Đá thô', 'Các loại đá nguyên bản chưa qua xử lý', 1),
                                                       ('Đá mài bóng', 'Đá đã được gia công, mài và đánh bóng', 1),
                                                       ('Trang sức', 'Các loại đá phong thủy dùng làm trang sức', 1);

-- =========================
-- INSERT: ELEMENTS
-- =========================
INSERT INTO elements (name) VALUES
                                ('Kim'),
                                ('Mộc'),
                                ('Thủy'),
                                ('Hỏa'),
                                ('Thổ');

-- =========================
-- INSERT: USERS
-- =========================
INSERT INTO users (username, password, full_name, email, phone, role, status) VALUES
                                                                                  ('admin', '123456', 'Trung Admin', 'admin@gmail.com', '0123456789', 'ADMIN', 1),
                                                                                  ('anh', '123456', 'Ngọc Ánh', 'anh@gmail.com', '0987654321', 'USER', 1),
                                                                                  ('duoc', '123456', 'Nguyễn Được', 'duoc@gmail.com', '0911222333', 'USER', 1),
                                                                                  ('manager', '123456', 'Quản lý', 'manager@gmail.com', '0933444555', 'ADMIN', 1),
                                                                                  ('guest', '123456', 'Khách', 'guest@gmail.com', '0966777888', 'USER', 1);

-- =========================
-- INSERT: STONES
-- =========================

-- ĐÁ THÔ + MÀI BÓNG + TRANG SỨC
INSERT INTO stones (category_id, name, code, price, image_url, description, status) VALUES
                                                                                        (1, 'Thạch anh trắng', 'RAW001', 65000, 'thachanhtrang_tho.jpg', 'Đá nguyên bản tự nhiên', 1),
                                                                                        (1, 'Thạch anh tím', 'RAW002', 50000, 'amethyst_tho.webp', 'Đá chưa xử lý', 1),
                                                                                        (1, 'Opal', 'RAW003', 55000, '1_opal.jpg', 'Đá chưa xử lý', 1),
                                                                                        (1, 'Lapis Lazuli', 'RAW004', 45000, '1_lapis_lazuli.jpg', 'Đá chưa xử lý', 1),
                                                                                        (1, 'Fluorite xanh', 'RAW005', 55000, '1_fluorite_xanh.jpg', 'Đá chưa xử lý', 1),
                                                                                        (1, 'Thạch anh vàng', 'RAW006', 35000, '1_citrine.jpg', 'Đá chưa xử lý', 1),
                                                                                        (1, 'Thạch anh hồng', 'RAW007', 35000, '1_hong.jpg', 'Đá chưa xử lý', 1),

                                                                                        (2, 'Viên Thạch anh hồng', 'POL001', 55000, 'thachanhhong_maibong.webp', 'Đá mài bóng đẹp', 1),
                                                                                        (2, 'Viên Obsidian', 'POL002', 60000, 'Obsidian_maibong.jpg', 'Bề mặt sáng bóng', 1),

                                                                                        (3, 'Vòng tay green aventurine', 'JEW001', 250000, 'GreenAventurine_vongtay.webp', 'Trang sức phong thủy', 1),
                                                                                        (3, 'Dây chuyền Aquamarine', 'JEW002', 1650000, 'Aquamarine_daychuyen.jpg', 'Trang sức cao cấp', 1),
                                                                                        (3, 'Nhẫn Freeset Super Seven', 'SS001', 2850000, 's7_nhan.jpg', 'Đá Super Seven', 1),
                                                                                        (3, 'Dây Chuyền Sunstone', 'SS002', 750000, 'Sunstone_daychuyen.jpg', 'Tăng trực giác', 1),
                                                                                        (3, 'Mặt Dây Moldavite', 'MD001', 2950000, 'modavite_matdaychuyen.jpg', 'Đá thiên thạch', 1),
                                                                                        (3, 'Dây Chuyền Vera Cruz Amethyst', 'MD002', 950000, 'Amethyst_daychuyen.jpg', 'Đá hiếm năng lượng mạnh', 1);

-- =========================
-- INSERT: CONTACT REQUESTS
-- =========================
INSERT INTO contact_requests (full_name, phone, email, subject, message, stone_id, status) VALUES
                                                                                               ('Nguyễn Văn A', '0901111222', 'a@gmail.com', 'Tư vấn đá', 'Tôi muốn tư vấn đá hợp mệnh', 1, 'NEW'),
                                                                                               ('Trần Thị B', '0902222333', 'b@gmail.com', 'Giá sản phẩm', 'Cho tôi hỏi giá đá này', 2, 'NEW'),
                                                                                               ('Lê Văn C', '0903333444', 'c@gmail.com', 'Đặt hàng', 'Tôi muốn đặt mua đá', 3, 'PROCESSING'),
                                                                                               ('Phạm Thị D', '0904444555', 'd@gmail.com', 'Hỏi thông tin', 'Đá này có hợp mệnh không?', 4, 'DONE');