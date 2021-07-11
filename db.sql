/* БД 'Компьютерная фирма' */

create table product
(
    maker varchar(16),
    model varchar(16),
    type  varchar(16)
);

create table pc
(
    code  integer,
    model varchar(16),
    speed integer,
    ram   integer,
    hd    decimal(8, 1),
    cd    varchar(16),
    price decimal(16, 4)
);

create table laptop
(
    code   integer,
    model  varchar(16),
    speed  integer,
    ram    integer,
    hd     decimal(8, 1),
    price  decimal(16, 4),
    screen integer
);

create table printer
(
    code  integer,
    model varchar(16),
    color varchar(16),
    type  varchar(16),
    price decimal(16, 4)
);

insert into product (maker, model, type)
values ('A', 1232, 'PC');
insert into product (maker, model, type)
values ('A', 1233, 'PC');
insert into product (maker, model, type)
values ('A', 1276, 'Printer');
insert into product (maker, model, type)
values ('A', 1298, 'Laptop');
insert into product (maker, model, type)
values ('A', 1401, 'Printer');
insert into product (maker, model, type)
values ('A', 1408, 'Printer');
insert into product (maker, model, type)
values ('A', 1752, 'Laptop');
insert into product (maker, model, type)
values ('B', 1121, 'PC');
insert into product (maker, model, type)
values ('B', 1750, 'Laptop');
insert into product (maker, model, type)
values ('C', 1321, 'Laptop');
insert into product (maker, model, type)
values ('D', 1288, 'Printer');
insert into product (maker, model, type)
values ('D', 1433, 'Printer');
insert into product (maker, model, type)
values ('E', 1260, 'PC');
insert into product (maker, model, type)
values ('E', 1434, 'Printer');
insert into product (maker, model, type)
values ('E', 2112, 'PC');
insert into product (maker, model, type)
values ('E', 2113, 'PC');

insert into pc (code, model, speed, ram, hd, cd, price)
values (1, 1232, 500, 64, 5, '12x', 600);
insert into pc (code, model, speed, ram, hd, cd, price)
values (10, 1260, 500, 32, 10, '12x', 350);
insert into pc (code, model, speed, ram, hd, cd, price)
values (11, 1233, 900, 128, 40, '40x', 980);
insert into pc (code, model, speed, ram, hd, cd, price)
values (12, 1233, 800, 128, 20, '50x', 970);
insert into pc (code, model, speed, ram, hd, cd, price)
values (2, 1121, 750, 128, 14, '40x', 850);
insert into pc (code, model, speed, ram, hd, cd, price)
values (3, 1233, 500, 64, 5, '12x', 600);
insert into pc (code, model, speed, ram, hd, cd, price)
values (4, 1121, 600, 128, 14, '40x', 850);
insert into pc (code, model, speed, ram, hd, cd, price)
values (5, 1121, 600, 128, 8, '40x', 850);
insert into pc (code, model, speed, ram, hd, cd, price)
values (6, 1233, 750, 128, 20, '50x', 950);
insert into pc (code, model, speed, ram, hd, cd, price)
values (7, 1232, 500, 32, 10, '12x', 400);
insert into pc (code, model, speed, ram, hd, cd, price)
values (8, 1232, 450, 64, 8, '24x', 350);
insert into pc (code, model, speed, ram, hd, cd, price)
values (9, 1232, 450, 32, 10, '24x', 350);

insert into laptop (code, model, speed, ram, hd, price, screen)
values (1, 1298, 350, 32, 4, 700, 11);
insert into laptop (code, model, speed, ram, hd, price, screen)
values (2, 1321, 500, 64, 8, 970, 12);
insert into laptop (code, model, speed, ram, hd, price, screen)
values (3, 1750, 750, 128, 12, 1200, 14);
insert into laptop (code, model, speed, ram, hd, price, screen)
values (4, 1298, 600, 64, 10, 1050, 15);
insert into laptop (code, model, speed, ram, hd, price, screen)
values (5, 1752, 750, 128, 10, 1150, 14);
insert into laptop (code, model, speed, ram, hd, price, screen)
values (6, 1298, 450, 64, 10, 950, 12);

insert into printer (code, model, color, type, price)
values (1, 1276, 'n', 'Laser', 400);
insert into printer (code, model, color, type, price)
values (2, 1433, 'y', 'Jet', 270);
insert into printer (code, model, color, type, price)
values (3, 1434, 'y', 'Jet', 290);
insert into printer (code, model, color, type, price)
values (4, 1401, 'n', 'Matrix', 150);
insert into printer (code, model, color, type, price)
values (5, 1408, 'n', 'Matrix', 270);
insert into printer (code, model, color, type, price)
values (6, 1288, 'n', 'Laser', 400);


