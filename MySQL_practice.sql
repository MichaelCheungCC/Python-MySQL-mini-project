CREATE DATABASE `sql_tutorial`;
SHOW DATABASES;
USE `sql_tutorial`;

#DROP DATABASE sql_tutorial;
SHOW TABLES;

CREATE TABLE `sales`(
	`sales_id` INT AUTO_INCREMENT,
    `sales_amount` DECIMAL(5,1),
    PRIMARY KEY (`sales_id`)
);

ALTER TABLE `sales` (

CREATE TABLE `customer`(
	`customer_id` INT AUTO_INCREMENT,
    `customer_name` VARCHAR(20),
    `good_id` INT,
    `date` DATE,
    `sales_id` INT,
	PRIMARY KEY (`customer_id`),
    FOREIGN KEY (`sales_id`) REFERENCES `sales`(`sales_id`) ON DELETE SET NULL
);

INSERT INTO `sales` (`sales_amount`) VALUES(1000.5);
INSERT INTO `sales` (`sales_amount`) VALUES(200);

INSERT INTO `customer` (`customer_name`, `good_id`, `date`, `sales_id`) VALUES ('John', 1, '2023-02-02', 1);
INSERT INTO `customer` (`customer_name`, `good_id`, `date`, `sales_id`) VALUES ('Ken', 2, '2023-02-01', 1);
INSERT INTO `customer` (`customer_name`, `good_id`, `date`, `sales_id`) VALUES ('Teresa', 2, '2023-02-03', 2);
INSERT INTO `customer` (`customer_name`, `good_id`, `date`, `sales_id`) VALUES ('Jeff', 1, '2023-02-04', 2);


SELECT * FROM `sales`;
SELECT * FROM `customer`;
SELECT COUNT(DISTINCT `good_id`) AS no_good from `customer`;
SELECT AVG(`sales_amount`) as avg_sames_amt FROM `sales`;
SELECT * FROM `customer` WHERE `customer_name` LIKE '__resa';
SELECT * FROM `customer` AS a JOIN `sales` AS b ON a.`sales_id` = b.`sales_id`;
SELECT 
    *
FROM
    `customer`
WHERE
    `sales_id` in (SELECT 
            `sales_id`
        FROM
            `sales`
        WHERE
            `sales_amount` > 1000);
            
SELECT * FROM `customer`;
DELETE FROM `sales` WHERE `sales_id` = 1; 
SELECT * FROM `customer`;
