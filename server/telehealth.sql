-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 20, 2025 lúc 06:32 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `telehealth`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `tinh_trang` tinyint(4) DEFAULT 1,
  `id_chuc_vu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bacsi_chuyennganh`
--

CREATE TABLE `bacsi_chuyennganh` (
  `id` int(11) NOT NULL,
  `id_bac_si` int(11) DEFAULT NULL,
  `id_chuyen_nganh` int(11) DEFAULT NULL,
  `thoi_gian_du_kien` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bac_sis`
--

CREATE TABLE `bac_sis` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` varchar(10) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `tinh_trang` tinyint(4) DEFAULT 1,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `chuc_danh` varchar(100) DEFAULT NULL,
  `so_nam_kinh_nghiem` int(11) DEFAULT NULL,
  `kinh_nghiem_lam_viec` text DEFAULT NULL,
  `id_benh_vien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benh_nhans`
--

CREATE TABLE `benh_nhans` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` varchar(10) DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `dia_chi` varchar(200) DEFAULT NULL,
  `tinh_trang` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benh_viens`
--

CREATE TABLE `benh_viens` (
  `id` int(11) NOT NULL,
  `ten_benh_vien` varchar(200) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dia_chi` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_dat_lichs`
--

CREATE TABLE `chi_tiet_dat_lichs` (
  `id` int(11) NOT NULL,
  `id_phieu_dat_lich` int(11) DEFAULT NULL,
  `id_bac_si` int(11) DEFAULT NULL,
  `thoi_gian_bat_dau` datetime DEFAULT NULL,
  `thoi_gian_ket_thuc_kham` datetime DEFAULT NULL,
  `so_sao_danh_gia` int(11) DEFAULT NULL,
  `nhan_xet` text DEFAULT NULL,
  `ngay_danh_gia` date DEFAULT NULL,
  `don_thuoc` text DEFAULT NULL,
  `chuan_doan` text DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuc_nangs`
--

CREATE TABLE `chuc_nangs` (
  `id` int(11) NOT NULL,
  `ten_chuc_nang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuc_vus`
--

CREATE TABLE `chuc_vus` (
  `id` int(11) NOT NULL,
  `ten_chuc_vu` varchar(100) NOT NULL,
  `tinh_trang` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyen_khoas`
--

CREATE TABLE `chuyen_khoas` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyen_nganhs`
--

CREATE TABLE `chuyen_nganhs` (
  `id` int(11) NOT NULL,
  `ten_chuyen_nganh` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lich_lam_viecs`
--

CREATE TABLE `lich_lam_viecs` (
  `id` int(11) NOT NULL,
  `id_bac_si` int(11) DEFAULT NULL,
  `ngay_lam_viec` date DEFAULT NULL,
  `thoi_gian_bat_dau` time DEFAULT NULL,
  `thoi_gian_ket_thuc` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_quyens`
--

CREATE TABLE `phan_quyens` (
  `id` int(11) NOT NULL,
  `id_chuc_nang` int(11) DEFAULT NULL,
  `id_chuc_vu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_dat_lichs`
--

CREATE TABLE `phieu_dat_lichs` (
  `id` int(11) NOT NULL,
  `id_benh_nhan` int(11) DEFAULT NULL,
  `ngay_dat_hen` date DEFAULT NULL,
  `ly_do_kham` text DEFAULT NULL,
  `tinh_trang` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `ten_role` varchar(50) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `tinh_trang` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `ten_role`, `mo_ta`, `tinh_trang`) VALUES
(1, 'admin', 'Quản trị viên hệ thống', 1),
(2, 'bac_si', 'Bác sĩ', 1),
(3, 'benh_nhan', 'Bệnh nhân', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `entity_type` enum('admin','bac_si','benh_nhan') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tinh_trang` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_chuc_vu` (`id_chuc_vu`);

--
-- Chỉ mục cho bảng `bacsi_chuyennganh`
--
ALTER TABLE `bacsi_chuyennganh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bac_si` (`id_bac_si`),
  ADD KEY `id_chuyen_nganh` (`id_chuyen_nganh`);

--
-- Chỉ mục cho bảng `bac_sis`
--
ALTER TABLE `bac_sis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_benh_vien` (`id_benh_vien`);

--
-- Chỉ mục cho bảng `benh_nhans`
--
ALTER TABLE `benh_nhans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `benh_viens`
--
ALTER TABLE `benh_viens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chi_tiet_dat_lichs`
--
ALTER TABLE `chi_tiet_dat_lichs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_phieu_dat_lich` (`id_phieu_dat_lich`),
  ADD KEY `id_bac_si` (`id_bac_si`);

--
-- Chỉ mục cho bảng `chuc_nangs`
--
ALTER TABLE `chuc_nangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chuc_vus`
--
ALTER TABLE `chuc_vus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chuyen_khoas`
--
ALTER TABLE `chuyen_khoas`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chuyen_nganhs`
--
ALTER TABLE `chuyen_nganhs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lich_lam_viecs`
--
ALTER TABLE `lich_lam_viecs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bac_si` (`id_bac_si`);

--
-- Chỉ mục cho bảng `phan_quyens`
--
ALTER TABLE `phan_quyens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_chuc_nang` (`id_chuc_nang`),
  ADD KEY `id_chuc_vu` (`id_chuc_vu`);

--
-- Chỉ mục cho bảng `phieu_dat_lichs`
--
ALTER TABLE `phieu_dat_lichs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_benh_nhan` (`id_benh_nhan`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ten_role` (`ten_role`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bacsi_chuyennganh`
--
ALTER TABLE `bacsi_chuyennganh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bac_sis`
--
ALTER TABLE `bac_sis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `benh_nhans`
--
ALTER TABLE `benh_nhans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `benh_viens`
--
ALTER TABLE `benh_viens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_dat_lichs`
--
ALTER TABLE `chi_tiet_dat_lichs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chuc_nangs`
--
ALTER TABLE `chuc_nangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chuc_vus`
--
ALTER TABLE `chuc_vus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chuyen_khoas`
--
ALTER TABLE `chuyen_khoas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chuyen_nganhs`
--
ALTER TABLE `chuyen_nganhs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lich_lam_viecs`
--
ALTER TABLE `lich_lam_viecs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phan_quyens`
--
ALTER TABLE `phan_quyens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phieu_dat_lichs`
--
ALTER TABLE `phieu_dat_lichs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`id_chuc_vu`) REFERENCES `chuc_vus` (`id`);

--
-- Các ràng buộc cho bảng `bacsi_chuyennganh`
--
ALTER TABLE `bacsi_chuyennganh`
  ADD CONSTRAINT `bacsi_chuyennganh_ibfk_1` FOREIGN KEY (`id_bac_si`) REFERENCES `bac_sis` (`id`),
  ADD CONSTRAINT `bacsi_chuyennganh_ibfk_2` FOREIGN KEY (`id_chuyen_nganh`) REFERENCES `chuyen_nganhs` (`id`);

--
-- Các ràng buộc cho bảng `bac_sis`
--
ALTER TABLE `bac_sis`
  ADD CONSTRAINT `bac_sis_ibfk_1` FOREIGN KEY (`id_benh_vien`) REFERENCES `benh_viens` (`id`);

--
-- Các ràng buộc cho bảng `chi_tiet_dat_lichs`
--
ALTER TABLE `chi_tiet_dat_lichs`
  ADD CONSTRAINT `chi_tiet_dat_lichs_ibfk_1` FOREIGN KEY (`id_phieu_dat_lich`) REFERENCES `phieu_dat_lichs` (`id`),
  ADD CONSTRAINT `chi_tiet_dat_lichs_ibfk_2` FOREIGN KEY (`id_bac_si`) REFERENCES `bac_sis` (`id`);

--
-- Các ràng buộc cho bảng `lich_lam_viecs`
--
ALTER TABLE `lich_lam_viecs`
  ADD CONSTRAINT `lich_lam_viecs_ibfk_1` FOREIGN KEY (`id_bac_si`) REFERENCES `bac_sis` (`id`);

--
-- Các ràng buộc cho bảng `phan_quyens`
--
ALTER TABLE `phan_quyens`
  ADD CONSTRAINT `phan_quyens_ibfk_1` FOREIGN KEY (`id_chuc_nang`) REFERENCES `chuc_nangs` (`id`),
  ADD CONSTRAINT `phan_quyens_ibfk_2` FOREIGN KEY (`id_chuc_vu`) REFERENCES `chuc_vus` (`id`);

--
-- Các ràng buộc cho bảng `phieu_dat_lichs`
--
ALTER TABLE `phieu_dat_lichs`
  ADD CONSTRAINT `phieu_dat_lichs_ibfk_1` FOREIGN KEY (`id_benh_nhan`) REFERENCES `benh_nhans` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