/* БД 'Фирма вторсырья' */

create table income_o
(
    point integer,
    date  date,
    inc   decimal(16, 4)
);

create table outcome_o
(
    point integer,
    date  date,
    out   decimal(16, 4)
);

create table income
(
    code  integer,
    point integer,
    date  date,
    inc   decimal(16, 4)
);

create table outcome
(
    code  integer,
    point integer,
    date  date,
    out   decimal(16, 4)
);

insert into income_o (point, date, inc)
values (1, to_date('2001-03-22', 'YYYY-MM-DD'), 15000);
insert into income_o (point, date, inc)
values (1, to_date('2001-03-23', 'YYYY-MM-DD'), 15000);
insert into income_o (point, date, inc)
values (1, to_date('2001-03-24', 'YYYY-MM-DD'), 3400);
insert into income_o (point, date, inc)
values (1, to_date('2001-04-13', 'YYYY-MM-DD'), 5000);
insert into income_o (point, date, inc)
values (1, to_date('2001-05-11', 'YYYY-MM-DD'), 4500);
insert into income_o (point, date, inc)
values (2, to_date('2001-03-22', 'YYYY-MM-DD'), 10000);
insert into income_o (point, date, inc)
values (2, to_date('2001-03-24', 'YYYY-MM-DD'), 1500);
insert into income_o (point, date, inc)
values (3, to_date('2001-09-13', 'YYYY-MM-DD'), 11500);
insert into income_o (point, date, inc)
values (3, to_date('2001-10-02', 'YYYY-MM-DD'), 18000);

insert into outcome_o (point, date, out)
values (1, to_date('2001-03-14', 'YYYY-MM-DD'), 15348);
insert into outcome_o (point, date, out)
values (1, to_date('2001-03-24', 'YYYY-MM-DD'), 3663);
insert into outcome_o (point, date, out)
values (1, to_date('2001-03-26', 'YYYY-MM-DD'), 1221);
insert into outcome_o (point, date, out)
values (1, to_date('2001-03-28', 'YYYY-MM-DD'), 2075);
insert into outcome_o (point, date, out)
values (1, to_date('2001-03-29', 'YYYY-MM-DD'), 2004);
insert into outcome_o (point, date, out)
values (1, to_date('2001-04-11', 'YYYY-MM-DD'), 3195.04);
insert into outcome_o (point, date, out)
values (1, to_date('2001-04-13', 'YYYY-MM-DD'), 4490);
insert into outcome_o (point, date, out)
values (1, to_date('2001-04-27', 'YYYY-MM-DD'), 3110);
insert into outcome_o (point, date, out)
values (1, to_date('2001-05-11', 'YYYY-MM-DD'), 2530);
insert into outcome_o (point, date, out)
values (2, to_date('2001-03-22', 'YYYY-MM-DD'), 1440);
insert into outcome_o (point, date, out)
values (2, to_date('2001-04-02', 'YYYY-MM-DD'), 2040);
insert into outcome_o (point, date, out)
values (3, to_date('2001-09-13', 'YYYY-MM-DD'), 1500);
insert into outcome_o (point, date, out)
values (3, to_date('2001-09-14', 'YYYY-MM-DD'), 2300);
insert into outcome_o (point, date, out)
values (3, to_date('2001-09-16', 'YYYY-MM-DD'), 2150);

insert into income (code, point, date, inc)
values (1, 1, to_date('2001-03-22', 'YYYY-MM-DD'), 15000);
insert into income (code, point, date, inc)
values (10, 1, to_date('2001-04-13', 'YYYY-MM-DD'), 5000);
insert into income (code, point, date, inc)
values (11, 1, to_date('2001-03-24', 'YYYY-MM-DD'), 3400);
insert into income (code, point, date, inc)
values (12, 3, to_date('2001-09-13', 'YYYY-MM-DD'), 1350);
insert into income (code, point, date, inc)
values (13, 3, to_date('2001-09-13', 'YYYY-MM-DD'), 1750);
insert into income (code, point, date, inc)
values (2, 1, to_date('2001-03-23', 'YYYY-MM-DD'), 15000);
insert into income (code, point, date, inc)
values (3, 1, to_date('2001-03-24', 'YYYY-MM-DD'), 3600);
insert into income (code, point, date, inc)
values (4, 2, to_date('2001-03-22', 'YYYY-MM-DD'), 10000);
insert into income (code, point, date, inc)
values (5, 2, to_date('2001-03-24', 'YYYY-MM-DD'), 1500);
insert into income (code, point, date, inc)
values (6, 1, to_date('2001-04-13', 'YYYY-MM-DD'), 5000);
insert into income (code, point, date, inc)
values (7, 1, to_date('2001-05-11', 'YYYY-MM-DD'), 4500);
insert into income (code, point, date, inc)
values (8, 1, to_date('2001-03-22', 'YYYY-MM-DD'), 15000);
insert into income (code, point, date, inc)
values (9, 2, to_date('2001-03-24', 'YYYY-MM-DD'), 1500);

