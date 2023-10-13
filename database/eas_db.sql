-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 28 Jun 2023 pada 12.03
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eas_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `username` char(6) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `department_id` char(3) NOT NULL,
  `shift_id` int(1) NOT NULL,
  `location_id` int(1) NOT NULL,
  `in_time` int(11) NOT NULL,
  `notes` varchar(120) NOT NULL,
  `image` varchar(50) NOT NULL,
  `lack_of` varchar(11) NOT NULL,
  `in_status` varchar(15) NOT NULL,
  `out_time` int(11) NOT NULL,
  `out_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `attendance`
--

INSERT INTO `attendance` (`id`, `username`, `employee_id`, `department_id`, `shift_id`, `location_id`, `in_time`, `notes`, `image`, `lack_of`, `in_status`, `out_time`, `out_status`) VALUES
(78, 'ITD031', 031, 'ITD', 1, 1, 1687753078, 'sorry, i late', '', 'None,image', 'Late', 1687770531, 'Early'),
(79, 'HRD032', 032, 'HRD', 1, 1, 1687753111, 'i''m sick', '', 'None,image', 'Late', 1687777136, 'Over Time'),
(81, 'HRD032', 032, 'HRD', 1, 1, 1687827274, 'Yeah', 'item-230627-0829da38b0.jpg', 'None', 'On Time', 1687859264, 'Early'),
(82, 'ITD031', 031, 'ITD', 1, 1, 1687859770, 'sorry', 'item-230627-15adc2044e.png', 'None', 'Late', 1687859777, 'Early'),
(83, 'ITD031', 031, 'ITD', 1, 2, 1687913126, 'WFO', 'item-230628-9ed017d737.png', 'None', 'On Time', 1687944323, 'Early'),
(84, 'HRD032', 032, 'HRD', 1, 1, 1687913164, 'WFH', 'item-230628-4a716f7ba0.jpg', 'None', 'On Time', 1687946485, 'Over Time');

-- --------------------------------------------------------

--
-- Struktur dari tabel `department`
--

CREATE TABLE `department` (
  `id` char(3) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
('ACD', 'Accounting Department'),
('ADM', 'Admin Department'),
('HRD', 'Human Resource Department'),
('ITD', 'Information Technology Department - Updated'),
('PCD', 'Production Controller Department'),
('PLD', 'Planner Department'),
('QCD', 'Quality Control Department'),
('SCD', 'Security Department'),
('STD', 'Store Department');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `gender` char(1) NOT NULL,
  `image` varchar(128) NOT NULL,
  `birth_date` date NOT NULL,
  `hire_date` date NOT NULL,
  `shift_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `gender`, `image`, `birth_date`, `hire_date`, `shift_id`) VALUES
