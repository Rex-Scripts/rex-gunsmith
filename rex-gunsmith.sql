CREATE TABLE `rex_gunsmith` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gunsmithid` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `rent` int(3) NOT NULL DEFAULT 0,
  `status` varchar(50) DEFAULT 'closed',
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rex_gunsmith_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gunsmithid` varchar(50) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `rex_gunsmith` (`gunsmithid`, `owner`, `money`) VALUES
('valgunsmith', 'vacant', 0.00),
('rhogunsmith', 'vacant', 0.00),
('stdgunsmith', 'vacant', 0.00),
('tumgunsmith', 'vacant', 0.00),
('anngunsmith', 'vacant', 0.00);

INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
('valgunsmith', 0, 'boss'),
('rhogunsmith', 0, 'boss'),
('stdgunsmith', 0, 'boss'),
('tumgunsmith', 0, 'boss'),
('anngunsmith', 0, 'boss');