CREATE TABLE `admin` (
  `adminID` int NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(45) NOT NULL,
  `admin_password` varchar(45) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `offTime` time NOT NULL,
  `onTime` time NOT NULL,
  `hours_worked` time NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `FK_attendance_staff_id` (`staff_id`),
  CONSTRAINT `FK_attendance_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


