CREATE DATABASE  IF NOT EXISTS `pushletchatingroom` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pushletchatingroom`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 172.17.12.100    Database: pushletchatingroom
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chating_record`
--

DROP TABLE IF EXISTS `chating_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chating_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `content` varchar(100) NOT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chating_record`
--

LOCK TABLES `chating_record` WRITE;
/*!40000 ALTER TABLE `chating_record` DISABLE KEYS */;
INSERT INTO `chating_record` VALUES (1,'james','== 提示：我刚刚进入聊天室 ==','2015-10-25 00:25:38'),(2,'james','nihao','2015-10-25 00:25:43'),(3,'james','== 提示：我刚刚进入聊天室 ==','2015-10-25 00:51:40'),(4,'james','== 提示：我刚刚进入聊天室 ==','2015-10-25 00:54:28'),(5,'james','So','2015-10-25 01:04:34'),(6,'james','who r you','2015-10-25 01:04:36'),(7,'sam','== 提示：我刚刚进入聊天室 ==','2015-10-25 01:04:48'),(8,'sam','i am some one you can','2015-10-25 01:04:58'),(9,'james','== 提示：我刚刚进入聊天室 ==','2015-10-25 01:07:54'),(10,'james','== 提示：我刚刚进入聊天室 ==','2015-10-25 01:11:56'),(11,'james','HI','2015/10/25 01:21:18'),(12,'james','nihao','2015/10/25 01:21:58'),(13,'sam','== 提示：我刚刚进入聊天室 ==','2015/10/25 01:27:00'),(14,'sam','在吗','2015/10/25 02:00:39'),(15,'james','我在呀','2015/10/25 02:00:48'),(16,'james','== 提示：我刚刚进入聊天室 ==','2015/10/25 03:03:52'),(17,'james','I am in','2015/10/25 03:04:00'),(18,'james','== 提示：我刚刚进入聊天室 ==','2015/10/25 10:45:59'),(19,'123456','== 提示：我刚刚进入聊天室 ==','2015/10/25 11:44:51'),(20,'james','== 提示：我刚刚进入聊天室 ==','2015/10/25 11:47:20'),(21,'james','看到我没','2015/10/25 11:47:27'),(22,'guozi','== 提示：我刚刚进入聊天室 ==','2015/10/25 12:14:09'),(23,'guozi','lalalal','2015/10/25 12:14:40'),(24,'guozi','为什么','2015/10/25 12:14:44'),(25,'guozi','我要重新注册','2015/10/25 12:14:49'),(26,'james','== 提示：我刚刚进入聊天室 ==','2015/10/25 12:15:35'),(27,'guozi','我要重新注册','2015/10/25 12:15:45'),(28,'james','可能因为你2','2015/10/25 12:15:47'),(29,'james','什么鬼','2015/10/25 12:15:50'),(30,'james','为啥','2015/10/25 12:15:52'),(31,'guozi','？','2015/10/25 12:15:53'),(32,'james','卧槽咯 好像出现新的BUG了','2015/10/25 12:16:14'),(33,'guozi','为什么我刚才看不到我的消息','2015/10/25 12:16:21'),(34,'james','不会吧','2015/10/25 12:16:26'),(35,'james','我都看到了','2015/10/25 12:16:29'),(36,'guozi','为什么会有两个jams','2015/10/25 12:16:34'),(37,'james','因为那边显示出问题了','2015/10/25 12:16:45'),(38,'guozi','还有好多个游客诶','2015/10/25 12:16:47'),(39,'james','都是幽灵账号','2015/10/25 12:17:00'),(40,'guozi','不用注册都可以登录的吗','2015/10/25 12:17:10'),(41,'一本正经的胡说八道_(:з」∠)_','== 提示：我刚刚进入聊天室 ==','2015/10/25 12:17:16'),(42,'james','不可以','2015/10/25 12:17:17'),(43,'james','卧槽了','2015/10/25 12:17:20'),(44,'james','这个又是谁','2015/10/25 12:17:24'),(45,'guozi','为什么可以用中文注册你都不告诉我','2015/10/25 12:17:40'),(46,'guozi','何欣','2015/10/25 12:17:44'),(47,'james','我昨晚加了个拦截器就好了','2015/10/25 12:18:12'),(48,'guozi','手机也可以玩的吗，啊','2015/10/25 12:18:59'),(49,'james','可以','2015/10/25 12:19:06'),(50,'james','可是','2015/10/25 12:19:07'),(51,'guozi','6666','2015/10/25 12:19:09'),(52,'james','有点麻烦','2015/10/25 12:19:14'),(53,'james','我这个没有为手机适配 平板可以玩','2015/10/25 12:19:25'),(54,'guozi','我现在有时候发消息要刷新才可以看到','2015/10/25 12:19:26'),(55,'一本正经的胡说八道_(:з」∠)_','== 提示：我刚刚进入聊天室 ==','2015/10/25 12:19:39'),(56,'james','那么6','2015/10/25 12:19:41'),(57,'james','他怎么又进了','2015/10/25 12:19:46'),(58,'james','可能是因为页面局部刷新出问题了','2015/10/25 12:19:59'),(59,'guozi','因为她是手机啊','2015/10/25 12:20:14'),(60,'james','卧槽了','2015/10/25 12:20:20'),(61,'james','小屏幕手机只能看到我们讲话','2015/10/25 12:20:34'),(62,'james','发不了言','2015/10/25 12:20:39'),(63,'guozi','哈哈哈哈哈哈哈','2015/10/25 12:21:00'),(64,'james','因为其实这个是个窗口 而不是一个页面哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈','2015/10/25 12:21:01'),(65,'james','而且你没发现按你的要求增加了消息清空吗。。','2015/10/25 12:21:44'),(66,'guozi','我要即时刷新看到消息','2015/10/25 12:21:54'),(67,'guozi','自动刷新好不嗨','2015/10/25 12:22:05'),(68,'guozi','卧槽。我点了清空','2015/10/25 12:22:25'),(69,'guozi','可是一刷新又有历史记录了','2015/10/25 12:23:03'),(70,'james','即使刷新？','2015/10/25 12:23:15'),(71,'james','我不用啊','2015/10/25 12:23:20'),(72,'james','对啊','2015/10/25 12:23:21'),(73,'james','就是这样的','2015/10/25 12:23:25'),(74,'guozi','可是我要诶','2015/10/25 12:23:28'),(75,'james','你要全部消息清空？','2015/10/25 12:23:38'),(76,'guozi','我有时候可以即时刷新。有时候要自己刷新','2015/10/25 12:23:44'),(77,'james','我服了','2015/10/25 12:23:50'),(78,'james','你用什么浏览器','2015/10/25 12:24:06'),(79,'guozi','不是不是、是即时刷新','2015/10/25 12:24:09'),(80,'guozi','火狐','2015/10/25 12:24:12'),(81,'james','== 提示：我刚刚进入聊天室 ==','2015/10/25 21:20:05'),(82,'james','== 提示：我刚刚进入聊天室 ==','2015/10/26 10:17:09'),(83,'james','人了','2015/10/26 10:17:17'),(84,'james','人呢','2015/10/26 10:17:24'),(85,'james','== 鎻愮ず锛氭垜鍒氬垰杩涘叆鑱婂ぉ瀹� ==','2015/10/27 14:28:49'),(86,'james','完了','2015/10/27 14:29:12'),(87,'james','好严重','2015/10/27 14:29:27'),(88,'sam','== 鎻愮ず锛氭垜鍒氬垰杩涘叆鑱婂ぉ瀹� ==','2015/10/27 14:30:20'),(89,'sam','Can you see','2015/10/27 14:30:39'),(90,'sam','看到了吗','2015/10/27 14:31:10'),(91,'sam','[em_35]','2015/10/27 14:31:22'),(92,'james','== 鎻愮ず锛氭垜鍒氬垰杩涘叆鑱婂ぉ瀹� ==','2015/10/27 15:42:29'),(93,'lwx','== 鎻愮ず锛氭垜鍒氬垰杩涘叆鑱婂ぉ瀹� ==','2015/10/27 15:44:35'),(94,'','看到我了吗','2015/10/27 15:45:11'),(95,'james','== 鎻愮ず锛氭垜鍒氬垰杩涘叆鑱婂ぉ瀹� ==','2015/10/27 15:45:48'),(96,'lwx','== 鎻愮ず锛氭垜鍒氬垰杩涘叆鑱婂ぉ瀹� ==','2015/10/27 15:47:45'),(97,'lwx','== 鎻愮ず锛氭垜鍒氬垰杩涘叆鑱婂ぉ瀹� ==','2015/10/27 16:20:38'),(98,'','dnd','2015/10/27 16:23:28'),(99,'','dobdkf','2015/10/27 16:23:35'),(100,'lwx','== 鎻愮ず锛氭垜鍒氬垰杩涘叆鑱婂ぉ瀹� ==','2015/10/27 16:23:55');
/*!40000 ALTER TABLE `chating_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'james','123'),(2,'sam','123'),(3,'轩憬彦','123'),(4,'123456','123456'),(5,'guozi','123456'),(6,'一本正经的胡说八道_(:з」∠)_','123456'),(7,'lwx','123456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-23 12:04:44
