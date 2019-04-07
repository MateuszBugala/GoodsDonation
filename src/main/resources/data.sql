INSERT INTO `role` (`role_id`, `role`) VALUES (NULL, 'ROLE_USER'), (NULL, 'ROLE_ADMIN');

INSERT INTO `cities` VALUES (1, 'Warszawa'), (2, 'Kraków'), (3, 'Poznań');

INSERT INTO `institution_types` VALUES (1, 'Fundacja'), (2, 'Organizacja pozarządowa'), (3, 'Zbiórka lokalna');

LOCK TABLES `institutions` WRITE;
INSERT INTO `institutions` VALUES
(NULL, 'Pomoc dzieciom z ubogich rodzin', 'Dbam o Zdrowie','ubrania, jedzenie, sprzęt AGD, meble, zabawki', 1, 1),
(NULL, 'Pomoc osobom znajdującym się w trudnej sytuacji życiowej', 'Dla dzieci','ubrania, meble, zabawki', 2, 1),
(NULL, 'Pomoc dla osób nie posiadających miejsca zamieszkania', 'Bez domu','ubrania, jedzenie, ciepłe koce', 3, 1),
(NULL, 'Pomoc zwierzętom', 'Przygarnij mnie','koce', 1, 2),
(NULL, 'Pomoc samotnym matkom', 'SOS','meble, sprzęt AGD, ubrania', 2, 2),
(NULL, 'Pomoc seniorom','Samotny Senior', 'jedzenie, meble, sprzęt AGD', 3, 2);
UNLOCK TABLES;


INSERT INTO `donated_items` VALUES
(1, 'ubrania, które nadają się do ponownego użycia'),
(2, 'ubrania, do wyrzucenia'),
(3, 'zabawki'),
(4, 'książki'),
(5, 'inne');