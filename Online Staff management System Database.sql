--admin
CREATE TABLE `admin` (
  `adminID` int NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(45) NOT NULL,
  `admin_password` varchar(45) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

--attendance
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


--department
CREATE TABLE `department` (
  `department_id` int NOT NULL,
  `department_name` varchar(45) DEFAULT NULL,
  `manger_id` int DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `FK_manger_id` (`manger_id`),
  CONSTRAINT `FK_manger_id` FOREIGN KEY (`manger_id`) REFERENCES `manager` (`mID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

--leave
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


--manager
CREATE TABLE `manager` (
  `mID` int NOT NULL AUTO_INCREMENT,
  `Role` varchar(45) DEFAULT NULL,
  `promoteDate` date DEFAULT (curdate()),
  PRIMARY KEY (`mID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


--notification
CREATE TABLE `notification` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL,
  `notification_content` varchar(225) NOT NULL,
  `notification_d&t` datetime NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `FK_departmentID` (`department_id`),
  CONSTRAINT `FK_departmentID` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

--paysheet
CREATE TABLE `paysheet` (
  `Paysheet_Id` int NOT NULL AUTO_INCREMENT,
  `OT` int NOT NULL,
  `additional_amount` double NOT NULL,
  `Salary_total` double NOT NULL,
  `staff_id` int DEFAULT NULL,
  PRIMARY KEY (`Paysheet_Id`),
  KEY `FK_staff_id` (`staff_id`),
  CONSTRAINT `FK_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


--project
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(45) DEFAULT NULL,
  `project_start` datetime DEFAULT NULL,
  `project_due` datetime DEFAULT NULL,
  `project_description` varchar(100) DEFAULT NULL,
  `handlerID` int DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `FK_mID` (`handlerID`),
  CONSTRAINT `FK_mID` FOREIGN KEY (`handlerID`) REFERENCES `manager` (`mID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

--project report
CREATE TABLE `projectreport` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `no_of_task` int NOT NULL,
  `completed_task` varchar(100) NOT NULL,
  `report_projectID` int DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `FK_report_projectID` (`report_projectID`),
  CONSTRAINT `FK_report_projectID` FOREIGN KEY (`report_projectID`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


--staff
CREATE TABLE `staff` (
  `staffID` int NOT NULL AUTO_INCREMENT,
  `password` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `p_email` varchar(45) NOT NULL,
  `w_email` varchar(45) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `hireDate` date DEFAULT (curdate()),
  `quitDate` date DEFAULT NULL,
  `salary` double NOT NULL,
  `ot_rate` double NOT NULL,
  `staffcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  UNIQUE KEY `staffID_UNIQUE` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
