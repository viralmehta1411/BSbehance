-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 02, 2021 at 02:54 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `comment` varchar(140) NOT NULL,
  `commentOn` int(11) NOT NULL,
  `commentBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `comment`, `commentOn`, `commentBy`) VALUES
(2, 'helo', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `followID` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `followOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likeID` int(11) NOT NULL,
  `likeBy` int(11) NOT NULL,
  `likeOn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `message` text NOT NULL,
  `messageTo` int(11) NOT NULL,
  `messageFrom` int(11) NOT NULL,
  `messageOn` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL,
  `notificationFor` int(11) NOT NULL,
  `notificationFrom` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('follow','retweet','like','mention') NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `trendID` int(11) NOT NULL,
  `hashtag` varchar(140) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`trendID`, `hashtag`, `CreatedOn`) VALUES
(1, 'php', '2017-04-14 13:34:49'),
(2, 'meralesson', '2017-05-10 20:14:50'),
(6, 'PanamaCase', '2017-05-19 20:17:34'),
(7, 'QuoteOfTheDay', '2017-05-19 20:17:34'),
(8, 'test', '2021-12-02 13:01:58');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `tweetID` int(11) NOT NULL,
  `status` varchar(140) NOT NULL,
  `tweetBy` int(11) NOT NULL,
  `tweetImage` varchar(255) NOT NULL,
  `retweetID` int(11) DEFAULT 0,
  `retweetBy` int(11) NOT NULL DEFAULT 0,
  `postedOn` datetime NOT NULL,
  `likesCount` int(11) DEFAULT 0,
  `retweetCount` int(11) DEFAULT 0,
  `retweetMsg` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`tweetID`, `status`, `tweetBy`, `tweetImage`, `retweetID`, `retweetBy`, `postedOn`, `likesCount`, `retweetCount`, `retweetMsg`) VALUES
(1, 'i <3 php', 1, '', 0, 0, '2017-04-19 16:12:03', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(140) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `screenName` varchar(40) DEFAULT NULL,
  `profileImage` varchar(255) NOT NULL,
  `profileCover` varchar(255) NOT NULL,
  `following` int(11) DEFAULT 0,
  `followers` int(11) DEFAULT 0,
  `bio` varchar(140) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `screenName`, `profileImage`, `profileCover`, `following`, `followers`, `bio`, `country`, `website`) VALUES
(1, 'aizazdinho', 'aizaz.dinho@meralesson.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Aizaz dinho', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 0, 0, 'Online Instructor, PHP developer, Entrepreneur. And i loved to do impossible things http://goo.gl/zmQxin', 'Pakistan', 'www.meralesson.com'),
(2, 'dany', 'dany@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'dany', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 0, 0, 'User from nowhere', ' Pakistan', 'www.meralesson.com'),
(9, 'test123', 'test@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'test', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 0, 0, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`followID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likeID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`trendID`),
  ADD UNIQUE KEY `hashtag` (`hashtag`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`tweetID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `followID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `trendID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `tweetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