(001, 'John Smith', 'jsmith@mail.com', 'M', 'default.png', '1996-07-15', '2020-03-05', 7),
(025, 'Admin ', 'admin@admin.com', 'M', 'default.png', '0000-00-00', '0000-00-00', 0),
(028, 'Mark Cooper', 'mcooper@mail.com', 'M', 'item-220609-64856edd56.png', '1997-06-23', '2021-04-20', 7),
(030, 'Claire Blake', 'cblake@mail.com', 'F', 'item-220609-97e2f7f0fe.png', '1997-10-14', '2020-03-05', 7),
(031, 'Reza Irsyad', 'rezairsyad96@gmail.com', 'M', 'item-230623-358c850b38.png', '1996-09-12', '2023-04-24', 1),
(032, 'Joana', 'joana@gmail.com', 'M', 'item-230623-58ea24488c.jpg', '1995-04-23', '2023-02-02', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee_department`
--

CREATE TABLE `employee_department` (
  `id` int(3) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `department_id` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `employee_department`
--

INSERT INTO `employee_department` (`id`, `employee_id`, `department_id`) VALUES
(1, 001, 'HRD'),
(2, 002, 'ACD'),
(3, 003, 'QCD'),
(4, 004, 'SCD'),
(5, 005, 'STD'),
(6, 006, 'ACD'),
(7, 007, 'PLD'),
(8, 008, 'STD'),
(9, 009, 'STD'),
(10, 010, 'PCD'),
(21, 011, 'ADM'),
(25, 024, 'HRD'),
(26, 026, 'STD'),
(27, 027, 'QCD'),
(28, 028, 'ITD'),
(30, 030, 'HRD'),
(31, 031, 'ITD'),
(32, 032, 'HRD');

-- --------------------------------------------------------

--
-- Struktur dari tabel `location`
--

CREATE TABLE `location` (
  `id` int(1) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `location`
--

INSERT INTO `location` (`id`, `name`) VALUES
(1, 'Home'),
(2, 'Office'),
(3, 'Store'),
(4, 'Site'),
(6, 'Field'),
(7, 'XYZ Client Office');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shift`
--

CREATE TABLE `shift` (
  `id` int(1) NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shift`
--

INSERT INTO `shift` (`id`, `start`, `end`) VALUES
(1, '08:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `username` char(6) NOT NULL,
  `password` varchar(128) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `role_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`username`, `password`, `employee_id`, `role_id`) VALUES
('ACD002', '$2y$10$5nv5ehyMVdljfKJ6izsOqOimsbv.cbzU.XLB9ji9zbA.eICdSrNvO', 002, 2),
('ADM011', '$2y$10$BKpQcs4XKavCcYdFWujzx.Xqb7r9eNkDrOYss2VNXrMJUUpm1agUC', 011, 2),
('admin', '$2y$10$tG8hnh7w.yiJL7fjlRCmkuHBwi0QI6DHFXmc1s6X3cAFuw5pRfO/O', 025, 1),
('admin1', '8af0ce0e22fa0d2c0c48ff69165e4075', 070, 1),
('HRD032', '$2y$10$dz45QLMcHCyBoN1Unr3uvOm4EYR6dZh5GUtsZ8DC97OEEb1lEpG3.', 032, 2),
('ITD031', '$2y$10$DZRoD6x2KKee3G9Mm3.UxOU6W.ndsM7JFWvL3J8YXRx3oY1p6r5Ma', 031, 2),
('PCD010', '$2y$10$BKpQcs4XKavCcYdFWujzx.Xqb7r9eNkDrOYss2VNXrMJUUpm1agUC', 010, 2),
('QCD027', '$2y$10$peALJo.JKZyD6uMBd41UfuHGQSJe7ExOfDhPITvDbSRRXeWUGY9xy', 027, 2),
('STD005', '$2y$10$hr35h1fIySFYCSRVL2jRD.RuYa9WtJCEJkkqvQfPboYK7VwURpLim', 005, 2),
('STD008', '$2y$10$8PGnFaiZPYtcIGrwzMmVZuNKbUb/A88f0NZOA9QVgHaUIJ6ddg.Si', 008, 2),
('STD026', '$2y$10$8WNMvEEgNPWyRuSeeLDE1uXwnBkYNJE/heLT1zWbsUfYb/wKFyYIy', 026, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access`
--

CREATE TABLE `user_access` (
  `id` int(2) NOT NULL,
  `role_id` int(1) NOT NULL,
  `menu_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_access`
--

INSERT INTO `user_access` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(2) NOT NULL,
  `menu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'Master'),
(3, 'Attendance'),
(4, 'Profile'),
(5, 'Report');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(1) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Employee');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_submenu`
--

CREATE TABLE `user_submenu` (
  `id` int(2) NOT NULL,
  `menu_id` int(2) NOT NULL,
  `title` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_submenu`
--

INSERT INTO `user_submenu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'Department', 'master', 'fas fa-fw fa-building', 1),
(3, 2, 'Shift', 'master/shift', 'fas fa-fw fa-exchange-alt', 1),
(4, 2, 'Employee', 'master/employee', 'fas fa-fw fa-id-badge', 1),
(5, 2, 'Location', 'master/location', 'fas fa-fw fa-map-marker-alt', 1),
(6, 3, 'Attendance Form', 'attendance', 'fas fa-fw fa-clipboard-list', 1),
(7, 3, 'Statistics', 'attendance/stats', 'fas fa-fw fa-chart-pie', 0),
(8, 4, 'My Profile', 'profile', 'fas fa-fw fa-id-card', 1),
(9, 2, 'Users', 'master/users', 'fas fa-fw fa-users', 1),
(11, 5, 'Print Report', 'report', 'fas fa-fw fa-paste', 1),
(12, 3, 'History', 'attendance/history', 'fas fa-fw fa-th-list', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shift_id_fk_e` (`shift_id`);

--
-- Indexes for table `employee_department`
--
ALTER TABLE `employee_department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_department_ibfk_1` (`employee_id`),
  ADD KEY `employee_department_ibfk_2` (`department_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_submenu`
--
ALTER TABLE `user_submenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `employee_department`
--
ALTER TABLE `employee_department`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_access`
--
ALTER TABLE `user_access`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_submenu`
--
ALTER TABLE `user_submenu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