insert into outcome (code, point, date, out)
values (1, 1, to_date('2001-03-14', 'YYYY-MM-DD'), 15348);
insert into outcome (code, point, date, out)
values (10, 2, to_date('2001-03-22', 'YYYY-MM-DD'), 1440);
insert into outcome (code, point, date, out)
values (11, 2, to_date('2001-03-29', 'YYYY-MM-DD'), 7848);
insert into outcome (code, point, date, out)
values (12, 2, to_date('2001-04-02', 'YYYY-MM-DD'), 2040);
insert into outcome (code, point, date, out)
values (13, 1, to_date('2001-03-24', 'YYYY-MM-DD'), 3500);
insert into outcome (code, point, date, out)
values (14, 2, to_date('2001-03-22', 'YYYY-MM-DD'), 1440);
insert into outcome (code, point, date, out)
values (15, 1, to_date('2001-03-29', 'YYYY-MM-DD'), 2006);
insert into outcome (code, point, date, out)
values (16, 3, to_date('2001-09-13', 'YYYY-MM-DD'), 1200);
insert into outcome (code, point, date, out)
values (17, 3, to_date('2001-09-13', 'YYYY-MM-DD'), 1500);
insert into outcome (code, point, date, out)
values (18, 3, to_date('2001-09-14', 'YYYY-MM-DD'), 1150);
insert into outcome (code, point, date, out)
values (2, 1, to_date('2001-03-24', 'YYYY-MM-DD'), 3663);
insert into outcome (code, point, date, out)
values (3, 1, to_date('2001-03-26', 'YYYY-MM-DD'), 1221);
insert into outcome (code, point, date, out)
values (4, 1, to_date('2001-03-28', 'YYYY-MM-DD'), 2075);
insert into outcome (code, point, date, out)
values (5, 1, to_date('2001-03-29', 'YYYY-MM-DD'), 2004);
insert into outcome (code, point, date, out)
values (6, 1, to_date('2001-04-11', 'YYYY-MM-DD'), 3195.04);
insert into outcome (code, point, date, out)
values (7, 1, to_date('2001-04-13', 'YYYY-MM-DD'), 4490);
insert into outcome (code, point, date, out)
values (8, 1, to_date('2001-04-27', 'YYYY-MM-DD'), 3110);
insert into outcome (code, point, date, out)
values (9, 1, to_date('2001-05-11', 'YYYY-MM-DD'), 2530);

/* БД 'Корабли' */

create table classes
(
    class        varchar(32),
    type         char(2),
    country      varchar(32),
    numGuns      integer,
    bore         decimal(8, 1),
    displacement integer
);

create table ships
(
    name     varchar(32),
    class    varchar(32),
    launched varchar(32)
);

create table battles
(
    name varchar(32),
    date date
);

create table outcomes
(
    ship   varchar(32),
    battle varchar(32),
    result varchar(32)
);

insert into classes (class, type, country, numGuns, bore, displacement)
values ('Bismarck', 'bb', 'Germany', 8, 15, 42000);
insert into classes (class, type, country, numGuns, bore, displacement)
values ('Iowa', 'bb', 'USA', 9, 16, 46000);
insert into classes (class, type, country, numGuns, bore, displacement)
values ('Kongo', 'bc', 'Japan', 8, 14, 32000);
insert into classes (class, type, country, numGuns, bore, displacement)
values ('North Carolina', 'bb', 'USA', 12, 16, 37000);
insert into classes (class, type, country, numGuns, bore, displacement)
values ('Renown', 'bc', 'Gt.Britan', 6, 15, 32000);
insert into classes (class, type, country, numGuns, bore, displacement)
values ('Revenge', 'bb', 'Gt.Britan', 8, 15, 29000);
insert into classes (class, type, country, numGuns, bore, displacement)
values ('Tennessee', 'bb', 'USA', 12, 14, 32000);
insert into classes (class, type, country, numGuns, bore, displacement)
values ('Yamato', 'bb', 'Japan', 9, 18, 65000);

