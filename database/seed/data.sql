-- USERS
INSERT INTO users (username, password, full_name, email, phone, role, status)
VALUES
    ('admin', '123456', 'Trung Admin', 'admin@gmail.com', '0123456789', 'ADMIN', 1),
    ('anh', '123456', 'Ngọc Ánh', 'anh@gmail.com', '0987654321', 'USER', 1),
    ('duoc', '123456', 'Nguyễn Được', 'duoc@gmail.com', '0911222333', 'USER', 1),
    ('manager', '123456', 'Quản lý', 'manager@gmail.com', '0933444555', 'ADMIN', 1),
    ('guest', '123456', 'Khách', 'guest@gmail.com', '0966777888', 'USER', 1);

-- CATEGORIES
INSERT INTO categories (name, description, status)
VALUES
    ('Đá thạch anh', 'Các loại đá thạch anh phong thủy', 1),
    ('Đá mã não', 'Đá mã não tự nhiên', 1),
    ('Đá mắt hổ', 'Đá mắt hổ tăng năng lượng', 1);

-- ELEMENTS
INSERT INTO elements (name)
VALUES
    ('Kim'),
    ('Mộc'),
    ('Thủy'),
    ('Hỏa'),
    ('Thổ');

-- STONES
INSERT INTO stones (category_id, name, code, price, image_url, description, status)
VALUES
    (1, 'Thạch anh tím', 'TA001', 500000, 'https://via.placeholder.com/200', 'Đá giúp tăng trí tuệ', 1),
    (1, 'Thạch anh hồng', 'TA002', 450000, 'https://via.placeholder.com/200', 'Đá tình duyên', 1),
    (2, 'Mã não đỏ', 'MN001', 300000, 'https://via.placeholder.com/200', 'Mang lại may mắn', 1),
    (2, 'Mã não xanh', 'MN002', 320000, 'https://via.placeholder.com/200', 'Giúp cân bằng', 1),
    (3, 'Mắt hổ vàng', 'MH001', 600000, 'https://via.placeholder.com/200', 'Tăng tài lộc', 1),
    (3, 'Mắt hổ đỏ', 'MH002', 650000, 'https://via.placeholder.com/200', 'Tăng sức mạnh', 1),
    (1, 'Thạch anh trắng', 'TA003', 400000, 'https://via.placeholder.com/200', 'Thanh lọc năng lượng', 1),
    (2, 'Mã não đen', 'MN003', 350000, 'https://via.placeholder.com/200', 'Bảo vệ khỏi tiêu cực', 1);

-- CONTACT REQUESTS
INSERT INTO contact_requests (full_name, phone, email, subject, message, stone_id, status)
VALUES
    ('Nguyễn Văn A', '0901111222', 'a@gmail.com', 'Tư vấn đá', 'Tôi muốn tư vấn đá hợp mệnh', 1, 'NEW'),
    ('Trần Thị B', '0902222333', 'b@gmail.com', 'Giá sản phẩm', 'Cho tôi hỏi giá đá này', 2, 'NEW'),
    ('Lê Văn C', '0903333444', 'c@gmail.com', 'Đặt hàng', 'Tôi muốn đặt mua đá', 3, 'PROCESSING'),
    ('Phạm Thị D', '0904444555', 'd@gmail.com', 'Hỏi thông tin', 'Đá này có hợp mệnh không?', 4, 'DONE');

update users set password ='8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'
where username = 'admin';

select username, password from users
where username = 'admin';

DELETE FROM users
WHERE username = 'admin'
LIMIT 1;

select * from users;

UPDATE users
SET password = '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'
WHERE username IN ('admin','anh','duoc','manager','guest');

