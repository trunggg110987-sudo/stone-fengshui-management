DROP DATABASE IF EXISTS fengshui_stone_db;

CREATE DATABASE fengshui_stone_db;
USE fengshui_stone_db;

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

CREATE TABLE blog (
                      id INT PRIMARY KEY AUTO_INCREMENT,
                      title VARCHAR(255),
                      content TEXT,
                      image VARCHAR(255),
                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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
INSERT INTO blog (title, content, image)
VALUES
    ('MOLDAVITE - Stones of Transformation',
     ' MOLDAVITE - Stones of Transformation
Không hẳn là Tiktok trend, Moldavite hiếm hơn vàng và kim cương, và chỉ có thể tìm thấy tại Czech. Đó cũng là lí do Moldavite là đại sứ đá quý của quốc gia này.
✨Moldavite được xem là viên đá có nguồn năng lượng mạnh nhất từ vũ trụ.
✨ Moldavite là viên đá của sự bảo vệ, và là viên đá giúp bạn làm chủ cảm xúc của mình tốt hơn.
✨Tần số rung động cao, giúp bạn kết nối với Chakra tim tốt hơn.

Cách đây 15 triệu năm, trên lãnh thổ của Đức và Cộng hòa Séc ngày nay, đã xuất hiện một Tiểu hành tinh màu xanh lục tuyệt đẹp với hàm lượng Silicon cao (tương tự như não của chúng ta). Nó được gọi là Moldavite hoặc Vltavin (sau sông Vltava). Moldavite đến với một mục đích cao cả, và bất kỳ ai chấp nhận nó đều được tiết lộ một thông điệp quan trọng (và nhiều hơn thế nữa).

Moldavite là tình yêu thuần khiết, và hào quang màu xanh lá hoạt động chủ yếu trên luân xa TRÁI TIM (cốt lõi của 7 Chakra). Nó giải phóng Tâm hồn, mang lại Bình yên cho cuộc sống, tăng cường sức khỏe tinh thần và thể chất. Moldavite là một trong những công cụ mạnh mẽ nhất để chữa lành và loại bỏ cơn đau (các cơ quan nội tạng, đau răng, nhức đầu, v.v.). Moldavite càng lớn hoặc càng nặng thì nó càng mạnh. Một số người có thể cảm nhận được Đá trên tay, nhưng hiệu quả nhất là khi đeo quanh vùng TRÁI TIM. Bạn có thể cảm thấy Moldavite cũng đứng đầu (luân xa Thirdeye), nơi nó mở ra cái nhìn vô hình và mang lại cho bạn khả năng thấu thị, nhưng bạn phải loại bỏ mọi suy nghĩ tiêu cực, lo lắng và các vấn đề. Nếu bạn đặt các Mandala xung quanh mình trong Mandala 6 hoặc 12 điểm, chúng có tác dụng rất tích cực trong việc điều trị, thư giãn, thiền định, chống bức xạ; chúng cũng củng cố những giấc mơ của bạn để chúng trở thành hiện thực và mang tính tâm linh, đôi khi thậm chí là Tiên tri.

Moldavite hoạt động với độ rung cao rất tinh tế. Nó có thể giúp bạn vượt qua TRÁI TIM đến những Vùng Tinh thần cao nhất, đến TRUNG TÂM CỦA ÁNH SÁNG MẶT TRỜI tràn ngập mọi thứ tồn tại trên khắp INFINITY. Nó gắn kết bạn với những người tương tự bên trong, với những Tinh linh Thiên thần cao nhất, với TRUNG TÂM của mọi sự Sáng tạo, chính NGƯỜI SÁNG TẠO, và khiến bạn rất hạnh phúc. Chúa công bằng và nghiêm khắc trở thành người cha TỐT, BAO DUNG và YÊU THƯƠNG nhất. TÌNH YÊU và SỰ HIỂU BIẾT trong bạn càng được củng cố. Bạn có thể phát triển LÒNG TRẮC ẨN và TÌNH YÊU ở mức cao nhất để Tha thứ, Làm thiện cho ác, v.v.

Moldavite dẫn bạn tới Điểm đến của bạn, cốt lõi của mọi thứ tồn tại, lần sinh thứ hai (Thức tỉnh tâm linh), để HOÀN HẢO.
    ',
     'blog2.webp'),

    ('LIBYAN DESERT GLASS - Libyan Gold Tektite',
     'LIBYAN DESERT GLASS – THỦY TINH SA MẠC KỲ BÍ

Trong vùng sa mạc rộng lớn phía tây Ai Cập, gần biên giới Libya, tồn tại một hiện tượng địa chất vô cùng kỳ lạ: những mảnh đá màu vàng nhạt đến vàng đậm, nằm rải rác giữa các cồn cát khô cằn. Người ta gọi chúng là Libyan Desert Glass – Thủy tinh sa mạc Libya.

Nguồn gốc được ghi nhận

Libyan Desert Glass được chính thức phát hiện vào năm 1932 bởi P. Clayton. Tuy nhiên, các nghiên cứu cho thấy loại vật liệu này đã hình thành từ khoảng 29 triệu năm trước, và từng được con người cổ đại sử dụng để chế tác công cụ và trang sức.

Điều khiến các nhà khoa học quan tâm không chỉ là vẻ đẹp của nó, mà là câu hỏi lớn:
Tại sao một loại thủy tinh lại có thể xuất hiện giữa sa mạc?

Những giả thuyết khoa học
1. Va chạm thiên thạch

Giả thuyết phổ biến nhất cho rằng Libyan Desert Glass được tạo ra từ một vụ va chạm thiên thạch cực lớn. Nhiệt lượng khổng lồ từ vụ nổ đã làm nóng chảy cát silica trên bề mặt sa mạc, tạo thành thủy tinh.

Tuy nhiên, một vấn đề lớn xuất hiện:
👉 Không tìm thấy miệng hố va chạm rõ ràng trong khu vực.

Điều này khiến giả thuyết vẫn còn tranh cãi.

2. Vụ nổ trong khí quyển (airburst)

Một giả thuyết khác cho rằng thiên thạch đã phát nổ khi đi vào khí quyển, tương tự như sự kiện Tunguska năm 1908.

Nhiệt độ có thể vượt quá 1.600°C
Đủ để làm nóng chảy cát sa mạc
Không tạo ra miệng hố trên mặt đất

Giả thuyết này giải thích được nhiều đặc điểm của Libyan Desert Glass, và hiện được nhiều nhà khoa học ủng hộ hơn.

3. Nguồn gốc núi lửa (ít được ủng hộ)

Một số ý kiến cho rằng thủy tinh này có thể hình thành từ hoạt động núi lửa. Tuy nhiên:

Khu vực không có dấu hiệu núi lửa cổ đại phù hợp
Thiếu bằng chứng địa chất hỗ trợ

Vì vậy, giả thuyết này ít được chấp nhận.

4. Thuyết “cổ đại siêu văn minh”

Một số giả thuyết mang tính huyền bí cho rằng Libyan Desert Glass là kết quả của các vụ nổ hạt nhân cổ đại do một nền văn minh tiên tiến đã biến mất.

Lập luận dựa trên việc thủy tinh này giống với cát bị nung chảy trong các vụ thử hạt nhân hiện đại.

Tuy nhiên:

Không có bằng chứng khảo cổ
Không có dấu vết phóng xạ nhân tạo
Niên đại lên tới hàng chục triệu năm

Do đó, giả thuyết này không được khoa học công nhận.

Vậy sự thật là gì?

Cho đến nay, giả thuyết hợp lý nhất vẫn là:

👉 Một thiên thạch lớn nổ trong khí quyển
👉 Tạo ra nhiệt cực cao (> 1.600°C)
👉 Làm nóng chảy cát sa mạc thành thủy tinh
👉 Không tạo miệng hố rõ ràng

Kết luận

Libyan Desert Glass vẫn là một trong những bí ẩn địa chất hấp dẫn nhất thế giới. Dù chưa có câu trả lời tuyệt đối, nhưng khoa học hiện đại nghiêng về khả năng đây là sản phẩm của một sự kiện vũ trụ cực mạnh trong quá khứ.

Và có lẽ, chính sự bí ẩn đó mới làm nó trở nên đặc biệt đến vậy.',
     'blog1.jpeg'),


    ('Cách bảo quản đá phong thủy',
     'Đá phong thủy không chỉ là vật trang trí mà còn được xem là vật mang năng lượng tự nhiên, giúp cân bằng phong thủy, thu hút may mắn và tài lộc. Tuy nhiên, nếu không biết cách bảo quản đúng, đá có thể bị giảm độ sáng, nứt vỡ hoặc “giảm năng lượng”.

Dưới đây là những cách đơn giản nhưng rất quan trọng để giữ đá phong thủy luôn đẹp và bền năng lượng.

1. Vệ sinh đá định kỳ

Đá phong thủy sau một thời gian sử dụng sẽ bám bụi và hấp thụ năng lượng xung quanh.

👉 Cách vệ sinh đúng:

Dùng khăn mềm lau nhẹ
Rửa bằng nước sạch hoặc nước muối loãng (tùy loại đá)
Tránh dùng hóa chất tẩy rửa mạnh

📌 Lưu ý: Một số loại đá mềm hoặc có cấu trúc đặc biệt không nên ngâm nước lâu.

2. Tránh va đập mạnh

Đá phong thủy, đặc biệt là các loại thạch anh hoặc đá tự nhiên, có thể bị nứt hoặc vỡ nếu rơi hoặc va chạm mạnh.

👉 Nên:

Đặt ở nơi cố định, an toàn
Tránh để gần mép bàn, kệ dễ rơi
3. Tránh ánh nắng trực tiếp quá lâu

Một số loại đá có thể bị phai màu nếu tiếp xúc ánh nắng mạnh trong thời gian dài.

👉 Ví dụ:

Thạch anh tím
Thạch anh hồng

📌 Nên đặt ở nơi có ánh sáng tự nhiên nhẹ hoặc trong nhà.

4. “Thanh tẩy” năng lượng cho đá

Theo quan niệm phong thủy, đá có thể hấp thụ năng lượng xấu theo thời gian, nên cần được thanh tẩy.

👉 Một số cách phổ biến:

Đặt dưới ánh trăng (đặc biệt là trăng rằm)
Ngâm trong nước muối loãng (với loại đá phù hợp)
Đặt cạnh thạch anh trắng để làm sạch năng lượng
5. Không để đá ở nơi ô uế

Tránh đặt đá phong thủy ở những nơi như:

Nhà vệ sinh
Khu vực ẩm thấp, bẩn
Nơi có năng lượng tiêu cực mạnh
6. Bảo quản theo mục đích sử dụng

Mỗi loại đá có mục đích khác nhau:

Cầu tài lộc
Tình duyên
Sức khỏe
Bảo hộ năng lượng

👉 Vì vậy, nên đặt đúng vị trí phong thủy để phát huy tối đa công dụng.

KẾT LUẬN

Đá phong thủy không chỉ là vật trang trí mà còn mang ý nghĩa tinh thần và năng lượng. Việc bảo quản đúng cách không chỉ giúp giữ vẻ đẹp tự nhiên của đá mà còn giúp duy trì nguồn năng lượng tích cực lâu dài.

Chỉ cần chăm sóc đúng cách, viên đá phong thủy của bạn sẽ luôn “sáng – sạch – và đầy năng lượng tốt”.',
     'blog3.jpg');