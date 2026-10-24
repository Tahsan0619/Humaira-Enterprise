
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Feeding','feeding','Bottles, sippy cups and everyday feeding essentials for little ones.','assets/images/categories/feeding.jpg',0,1,'2026-10-13 08:14:23','2026-10-13 08:14:23'),(2,'Diapers & Wipes','diapers-wipes','Soft diapers and gentle wipes for newborns and toddlers.','assets/images/categories/diapers.jpg',1,1,'2026-10-13 08:14:23','2026-10-13 08:14:23'),(3,'Baby Clothing','baby-clothing','Soft cotton rompers, blankets and everyday wear.','assets/images/categories/clothing.jpg',2,1,'2026-10-13 08:14:23','2026-10-13 08:14:23'),(4,'Toys & Play','toys-play','Soft toys and teethers chosen for safe play.','assets/images/categories/toys.jpg',3,1,'2026-10-13 08:14:23','2026-10-13 08:14:23'),(5,'Nursery','nursery','Mobiles, strollers and pieces that make the nursery calm.','assets/images/categories/nursery.jpg',4,1,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(6,'Bath & Care','bath-care','Bathtubs, lotion and gentle care for bath time.','assets/images/categories/bath-care.jpg',5,1,'2026-10-13 08:14:24','2026-10-13 08:14:24');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` varchar(191) NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_10_01_134955_create_personal_access_tokens_table',1),(5,'2026_10_01_140000_create_shop_tables',1),(6,'2026_10_01_160000_add_online_payment_to_orders_table',1),(7,'2026_10_02_120000_add_free_shipping_to_products_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `product_name` varchar(191) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(30) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `customer_name` varchar(191) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `city` varchar(191) DEFAULT NULL,
  `shipping_area` varchar(30) NOT NULL DEFAULT 'inside_dhaka',
  `notes` text DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) NOT NULL DEFAULT 'cod',
  `payment_status` varchar(20) NOT NULL DEFAULT 'unpaid',
  `transaction_id` varchar(191) DEFAULT NULL,
  `sp_order_id` varchar(100) DEFAULT NULL,
  `payment_channel` varchar(50) DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_status_index` (`status`),
  KEY `orders_sp_order_id_index` (`sp_order_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'About Us','about-us','<h2>Welcome to Humaira Enterprise</h2>\n<p><strong>Humaira Enterprise</strong> is a baby shop for feeding, diapers, clothing, toys, nursery and bath care. We pack everyday baby products with care and deliver them across Bangladesh.</p>\n<hr>\n<h3><i class=\"fa-solid fa-boxes-stacked\"></i> What we offer</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-bottle-droplet\"></i><span><strong>Feeding:</strong> bottles and sippy cups for daily meals.</span></li>\n<li><i class=\"fa-solid fa-baby\"></i><span><strong>Diapers &amp; wipes:</strong> soft diapers and fragrance-free wipes.</span></li>\n<li><i class=\"fa-solid fa-shirt\"></i><span><strong>Clothing:</strong> cotton rompers and muslin blankets.</span></li>\n<li><i class=\"fa-solid fa-puzzle-piece\"></i><span><strong>Toys:</strong> plush toys and teethers.</span></li>\n<li><i class=\"fa-solid fa-bed\"></i><span><strong>Nursery:</strong> mobiles and strollers.</span></li>\n<li><i class=\"fa-solid fa-bath\"></i><span><strong>Bath &amp; care:</strong> bathtubs and gentle lotion.</span></li>\n</ul>\n<hr>\n<h3><i class=\"fa-solid fa-award\"></i> Why shop with us?</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-circle-check\"></i><span>Products chosen for babies and everyday family use</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span>Clear prices and regular offers</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span>Cash on Delivery and secure online payment via shurjoPay (bKash, Nagad, Rocket, Visa, Mastercard)</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span>Home delivery all over Bangladesh</span></li>\n</ul>\n<hr>\n<h3><i class=\"fa-solid fa-headset\"></i> Contact us</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-phone\"></i><span>Phone: <a href=\"tel:01754471654\">01754471654</a></span></li>\n<li><i class=\"fa-brands fa-whatsapp\"></i><span>WhatsApp: <a href=\"https://wa.me/8801754471654\" target=\"_blank\" rel=\"noopener\">01754471654</a></span></li>\n<li><i class=\"fa-solid fa-envelope\"></i><span>Email: <a href=\"mailto:info@humairaenterprise.com\">info@humairaenterprise.com</a></span></li>\n</ul>',1,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(2,'Refund and Returns Policy','refund-returns','<h2>Refund &amp; Returns Policy</h2>\n<p>At <strong>Humaira Enterprise</strong> we want you to be happy with what arrives. If something is not right, this is how returns and refunds work.</p>\n<h3><i class=\"fa-solid fa-circle-check\"></i> Eligible for return / replacement</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-circle-check\"></i><span><strong>Wrong product delivered:</strong> the item is different from your order.</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span><strong>Damaged on arrival:</strong> the product or pack is damaged when it reaches you.</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span><strong>Missing items:</strong> pieces listed with the product are missing.</span></li>\n</ul>\n<p>Please tell us within <strong>3 days of delivery</strong> and share photos of the product and the packaging.</p>\n<h3><i class=\"fa-solid fa-circle-xmark\"></i> Not eligible</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-circle-xmark\"></i><span>Opened hygiene products, including diapers, wipes and lotion, once the seal is broken</span></li>\n<li><i class=\"fa-solid fa-circle-xmark\"></i><span>Products used, washed or damaged after delivery</span></li>\n<li><i class=\"fa-solid fa-circle-xmark\"></i><span>Items returned without the original box or invoice</span></li>\n<li><i class=\"fa-solid fa-circle-xmark\"></i><span>Change of mind after the product has been used</span></li>\n</ul>\n<h3><i class=\"fa-solid fa-rotate-left\"></i> Refund process</h3>\n<ul>\n<li>Once we receive and check the return, we confirm a refund or a replacement.</li>\n<li>Approved refunds are processed within <strong>5 to 7 business days</strong>.</li>\n<li>Online payments made through shurjoPay are refunded to the original payment method. Cash on Delivery orders are refunded via bKash, Nagad or bank transfer.</li>\n<li>Delivery charges are refunded only when the return is our mistake.</li>\n</ul>\n<h3><i class=\"fa-solid fa-headset\"></i> Contact us</h3>\n<p>For a return or refund question, call or message us.</p>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-phone\"></i><span>Phone: <a href=\"tel:01754471654\">01754471654</a></span></li>\n<li><i class=\"fa-brands fa-whatsapp\"></i><span>WhatsApp: <a href=\"https://wa.me/8801754471654\" target=\"_blank\" rel=\"noopener\">01754471654</a></span></li>\n</ul>',1,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(3,'Terms & Conditions','terms-conditions','<h2>Terms &amp; Conditions</h2>\n<p>By using the Humaira Enterprise website or placing an order, you agree to these terms.</p>\n<h3>1. Products &amp; pricing</h3>\n<ul>\n<li>All prices are in Bangladeshi Taka (৳).</li>\n<li>Product photos show the item. Colour and packaging can vary slightly.</li>\n<li>Prices, offers and stock can change without notice.</li>\n</ul>\n<h3>2. Orders</h3>\n<ul>\n<li>We may call you to confirm an order before it is shipped.</li>\n<li>We may cancel an order if a product is out of stock, the price was listed incorrectly, or the details cannot be verified. Any payment already taken is refunded in full.</li>\n</ul>\n<h3>3. Payment</h3>\n<ul>\n<li>We accept Cash on Delivery and online payment through <strong>shurjoPay</strong> (bKash, Nagad, Rocket, Visa, Mastercard and other supported methods).</li>\n<li>Online payments are processed by shurjoPay. We never see or store your card or wallet PIN.</li>\n</ul>\n<h3>4. Delivery</h3>\n<ul>\n<li>Inside Dhaka: usually within 24 to 48 hours. Outside Dhaka: usually within 2 to 5 business days.</li>\n<li>Please check the product before you accept it.</li>\n<li>If delivery fails because of a wrong address or an unreachable phone, a re-delivery charge may apply.</li>\n</ul>\n<h3>5. Privacy</h3>\n<p>Your name, phone number and address are used to process and deliver your order. They are not sold to anyone else.</p>\n<h3>6. Returns</h3>\n<p>See our <a href=\"refund-returns.html\">Refund &amp; Returns Policy</a>.</p>\n<h3>7. Contact</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-phone\"></i><span>Phone: <a href=\"tel:01754471654\">01754471654</a></span></li>\n<li><i class=\"fa-brands fa-whatsapp\"></i><span>WhatsApp: <a href=\"https://wa.me/8801754471654\" target=\"_blank\" rel=\"noopener\">01754471654</a></span></li>\n</ul>',1,'2026-10-13 08:14:24','2026-10-13 08:14:24');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT 0,
  `unit` varchar(50) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `sold_count` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Soft Silicone Feeding Bottle 260ml','soft-silicone-feeding-bottle','A soft silicone feeding bottle with a gentle nipple, easy to hold and simple to clean.','<p>A soft silicone feeding bottle with a gentle nipple, easy to hold and simple to clean.</p><h3>Details</h3><ul><li>260ml capacity</li><li>Soft silicone body</li><li>Wide neck for easy cleaning</li><li>Slow-flow nipple</li><li>BPA free</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',850.00,690.00,40,'260ml, Blush','assets/images/products/feeding-bottle.jpg',1,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(2,1,'Sippy Cup with Handles','sippy-cup-with-handles','A two-handle sippy cup that helps little hands learn to drink on their own.','<p>A two-handle sippy cup that helps little hands learn to drink on their own.</p><h3>Details</h3><ul><li>Soft spout</li><li>Two easy-grip handles</li><li>Leak-resistant lid</li><li>Easy to take apart and wash</li><li>BPA free</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',650.00,520.00,50,'Blush','assets/images/products/sippy-cup.jpg',1,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(3,2,'Newborn Diaper Pack','newborn-diaper-pack','Soft newborn diapers with a gentle fit for daytime and night.','<p>Soft newborn diapers with a gentle fit for daytime and night.</p><h3>Details</h3><ul><li>44 pieces</li><li>Soft inner layer</li><li>Wetness indicator</li><li>Flexible sides</li><li>Newborn fit</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',1290.00,1090.00,60,'44 pieces','assets/images/products/diaper-pack.jpg',1,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(4,2,'Fragrance-free Baby Wipes','fragrance-free-baby-wipes','Thick, fragrance-free wipes for diaper changes and messy hands.','<p>Thick, fragrance-free wipes for diaper changes and messy hands.</p><h3>Details</h3><ul><li>3 packs</li><li>Fragrance free</li><li>Soft cloth texture</li><li>Resealable pack</li><li>For face, hands and diaper changes</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',480.00,390.00,80,'3 packs','assets/images/products/baby-wipes.jpg',0,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(5,3,'Cotton Romper Set','cotton-romper-set','A soft cotton romper set in blush and cream for everyday wear.','<p>A soft cotton romper set in blush and cream for everyday wear.</p><h3>Details</h3><ul><li>Soft cotton</li><li>Snap buttons for easy changing</li><li>0 to 6 months</li><li>Gentle on skin</li><li>Machine washable</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',1450.00,1190.00,30,'0 to 6 months','assets/images/products/cotton-romper.jpg',1,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(6,3,'Muslin Swaddle Blanket','muslin-swaddle-blanket','A breathable muslin swaddle that stays soft wash after wash.','<p>A breathable muslin swaddle that stays soft wash after wash.</p><h3>Details</h3><ul><li>Lightweight muslin</li><li>Generous size for swaddling</li><li>Breathable weave</li><li>Gets softer with washing</li><li>Cream and blush</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',980.00,790.00,35,'Cream and blush','assets/images/products/muslin-blanket.jpg',1,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(7,4,'Plush Bunny Soft Toy','plush-bunny-soft-toy','A small plush bunny with a soft hug, made for cuddles and nursery shelves.','<p>A small plush bunny with a soft hug, made for cuddles and nursery shelves.</p><h3>Details</h3><ul><li>Soft plush</li><li>Lightweight</li><li>Stitched features</li><li>Suitable from birth with supervision</li><li>Surface wash</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',890.00,720.00,40,'Cream','assets/images/products/plush-bunny.jpg',1,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(8,4,'Silicone Teether Set','silicone-teether-set','A set of soft silicone teethers in calm colours for soothing gums.','<p>A set of soft silicone teethers in calm colours for soothing gums.</p><h3>Details</h3><ul><li>Set of 3</li><li>Soft silicone</li><li>Easy to grip</li><li>Fridge friendly</li><li>BPA free</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',420.00,350.00,70,'Set of 3','assets/images/products/teether-set.jpg',0,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(9,5,'Wooden Baby Mobile','wooden-baby-mobile','A gentle wooden mobile with felt stars and a moon for the crib.','<p>A gentle wooden mobile with felt stars and a moon for the crib.</p><h3>Details</h3><ul><li>Wooden frame</li><li>Felt stars and moon</li><li>Calm motion</li><li>Nursery decor</li><li>For crib or cot</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',1650.00,1390.00,18,'Stars and moon','assets/images/products/baby-mobile.jpg',1,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(10,5,'Lightweight Baby Stroller','lightweight-baby-stroller','A compact stroller that folds small and rolls smoothly for daily walks.','<p>A compact stroller that folds small and rolls smoothly for daily walks.</p><h3>Details</h3><ul><li>Lightweight frame</li><li>One-hand fold</li><li>Canopy for shade</li><li>Storage basket</li><li>Five-point harness</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',8900.00,7490.00,10,'Blush','assets/images/products/baby-stroller.jpg',1,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(11,6,'Baby Bathtub with Seat','baby-bathtub-with-seat','A small bathtub with a soft seat so bath time stays steady and simple.','<p>A small bathtub with a soft seat so bath time stays steady and simple.</p><h3>Details</h3><ul><li>Built-in soft seat</li><li>Easy-drain plug</li><li>Non-slip base</li><li>Compact size</li><li>Simple to wipe clean</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',2200.00,1850.00,16,'Warm white','assets/images/products/baby-bathtub.jpg',0,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(12,6,'Gentle Baby Lotion 400ml','gentle-baby-lotion','A light daily lotion for soft skin after bath time.','<p>A light daily lotion for soft skin after bath time.</p><h3>Details</h3><ul><li>400ml pump bottle</li><li>Light, non-greasy feel</li><li>For daily use</li><li>No strong fragrance</li><li>Dermatologically gentle formula</li></ul><h3>Why buy from Humaira Enterprise?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',560.00,450.00,55,'400ml','assets/images/products/baby-lotion.jpg',0,1,0,0,'2026-10-13 08:14:24','2026-10-13 08:14:24');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `link` varchar(191) DEFAULT NULL,
  `position` varchar(20) NOT NULL DEFAULT 'main',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,'Gentle Care for Every Day','Feeding, clothing and nursery picks for your baby','assets/images/slides/slide-1.jpg','shop.html?category=feeding','main',1,1,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(2,'A Calm Nursery','Soft blankets, mobiles and bath-time essentials','assets/images/slides/slide-2.jpg','shop.html?category=nursery','main',2,1,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(3,'Feeding',NULL,'assets/images/products/feeding-bottle.jpg','shop.html?category=feeding','side',1,1,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(4,'Soft Toys',NULL,'assets/images/products/plush-bunny.jpg','shop.html?category=toys-play','side',2,1,'2026-10-13 08:14:24','2026-10-13 08:14:24'),(5,'Bath Time',NULL,'assets/images/products/baby-bathtub.jpg','shop.html?category=bath-care','side',3,1,'2026-10-13 08:14:24','2026-10-13 08:14:24');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@gmail.com','01754471654',NULL,NULL,1,NULL,'$2y$12$bbGQygtYe/sZ2u8BWytC1.06po7z.DJMM7GG8phmq7hqx1idzqWee',NULL,'2026-10-13 08:14:23','2026-10-13 08:14:23'),(2,'Customer','customer@gmail.com',NULL,NULL,NULL,0,NULL,'$2y$12$oDtQlfxNFnyju8L4ey/aIOYW5c29.qH6V7S9xdNv.hodAY9dwMIje',NULL,'2026-10-13 08:14:23','2026-10-13 08:14:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

