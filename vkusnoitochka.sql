-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 13 2023 г., 21:06
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vkusnoitochka`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL COMMENT 'айди',
  `name` varchar(50) NOT NULL COMMENT 'название'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='категории продуктов';

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Бургеры и роллы'),
(2, 'Напитки'),
(3, 'Картофель, стартеры и салаты'),
(4, 'Десерты'),
(5, 'Соусы');

-- --------------------------------------------------------

--
-- Структура таблицы `coupon`
--

CREATE TABLE `coupon` (
  `id` int NOT NULL COMMENT 'айди',
  `name` varchar(100) NOT NULL COMMENT 'название',
  `discount` tinyint NOT NULL COMMENT 'процент скидки',
  `product_id` int NOT NULL COMMENT 'на какой товар скидка'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='купоны для покупки товаров со скидкой';

--
-- Дамп данных таблицы `coupon`
--

INSERT INTO `coupon` (`id`, `name`, `discount`, `product_id`) VALUES
(1, 'Купон на покупку \"Чикен Хит Грибной\" с огромной скидкой в 50%!', 50, 1),
(2, 'Скидка 25% на Чикен Премьер Грибной', 25, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `coupon_for_user`
--

CREATE TABLE `coupon_for_user` (
  `id` int NOT NULL COMMENT 'айди',
  `user_id` int NOT NULL COMMENT 'айди юзера',
  `coupon_id` int NOT NULL COMMENT 'айди купона',
  `amount` int NOT NULL COMMENT 'количество купонов'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='связь между таблицей юзер и таблицей купон';

--
-- Дамп данных таблицы `coupon_for_user`
--

INSERT INTO `coupon_for_user` (`id`, `user_id`, `coupon_id`, `amount`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int NOT NULL COMMENT 'айди',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'название',
  `compound` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'состав'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='таблица ингредиентов';

--
-- Дамп данных таблицы `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `compound`) VALUES
(1, 'Булочка для гамбургеров из пшеничной муки с кунжутом', 'Мука пшеничная хлебопекарная высший сорт, вода питьевая, сахар, семена кунжута очищенные, масло подсолнечное, дрожжи хлебопекарные, соль, глютен пшеничный сухой, улучшитель хлебопекарный (мука пшеничная, ферменты (ксиланазы, липазы, амилазы)), антиокислитель - аскорбиновая кислота.'),
(2, 'Котлета куриная «Пикантная»', 'Мясо куриное (53%), вода, мука (пшеничная, кукурузная, рисовая), мука панировочная (мука пшеничная, дрожжи, соль), крупа манная, масло растительное (подсолнечное), глютен пшеничный, соль, крахмал (кукурузный, картофельный), ароматизатор (содержит загуститель Е414, агент влагоудерживающий Е1518), ароматизатор натуральный (лимон, чеснок, содержит стабилизатор Е1450, антиокислитель Е306, носитель Е1520, агент антислеживающий Е551, регулятор кислотности Е330), дрожжевой экстракт, сахар, специи (порошок хрена, белый перец), экстракты специй (перец, стручковый перец, паприка, куркума (содержит эмульгатор (Е471, Е472(е)), носитель Е1520), агент антислеживающий (Е551), травы (шалфей, тимьян).'),
(3, 'Лук сушеный обжаренный', 'Лук, пальмовое/рапсовое масло, пшеничная мука, соль.'),
(4, 'Салат Айсберг мелкой нарезки', 'Салат Айсберг.'),
(5, 'Соус на основе растительных масел Грибной', 'Масло подсолнечное рафинированное дезодорированное, вода, сахар, сыворотка молочная сухая (содержит лактозу), загустители (Е1422, Е415), соль, сливки сухие, ароматизатор, грибы сушеные, регуляторы кислотности (Е260, Е330), лук репчатый сушеный, сироп карамельный, консервант Е202, антиокислитель Е385.'),
(6, 'Плавленый сыр Чеддер', 'Сыр Чеддер (молоко нормализованное пастеризованное, соль поваренная пищевая, молокосвертывающий ферментный препарат микробного происхождения, пищевая добавка уплотнитель хлорид кальция, закваска мезофильных и термофильных молочнокислых микроорганизмов), молоко сухое обезжиренное, эмульгаторы (Е331, Е339), белок молочный, масло сливочное, натуральный ароматизатор сыра Чеддер, соль поваренная пищевая, пищевой краситель (каротины и экстракт паприки), регулятор кислотности лимонная кислота, вода питьевая. ИЛИ Сыр Чеддер (молоко пастеризованное, соль, уплотнитель хлорид кальция, молокосвертывающий ферментный препарат микробного происхождения, бактериальная закваска мезофильных и термофильных молочнокислых микроорганизмов), масло сливочное, вода питьевая, молоко сухое обезжиренное, белок молочный, эмульгатор Е331, соль (соль, агент антислеживающий ферроцианид калия), регулятор кислотности лимонная кислота, ароматизатор натуральный, краситель натуральный.'),
(7, 'Бекон жареный (нарезка) / Бекон свиной обжаренный', 'Свинина, пищевая добавка (регулятор кислотности Е326, вода), комплексная пищевая добавка (пищевая соль, фиксатор окраски Е250, агент антислеживающий Е536), морская соль, пищевая добавка: аромаизатор коптильный (водный раствор натурального жидкого дыма, эмульгатор Е433), ароматизатор пищевой (мальтодекстрин картофельный, соль, сахар, мальтодекстрин кукурузный, ароматизатор коптильный, препарат вкусоароматический, ароматизатор термический технологический, ароматизаторы пищевые, вкусоароматическое вещество, вкусоароматическое вещество натуральное, регулятор кислотности Е340ii, агент антислеживающий Е551, подсластитель Е958), комплексная пищевая добавка (антиокислитель Е301, натуральный ароматизатор), сухой глюкозный сироп (кукурузный), комплексная пищевая добавка (регулятор кислотности Е451i), ароматизатор натуральный (олеорезины перца черного и перца красного, носитель Е1520). ИЛИ Грудинка свиная, вода,соль, экстракты фруктов и пряностей (лимон, помело, лайм, апельсин, укроп), антиокислители (аскорбиновая кислота, экстракты розмарина), дрожжевой экстракт, пивные дрожжи, ароматизаторы (дым, перец черный, перец красный), носители (Твин 80, пропиленгликоль).'),
(8, 'Сырные снеки в панировке', 'Сыр Моцарелла с массовой долей жира в сухом веществе 40, сыр с голубой благородной плесенью с массовой долей жира в сухом веществе 50-60% «БЛЮ ЧИЗ»/ «Сливочный»/ «Grassan» (цельное и обезжиренное нормализованное пастеризованное молоко, сливки, соль поваренная пищевая, молокосвертывающий ферментный препарат микробного и животного происхождения, бактериальная закваска мезофильных и термофильных молочнокислых микроорганизмов, краситель пищевой натуральный норбиксим, масло сливочное, вода питьевая, казеин сычужный, эмульгаторы: Е331, Е452, E433, Е340; регуляторы кислотности: Е330, E451i, гидроксид калия, лимонная кислота; краситель Е140, консерванты: Е202, натамицин; плесневая культура Penicillium Roquaforti); Панировка: мука: пшеничная, рисовая; соль, сахар, масло подсолнечное, антиокислители: Е306, Е319, Е330, Е300; эмульгаторы: Е471, Е472е; вода питьевая, дрожжи, экстракт дрожжей, загустители: Е412, Е415, Е1414; стабилизатор Е1420, крахмал: кукурузный, пшеничный; ароматизаторы натуральные, крупа манная, разрыхлители: Е450ii, E500ii; перец черный, глютен пшеничный.');

