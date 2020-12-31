SELECT * FROM recipebook.post;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `recipe` varchar(5000) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
