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

CREATE TABLE `department` (
  `department_id` int NOT NULL,
  `department_name` varchar(45) DEFAULT NULL,
  `manger_id` int DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `FK_manger_id` (`manger_id`),
  CONSTRAINT `FK_manger_id` FOREIGN KEY (`manger_id`) REFERENCES `manager` (`mID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `leave` (
  `leaveId` int NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(45) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_till` date NOT NULL,
  `approval` varchar(5) NOT NULL,
  `time` time NOT NULL,
  `approvedBy` int DEFAULT NULL,
  `requestBy` int DEFAULT NULL,
  PRIMARY KEY (`leaveId`),
  KEY `FK_approvedBy` (`approvedBy`),
  KEY `FK_requestBy` (`requestBy`),
  CONSTRAINT `FK_approvedBy` FOREIGN KEY (`approvedBy`) REFERENCES `manager` (`mID`),
  CONSTRAINT `FK_requestBy` FOREIGN KEY (`requestBy`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


