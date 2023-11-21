-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2023 a las 00:31:17
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `book_store_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `image_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `category_ids`, `title`, `author`, `description`, `qty`, `price`, `image_path`, `date_created`) VALUES
(1, '4,1', 'Libro Ejemplo', 'Autor ejemplo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tincidunt dolor in odio aliquet placerat. Mauris vestibulum lacinia justo, at sollicitudin nisi pretium in. Vivamus et ex at purus placerat laoreet faucibus vitae enim. Sed nibh ex, varius congue augue vitae, ullamcorper porta lorem. Praesent ex nunc, faucibus id eros nec, dapibus tempor justo. Ut turpis urna, euismod ac tincidunt vitae, interdum vel purus. Etiam pellentesque leo eget commodo dignissim. Proin ac lorem id lorem euismod posuere eget eget ipsum.', 0, 2500, '1604631420_books-1419613.jpg', '2020-11-06 10:57:51'),
(2, '1,2', 'Programación en Python', 'Anthony Brun', 'Guía paso a paso del principiante al experto', 0, 1800, '1604631960_python_book.jpg', '2020-11-06 11:06:58'),
(3, '5', 'FORRO RICOR 1/2 OFICIO PLAST MOR', '', '', 0, 6, '1700521560_min1_foto_13_01_2023_09_44_50_760.jpg', '2023-11-20 19:06:46'),
(4, '5', 'FORRO RICOR 1/2 OFICIO PLAST CAF', '', '', 0, 6, '1700521620_min1_foto_13_01_2023_09_44_27_339.jpg', '2023-11-20 19:07:17'),
(5, '5', 'ESTUCHE P/LAPIZ MAPED MINI CUTE BLUE 934804', '', '', 0, 82, '1700521680_min2_foto_09_01_2023_10_04_29_132.jpg', '2023-11-20 19:08:01'),
(6, '5', 'CUADERNO ABC ESP CARTA PUNTEADA 100HJS TAPA DURA', '', '', 0, 19, '1700521680_min1_foto_08_11_2022_18_14_34_024.jpg', '2023-11-20 19:08:37'),
(7, '5', 'HJA TRAPPER ABC NEGRO 5 PERF PUNTEADA PQ200HJS', '', '', 0, 19, '1700521740_min1_foto_17_11_2022_10_58_47_212.jpg', '2023-11-20 19:09:10'),
(8, '5', 'ACUARELA PENTEL ARTS HTP18 18COL X 6ML', '', '', 0, 63, '1700521740_min1_foto_21_10_2022_10_04_49_114.jpg', '2023-11-20 19:09:32'),
(9, '5', 'MARCADOR JGO PELIKAN CO 600 WINDOW JGO8U 30201403', '', '', 0, 96, '1700521800_min2_foto_14_02_2023_16_07_15_078.jpg', '2023-11-20 19:10:00'),
(10, '5', 'LAPIC COLOR PELIKAN MX 30330303 TRIANGULAR 4MM LARGO JGO12U', '', '', 0, 33, '1700521800_min1_foto_14_02_2023_15_57_10_388.jpg', '2023-11-20 19:10:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `customer_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Educación', 'Educación'),
(2, 'Programación', 'Programación'),
(3, 'Fantasía', 'Fantasía'),
(4, 'Empresas', 'Empresas'),
(5, 'Materiales', 'Materiales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `contact`, `email`, `password`, `date_created`) VALUES
(1, 'John Smith', 'Sample address', '+18456-5455-55', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', '2020-11-06 12:59:12'),
(2, 'Ruddy', 'Calle uno', '69943936', 'rr@a.com', '202cb962ac59075b964b07152d234b70', '2023-11-20 19:12:03'),
(3, 'Joshep', 'Calle 5', '25525', 'jj@a.com', '202cb962ac59075b964b07152d234b70', '2023-11-20 19:14:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `address` text NOT NULL,
  `total_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `total_amount`, `status`, `date_created`) VALUES
(1, 1, 'Sample address', 0, 1, '2020-11-06 15:26:12'),
(2, 1, '<br />\r\n<b>Warning</b>:  Undefined array key \"login_address\" in <b>C:xampphtdocsook_storemanage_order.php</b> on line <b>8</b><br />\r\n', 0, 1, '2023-11-18 01:11:08'),
(3, 2, 'Calle uno', 0, 0, '2023-11-20 19:12:48'),
(4, 2, 'Calle uno', 0, 1, '2023-11-20 19:13:12'),
(5, 2, 'Calle uno', 0, 0, '2023-11-20 19:13:29'),
(6, 3, 'Calle 5', 0, 1, '2023-11-20 19:14:21'),
(7, 3, 'Calle 5', 0, 0, '2023-11-20 19:14:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `book_id`, `qty`, `price`) VALUES
(1, 1, 1, 4, 2500),
(2, 1, 2, 3, 1800),
(3, 2, 1, 1, 2500),
(4, 2, 2, 1, 1800),
(5, 3, 6, 1, 19),
(6, 3, 5, 1, 82),
(7, 3, 10, 1, 33),
(8, 4, 10, 1, 33),
(9, 4, 9, 1, 96),
(10, 4, 2, 1, 1800),
(11, 5, 8, 1, 63),
(12, 5, 6, 1, 19),
(13, 5, 5, 1, 82),
(14, 6, 10, 1, 33),
(15, 6, 7, 1, 19),
(16, 6, 4, 1, 6),
(17, 7, 3, 1, 6),
(18, 7, 5, 1, 82),
(19, 7, 6, 1, 19),
(20, 7, 8, 1, 63);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Olimpia', 'info@Olimpia.com', '+591 800-00-1234', 'logo.jpg', '&lt;p dir=&quot;ltr&quot; style=&quot;line-height: 1.295; text-align: center; margin-top: 0pt; margin-bottom: 8pt;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 60px;&quot;&gt;Historia&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height:1.295;text-align: justify;margin-top:0pt;margin-bottom:8pt;&quot;&gt;&lt;span style=&quot;font-size:11pt;font-family:Verdana,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;A lo largo de su trayectoria en la producci&amp;oacute;n, importaci&amp;oacute;n y comercializaci&amp;oacute;n de material escolar y de oficina, Librer&amp;iacute;a y Papeler&amp;iacute;a Olimpia ha estado a la vanguardia en el mercado pace&amp;ntilde;o hace m&amp;aacute;s de seis d&amp;eacute;cadas. En julio de 1959, esta empresa surgi&amp;oacute; a ra&amp;iacute;z del emprendimiento del se&amp;ntilde;or Alfred Weinberg y la se&amp;ntilde;ora Flora J&amp;aacute;uregui, cuya visi&amp;oacute;n de una Bolivia en v&amp;iacute;as de desarrollo fue fundamental para construir y consolidar una de las empresas m&amp;aacute;s importantes y tradicionales de La Paz, con alcance de distribuci&amp;oacute;n a los 9 departamentos de Bolivia. Hoy cumple 62 a&amp;ntilde;os de funci&amp;oacute;n y entrega, permaneciendo el legado, con el trabajo arduo de un equipo &amp;iacute;ntegro con vocaci&amp;oacute;n de servicio, respeto y compromiso con la sociedad que los acoge, que son la base de sus fundadores Alfred y Flora.&lt;/span&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height:1.295;text-align: justify;margin-top:0pt;margin-bottom:8pt;&quot;&gt;&lt;span style=&quot;font-size:11pt;font-family:Verdana,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;Este gran emprendimiento abre sus puertas el 29 de julio de 1959, iniciando actividades en la producci&amp;oacute;n y venta de art&amp;iacute;culos y material de escritorio y oficina en un peque&amp;ntilde;o local del 1024 en la Calle Ingavi. Pasados los 5 primeros a&amp;ntilde;os se trasladan a un local m&amp;aacute;s amplio en el 105; en el mismo logran ampliar su alcance en el mercado con una mayor variedad de productos. A mediados de la d&amp;eacute;cada de los sesenta se realizaron las primeras importaciones provenientes de pa&amp;iacute;ses lim&amp;iacute;trofes, y a partir de los a&amp;ntilde;os 70 contin&amp;uacute;an las importaciones de productos de marcas de primera calidad como STAEDTLER y PELIKAN.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://localhost/book_store/admin/assets/uploads/1700279460_1700279476343.jpeg&quot; style=&quot;width: 300px;&quot; class=&quot;fr-fic fr-dib&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height: 1.295; margin-top: 0pt; margin-bottom: 8pt; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 60px;&quot;&gt;MISI&amp;Oacute;N, VISI&amp;Oacute;N, VALORES DE LA EMPRESA&lt;/span&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height:1.295;text-align: justify;margin-top:0pt;margin-bottom:8pt;&quot;&gt;&lt;span style=&quot;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;Misi&amp;oacute;n:&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;&amp;nbsp;Brindar soluciones a las necesidades de nuestros clientes a trav&amp;eacute;s de la comercializaci&amp;oacute;n, fabricaci&amp;oacute;n y distribuci&amp;oacute;n de productos y servicios de calidad, manteniendo el liderazgo en el mercado.&lt;/span&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height:1.295;text-align: justify;margin-top:0pt;margin-bottom:8pt;&quot;&gt;&lt;span style=&quot;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;Visi&amp;oacute;n:&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;&amp;nbsp;Ser la primera opci&amp;oacute;n de nuestros clientes y referentes de mejora continua en nuestras l&amp;iacute;neas de negocio.&lt;/span&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height:1.295;text-align: justify;margin-top:0pt;margin-bottom:8pt;&quot;&gt;&lt;span style=&quot;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;Valores:&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;margin-top:0;margin-bottom:0;padding-inline-start:48px;&quot;&gt;&lt;li dir=&quot;ltr&quot; style=&quot;list-style-type:disc;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height:1.295;text-align: justify;margin-top:0pt;margin-bottom:0pt;&quot;&gt;&lt;span style=&quot;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;Respeto: Brindamos un trato amable y cortes reconociendo y valorando las cualidades de nuestros clientes internos y externos.&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;li dir=&quot;ltr&quot; style=&quot;list-style-type:disc;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height:1.295;text-align: justify;margin-top:0pt;margin-bottom:0pt;&quot;&gt;&lt;span style=&quot;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;Compromiso: Ofrecemos un servicio de calidad a trav&amp;eacute;s de la comercializaci&amp;oacute;n, fabricaci&amp;oacute;n y distribuci&amp;oacute;n de nuestros productos.&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;li dir=&quot;ltr&quot; style=&quot;list-style-type:disc;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height:1.295;text-align: justify;margin-top:0pt;margin-bottom:0pt;&quot;&gt;&lt;span style=&quot;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;Integridad: Quienes conforman la empresa realizan sus actividades con honradez, responsabilidad puntualidad y lealtad.&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;li dir=&quot;ltr&quot; style=&quot;list-style-type:disc;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;line-height:1.295;text-align: justify;margin-top:0pt;margin-bottom:8pt;&quot;&gt;&lt;span style=&quot;font-size:12pt;font-family:&rsquo;Century Gothic&rsquo;,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;&quot;&gt;Vocaci&amp;oacute;n de servicio: Nos caracterizamos por brindar a nuestros clientes sin excepciones, un servicio de calidad.&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