insert into ships (name, class, launched)
values ('California', 'Tennessee', 1921);
insert into ships (name, class, launched)
values ('Haruna', 'Kongo', 1916);
insert into ships (name, class, launched)
values ('Hiei', 'Kongo', 1914);
insert into ships (name, class, launched)
values ('Iowa', 'Iowa', 1943);
insert into ships (name, class, launched)
values ('Kirishima', 'Kongo', 1915);
insert into ships (name, class, launched)
values ('Kongo', 'Kongo', 1913);
insert into ships (name, class, launched)
values ('Missouri', 'Iowa', 1944);
insert into ships (name, class, launched)
values ('Musashi', 'Yamato', 1942);
insert into ships (name, class, launched)
values ('New Jersey', 'Iowa', 1943);
insert into ships (name, class, launched)
values ('North Carolina', 'North Carolina', 1941);
insert into ships (name, class, launched)
values ('Ramillies', 'Revenge', 1917);
insert into ships (name, class, launched)
values ('Renown', 'Renown', 1916);
insert into ships (name, class, launched)
values ('Repulse', 'Renown', 1916);
insert into ships (name, class, launched)
values ('Resolution', 'Renown', 1916);
insert into ships (name, class, launched)
values ('Revenge', 'Revenge', 1916);
insert into ships (name, class, launched)
values ('Royal Oak', 'Revenge', 1916);
insert into ships (name, class, launched)
values ('Royal Sovereign', 'Revenge', 1916);
insert into ships (name, class, launched)
values ('South Dakota', 'North Carolina', 1941);
insert into ships (name, class, launched)
values ('Tennessee', 'Tennessee', 1920);
insert into ships (name, class, launched)
values ('Washington', 'North Carolina', 1941);
insert into ships (name, class, launched)
values ('Wisconsin', 'Iowa', 1944);
insert into ships (name, class, launched)
values ('Yamato', 'Yamato', 1941);

insert into battles (name, date)
values ('#Cuba62a', to_date('1962-10-20', 'YYYY-MM-DD'));
insert into battles (name, date)
values ('#Cuba62b', to_date('1962-10-25', 'YYYY-MM-DD'));
insert into battles (name, date)
values ('Guadalcanal', to_date('1942-11-15', 'YYYY-MM-DD'));
insert into battles (name, date)
values ('North Atlantic', to_date('1941-05-25', 'YYYY-MM-DD'));
insert into battles (name, date)
values ('North Cape', to_date('1943-12-26', 'YYYY-MM-DD'));
insert into battles (name, date)
values ('Surigao Strait', to_date('1944-10-25', 'YYYY-MM-DD'));

insert into outcomes (ship, battle, result)
values ('Bismarck', 'North Atlantic', 'sunk');
insert into outcomes (ship, battle, result)
values ('California', 'Guadalcanal', 'damaged');
insert into outcomes (ship, battle, result)
values ('CAlifornia', 'Surigao Strait', 'ok');
insert into outcomes (ship, battle, result)
values ('Duke of York', 'North Cape', 'ok');
insert into outcomes (ship, battle, result)
values ('Fuso', 'Surigao Strait', 'sunk');
insert into outcomes (ship, battle, result)
values ('Hood', 'North Atlantic', 'sunk');
insert into outcomes (ship, battle, result)
values ('King George V', 'North Atlantic', 'ok');
insert into outcomes (ship, battle, result)
values ('Kirishima', 'Guadalcanal', 'sunk');
insert into outcomes (ship, battle, result)
values ('Prince of Wales', 'North Atlantic', 'damaged');
insert into outcomes (ship, battle, result)
values ('Rodney', 'North Atlantic', 'OK');
insert into outcomes (ship, battle, result)
values ('Schamhorst', 'North Cape', 'sunk');
insert into outcomes (ship, battle, result)
values ('South Dakota', 'Guadalcanal', 'damaged');
insert into outcomes (ship, battle, result)
values ('Tennessee', 'Surigao Strait', 'ok');
insert into outcomes (ship, battle, result)
values ('Washington', 'Guadalcanal', 'ok');
insert into outcomes (ship, battle, result)
values ('West Virginia', 'Surigao Strait', 'ok');
insert into outcomes (ship, battle, result)
values ('Yamashiro', 'Surigao Strait', 'sunk');