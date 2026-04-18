SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE stones;
TRUNCATE TABLE categories;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO categories (name, description, status) VALUES
                                                       ('Đá thô', 'Các loại đá nguyên bản chưa qua xử lý', 1),
                                                       ('Đá mài bóng', 'Đá đã được gia công, mài và đánh bóng', 1),
                                                       ('Trang sức', 'Các loại đá phong thủy dùng làm trang sức', 1);