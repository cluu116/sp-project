CREATE DATABASE DB_Ban_Hang;
USE DB_Ban_Hang;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    role VARCHAR(50)
);

CREATE TABLE san_pham (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_san_pham VARCHAR(255),
    ten_san_pham VARCHAR(255),
    trang_thai VARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME
);

CREATE TABLE mau_sac (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_mau VARCHAR(255),
    ten_mau VARCHAR(255),
    trang_thai VARCHAR(50),
    ngay_sua DATETIME,
    ngay_tao DATETIME
);

CREATE TABLE size (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_size VARCHAR(255),
    ten_size VARCHAR(255),
    trang_thai VARCHAR(50),
    ngay_sua DATETIME,
    ngay_tao DATETIME
);

CREATE TABLE danh_muc (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_danh_muc VARCHAR(255),
    ten_danh_muc VARCHAR(255),
    trang_thai VARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME
);

CREATE TABLE khach_hang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(255) CHARACTER SET utf8mb4,
    dia_chi VARCHAR(255) CHARACTER SET utf8mb4,
    sdt VARCHAR(20),
    trang_thai VARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME
);

CREATE TABLE ctsp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_sp INT NULL,
    id_mau_sac INT NULL,
    id_size INT NULL,
    gia_ban DECIMAL(18, 2),
    so_luong_ton INT,
    trang_thai VARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    FOREIGN KEY (id_sp) REFERENCES san_pham(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_mau_sac) REFERENCES mau_sac(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_size) REFERENCES size(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE hoa_don (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_khach_hang INT NULL,
    trang_thai VARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    dia_chi VARCHAR(255) CHARACTER SET utf8mb4,
    so_dien_thoai VARCHAR(20),
    FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE hdct (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_hoa_don INT NULL,
    id_ctsp INT NULL,
    so_luong_mua INT,
    gia_ban DECIMAL(18, 2),
    tong_tien DECIMAL(18, 2),
    trang_thai VARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    FOREIGN KEY (id_hoa_don) REFERENCES hoa_don(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_ctsp) REFERENCES ctsp(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE  table gio_hang(
         id INT auto_increment PRIMARY KEY,
       id_khach_hang INT NULL,
        id_ctsp INT NULL,
        so_luong_mua INT,
        trang_thai VARCHAR(50), -- Adjust based on how you represent the status
        ngay_tao DATETIME,
        ngay_sua DATETIME,
         CONSTRAINT fk_khach_hang1 FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id) ON UPDATE CASCADE ON DELETE CASCADE,
         CONSTRAINT fk_ctsp1 FOREIGN KEY (id_ctsp) REFERENCES ctsp(id) ON UPDATE CASCADE ON DELETE CASCADE
       );

ALTER TABLE san_pham
ADD id_danh_muc INT NULL;

ALTER TABLE user
ADD id_khach_hang INT NULL;

ALTER TABLE san_pham
ADD CONSTRAINT fk_san_pham_danh_muc
FOREIGN KEY (id_danh_muc) REFERENCES danh_muc(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE user
ADD CONSTRAINT fk_user_khach_hang
FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id) ON UPDATE CASCADE ON DELETE CASCADE;

-- Dữ liệu cho bảng danh_muc
INSERT INTO danh_muc (ma_danh_muc, ten_danh_muc, trang_thai, ngay_tao, ngay_sua) VALUES
('DM01', 'Danh Mục 1', 'Hoạt động', NOW(), NOW()),
('DM02', 'Danh Mục 2', 'Hoạt động', NOW(), NOW()),
('DM03', 'Danh Mục 3', 'Hoạt động', NOW(), NOW()),
('DM04', 'Danh Mục 4', 'Hoạt động', NOW(), NOW()),
('DM05', 'Danh Mục 5', 'Hoạt động', NOW(), NOW());

-- Dữ liệu cho bảng san_pham
INSERT INTO san_pham (ma_san_pham, ten_san_pham, trang_thai, ngay_tao, ngay_sua, id_danh_muc) VALUES
('SP01', 'Sản Phẩm 1', 'Còn hàng', NOW(), NOW(), 1),
('SP02', 'Sản Phẩm 2', 'Còn hàng', NOW(), NOW(), 2),
('SP03', 'Sản Phẩm 3', 'Còn hàng', NOW(), NOW(), 3),
('SP04', 'Sản Phẩm 4', 'Còn hàng', NOW(), NOW(), 4),
('SP05', 'Sản Phẩm 5', 'Còn hàng', NOW(), NOW(), 5);

-- Dữ liệu cho bảng mau_sac
INSERT INTO mau_sac (ma_mau, ten_mau, trang_thai, ngay_tao, ngay_sua) VALUES
('MS01', 'Màu 1', 'Hoạt động', NOW(), NOW()),
('MS02', 'Màu 2', 'Hoạt động', NOW(), NOW()),
('MS03', 'Màu 3', 'Hoạt động', NOW(), NOW()),
('MS04', 'Màu 4', 'Hoạt động', NOW(), NOW()),
('MS05', 'Màu 5', 'Hoạt động', NOW(), NOW());

-- Dữ liệu cho bảng size
INSERT INTO size (ma_size, ten_size, trang_thai, ngay_tao, ngay_sua) VALUES
('S01', 'Size 1', 'Hoạt động', NOW(), NOW()),
('S02', 'Size 2', 'Hoạt động', NOW(), NOW()),
('S03', 'Size 3', 'Hoạt động', NOW(), NOW()),
('S04', 'Size 4', 'Hoạt động', NOW(), NOW()),
('S05', 'Size 5', 'Hoạt động', NOW(), NOW());

-- Dữ liệu cho bảng khach_hang
INSERT INTO khach_hang (ho_ten, dia_chi, sdt, trang_thai, ngay_tao, ngay_sua) VALUES
('Khách Hàng 1', 'Địa chỉ 1', '0123456789', 'Hoạt động', NOW(), NOW()),
('Khách Hàng 2', 'Địa chỉ 2', '0123456789', 'Hoạt động', NOW(), NOW()),
('Khách Hàng 3', 'Địa chỉ 3', '0123456789', 'Hoạt động', NOW(), NOW()),
('Khách Hàng 4', 'Địa chỉ 4', '0123456789', 'Hoạt động', NOW(), NOW()),
('Khách Hàng 5', 'Địa chỉ 5', '0123456789', 'Hoạt động', NOW(), NOW());

-- Dữ liệu cho bảng ctsp
INSERT INTO ctsp (id_sp, id_mau_sac, id_size, gia_ban, so_luong_ton, trang_thai, ngay_tao, ngay_sua) VALUES
(1, 1, 1, 100000, 50, 'Hoạt động', NOW(), NOW()),
(2, 2, 2, 200000, 60, 'Hoạt động', NOW(), NOW()),
(3, 3, 3, 300000, 70, 'Hoạt động', NOW(), NOW()),
(4, 4, 4, 400000, 80, 'Hoạt động', NOW(), NOW()),
(5, 5, 5, 500000, 90, 'Hoạt động', NOW(), NOW());

-- Dữ liệu cho bảng hoa_don
INSERT INTO hoa_don (id_khach_hang, trang_thai, ngay_tao, ngay_sua, dia_chi, so_dien_thoai) VALUES
(1, 'Đã giao', NOW(), NOW(), 'Địa chỉ 1', '0123456789'),
(2, 'Đã giao', NOW(), NOW(), 'Địa chỉ 2', '0123456789'),
(3, 'Đã giao', NOW(), NOW(), 'Địa chỉ 3', '0123456789'),
(4, 'Đã giao', NOW(), NOW(), 'Địa chỉ 4', '0123456789'),
(5, 'Đã giao', NOW(), NOW(), 'Địa chỉ 5', '0123456789');

-- Dữ liệu cho bảng hdct
INSERT INTO hdct (id_hoa_don, id_ctsp, so_luong_mua, gia_ban, tong_tien, trang_thai, ngay_tao, ngay_sua) VALUES
(1, 1, 2, 100000, 200000, 'Hoạt động', NOW(), NOW()),
(2, 2, 3, 200000, 600000, 'Hoạt động', NOW(), NOW()),
(3, 3, 4, 300000, 1200000, 'Hoạt động', NOW(),NOW()),
(4, 4, 9, 520000, 4680000, 'Hoạt động', NOW(),NOW()),
(5, 5, 10, 310000, 3100000, 'Hoạt động', NOW(),NOW());

-- Dữ liệu cho bảng user
INSERT INTO user (id, username, password, role, id_khach_hang) VALUES
(1, 'user', '123', 'user', 1),
(2, 'admin', '123', 'admin', 3);

USE DB_Ban_Hang;

ALTER TABLE san_pham
ADD COLUMN hinh_anh VARCHAR(255) AFTER ten_san_pham;


ALTER TABLE san_pham
ADD COLUMN gia_san_pham DECIMAL(18, 2) AFTER ten_san_pham;