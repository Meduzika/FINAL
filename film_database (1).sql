-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 17 2026 г., 13:01
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `film_database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `actors`
--

INSERT INTO `actors` (`id`, `name`, `birth_date`) VALUES
(1, 'Роберт Дауни-младший', '1965-04-04'),
(2, 'Крис Эванс', '1981-06-13'),
(3, 'Скарлетт Йоханссон', '1984-11-22'),
(4, 'Хью Джекман', '1968-10-12'),
(5, 'Майкл Фассбендер', '1977-04-02'),
(6, 'Джеймс МакЭвой', '1979-04-21'),
(7, 'Вигго Мортенсен', '1958-10-20'),
(8, 'Иэн МакКеллен', '1939-05-25'),
(9, 'Киану Ривз', '1964-09-02'),
(10, 'Харрисон Форд', '1942-07-13'),
(11, 'Марлон Брандо', '1924-04-03'),
(12, 'Райан Гослинг', '1980-11-12');

-- --------------------------------------------------------

--
-- Структура таблицы `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `director` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `movies`
--

INSERT INTO `movies` (`id`, `title`, `year`, `director`, `description`) VALUES
(1, 'Железный человек', '2008', 'Джон Фавро', 'Инженер Тони Старк создает экзоскелет и становится супергероем.'),
(2, 'Хранители', '2009', 'Зак Снайдер', 'Группа супергероев пытается спасти мир от ядерной катастрофы.'),
(3, 'Властелин колец: Братство Кольца', '2001', 'Питер Джексон', 'Хоббит Фродо должен уничтожить Кольцо Всевластия.'),
(4, 'Матрица', '1999', 'Братья Вачовски', 'Нео узнаёт правду о мире и борется против машин.'),
(5, 'Крёстный отец', '1972', 'Фрэнсис Форд Коппола', 'История семьи Корлеоне и её подъёма в мире мафии.'),
(6, 'Тёмный рыцарь', '2008', 'Кристофер Нолан', 'Бэтмен сталкивается с Джокером в Готэме.'),
(7, 'Парк юрского периода', '1993', 'Стивен Спилберг', 'Учёные воскрешают динозавров — и всё идёт наперекосяк.'),
(8, 'Люди Икс: Первый класс', '2011', 'Мэтью Вон', 'Молодые мутанты обучаются в школе Профессора Ксавье.'),
(9, 'Гладиатор', '2000', 'Ридли Скотт', 'Римский генерал Максимус становится гладиатором и мстит императору.'),
(10, 'Драйв', '2011', 'Николас Виндинг Рефн', 'Каскадёр-наёмник втягивается в преступный мир Лос-Анджелеса.');

-- --------------------------------------------------------

--
-- Структура таблицы `movie_actor`
--

CREATE TABLE `movie_actor` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `role_in_movie` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `movie_actor`
--

INSERT INTO `movie_actor` (`movie_id`, `actor_id`, `role_in_movie`) VALUES
(1, 1, 'Тони Старк / Железный человек'),
(1, 2, 'Стив Роджерс / Капитан Америка'),
(2, 3, 'Сильки Спектр'),
(2, 10, 'Доктор Манхэттен'),
(2, 11, 'Комиссар Готэм'),
(3, 7, 'Арагорн'),
(3, 8, 'Гэндальф'),
(4, 9, 'Нео'),
(4, 10, 'Тринити'),
(5, 10, 'Майкл Корлеоне'),
(5, 11, 'Дон Вито Корлеоне'),
(6, 10, 'Бэтмен'),
(6, 12, 'Джокер'),
(7, 10, 'Алан Грант'),
(7, 11, 'Элли Сэттлер'),
(8, 4, 'Логан / Росомаха'),
(8, 5, 'Эрик Леншерр / Магнето'),
(8, 6, 'Чарльз Ксавье'),
(9, 7, 'Максимус'),
(9, 10, 'Коммод'),
(10, 10, 'Ирен'),
(10, 12, 'Драйв');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 10),
  `created_at` datetime DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `text`, `rating`, `created_at`, `user_id`, `movie_id`) VALUES
(16, 'овралкраол цлдфаоцуарук ыволоа', 7, '2026-04-03 15:38:56', 4, 8),
(17, 'алтыларва алваповхфыпловапджчвер', 9, '2026-04-03 15:42:44', 4, 6),
(18, 'нкеповыдоп шазшафщааьфыбуаоцщфук', 2, '2026-04-06 09:26:49', 4, 3),
(19, 'вапролджорамкелилми', 2, '2026-04-20 18:41:13', 4, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `role`) VALUES
(3, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin'),
(4, 'ivanov', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD PRIMARY KEY (`movie_id`,`actor_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_actor_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
