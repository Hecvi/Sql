
/*
   1.Найдите номер модели, скорость и размер жесткого диска для
   всех ПK стоимостью менее 500 дол. Вывести: model, speed и hd
 */

select model,
       speed,
       hd
from pc
where price < 500;

/*
 2.Найдите производителей принтеров. Вывести: maker
 */

select distinct maker
from product
where type = 'Printer';

/*
 3.Найдите номер модели, объем памяти и размеры экранов
 ПК-блокнотов, цена которых превышает 1000 дол
 */

select model,
       ram,
       screen
from laptop
where price > 1000;

/*
 4.Найдите все записи таблицы Printer для цветных принтеров
 */

select *
from printer
where color = 'y';

/*
 5.Найдите номер модели, скорость и размер жесткого диска ПК,
 имеющих 12x или 24x CD и цену менее 600 дол.
 */

select model,
       speed,
       hd
from pc
where (cd = '12x' or cd = '24x')
  and price < 600;

/*
 6.Для каждого производителя, выпускающего ПК-блокноты c объёмом
 жесткого диска не менее 10 Гбайт, найти скорости таких
 ПК-блокнотов. Вывод: производитель, скорость
 */

select distinct maker,
                speed
from laptop as l
         left join product as p
                   on l.model = p.model
where hd >= 10;

/*
 7.Найдите номера моделей и цены всех имеющихся в продаже
 продуктов (любого типа) производителя B (латинская буква)
 */

select p.model, price
from product as p
         join pc
              on p.model = pc.model
where maker = 'B'
union
select p.model, price
from product as p
         join laptop as l
              on p.model = l.model
where maker = 'B'
union
select p.model, price
from product as p
         join printer as pr
              on p.model = pr.model
where maker = 'B';

/*
 8.Найдите производителя, выпускающего ПК, но не ПК-блокноты
 */

select distinct maker
from product
where type = 'PC'
  and maker not in (
    select maker
    from product
    where type = 'Laptop');

/*
 9.Найдите производителей ПК с процессором не менее 450 Мгц
 Вывести: Maker
 */

select distinct maker
from product as p
         join pc
              on p.model = pc.model
where speed >= 450;

/*
 10.Найдите модели принтеров, имеющих самую высокую цену
 Вывести: model, price
 */

select model,
       price
from printer
where price = (
    select max(price)
    from printer);

/*
 11.Найдите среднюю скорость ПК
 */

select round(avg(speed), 0) as avg_speed
from pc;

/*
 12.Найдите среднюю скорость ПК-блокнотов, цена которых
 превышает 1000 дол.
 */

select round(avg(speed), 0) as avg_speed
from laptop
where price > 1000;

/*
 13.Найдите среднюю скорость ПК, выпущенных производителем A
 */

select round(avg(speed), 0) as avg_speed
from product as p
         join pc
              on p.model = pc.model
where maker = 'A';

/*
 14. Найдите класс, имя и страну для кораблей из таблицы Ships,
 имеющих не менее 10 орудий
 */

select s.class,
       name,
       country
from ships as s
         join classes as c
              on s.class = c.class
where numguns >= 10;

/*
 15.Найдите размеры жестких дисков, совпадающих у двух и более PC
 Вывести: HD
 */

select hd
from pc
group by hd
having count(hd) >= 2;

/*
 16.Найдите пары моделей PC, имеющих одинаковые скорость и RAM.
 В результате каждая пара указывается только один раз,
 т.е. (i,j), но не (j,i), Порядок вывода: модель с большим
 номером, модель с меньшим номером, скорость и RAM
 */

select distinct pc1.model,
                pc2.model,
                pc1.speed,
                pc1.ram
from pc as pc1
         join pc as pc2
              on pc1.speed = pc2.speed and pc1.ram = pc2.ram
where pc1.model > pc2.model;

select distinct pc1.model,
                pc2.model,
                pc1.speed,
                pc1.ram
from pc as pc1,
     pc as pc2
where pc1.speed = pc2.speed
  and pc1.ram = pc2.ram
  and pc1.model > pc2.model;

/*
 17.Найдите модели ПК-блокнотов, скорость которых меньше скорости
 каждого из ПК. Вывести: type, model, speed
 */

select distinct cast('Laptop' as varchar(16)) as type,
                model,
                speed
from laptop
where speed < ALL (
    select speed
    from pc);

/*
 18.Найдите производителей самых дешевых цветных принтеров
 Вывести: maker, price
 */

select distinct maker,
                price
from printer as pr
         join product as p
              on pr.model = p.model
where color = 'y'
  and price = (
    select distinct min(price)
    from printer
    where color = 'y');

/*
 19.Для каждого производителя, имеющего модели в таблице Laptop,
 найдите средний размер экрана выпускаемых им ПК-блокнотов.
 Вывести: maker, средний размер экрана
 */

select maker,
       avg(screen) as avg_screen
