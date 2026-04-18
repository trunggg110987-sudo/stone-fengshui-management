SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE stones;

SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO stones (category_id, name, code, price, image_url, description, status)
VALUES

-- ================= ĐÁ THÔ =================
(1, 'Thạch anh trắng', 'RAW001', 65000, 'thachanhtrang_tho.jpg', 'Đá nguyên bản tự nhiên', 1),
(1, 'Thạch anh tím', 'RAW002', 50000, 'amethyst_tho.webp', 'Đá chưa xử lý', 1),

-- ================= ĐÁ MÀI BÓNG =================
(2, 'Viên Thạch anh hồng ', 'POL001', 55000, 'thachanhhong_maibong.webp', 'Đá mài bóng đẹp', 1),
(2, 'Viên Obsidian ', 'POL002', 60000, 'Obsidian_maibong.jpg', 'Bề mặt sáng bóng', 1),

-- ================= TRANG SỨC =================
(3, 'Vòng tay green aventurine', 'JEW001', 250000, 'GreenAventurine_vongtay.webp', 'Trang sức phong thủy', 1),
(3, 'Dây chuyền Aquamarine', 'JEW002', 1650000, 'Aquamarine_daychuyen.jpg', 'Trang sức cao cấp', 1),

(3, 'Nhẫn Freeset Super Seven', 'SS001', 2850000, 's7_nhan.jpg', 'Đá Super Seven – 7 khoáng chất năng lượng mạnh', 1),
(3, 'Dây Chuyền Sunstone', 'SS002', 750000, 'Sunstone_daychuyen.jpg', 'Tăng trực giác và tâm linh', 1),

(3, 'Mặt Dây Moldavite', 'MD001', 2950000, 'modavite_matdaychuyen.jpg', 'Đá thiên thạch từ vũ trụ', 1),
(3, 'Dây Chuyền Sliding Vera Cruz Amethyst', 'MD002', 950000, 'Amethyst_daychuyen.jpg', 'Năng lượng chuyển hóa mạnh, hiếm', 1);