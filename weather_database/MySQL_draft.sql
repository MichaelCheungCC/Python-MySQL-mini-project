CREATE DATABASE `weather`;
USE `weather`;
SHOW DATABASES;
SHOW TABLES;
CREATE TABLE `local_weather_forecast`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`date` DATE,
	`generalSituation` VARCHAR(1000), 
    `tcInfo` VARCHAR(1000), 
    `fireDangerWarning` VARCHAR(1000),
    `forecastPeriod` VARCHAR(1000),
    `forecastDesc` VARCHAR(1000),
    `outlook` VARCHAR(1000),
    `updateTime` VARCHAR(1000)
);

DESCRIBE `local_weather_forecast`;

INSERT INTO `local_weather_forecast` (`date`, `generalSituation`, `tcInfo`, `fireDangerWarning`, `forecastPeriod`, `forecastDesc`, `outlook`, `updateTime`) VALUES (CURDATE(),'','','','','','','');

SELECT * from `local_weather_forecast`;

DROP TABLE `local_weather_forecast`;