from laptop as l
         join product as p
              on l.model = p.model
group by maker;

/*
 20.Найдите производителей, выпускающих по меньшей мере три
 различных модели ПК. Вывести: Maker, число моделей ПК
 */

select maker,
       count(model) as count_model
from product
where type = 'PC'
group by maker
having count(model) >= 3;

/*
 21.Найдите максимальную цену ПК, выпускаемых каждым
 производителем, у которого есть модели в таблице PC
 Вывести: maker, максимальная цена
 */

select maker,
       max(price) as max_price
from pc
         join product as p
              on pc.model = p.model
group by maker;

/*
 22.Для каждого значения скорости ПК, превышающего 600 МГц,
 определите среднюю цену ПК с такой же скоростью
 Вывести: speed, средняя цена
 */

select speed,
       round(avg(price), 0) avg_price
from pc
where speed > 600
group by speed;

/*
 23.Найдите производителей, которые производили бы как ПК
 со скоростью не менее 750 МГц, так и ПК-блокноты со
 скоростью не менее 750 МГц. Вывести: Maker
 */

select maker
from product as p
         join pc
              on p.model = pc.model
where speed >= 750
intersect
select maker
from product as p
         join laptop as l
              on p.model = l.model
where speed >= 750;

/*
 24.Перечислите номера моделей любых типов, имеющих самую
 высокую цену по всей имеющейся в базе данных продукции
 */

with t1 as (
    select model,
           price
    from pc
    union
    select model,
           price
    from laptop
    union
    select model,
           price
    from printer)
select model
from t1
where price in (
    select max(price) as max_price
    from t1);

/*
 25.Найдите производителей принтеров, которые производят ПК с
 наименьшим объемом RAM и с самым быстрым процессором среди
 всех ПК, имеющих наименьший объем RAM. Вывести: Maker
 */

select distinct maker
from pc
         join product as p
              on pc.model = p.model
where speed in (
    select max(speed)
    from pc
    where ram in (
        select min(ram)
        from pc))
  and maker in (
    select maker
    from product
    where type = 'Printer');

with t1 as (
    select maker,
           speed
    from product as p
             join pc
                  on p.model = pc.model
    where ram = (
        select min(ram)
        from pc))
select maker
from t1
where speed = (
    select max(speed)
    from t1)
intersect
select distinct maker
from product
where type = 'Printer';

/*
 26.Найдите среднюю цену ПК и ПК-блокнотов, выпущенных
 производителем A (латинская буква). Вывести: одна
 общая средняя цена
 */

with t1 as (
    select maker,
           price
    from product as p
             join pc
                  on p.model = pc.model
    union all
    select maker,
           price
    from product as p
             join laptop as l
                  on p.model = l.model)
select round(avg(price), 4) as avg_price
from t1
where maker = 'A';

/*
 27.Найдите средний размер диска ПК каждого из тех производителей,
 которые выпускают и принтеры. Вывести: maker, средний размер HD
 */

select maker,
       avg(hd) as avg_hd
from product as p
         join pc
              on p.model = pc.model
where maker in (
    select maker
    from product
    where type = 'PC'
    intersect
    select maker
    from product
    where type = 'Printer')
group by maker;

/*
 28.Используя таблицу Product, определить количество производителей,
 выпускающих по одной модели
 */

with t1 as (
    select maker,
           count(model) as qty
    from product
    group by maker
    having count(model) = 1)
select count(maker) as qty
from t1;

select count(maker) as qty
from (
         select maker,
                count(model)
         from product
         group by maker
         having count(model) = 1) as t1;

/*
 29.В предположении, что приход и расход денег на каждом пункте
 приема фиксируется не чаще одного раза в день [т.е. первичный
 ключ (пункт, дата)], написать запрос с выходными данными
 (пункт, дата, приход, расход). Использовать таблицы Income_o
 и Outcome_o
 */

with t1 as (
    select point,
           date
    from income_o
    union
    select point,
           date
    from outcome_o)
select t1.point,
       t1.date,
       inc,
       out
from t1
         left join income_o as o
                   on t1.point = o.point and t1.date = o.date
         left join outcome_o as out
                   on t1.point = out.point and t1.date = out.date;

/*
 30.В предположении, что приход и расход денег на каждом пункте приема
 фиксируется произвольное число раз (первичным ключом в таблицах
 является столбец code), требуется получить таблицу, в которой
 каждому пункту за каждую дату выполнения операций будет
 соответствовать одна строка. Вывод: point, date, суммарный расход
 пункта за день (out), суммарный приход пункта за день (inc).
 Отсутствующие значения считать неопределенными (NULL)
 */

with t1 as (
    select point,
           date
    from income
    union
    select point, date
    from outcome),
     t2 as (
         select point,
                date,
                sum(out) as out
         from outcome
         group by point, date),
     t3 as (
         select point,
                date,
                sum(inc) as inc
         from income
         group by point, date)