-- --------------------------------------------------------

--
-- Структура таблицы `ingredient_for_product`
--

CREATE TABLE `ingredient_for_product` (
  `id` int NOT NULL COMMENT 'айди',
  `product_id` int NOT NULL COMMENT 'айди продукта',
  `ingredient_id` int NOT NULL COMMENT 'айди ингредиента'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='связь между таблицей продукт и таблицей ингредиент';

--
-- Дамп данных таблицы `ingredient_for_product`
--

INSERT INTO `ingredient_for_product` (`id`, `product_id`, `ingredient_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 6),
(7, 2, 1),
(8, 2, 2),
(9, 2, 3),
(10, 2, 7),
(11, 2, 4),
(12, 2, 5),
(13, 3, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL COMMENT 'айди',
  `name` varchar(50) NOT NULL COMMENT 'название',
  `description` varchar(255) NOT NULL COMMENT 'описание',
  `proteins` decimal(3,1) NOT NULL COMMENT 'белки',
  `fats` decimal(3,1) NOT NULL COMMENT 'жиры',
  `carbohydrates` decimal(3,1) NOT NULL COMMENT 'углеводы',
  `weight` int NOT NULL COMMENT 'масса',
  `ccal` decimal(5,2) NOT NULL COMMENT 'калорийность',
  `price` decimal(6,2) NOT NULL COMMENT 'цена',
  `category_id` int NOT NULL COMMENT 'категория',
  `status` tinyint(1) NOT NULL COMMENT 'статус, 0 - дефолт, 1 - новинка, 2 - популярное'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='таблица продуктов';

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `proteins`, `fats`, `carbohydrates`, `weight`, `ccal`, `price`, `category_id`, `status`) VALUES
(1, 'Чикен Хит Грибной', 'Сочная куриная котлета в хрустящей панировке, нежный грибной соус, свежий салат, кусочки жареного хрустящего лука и карамелизированная булочка с кунжутом', '21.0', '28.0', '52.0', 204, '549.00', '135.00', 1, 1),
(2, 'Чикен Премьер Грибной', 'Сочная куриная котлета в хрустящей панировке, нежный грибной соус, ломтик сыра Чеддер, ароматный бекон, свежий салат, кусочки жареного хрустящего лука и карамелизированная булочка с кунжутом', '26.0', '34.0', '53.0', 224, '626.00', '194.00', 1, 1),
(3, 'Сырные треугольники', 'Аппетитные треугольники из тянущегося сыра в хрустящей панировке.', '10.0', '12.0', '19.0', 72, '222.00', '109.00', 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL COMMENT 'айди юзера',
  `name` varchar(50) NOT NULL COMMENT 'имя',
  `phone` varchar(20) NOT NULL COMMENT 'номер телефона',
  `password_hash` varchar(60) NOT NULL COMMENT 'хэшированный пароль',
  `role` bit(1) NOT NULL COMMENT 'роль юзера, 0 - дефолт, 1 - админ',
  `point` decimal(6,2) NOT NULL COMMENT 'бонусы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='таблица с данными о пользователях';

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `password_hash`, `role`, `point`) VALUES
(1, 'Попов Александр', '78005553535', '$2y$10$4/yee1MGeAQvmg1TNCYIxeIaM54clWEYAutLrkNhuk7BZsLE2H9wu', b'1', '50.00'),
(2, 'Игорь', '89511684577', '$2y$10$TcmiA8LEk5JLnR/9AYY7teDMrU94yM3.Nt738zQ9OdmkOzdg.SDS2', b'0', '0.00'),
(3, 'Игорь', '79511684577', '$2y$10$pv92SocQ5j..NOuT92uPsuyQX/Ss2H3nggwynfVqB7Fh509P2Kh82', b'0', '0.00'),
(4, 'ы', '95116845778', '$2y$10$T6THlnN3vFpnmbrXKvsjS.M55lcjMPRgwYgU55nctkcyLKRcxAxCi', b'0', '0.00'),
(5, 'sad', '89511684578', '$2y$10$3aUVsGI/7AuNffZmkBW6Cedi.Xp8aiA.PBjtz4op30IxCX6PHTYYu', b'0', '0.00'),
(6, 'Игорь', '89511684587', '$2y$10$geVT2IG/f.FDw92L2xUxT.5lPYBCKUg4jss84LTVwAQWMu89qfN5u', b'0', '0.00'),
(7, '123', '123', '$2y$10$radZRxGSbJ2TonBED9Iqkubl7yWRtowtJ64mEKH3AR8vv.HRM6TO2', b'0', '0.00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `coupon_for_user`
--
ALTER TABLE `coupon_for_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ingredient_for_product`
--
ALTER TABLE `ingredient_for_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `coupon_for_user`
--
ALTER TABLE `coupon_for_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `ingredient_for_product`
--
ALTER TABLE `ingredient_for_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди юзера', AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `coupon_for_user`
--
ALTER TABLE `coupon_for_user`
  ADD CONSTRAINT `coupon_for_user_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coupon_for_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ingredient_for_product`
--
ALTER TABLE `ingredient_for_product`
  ADD CONSTRAINT `ingredient_for_product_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `ingredient_for_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
