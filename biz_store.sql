-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 10:59 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biz_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `delivery_ordes`
--

CREATE TABLE `delivery_ordes` (
  `id` int(11) NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `delivery_city` varchar(255) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `transaction_ref` varchar(100) NOT NULL,
  `payment_status` enum('pending','completed','','') NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_color` varchar(100) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `transaction_ref` varchar(255) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_name`, `product_price`, `product_color`, `full_name`, `email`, `address`, `city`, `state`, `zip`, `transaction_ref`, `total_amount`, `created_at`) VALUES
(1, 'Tailored Jeans', 9.00, 'Blue', 'Joshua Akinremi', 'akinremijoshua9@gmail.com', '11,Royal crescent ayetoro itele ogun state', 'Ayetoro', 'Ogun', '112104', '101073151', 18.00, '2024-08-19 08:30:52'),
(2, 'Tailored Jeans', 9.00, 'Blue', 'Joshua Akinremi', 'akinremijoshua9@gmail.com', '11,Royal crescent ayetoro itele ogun state', 'Ayetoro', 'Ogun', '112104', '949490113', 18.00, '2024-08-19 08:40:03'),
(3, 'Tailored Jeans', 9.00, 'Blue', 'Joshua Akinremi', 'akinremijoshua9@gmail.com', '11,Royal crescent ayetoro itele ogun state', 'Ayetoro', 'Ogun', '112104', '949490113', 18.00, '2024-08-19 08:40:03'),
(4, 'Tailored Jeans', 9.00, 'Blue', 'Joshua Akinremi', 'akinremijoshua9@gmail.com', '11,Royal crescent ayetoro itele ogun state', 'Ayetoro', 'Ogun', '112104', '587812955', 36.00, '2024-08-19 08:43:23'),
(5, 'Tailored Jeans', 9.00, 'Blue', 'Joshua Akinremi', 'akinremijoshua9@gmail.com', '11,Royal crescent ayetoro itele ogun state', 'Ayetoro', 'Ogun', '112104', '587812955', 36.00, '2024-08-19 08:43:23'),
(6, 'Tailored Jeans', 9.00, 'Blue', 'Joshua Akinremi', 'akinremijoshua9@gmail.com', '11,Royal crescent ayetoro itele ogun state', 'Ayetoro', 'Ogun', '112104', '587812955', 36.00, '2024-08-19 08:43:23'),
(7, 'Tailored Jeans', 9.00, 'Blue', 'Joshua Akinremi', 'akinremijoshua9@gmail.com', '11,Royal crescent ayetoro itele ogun state', 'Ayetoro', 'Ogun', '112104', '587812955', 36.00, '2024-08-19 08:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'akinremiibukun@gmail.com', '$2y$10$rzPw2Whh4TBiDykEjOxZCu7/TCwuz/MskObq2JyIGpvnUoYGOO7I6', '2024-08-13 22:55:27', '2024-08-13 22:55:27'),
(2, 'bayo@gmail.com', '$2y$10$pMtplzWLXN8bDE7qMjceYu2vFDlHVbOR6uobXBFwvLsaW8HPHnmU.', '2024-08-14 09:23:03', '2024-08-14 09:23:03'),
(3, 'lola@gmail.com', '$2y$10$Y4LgUa4.sBiPRumQ0Xncw.uP73QSXotjxeQEbdwvIcLbIVEKVEMQm', '2024-08-14 10:18:25', '2024-08-14 10:18:25'),
(4, 'yomi@gmail.com', '$2y$10$IFcSiGWeV4K.KY3fKnwZo.HkXAiUEPWww61nalxYyiH6DzGui89YC', '2024-08-14 10:28:26', '2024-08-14 10:28:26'),
(5, 'gbemi@gmail.com', '$2y$10$n68Nk0cvUGuaqWZ0qmKJiOMU0.pZbOUHEhThKvlQRSBKV35sIy9fS', '2024-08-14 10:49:20', '2024-08-14 10:49:20'),
(6, 'tomi@gmail.com', '$2y$10$OjCaE7MPBTDW7ez8IZAvxOihHSHqCvoIjJZpBCvPFPFqQasEmIxHu', '2024-08-14 10:50:37', '2024-08-14 10:50:37'),
(7, 'pelumi@gmail.com', '$2y$10$M7tQ0.RhRu3OQM22ylPZYulHIMyWfh2xpGX7Ntsn06A8akgg/Llhy', '2024-08-14 10:54:57', '2024-08-14 10:54:57'),
(8, 'bola@gmail.com', '$2y$10$yjlyCaQ0IebwBABEz5CaKOhNDRo2wxQXeO78LPqV1Vn0Qvc4pJNOO', '2024-08-14 11:28:31', '2024-08-14 11:28:31'),
(9, 'femi@gmail.com', '$2y$10$lAKt8j9rR4i3hFxb580Y/O5Gl09U/puEDK2VAI8OuZOud1suG/sn6', '2024-08-14 11:32:42', '2024-08-14 11:32:42'),
(10, 'wale@gmail.com', '$2y$10$oSgl7zlAmE81pUah9eRNaOGAJM0cmbYHqLMbCcjNJq0hEHkVBNFOK', '2024-08-14 11:42:05', '2024-08-14 11:42:05'),
(11, 'yemi@gmail.com', '$2y$10$jOQiDqpaeioJvfUXrBjFj.t58vVXhtWItYwLlRpDgM2DXBLM66aIW', '2024-08-14 12:10:45', '2024-08-14 12:10:45'),
(12, 'posi@gmail.com', '$2y$10$o9nOtSyC8BGpmgsi8MsFlO/QAj5GqPB0zuG8hg0JdEK3VwwKnXBiO', '2024-08-14 12:13:57', '2024-08-14 12:13:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery_ordes`
--
ALTER TABLE `delivery_ordes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery_ordes`
--
ALTER TABLE `delivery_ordes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
