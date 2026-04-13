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