-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 05, 2025 at 09:34 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `answer` varchar(255) NOT NULL,
  `is_correct` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

DROP TABLE IF EXISTS `exam_results`;
CREATE TABLE IF NOT EXISTS `exam_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `score` decimal(5,2) NOT NULL,
  `exam_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int DEFAULT NULL,
  `question` text NOT NULL,
  `options` json NOT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `subject_id`, `question`, `options`, `correct_answer`, `created_at`) VALUES
(103, 1, 'Mô hình thác nước có mấy giai đoạn chính?', '{\"A\": \"4\", \"B\": \"5\", \"C\": \"6\", \"D\": \"7\"}', 'B', '2025-04-02 14:03:16'),
(104, 1, 'Agile là phương pháp phát triển phần mềm gì?', '{\"A\": \"Truyền thống\", \"B\": \"Linh hoạt\", \"C\": \"Mô hình thác nước\", \"D\": \"Không có đáp án đúng\"}', 'B', '2025-04-02 14:03:16'),
(105, 1, 'Scrum là gì trong phát triển phần mềm?', '{\"A\": \"Một quy trình phát triển\", \"B\": \"Một ngôn ngữ lập trình\", \"C\": \"Một hệ điều hành\", \"D\": \"Một công cụ thiết kế\"}', 'A', '2025-04-02 14:03:16'),
(106, 1, 'Trong mô hình Agile, vai trò Product Owner là gì?', '{\"A\": \"Quản lý dự án\", \"B\": \"Lập trình viên\", \"C\": \"Định nghĩa yêu cầu sản phẩm\", \"D\": \"Kiểm thử viên\"}', 'C', '2025-04-02 14:03:16'),
(107, 1, 'Extreme Programming (XP) là gì?', '{\"A\": \"Một phương pháp phát triển phần mềm\", \"B\": \"Một phần mềm quản lý\", \"C\": \"Một hệ điều hành\", \"D\": \"Một công cụ kiểm thử\"}', 'A', '2025-04-02 14:03:16'),
(108, 1, 'Use Case Diagram được sử dụng để làm gì?', '{\"A\": \"Thiết kế cơ sở dữ liệu\", \"B\": \"Mô tả các chức năng hệ thống\", \"C\": \"Lập trình phần mềm\", \"D\": \"Quản lý tiến độ dự án\"}', 'B', '2025-04-02 14:03:16'),
(109, 1, 'Mô hình phát triển phần mềm nào chú trọng vào phản hồi nhanh?', '{\"A\": \"Mô hình thác nước\", \"B\": \"Mô hình Agile\", \"C\": \"Mô hình chữ V\", \"D\": \"Mô hình xoắn ốc\"}', 'B', '2025-04-02 14:03:16'),
(110, 1, 'Phần mềm nguồn mở là gì?', '{\"A\": \"Phần mềm miễn phí\", \"B\": \"Phần mềm có mã nguồn công khai\", \"C\": \"Phần mềm thương mại\", \"D\": \"Phần mềm dùng thử\"}', 'B', '2025-04-02 14:03:16'),
(111, 1, 'Kiểm thử phần mềm có mấy mức chính?', '{\"A\": \"2\", \"B\": \"3\", \"C\": \"4\", \"D\": \"5\"}', 'C', '2025-04-02 14:03:16'),
(112, 1, 'Unit Test là gì?', '{\"A\": \"Kiểm thử hệ thống\", \"B\": \"Kiểm thử đơn vị\", \"C\": \"Kiểm thử tích hợp\", \"D\": \"Kiểm thử chấp nhận\"}', 'B', '2025-04-02 14:03:16'),
(113, 1, 'Mô hình xoắn ốc có bao nhiêu giai đoạn chính?', '{\"A\": \"2\", \"B\": \"3\", \"C\": \"4\", \"D\": \"5\"}', 'C', '2025-04-02 14:03:16'),
(114, 1, 'Mục tiêu chính của Kiểm thử phần mềm là gì?', '{\"A\": \"Phát hiện lỗi\", \"B\": \"Cải thiện hiệu suất\", \"C\": \"Tối ưu hóa mã nguồn\", \"D\": \"Giảm chi phí phát triển\"}', 'A', '2025-04-02 14:03:16'),
(115, 1, 'Thiết kế phần mềm hướng đối tượng sử dụng mô hình nào?', '{\"A\": \"ERD\", \"B\": \"UML\", \"C\": \"DFD\", \"D\": \"RAD\"}', 'B', '2025-04-02 14:03:16'),
(116, 1, 'Trong phát triển phần mềm, RAD là viết tắt của gì?', '{\"A\": \"Rapid Application Development\", \"B\": \"Real-time Application Deployment\", \"C\": \"Random Access Data\", \"D\": \"Reliable Application Design\"}', 'A', '2025-04-02 14:03:16'),
(117, 1, 'Khái niệm “Software Engineering” đề cập đến điều gì?', '{\"A\": \"Phát triển phần mềm một cách có hệ thống\", \"B\": \"Lập trình phần mềm\", \"C\": \"Kiểm thử phần mềm\", \"D\": \"Quản lý phần mềm\"}', 'A', '2025-04-02 14:03:16'),
(118, 1, 'Một phần mềm tốt cần đáp ứng tiêu chí nào?', '{\"A\": \"Hiệu suất cao\", \"B\": \"Dễ bảo trì\", \"C\": \"Thân thiện với người dùng\", \"D\": \"Tất cả các đáp án trên\"}', 'D', '2025-04-02 14:03:16'),
(119, 1, 'Phân tích yêu cầu phần mềm được thực hiện trong giai đoạn nào?', '{\"A\": \"Thiết kế\", \"B\": \"Lập trình\", \"C\": \"Phân tích\", \"D\": \"Kiểm thử\"}', 'C', '2025-04-02 14:03:16'),
(120, 1, 'Kiến trúc MVC gồm mấy thành phần chính?', '{\"A\": \"2\", \"B\": \"3\", \"C\": \"4\", \"D\": \"5\"}', 'B', '2025-04-02 14:03:16'),
(121, 1, 'Yếu tố nào ảnh hưởng lớn đến tiến độ dự án phần mềm?', '{\"A\": \"Quy mô dự án\", \"B\": \"Khả năng của đội ngũ phát triển\", \"C\": \"Công nghệ sử dụng\", \"D\": \"Tất cả các yếu tố trên\"}', 'D', '2025-04-02 14:03:16'),
(122, 1, 'Tại sao phần mềm cần bảo trì?', '{\"A\": \"Do lỗi phát sinh\", \"B\": \"Do yêu cầu mới\", \"C\": \"Do thay đổi môi trường\", \"D\": \"Tất cả các lý do trên\"}', 'D', '2025-04-02 14:03:16'),
(123, 1, 'Mô hình Agile có ưu điểm gì?', '{\"A\": \"Linh hoạt\", \"B\": \"Giảm thiểu rủi ro\", \"C\": \"Tăng tốc phát triển\", \"D\": \"Tất cả các đáp án trên\"}', 'D', '2025-04-02 14:03:16'),
(124, 1, 'Chức năng chính của DevOps là gì?', '{\"A\": \"Tích hợp phát triển và vận hành\", \"B\": \"Quản lý cơ sở dữ liệu\", \"C\": \"Thiết kế giao diện\", \"D\": \"Phân tích yêu cầu\"}', 'A', '2025-04-02 14:03:16'),
(125, 1, 'Yếu tố nào quan trọng trong kiểm thử phần mềm?', '{\"A\": \"Độ phủ kiểm thử\", \"B\": \"Tính tự động hóa\", \"C\": \"Độ tin cậy\", \"D\": \"Tất cả các yếu tố trên\"}', 'D', '2025-04-02 14:03:16'),
(126, 1, 'Pair Programming trong Extreme Programming là gì?', '{\"A\": \"Hai lập trình viên làm việc cùng nhau\", \"B\": \"Lập trình theo cặp module\", \"C\": \"Lập trình đôi cho đa nhiệm vụ\", \"D\": \"Lập trình nhóm lớn\"}', 'A', '2025-04-02 14:03:16'),
(127, 1, 'Continuous Integration (CI) giúp gì trong phát triển phần mềm?', '{\"A\": \"Kiểm thử tự động\", \"B\": \"Tích hợp mã thường xuyên\", \"C\": \"Triển khai nhanh chóng\", \"D\": \"Tối ưu hóa hiệu suất\"}', 'B', '2025-04-02 14:03:16'),
(128, 2, 'Giao thức nào được sử dụng để gửi email?', '{\"A\": \"HTTP\", \"B\": \"SMTP\", \"C\": \"FTP\", \"D\": \"POP3\"}', 'B', '2025-04-02 18:54:29'),
(129, 2, 'Địa chỉ IPv4 có bao nhiêu bit?', '{\"A\": \"32\", \"B\": \"64\", \"C\": \"128\", \"D\": \"256\"}', 'A', '2025-04-02 18:54:29'),
(130, 2, 'Giao thức nào được sử dụng để truyền tệp giữa các máy tính?', '{\"A\": \"FTP\", \"B\": \"HTTP\", \"C\": \"SMTP\", \"D\": \"TCP\"}', 'A', '2025-04-02 18:54:29'),
(131, 2, 'Cổng mặc định của HTTP là gì?', '{\"A\": \"21\", \"B\": \"25\", \"C\": \"80\", \"D\": \"443\"}', 'C', '2025-04-02 18:54:29'),
(132, 2, 'Lớp nào trong mô hình OSI chịu trách nhiệm định tuyến dữ liệu?', '{\"A\": \"Lớp 2\", \"B\": \"Lớp 3\", \"C\": \"Lớp 4\", \"D\": \"Lớp 7\"}', 'B', '2025-04-02 18:54:29'),
(133, 2, 'Thiết bị nào hoạt động ở lớp 3 của mô hình OSI?', '{\"A\": \"Hub\", \"B\": \"Switch\", \"C\": \"Router\", \"D\": \"Repeater\"}', 'C', '2025-04-02 18:54:29'),
(134, 2, 'Giao thức nào sử dụng cổng 443?', '{\"A\": \"HTTP\", \"B\": \"HTTPS\", \"C\": \"FTP\", \"D\": \"SMTP\"}', 'B', '2025-04-02 18:54:29'),
(135, 2, 'Mô hình OSI có bao nhiêu lớp?', '{\"A\": \"5\", \"B\": \"6\", \"C\": \"7\", \"D\": \"8\"}', 'C', '2025-04-02 18:54:29'),
(136, 2, 'Lớp nào trong mô hình OSI chịu trách nhiệm truyền dữ liệu dạng thô (bit)?', '{\"A\": \"Lớp 1\", \"B\": \"Lớp 2\", \"C\": \"Lớp 3\", \"D\": \"Lớp 4\"}', 'A', '2025-04-02 18:54:29'),
(137, 2, 'Giao thức nào được sử dụng để phân giải tên miền thành địa chỉ IP?', '{\"A\": \"HTTP\", \"B\": \"FTP\", \"C\": \"DNS\", \"D\": \"SMTP\"}', 'C', '2025-04-02 18:54:29'),
(138, 2, 'Subnet mask của lớp A là gì?', '{\"A\": \"255.0.0.0\", \"B\": \"255.255.0.0\", \"C\": \"255.255.255.0\", \"D\": \"255.255.255.255\"}', 'A', '2025-04-02 18:54:29'),
(139, 2, 'Giao thức nào không thuộc tầng Transport?', '{\"A\": \"TCP\", \"B\": \"UDP\", \"C\": \"IP\", \"D\": \"SCTP\"}', 'C', '2025-04-02 18:54:29'),
(140, 2, 'IPv6 có bao nhiêu bit?', '{\"A\": \"32\", \"B\": \"64\", \"C\": \"128\", \"D\": \"256\"}', 'C', '2025-04-02 18:54:29'),
(141, 2, 'Giao thức nào không được sử dụng trong việc truyền email?', '{\"A\": \"SMTP\", \"B\": \"POP3\", \"C\": \"IMAP\", \"D\": \"SNMP\"}', 'D', '2025-04-02 18:54:29'),
(142, 2, 'Cổng mặc định của SSH là gì?', '{\"A\": \"22\", \"B\": \"23\", \"C\": \"80\", \"D\": \"443\"}', 'A', '2025-04-02 18:54:29'),
(143, 2, 'Giao thức nào đảm bảo độ tin cậy trong truyền dữ liệu?', '{\"A\": \"TCP\", \"B\": \"UDP\", \"C\": \"IP\", \"D\": \"ICMP\"}', 'A', '2025-04-02 18:54:29'),
(144, 2, 'Giao thức nào được sử dụng để truyền dữ liệu không kết nối?', '{\"A\": \"TCP\", \"B\": \"UDP\", \"C\": \"HTTP\", \"D\": \"FTP\"}', 'B', '2025-04-02 18:54:29'),
(145, 2, 'Lớp nào trong mô hình OSI liên quan đến mã hóa dữ liệu?', '{\"A\": \"Lớp 4\", \"B\": \"Lớp 5\", \"C\": \"Lớp 6\", \"D\": \"Lớp 7\"}', 'C', '2025-04-02 18:54:29'),
(146, 2, 'Băng thông được đo bằng đơn vị nào?', '{\"A\": \"ms\", \"B\": \"bps\", \"C\": \"MHz\", \"D\": \"dB\"}', 'B', '2025-04-02 18:54:29'),
(147, 2, 'Giao thức ARP có chức năng gì?', '{\"A\": \"Phân giải địa chỉ IP sang MAC\", \"B\": \"Phân giải tên miền\", \"C\": \"Truyền email\", \"D\": \"Mã hóa dữ liệu\"}', 'A', '2025-04-02 18:54:29'),
(148, 2, 'ICMP được sử dụng trong lệnh nào?', '{\"A\": \"ping\", \"B\": \"telnet\", \"C\": \"ftp\", \"D\": \"ssh\"}', 'A', '2025-04-02 18:54:29'),
(149, 2, 'Lớp nào trong mô hình OSI chịu trách nhiệm quản lý phiên kết nối?', '{\"A\": \"Lớp 2\", \"B\": \"Lớp 4\", \"C\": \"Lớp 5\", \"D\": \"Lớp 7\"}', 'C', '2025-04-02 18:54:29'),
(150, 2, 'Cổng nào là cổng mặc định của Telnet?', '{\"A\": \"21\", \"B\": \"22\", \"C\": \"23\", \"D\": \"25\"}', 'C', '2025-04-02 18:54:29'),
(151, 2, 'Dịch vụ nào được sử dụng để chuyển đổi địa chỉ IP thành tên miền?', '{\"A\": \"ARP\", \"B\": \"DNS\", \"C\": \"DHCP\", \"D\": \"ICMP\"}', 'B', '2025-04-02 18:54:29'),
(152, 3, 'SQL là viết tắt của gì?', '{\"A\": \"Structured Query Language\", \"B\": \"Sequential Query Language\", \"C\": \"Standard Query List\", \"D\": \"Script Query Language\"}', 'A', '2025-04-02 18:59:19'),
(153, 3, 'Ràng buộc PRIMARY KEY đảm bảo điều gì?', '{\"A\": \"Không có giá trị NULL\", \"B\": \"Không có giá trị trùng lặp\", \"C\": \"Cả A và B\", \"D\": \"Không có khóa ngoại\"}', 'C', '2025-04-02 18:59:19'),
(154, 3, 'Mệnh đề nào được sử dụng để lọc dữ liệu trong SQL?', '{\"A\": \"ORDER BY\", \"B\": \"GROUP BY\", \"C\": \"WHERE\", \"D\": \"JOIN\"}', 'C', '2025-04-02 18:59:19'),
(155, 3, 'Câu lệnh nào dùng để xóa toàn bộ dữ liệu trong bảng mà không xóa cấu trúc bảng?', '{\"A\": \"DELETE\", \"B\": \"DROP\", \"C\": \"TRUNCATE\", \"D\": \"REMOVE\"}', 'C', '2025-04-02 18:59:19'),
(156, 3, 'Ràng buộc FOREIGN KEY dùng để làm gì?', '{\"A\": \"Tạo chỉ mục\", \"B\": \"Đảm bảo giá trị duy nhất\", \"C\": \"Liên kết bảng\", \"D\": \"Tạo khóa chính\"}', 'C', '2025-04-02 18:59:19'),
(157, 3, 'DML trong SQL là viết tắt của gì?', '{\"A\": \"Data Manipulation Language\", \"B\": \"Data Management Language\", \"C\": \"Data Markup Language\", \"D\": \"Database Manipulation Language\"}', 'A', '2025-04-02 18:59:19'),
(158, 3, 'Mệnh đề nào trong SQL được sử dụng để nhóm kết quả?', '{\"A\": \"WHERE\", \"B\": \"ORDER BY\", \"C\": \"GROUP BY\", \"D\": \"HAVING\"}', 'C', '2025-04-02 18:59:19'),
(159, 3, 'Câu lệnh SQL nào được sử dụng để lấy dữ liệu từ bảng?', '{\"A\": \"SELECT\", \"B\": \"FETCH\", \"C\": \"GET\", \"D\": \"READ\"}', 'A', '2025-04-02 18:59:19'),
(160, 3, 'Từ khóa nào trong SQL được sử dụng để sắp xếp dữ liệu theo thứ tự giảm dần?', '{\"A\": \"ASC\", \"B\": \"DESC\", \"C\": \"ORDER\", \"D\": \"BY\"}', 'B', '2025-04-02 18:59:19'),
(161, 3, 'Câu lệnh SQL nào dùng để thêm một bản ghi vào bảng?', '{\"A\": \"INSERT INTO\", \"B\": \"ADD RECORD\", \"C\": \"NEW RECORD\", \"D\": \"APPEND\"}', 'A', '2025-04-02 18:59:19'),
(162, 3, 'Ràng buộc nào đảm bảo rằng một cột không chứa giá trị NULL?', '{\"A\": \"CHECK\", \"B\": \"DEFAULT\", \"C\": \"NOT NULL\", \"D\": \"PRIMARY KEY\"}', 'C', '2025-04-02 18:59:19'),
(163, 3, 'Câu lệnh nào dùng để sửa đổi dữ liệu trong bảng SQL?', '{\"A\": \"UPDATE\", \"B\": \"MODIFY\", \"C\": \"CHANGE\", \"D\": \"ALTER\"}', 'A', '2025-04-02 18:59:19'),
(164, 3, 'Giao dịch trong SQL có đặc tính nào?', '{\"A\": \"ACID\", \"B\": \"BASE\", \"C\": \"CAP\", \"D\": \"JSON\"}', 'A', '2025-04-02 18:59:19'),
(165, 3, 'Lệnh nào dùng để xóa bảng khỏi cơ sở dữ liệu?', '{\"A\": \"DROP TABLE\", \"B\": \"DELETE TABLE\", \"C\": \"REMOVE TABLE\", \"D\": \"CLEAR TABLE\"}', 'A', '2025-04-02 18:59:19'),
(166, 3, 'Mệnh đề nào trong SQL dùng để kết hợp các bảng?', '{\"A\": \"CONNECT\", \"B\": \"JOIN\", \"C\": \"MERGE\", \"D\": \"COMBINE\"}', 'B', '2025-04-02 18:59:19'),
(167, 3, 'Chỉ mục (Index) trong cơ sở dữ liệu dùng để làm gì?', '{\"A\": \"Tăng tốc truy vấn\", \"B\": \"Tạo khóa chính\", \"C\": \"Tạo bảng\", \"D\": \"Lưu trữ dữ liệu\"}', 'A', '2025-04-02 18:59:19'),
(168, 3, 'Lệnh nào trong SQL được sử dụng để đếm số bản ghi trong bảng?', '{\"A\": \"SUM()\", \"B\": \"COUNT()\", \"C\": \"TOTAL()\", \"D\": \"NUMBER()\"}', 'B', '2025-04-02 18:59:19'),
(169, 3, 'Loại khóa nào có thể nhận giá trị NULL?', '{\"A\": \"Primary Key\", \"B\": \"Foreign Key\", \"C\": \"Unique Key\", \"D\": \"Super Key\"}', 'B', '2025-04-02 18:59:19'),
(170, 3, 'Câu lệnh nào được sử dụng để tạo bảng trong SQL?', '{\"A\": \"CREATE DATABASE\", \"B\": \"MAKE TABLE\", \"C\": \"CREATE TABLE\", \"D\": \"NEW TABLE\"}', 'C', '2025-04-02 18:59:19'),
(171, 3, 'Câu lệnh nào dùng để đổi tên bảng trong SQL?', '{\"A\": \"MODIFY TABLE\", \"B\": \"ALTER TABLE\", \"C\": \"RENAME TABLE\", \"D\": \"CHANGE TABLE\"}', 'C', '2025-04-02 18:59:19'),
(172, 3, 'Hàm nào trong SQL dùng để lấy giá trị lớn nhất của một cột?', '{\"A\": \"MAX()\", \"B\": \"LARGEST()\", \"C\": \"GREATEST()\", \"D\": \"TOP()\"}', 'A', '2025-04-02 18:59:19'),
(173, 3, 'Hàm nào trong SQL được sử dụng để tính tổng giá trị của một cột?', '{\"A\": \"SUM()\", \"B\": \"ADD()\", \"C\": \"TOTAL()\", \"D\": \"COUNT()\"}', 'A', '2025-04-02 18:59:19'),
(174, 3, 'SQL hỗ trợ những kiểu JOIN nào?', '{\"A\": \"INNER JOIN\", \"B\": \"LEFT JOIN\", \"C\": \"RIGHT JOIN\", \"D\": \"Tất cả các loại trên\"}', 'D', '2025-04-02 18:59:19'),
(175, 3, 'Hàm nào trong SQL dùng để tính giá trị trung bình?', '{\"A\": \"MEAN()\", \"B\": \"MEDIAN()\", \"C\": \"AVERAGE()\", \"D\": \"AVG()\"}', 'D', '2025-04-02 18:59:19'),
(176, 4, 'Hệ thống thông tin là gì?', '{\"A\": \"Hệ thống phần cứng máy tính\", \"B\": \"Hệ thống quản lý thông tin\", \"C\": \"Tập hợp phần mềm và phần cứng để quản lý thông tin\", \"D\": \"Một loại cơ sở dữ liệu\"}', 'C', '2025-04-02 19:03:59'),
(177, 4, 'Thành phần nào không thuộc hệ thống thông tin?', '{\"A\": \"Phần cứng\", \"B\": \"Phần mềm\", \"C\": \"Mạng\", \"D\": \"Động cơ\"}', 'D', '2025-04-02 19:03:59'),
(178, 4, 'ERP là viết tắt của gì?', '{\"A\": \"Enterprise Resource Planning\", \"B\": \"Enterprise Relationship Processing\", \"C\": \"Extended Resource Protocol\", \"D\": \"Enterprise Reporting Plan\"}', 'A', '2025-04-02 19:03:59'),
(179, 4, 'Dữ liệu có thể được lưu trữ trong hệ thống thông tin bằng cách nào?', '{\"A\": \"Cơ sở dữ liệu\", \"B\": \"Bảng tính\", \"C\": \"Tệp văn bản\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:03:59'),
(180, 4, 'Mô hình nào không thuộc hệ thống thông tin?', '{\"A\": \"Hệ thống xử lý giao dịch (TPS)\", \"B\": \"Hệ thống hỗ trợ ra quyết định (DSS)\", \"C\": \"Hệ thống sản xuất ô tô\", \"D\": \"Hệ thống thông tin điều hành (EIS)\"}', 'C', '2025-04-02 19:03:59'),
(181, 4, 'Hệ thống thông tin có mấy thành phần chính?', '{\"A\": \"3\", \"B\": \"4\", \"C\": \"5\", \"D\": \"6\"}', 'C', '2025-04-02 19:03:59'),
(182, 4, 'Mục tiêu chính của hệ thống thông tin là gì?', '{\"A\": \"Lưu trữ dữ liệu\", \"B\": \"Tăng hiệu quả quản lý\", \"C\": \"Hỗ trợ ra quyết định\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:03:59'),
(183, 4, 'Hệ thống thông tin có thể được phân loại dựa trên điều gì?', '{\"A\": \"Chức năng\", \"B\": \"Phạm vi sử dụng\", \"C\": \"Quy mô tổ chức\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:03:59'),
(184, 4, 'Hệ thống thông tin nào giúp hỗ trợ ra quyết định?', '{\"A\": \"TPS\", \"B\": \"DSS\", \"C\": \"MIS\", \"D\": \"ERP\"}', 'B', '2025-04-02 19:03:59'),
(185, 4, 'Hệ thống nào được thiết kế để thu thập, lưu trữ, xử lý và phân phối thông tin?', '{\"A\": \"Hệ thống điều hành\", \"B\": \"Hệ thống thông tin\", \"C\": \"Hệ thống mạng\", \"D\": \"Hệ thống nhúng\"}', 'B', '2025-04-02 19:03:59'),
(186, 4, 'Trong mô hình hệ thống thông tin, vai trò của phần mềm là gì?', '{\"A\": \"Quản lý phần cứng\", \"B\": \"Xử lý dữ liệu\", \"C\": \"Cung cấp giao diện người dùng\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:03:59'),
(187, 4, 'Hệ thống nào giúp các nhà quản lý cấp cao đưa ra quyết định chiến lược?', '{\"A\": \"EIS\", \"B\": \"TPS\", \"C\": \"DSS\", \"D\": \"MIS\"}', 'A', '2025-04-02 19:03:59'),
(188, 4, 'Yếu tố quan trọng nhất trong một hệ thống thông tin là gì?', '{\"A\": \"Phần mềm\", \"B\": \"Dữ liệu\", \"C\": \"Con người\", \"D\": \"Phần cứng\"}', 'C', '2025-04-02 19:03:59'),
(189, 4, 'Dữ liệu trong hệ thống thông tin được phân loại như thế nào?', '{\"A\": \"Dữ liệu có cấu trúc\", \"B\": \"Dữ liệu phi cấu trúc\", \"C\": \"Dữ liệu bán cấu trúc\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:03:59'),
(190, 4, 'Hệ thống thông tin có thể giúp doanh nghiệp bằng cách nào?', '{\"A\": \"Tăng cường quản lý\", \"B\": \"Tối ưu hóa quy trình\", \"C\": \"Cải thiện ra quyết định\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:03:59'),
(191, 4, 'Hệ thống thông tin nào chủ yếu xử lý các giao dịch hàng ngày?', '{\"A\": \"MIS\", \"B\": \"TPS\", \"C\": \"DSS\", \"D\": \"ERP\"}', 'B', '2025-04-02 19:03:59'),
(192, 4, 'Công nghệ nào thường được sử dụng để lưu trữ và quản lý dữ liệu trong hệ thống thông tin?', '{\"A\": \"Blockchain\", \"B\": \"Big Data\", \"C\": \"Cơ sở dữ liệu quan hệ\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:03:59'),
(193, 4, 'Hệ thống nào giúp tự động hóa các quy trình kinh doanh trong tổ chức?', '{\"A\": \"ERP\", \"B\": \"CRM\", \"C\": \"SCM\", \"D\": \"MIS\"}', 'A', '2025-04-02 19:03:59'),
(194, 4, 'SCM là viết tắt của gì trong hệ thống thông tin?', '{\"A\": \"Software Configuration Management\", \"B\": \"Supply Chain Management\", \"C\": \"System Control Mechanism\", \"D\": \"Smart Computing Model\"}', 'B', '2025-04-02 19:03:59'),
(195, 4, 'Một hệ thống CRM giúp quản lý gì?', '{\"A\": \"Khách hàng\", \"B\": \"Nhà cung cấp\", \"C\": \"Nhân viên\", \"D\": \"Sản phẩm\"}', 'A', '2025-04-02 19:03:59'),
(196, 4, 'Dữ liệu nào quan trọng nhất trong hệ thống thông tin doanh nghiệp?', '{\"A\": \"Dữ liệu khách hàng\", \"B\": \"Dữ liệu tài chính\", \"C\": \"Dữ liệu sản phẩm\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:03:59'),
(197, 4, 'Mô hình dữ liệu phổ biến nhất trong hệ thống thông tin là gì?', '{\"A\": \"Mô hình quan hệ\", \"B\": \"Mô hình phân cấp\", \"C\": \"Mô hình mạng\", \"D\": \"Mô hình đồ thị\"}', 'A', '2025-04-02 19:03:59'),
(198, 4, 'Mô hình nào giúp chuẩn hóa và tối ưu hóa việc lưu trữ dữ liệu?', '{\"A\": \"Data Warehouse\", \"B\": \"Data Mart\", \"C\": \"Data Lake\", \"D\": \"Data Grid\"}', 'A', '2025-04-02 19:03:59'),
(199, 4, 'Khả năng mở rộng của một hệ thống thông tin có nghĩa là gì?', '{\"A\": \"Có thể thêm phần cứng hoặc phần mềm mới\", \"B\": \"Có thể hỗ trợ nhiều người dùng hơn\", \"C\": \"Có thể xử lý nhiều dữ liệu hơn\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:03:59'),
(200, 5, 'An toàn thông tin là gì?', '{\"A\": \"Bảo vệ thông tin khỏi bị truy cập trái phép\", \"B\": \"Đảm bảo tính toàn vẹn, bí mật và sẵn sàng của dữ liệu\", \"C\": \"Ngăn chặn virus và phần mềm độc hại\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:06:36'),
(201, 5, 'Yếu tố nào không thuộc nguyên tắc CIA trong an toàn thông tin?', '{\"A\": \"Bảo mật (Confidentiality)\", \"B\": \"Tính toàn vẹn (Integrity)\", \"C\": \"Tính sẵn sàng (Availability)\", \"D\": \"Tính bảo trì (Maintainability)\"}', 'D', '2025-04-02 19:06:36'),
(202, 5, 'Tấn công nào sau đây thuộc loại tấn công mạng phổ biến?', '{\"A\": \"Phishing\", \"B\": \"DDoS\", \"C\": \"Man-in-the-Middle (MITM)\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:06:36'),
(203, 5, 'Mật khẩu nào được xem là an toàn?', '{\"A\": \"123456\", \"B\": \"password\", \"C\": \"Qw!8xP@3#\", \"D\": \"abcdef\"}', 'C', '2025-04-02 19:06:36'),
(204, 5, 'Phương thức xác thực nào an toàn nhất?', '{\"A\": \"Mật khẩu đơn giản\", \"B\": \"Xác thực hai yếu tố (2FA)\", \"C\": \"Câu hỏi bảo mật\", \"D\": \"Đăng nhập bằng tên người dùng\"}', 'B', '2025-04-02 19:06:36'),
(205, 5, 'Loại mã hóa nào sử dụng cùng một khóa để mã hóa và giải mã?', '{\"A\": \"Mã hóa đối xứng\", \"B\": \"Mã hóa bất đối xứng\", \"C\": \"Mã hóa một chiều\", \"D\": \"Mã hóa không khóa\"}', 'A', '2025-04-02 19:06:36'),
(206, 5, 'Loại mã hóa nào sử dụng một cặp khóa công khai và khóa riêng?', '{\"A\": \"Mã hóa đối xứng\", \"B\": \"Mã hóa bất đối xứng\", \"C\": \"Mã hóa một chiều\", \"D\": \"Mã hóa XOR\"}', 'B', '2025-04-02 19:06:36'),
(207, 5, 'Thuật toán mã hóa nào sau đây là mã hóa đối xứng?', '{\"A\": \"RSA\", \"B\": \"AES\", \"C\": \"ECC\", \"D\": \"DSA\"}', 'B', '2025-04-02 19:06:36'),
(208, 5, 'Giao thức nào sau đây giúp bảo mật kết nối Internet?', '{\"A\": \"HTTP\", \"B\": \"FTP\", \"C\": \"HTTPS\", \"D\": \"SMTP\"}', 'C', '2025-04-02 19:06:36'),
(209, 5, 'SSL/TLS được sử dụng để làm gì?', '{\"A\": \"Bảo mật kết nối mạng\", \"B\": \"Nén dữ liệu\", \"C\": \"Tăng tốc độ mạng\", \"D\": \"Chuyển đổi địa chỉ IP\"}', 'A', '2025-04-02 19:06:36'),
(210, 5, 'Loại tấn công nào chiếm quyền điều khiển phiên làm việc?', '{\"A\": \"Phishing\", \"B\": \"Session Hijacking\", \"C\": \"DDoS\", \"D\": \"Brute Force\"}', 'B', '2025-04-02 19:06:36'),
(211, 5, 'Phần mềm độc hại (malware) bao gồm những loại nào?', '{\"A\": \"Virus\", \"B\": \"Trojan\", \"C\": \"Ransomware\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:06:36'),
(212, 5, 'Một cách để ngăn chặn tấn công từ chối dịch vụ (DDoS) là gì?', '{\"A\": \"Sử dụng tường lửa\", \"B\": \"Tăng băng thông mạng\", \"C\": \"Sử dụng mạng phân phối nội dung (CDN)\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:06:36'),
(213, 5, 'Xác thực sinh trắc học là gì?', '{\"A\": \"Sử dụng mật khẩu\", \"B\": \"Sử dụng đặc điểm sinh học như vân tay, khuôn mặt\", \"C\": \"Sử dụng câu hỏi bảo mật\", \"D\": \"Xác thực qua email\"}', 'B', '2025-04-02 19:06:36'),
(214, 5, 'Cách tốt nhất để bảo vệ tài khoản khỏi tấn công brute force là gì?', '{\"A\": \"Sử dụng mật khẩu mạnh\", \"B\": \"Kích hoạt giới hạn số lần đăng nhập\", \"C\": \"Sử dụng xác thực hai yếu tố\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:06:36'),
(215, 5, 'Firewall có chức năng gì?', '{\"A\": \"Bảo vệ hệ thống khỏi tấn công mạng\", \"B\": \"Tăng tốc Internet\", \"C\": \"Lưu trữ dữ liệu\", \"D\": \"Chặn quảng cáo\"}', 'A', '2025-04-02 19:06:36'),
(216, 5, 'VPN có tác dụng gì?', '{\"A\": \"Ẩn địa chỉ IP\", \"B\": \"Mã hóa dữ liệu truyền tải\", \"C\": \"Giúp truy cập nội dung bị chặn\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:06:36'),
(217, 5, 'Phương pháp nào giúp giảm nguy cơ bị tấn công phishing?', '{\"A\": \"Không nhấp vào liên kết đáng ngờ\", \"B\": \"Sử dụng phần mềm diệt virus\", \"C\": \"Bật xác thực hai yếu tố\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:06:36'),
(218, 5, 'Tấn công social engineering là gì?', '{\"A\": \"Tấn công vào phần cứng\", \"B\": \"Lừa đảo người dùng để lấy thông tin\", \"C\": \"Mã độc khai thác lỗ hổng hệ thống\", \"D\": \"Phát tán virus qua email\"}', 'B', '2025-04-02 19:06:36'),
(219, 5, 'Ransomware là gì?', '{\"A\": \"Mã độc mã hóa dữ liệu và đòi tiền chuộc\", \"B\": \"Phần mềm diệt virus\", \"C\": \"Chương trình tường lửa\", \"D\": \"Giao thức bảo mật\"}', 'A', '2025-04-02 19:06:36'),
(220, 5, 'Loại mã hóa nào không thể giải mã lại?', '{\"A\": \"Mã hóa đối xứng\", \"B\": \"Mã hóa bất đối xứng\", \"C\": \"Băm (Hashing)\", \"D\": \"Mã hóa AES\"}', 'C', '2025-04-02 19:06:36'),
(221, 5, 'Các công cụ nào giúp kiểm tra lỗ hổng bảo mật?', '{\"A\": \"Nmap\", \"B\": \"Wireshark\", \"C\": \"Metasploit\", \"D\": \"Tất cả các phương án trên\"}', 'D', '2025-04-02 19:06:36'),
(222, 5, 'Điều gì không nên làm để đảm bảo an toàn thông tin cá nhân?', '{\"A\": \"Chia sẻ mật khẩu với bạn bè\", \"B\": \"Sử dụng mật khẩu mạnh\", \"C\": \"Bật xác thực hai yếu tố\", \"D\": \"Không lưu mật khẩu trên trình duyệt\"}', 'A', '2025-04-02 19:06:36'),
(223, 5, 'Chữ ký số được dùng để làm gì?', '{\"A\": \"Mã hóa dữ liệu\", \"B\": \"Xác thực danh tính và bảo vệ dữ liệu\", \"C\": \"Tăng tốc độ mạng\", \"D\": \"Giúp truy cập Internet\"}', 'B', '2025-04-02 19:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
CREATE TABLE IF NOT EXISTS `scores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `exam_result_id` int NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `recorded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subject_id` (`subject_id`),
  KEY `exam_result_id` (`exam_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selected_questions`
--

DROP TABLE IF EXISTS `selected_questions`;
CREATE TABLE IF NOT EXISTS `selected_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_result_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `user_answer` varchar(255) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_result_id` (`exam_result_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Công Nghệ Phần Mềm', 'Công nghệ phần mềm tập trung vào việc phát triển và duy trì các phần mềm ứng dụng, với các phương pháp luận, công cụ và kỹ thuật hỗ trợ xây dựng phần mềm hiệu quả và chất lượng cao.', '2025-04-01 14:01:15'),
(2, 'Mạng Máy Tính', 'Mạng máy tính là lĩnh vực nghiên cứu về các hệ thống mạng, bao gồm cấu trúc mạng, giao thức truyền thông, và cách các thiết bị kết nối và trao đổi thông tin qua mạng.', '2025-04-01 14:01:15'),
(3, 'Cơ Sở Dữ Liệu', 'Cơ sở dữ liệu là một hệ thống tổ chức, lưu trữ và quản lý thông tin để dễ dàng truy cập, quản lý và cập nhật dữ liệu. Chúng bao gồm các hệ thống quản lý cơ sở dữ liệu như MySQL, PostgreSQL.', '2025-04-01 14:01:15'),
(4, 'Hệ Thống Thông Tin', 'Hệ thống thông tin bao gồm phần cứng, phần mềm và các quy trình để thu thập, xử lý và phân phối thông tin. Nó là một phần quan trọng trong các tổ chức và doanh nghiệp.', '2025-04-01 14:01:15'),
(5, 'An Toàn Thông Tin', 'An toàn thông tin là việc bảo vệ các hệ thống máy tính và dữ liệu khỏi các mối đe dọa như tấn công, xâm nhập, và mất mát thông tin, nhằm đảm bảo tính bảo mật, toàn vẹn và sẵn sàng của thông tin.', '2025-04-01 14:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','teacher') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'lich', 'lich@student.com', '$2b$10$9iUmq3BG/DF0qx7g80v/C.2lh3nGHuh31BVZDS0TdWKS2vDX0qPZe', 'student', '2025-04-02 13:39:23'),
(2, 'Minh Nghĩa', 'nghia@student.com', '$2b$10$fgZzKeJVIE0k6.jzRetofuOKL/tc4pAk1bgocP589cWDSDI8Orvii', 'student', '2025-04-03 05:28:33');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_results_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `scores_ibfk_3` FOREIGN KEY (`exam_result_id`) REFERENCES `exam_results` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selected_questions`
--
ALTER TABLE `selected_questions`
  ADD CONSTRAINT `selected_questions_ibfk_1` FOREIGN KEY (`exam_result_id`) REFERENCES `exam_results` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `selected_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
