CREATE TABLE `shop_board` (
	`board_idx` INT(11) NOT NULL PRIMARY KEY,
	`board_title` VARCHAR(100) NOT NULL COLLATE utf8_general_ci,
	`board_content` VARCHAR(1000) NOT NULL COLLATE utf8_general_ci,
	`board_type` VARCHAR(2) NOT NULL COLLATE utf8_general_ci,
	`user_idx` INT(11) NOT NULL,
	`board_file_path` VARCHAR(200) NULL DEFAULT NULL COLLATE utf8_general_ci,
	`board_real_file` VARCHAR(100) NULL DEFAULT NULL COLLATE utf8_general_ci,
	`write_date` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`delyn` VARCHAR(1) NOT NULL DEFAULT 'N' COLLATE utf8_general_ci,
	INDEX `FK_USER_IDX` (`user_idx`) USING BTREE,
	CONSTRAINT `FK_USER_IDX` FOREIGN KEY (`user_idx`) REFERENCES `test` (`user_idx`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE=utf8_general_ci
ENGINE=InnoDB
AUTO_INCREMENT=1262
;
