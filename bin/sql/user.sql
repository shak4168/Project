CREATE TABLE `shop_user` (
	`user_idx` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` VARCHAR(30) NOT NULL COLLATE 'utf8_general_ci',
	`user_pw` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`user_name` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`user_address` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`user_tel` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`user_email` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`user_level` CHAR(1) NOT NULL DEFAULT '1' COLLATE 'utf8_general_ci',
	`delyn` CHAR(1) NOT NULL DEFAULT 'N' COLLATE 'utf8_general_ci',
	`reg_date` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`user_idx`) USING BTREE,
	UNIQUE INDEX `UNIQUE KEY` (`user_id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=19
;