select t1.point,
       t1.date,
       t2.out,
       t3.inc
from t1
         left join t2
                   on t1.point = t2.point and t1.date = t2.date
         left join t3
                   on t1.point = t3.point and t1.date = t3.date;

/*
 31.Для классов кораблей, калибр орудий которых не менее 16 дюймов,
 укажите класс и страну
 */

select class,
       country
from classes
where bore >= 16;

/*
 32.Одной из характеристик корабля является половина куба калибра его
 главных орудий (mw). С точностью до 2 десятичных знаков определите
 среднее значение mw для кораблей каждой страны, у которой есть корабли
 в базе данных
 */

/*
 33.Укажите корабли, потопленные в сражениях в Северной Атлантике
 (North Atlantic). Вывод: ship
 */

select ship
from outcomes
where result = 'sunk'
  and battle = 'North Atlantic';

/*
 34.По Вашингтонскому международному договору от начала 1922 г.
 запрещалось строить линейные корабли водоизмещением более 35 тыс.тонн.
 Укажите корабли, нарушившие этот договор (учитывать только корабли c
 известным годом спуска на воду). Вывести названия кораблей
 */

select name
from classes c
         left join ships s
                   on c.class = s.class
where type = 'bb'
  and displacement > 35000
  and launched >= 1922;

/*
 35.В таблице Product найти модели, которые состоят только из цифр или только
 из латинских букв (A-Z, без учета регистра). Вывод: номер модели, тип модели
 */

select model,
       type
from product
where model not like '%[^a-zA-Z]%'
   or model not like '%[^0-9]%';

/*
 36.Перечислите названия головных кораблей, имеющихся в базе данных
 (учесть корабли в Outcomes)
 */

/*
 37.Найдите классы, в которые входит только один корабль из базы данных
 (учесть также корабли в Outcomes)
 */

/*
 38.Найдите страны, имевшие когда-либо классы обычных боевых кораблей ('bb') и
 имевшие когда-либо классы крейсеров ('bc')
 */

select country
from classes
group by country
having count(distinct type) = 2;

/*
 39.Найдите корабли, `сохранившиеся для будущих сражений`; т.е. выведенные из
 строя в одной битве (damaged), они участвовали в другой, произошедшей позже
 */

with t1 as (
    select *
    from outcomes
             join battles
                  on battle = name)
select distinct new.ship
from t1 new
where upper(ship) in (
    select upper(ship)
    from t1
    where new.date > date
      and result = 'damaged');

/*
 40.Найти производителей, которые выпускают более одной модели, при этом
 все выпускаемые производителем модели являются продуктами одного типа
 Вывести: maker, type
 */

select distinct maker,
                type
from product
where maker in (
    select maker
    from product
    group by maker
    having count(distinct type) = 1
       and count(distinct model) > 1);

/*
 41.Для каждого производителя, у которого присутствуют модели хотя бы в одной
 из таблиц PC, Laptop или Printer, определить максимальную цену на его
 продукцию. Вывод: имя производителя, если среди цен на продукцию данного
 производителя присутствует NULL, то выводить для этого производителя NULL,
 иначе максимальную цену
 */

with t1 as (
    select maker,
           price
    from product p
             join (
        select model,
               price
        from pc
        union
        select model,
               price
        from laptop
        union
        select model,
               price
        from printer) as t2
                  on p.model = t2.model)
select distinct maker,
                case
                    when maker in (
                        select distinct maker
                        from t1
                        where price is null) then null
                    else max(price) over (partition by maker)
                    end price_max
from t1;

/*
 42.Найдите названия кораблей, потопленных в сражениях, и название сражения,
 в котором они были потоплены
 */

select ship,
       battle
from outcomes
where result = 'sunk';

/*
 43.Укажите сражения, которые произошли в годы, не совпадающие ни с одним из
 годов спуска кораблей на воду
 */

select name
from battles
where extract(year from date) not in (
    select cast(launched as integer)
    from ships
    intersect
    select extract(year from date)
    from battles);

/*
 44.Найдите названия всех кораблей в базе данных, начинающихся с буквы R
 */

select *
from (
         select name
         from ships
         union
         select ship as name
         from outcomes) as t1
where name like 'R%';

/*
 45.Найдите названия всех кораблей в базе данных, состоящие из трех и
 более слов (например, King George V). Считать, что слова в названиях
 разделяются единичными пробелами, и нет концевых пробелов
 */

select *
from (
         select name
         from ships
         union
         select ship as name
         from outcomes) as t1
where name like '% % %';

/*
 46.Для каждого корабля, участвовавшего в сражении при Гвадалканале
 (Guadalcanal), вывести название, водоизмещение и число орудий
 */

select distinct ship,
                displacement,
                numguns
from classes as c
         left join ships as s
                   on c.class = s.class
         right join outcomes as o
                    on o.ship = s.name
                        or o.ship = s.class
where battle = 'Guadalcanal';