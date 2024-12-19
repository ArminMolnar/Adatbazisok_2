-- insert into BESZALLITO
insert into beszallito (nev, iranyitoszam, varos, utca, telefonszam, email, kapcsolattarto)
values ('Cérna Béla es Társa', '1117', 'Budapest', 'Karinthy Frigyes út 17.', '+36201478997', 'cernabela@gmail.com', 'Nagy Szabolcs');

insert into beszallito (nev, iranyitoszam, varos, utca, telefonszam, email, kapcsolattarto)
values ('SzuperCipő', '5256', 'Nagyrét', 'Balogh Jeromos út 1.', '+36203656542', 'szupercipo@gmail.com', 'Varga Emese');

insert into beszallito (nev, iranyitoszam, varos, utca, telefonszam, email, kapcsolattarto)
values ('Túrára fel Kft.', '6100', 'Zalazomos',  'Szabadsag utca 14.', '+36205938571', 'turarafel@gmail.com', 'Belovics Ferenc');

-- insert into RESZLEG
insert into reszleg (megnevezes, telefonszam, email, anyagkezelo)
values ('Irodisták', '+36208348512', 'irodistak@mh.outlook.com', 'Tóth Péter');

insert into reszleg (megnevezes, telefonszam, email, anyagkezelo)
values ('Túlélők', '+36209384727', 'tulelok@mh.outlook.com', 'Medvegy János');

insert into reszleg (megnevezes, telefonszam, email, anyagkezelo)
values ('Különleges részleg', '+36209238591', 'kulonlegesreszleg@mh.outlook.com', 'Karnis György');

-- insert into RAKTAROS
insert into raktaros (nev, rendfokozat, telefonszam, email)
values ('Balogh József', 'Fõtörzsõrmester', '+36305258274', 'baloghjozsef@mh.outlook.com');

insert into raktaros (nev, rendfokozat, telefonszam, email)
values ('Nagy Dávid', 'Zászlós', '+36308573819', 'nagydavid@mh.outlook.com');

insert into raktaros (nev, rendfokozat, telefonszam, email)
values ('Jerosics László', 'Fõtörzsõrmester', '+36309284710', 'jerosicslaszlo@mh.outlook.com');

-- insert into RAKTAR
insert into raktar (megnevezes, raktaros_id)
values ('Ruharaktár', (select r.raktaros_id from raktaros r where r.nev = 'Balogh József'));

insert into raktar (megnevezes, raktaros_id)
values ('Cipőraktár', (select r.raktaros_id from raktaros r where r.nev = 'Nagy Dávid'));

insert into raktar (megnevezes, raktaros_id)
values ('Kiegraktár', (select r.raktaros_id from raktaros r where r.nev = 'Jerosics László'));

-- insert into TERMEK
-- RUHARAKTÁR
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'Téli alsó', 'ruhanemű', 40, 'S 44-46', 'db', 15245, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'Téli alsó', 'ruhanemű', 45, 'M 48-50', 'db', 15245, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'Téli alsó', 'ruhanemű', 38, 'L 52-54', 'db', 15245, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'Téli alsó', 'ruhanemű', 26, 'XL 56-58', 'db', 15245, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'Téli felső', 'ruhanemű', 40, 'S 44-46', 'db', 16525, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'Téli felső', 'ruhanemű', 45, 'M 48-50', 'db', 16525, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'Téli felső', 'ruhanemű', 38, 'L 52-54', 'db', 16525, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'Téli felső', 'ruhanemű', 26, 'XL 56-58', 'db', 16525, 15, 120);

insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'sapka', 'ruhanemű', 160, 'one-size', 'db', 5400, 80, 240);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'sál', 'ruhanemű', 132, 'one-size', 'db', 3200 , 80, 220);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'kesztyű', 'ruhanemű', 70, 'S 7', 'pár', 1500, 40, 150);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'kesztyű', 'ruhanemű', 75, 'M 8', 'pár', 1500, 40, 150);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Cérna Béla es Társa'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Ruharaktár'), 'kesztyű', 'ruhanemű', 65, 'L 9', 'pár', 1500, 40, 150);

insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '37', 'pár', 50000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '38', 'pár', 50000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '39', 'pár', 50000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '40', 'pár', 50000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '41', 'pár', 50000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '42', 'pár', 50000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '43', 'pár', 50000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '44', 'pár', 50000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '45', 'pár', 50000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'túrabakancs', 'lábbeli', 40, '46', 'pár', 50000, 15, 120);

insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'papucs', 'lábbeli', 40, '37-38', 'pár', 3000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'papucs', 'lábbeli', 40, '39-40', 'pár', 3000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'papucs', 'lábbeli', 40, '41-42', 'pár', 3000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'papucs', 'lábbeli', 40, '43-44', 'pár', 3000, 15, 120);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'SzuperCipő'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Cipőraktár'), 'papucs', 'lábbeli', 40, '45-46', 'pár', 3000, 15, 120);

insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Túrára fel Kft.'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Kiegraktár'), 'hátizsák', 'kiegészítõ felszerelés', 36, '36L', 'db' ,8400, 15, 80);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Túrára fel Kft.'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Kiegraktár'), 'hátizsák', 'kiegészítõ felszerelés', 42, '36L+', 'db', 15000, 20, 80);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Túrára fel Kft.'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Kiegraktár'), 'sátor', 'kiegészítõ felszerelés', 20, '2-4 személy', 'klt', 145000, 10, 34);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Túrára fel Kft.'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Kiegraktár'), 'sátor', 'kiegészítõ felszerelés', 15, '4-6 személy', 'klt', 254000, 8, 30);
insert into termek (beszallito_id, raktar_id, megnevezes, termekkor, mennyiseg, meret, egyseg, ar, min_mennyiseg, max_mennyiseg)
values ((select b.beszallito_id from beszallito b where b.nev = 'Túrára fel Kft.'), 
(select r.raktar_id from raktar r where r.megnevezes = 'Kiegraktár'), 'sátor', 'kiegészítõ felszerelés', 12, '6-8 személy', 'klt', 300000, 5, 28);



