SET
FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE stones;

SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO stones (category_id, name, code, price, image_url, description, status)
VALUES

-- ================= ĐÁ THÔ =================
(1, 'Thạch anh trắng', 'RAW001', 65000, 'thachanhtrang_tho.jpg', 'Đá nguyên bản tự nhiên', 1),
(1, 'Thạch anh tím', 'RAW002', 50000, 'amethyst_tho.webp', 'Đá chưa xử lý', 1),
(1, 'Opal', 'RAW003', 55000, '1_opal.jpg', 'Đá chưa xử lý', 1),
(1, 'Lapis Lazuli', 'RAW004', 45000, '1_lapis_lazuli.jpg', 'Đá chưa xử lý', 1),
(1, 'Fluorite xanh', 'RAW005', 55000, '1_fluorite_xanh.jpg', 'Đá chưa xử lý', 1),
(1, 'Thạch anh vàng', 'RAW006', 35000, '1_citrine.jpg', 'Đá chưa xử lý', 1),
(1, 'Thạch anh hồng', 'RAW007', 35000, '1_hong.jpg', 'Đá chưa xử lý', 1),
(1, 'Thạch anh jasper đỏ', 'RAW008', 50000, '1_jasper_do.jpg', 'Đá chưa xử lý', 1),

(1, 'Fluorite Tím', 'RAW009', 36000, '1_fluorite_tim.jpg', 'Đá chưa xử lý', 1),
(1, 'Canxit Xanh Lam', 'RAW010', 28000, '1_canxit.jpg', 'Đá chưa xử lý', 1),
(1, 'Thạch Anh Khói ', 'RAW011', 23000, '1_thach_anh_khoi.jpg', 'Đá chưa xử lý', 1),
(1, 'Đá Labradorite', 'RAW012', 20000, '1_hac_nguyet_quang.jpg', 'Đá chưa xử lý', 1),
(1, 'Amazonite', 'RAW013', 25000, '1_amazonite.jpg', 'Đá chưa xử lý', 1),
(1, 'Vàng Ngăm', 'RAW014', 38000, '1_vangngam_pyrite.jpg', 'Đá chưa xử lý', 1),
(1, 'Thạch Anh Dâu Tây', 'RAW015', 25000, '1_dau_tay.jpg', 'Đá chưa xử lý', 1),
(1, 'Moostone Cộng sinh Tourmaline', 'RAW016', 50000, '1_moon_congsinh_tourmaline.jpg', 'Đá chưa xử lý', 1),
(1, 'Đá Celestine', 'RAW017', 25000, '1_celestine.jpg', 'Đá chưa xử lý', 1),
(1, 'Đá Mã Não Rêu', 'RAW018', 50000, '1_ma_nao_reu.jpg', 'Đá chưa xử lý', 1),
(1, 'Đá Opatilte', 'RAW019', 50000, '1_qpatitte.jpg', 'Đá chưa xử lý', 1),
(1, 'Sunstone', 'RAW020', 50000, '1_sunstone.jpg', 'Đá chưa xử lý', 1),
(1, 'Đá Huỳnh Quang Yooperlite', 'RAW021', 27000, '1_huynh_quang_yooperrlite.jpg', 'Đá chưa xử lý', 1),
(1, 'Đá Howlite', 'RAW0022', 21000, '1_howlite.jpg', 'Đá chưa xử lý', 1),

-- ================= ĐÁ MÀI BÓNG =================
(2, 'Viên Thạch anh hồng ', 'POL001', 55000, 'thachanhhong_maibong.webp', 'Đá mài bóng đẹp', 1),
(2, 'Viên Obsidian ', 'POL002', 60000, 'Obsidian_maibong.jpg', 'Bề mặt sáng bóng', 1),
(2, 'Viên Labradorite Trái tim ', 'POL003', 65000, '2_xa_cu.jpg', 'Bề mặt sáng bóng', 1),
(2, 'Viên Herkimer Kim cương Tự nhiên ', 'POL004', 39000, '2_herkimer.jpg', 'Bề mặt sáng bóng', 1),
(2, 'Tụ Thạch anh Trắng trong  ', 'POL005', 70000, '2_tu_tat.jpg', 'Bề mặt sáng bóng', 1),
(2, 'Moostone Cộng sinh Tourmaline ', 'POL006', 60000, '2_moon_congsinh_tourmaline.jpg', 'Bề mặt sáng bóng', 1),

-- ================= TRANG SỨC =================
(3, 'Vòng tay green aventurine', 'JEW001', 250000, 'GreenAventurine_vongtay.webp', 'Trang sức phong thủy', 1),
(3, 'Dây chuyền Aquamarine', 'JEW002', 1650000, 'Aquamarine_daychuyen.jpg', 'Trang sức cao cấp', 1),

(3, 'Nhẫn Freeset Super Seven', 'SS001', 2850000, 's7_nhan.jpg', 'Đá Super Seven – 7 khoáng chất năng lượng mạnh', 1),
(3, 'Dây Chuyền Sunstone', 'SS002', 750000, 'Sunstone_daychuyen.jpg', 'Tăng trực giác và tâm linh', 1),

(3, 'Mặt Dây Moldavite', 'MD001', 2950000, 'modavite_matdaychuyen.jpg', 'Đá thiên thạch từ vũ trụ', 1),
(3, 'Dây Chuyền Sliding Vera Cruz Amethyst', 'MD002', 950000, 'Amethyst_daychuyen.jpg', 'Năng lượng chuyển hóa mạnh, hiếm', 1);