INSERT INTO `role` (`role_id`, `role`) VALUES (NULL, 'ROLE_USER'), (NULL, 'ROLE_ADMIN');

INSERT INTO `cities` VALUES (1, 'Warszawa'), (2, 'Kraków'), (3, 'Poznań');

INSERT INTO `institution_types` VALUES (1, 'Fundacja'), (2, 'Organizacja pozarządowa'), (3, 'Zbiórka lokalna');

LOCK TABLES `institutions` WRITE;
INSERT INTO `institutions` VALUES
(NULL, 'Pomoc dzieciom z ubogich rodzin', 'Dbam o Zdrowie', 1, 1),
(NULL, 'Pomoc osobom znajdującym się w trudnej sytuacji życiowej', 'Dla dzieci', 2, 1),
(NULL, 'Pomoc dla osób nie posiadających miejsca zamieszkania', 'Bez domu', 3, 1);
UNLOCK TABLES;