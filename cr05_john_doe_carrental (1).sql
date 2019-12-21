-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Dez 2019 um 12:00
-- Server-Version: 10.4.10-MariaDB
-- PHP-Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr05_john_doe_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_price`
--

CREATE TABLE `additional_price` (
  `BILL_ID` int(11) DEFAULT NULL,
  `STATEMENT_ID` int(11) DEFAULT NULL,
  `ADD_PRICE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `additional_price`
--

INSERT INTO `additional_price` (`BILL_ID`, `STATEMENT_ID`, `ADD_PRICE`) VALUES
(1, 3, 200),
(2, 2, NULL),
(3, 4, 50),
(4, 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bill`
--

CREATE TABLE `bill` (
  `BILL_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `CAR_ID` int(11) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `bill`
--

INSERT INTO `bill` (`BILL_ID`, `CUSTOMER_ID`, `CAR_ID`, `PRICE`) VALUES
(1, 3, 1, 500),
(2, 2, 2, 600),
(3, 4, 3, 700),
(4, 1, 4, 800);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_feature`
--

CREATE TABLE `car_feature` (
  `FEATURE_ID` int(11) NOT NULL,
  `DOOR` int(11) DEFAULT NULL,
  `SPEED` int(11) DEFAULT NULL,
  `SEATS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car_feature`
--

INSERT INTO `car_feature` (`FEATURE_ID`, `DOOR`, `SPEED`, `SEATS`) VALUES
(1, 4, 180, 4),
(2, 4, 200, 4),
(3, 4, 200, 4),
(4, 4, 200, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_model`
--

CREATE TABLE `car_model` (
  `CAR_ID` int(11) NOT NULL,
  `MODEL_NAME` varchar(30) DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `CAR_FEATURE_ID` int(11) DEFAULT NULL,
  `BILL_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car_model`
--

INSERT INTO `car_model` (`CAR_ID`, `MODEL_NAME`, `CUSTOMER_ID`, `CAR_FEATURE_ID`, `BILL_ID`) VALUES
(1, 'FORD', 3, 1, 1),
(2, 'BMW', 2, 2, 2),
(3, 'MERCEDES', 4, 3, 3),
(4, 'AUDI', 1, 4, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `LOCATION` varchar(50) DEFAULT NULL,
  `TELEPHONE_NUMBER` varchar(15) DEFAULT NULL,
  `CAR_ID` int(11) DEFAULT NULL,
  `RESERVATION_INFO` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`ID`, `NAME`, `LOCATION`, `TELEPHONE_NUMBER`, `CAR_ID`, `RESERVATION_INFO`) VALUES
(1, 'ALEX RICH', 'RICH STREET', '123465465498644', 4, 1),
(2, 'MAX BUYER', 'TREE HAUS STREET', '456165198541651', 2, 2),
(3, 'HANS ARZT', 'BUYERSE STREET', '789498465498498', 1, 3),
(4, 'JULIA HAUS', 'SOMEWHERE STREET', '159541658465153', 3, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `c_card`
--

CREATE TABLE `c_card` (
  `C_CARD_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `CAR_ID` int(11) DEFAULT NULL,
  `BILL_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `c_card`
--

INSERT INTO `c_card` (`C_CARD_ID`, `CUSTOMER_ID`, `CAR_ID`, `BILL_ID`) VALUES
(1, 1, 4, 4),
(2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `PAYMENT_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `CREDIT_ID` int(11) DEFAULT NULL,
  `CASH_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`PAYMENT_ID`, `CUSTOMER_ID`, `CREDIT_ID`, `CASH_ID`) VALUES
(1, 1, 1, NULL),
(2, 2, 2, NULL),
(3, 3, NULL, 1),
(4, 4, NULL, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `per_cash`
--

CREATE TABLE `per_cash` (
  `per_cash_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `CAR_ID` int(11) DEFAULT NULL,
  `BILL_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `per_cash`
--

INSERT INTO `per_cash` (`per_cash_ID`, `CUSTOMER_ID`, `CAR_ID`, `BILL_ID`) VALUES
(1, 3, 1, 1),
(2, 4, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pick_up`
--

CREATE TABLE `pick_up` (
  `RESERVATION_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `LOCATION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `pick_up`
--

INSERT INTO `pick_up` (`RESERVATION_ID`, `CUSTOMER_ID`, `LOCATION`) VALUES
(1, 1, 'START STREET'),
(2, 2, 'HERE STREET'),
(3, 3, 'EVERYWHERE STREET'),
(4, 4, 'TOO STREET');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `RESERVATION_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `CAR_ID` int(11) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DAY` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`RESERVATION_ID`, `CUSTOMER_ID`, `CAR_ID`, `START_DATE`, `END_DAY`) VALUES
(1, 1, 4, '2019-12-20 10:42:00', '2019-12-24 16:27:00'),
(2, 2, 2, '2019-12-30 11:29:39', '2020-01-02 09:29:00'),
(3, 3, 1, '2019-12-23 15:51:00', '2019-12-27 10:26:00'),
(4, 4, 3, '2019-12-27 10:27:00', '2019-12-29 10:27:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `statement`
--

CREATE TABLE `statement` (
  `STATEMENT_ID` int(11) NOT NULL,
  `CAR_ID` int(11) DEFAULT NULL,
  `GASOLINE` int(11) DEFAULT NULL,
  `DAMAGE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `statement`
--

INSERT INTO `statement` (`STATEMENT_ID`, `CAR_ID`, `GASOLINE`, `DAMAGE`) VALUES
(1, 4, 100, 'HEALTHY'),
(2, 2, 100, 'HEALTHY'),
(3, 1, 75, 'A LITTLE SCRATCH'),
(4, 3, 75, 'HEALTHY');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additional_price`
--
ALTER TABLE `additional_price`
  ADD KEY `BILL_ID` (`BILL_ID`),
  ADD KEY `STATEMENT_ID` (`STATEMENT_ID`);

--
-- Indizes für die Tabelle `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BILL_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `CAR_ID` (`CAR_ID`);

--
-- Indizes für die Tabelle `car_feature`
--
ALTER TABLE `car_feature`
  ADD PRIMARY KEY (`FEATURE_ID`);

--
-- Indizes für die Tabelle `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`CAR_ID`),
  ADD KEY `CAR_FEATURE_ID` (`CAR_FEATURE_ID`),
  ADD KEY `BILL_ID` (`BILL_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CAR_ID` (`CAR_ID`),
  ADD KEY `RESERVATION_INFO` (`RESERVATION_INFO`);

--
-- Indizes für die Tabelle `c_card`
--
ALTER TABLE `c_card`
  ADD PRIMARY KEY (`C_CARD_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `CAR_ID` (`CAR_ID`),
  ADD KEY `BILL_ID` (`BILL_ID`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PAYMENT_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `CASH_ID` (`CASH_ID`);

--
-- Indizes für die Tabelle `per_cash`
--
ALTER TABLE `per_cash`
  ADD PRIMARY KEY (`per_cash_ID`),
  ADD KEY `BILL_ID` (`BILL_ID`),
  ADD KEY `CAR_ID` (`CAR_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indizes für die Tabelle `pick_up`
--
ALTER TABLE `pick_up`
  ADD PRIMARY KEY (`RESERVATION_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`RESERVATION_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `CAR_ID` (`CAR_ID`);

--
-- Indizes für die Tabelle `statement`
--
ALTER TABLE `statement`
  ADD PRIMARY KEY (`STATEMENT_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bill`
--
ALTER TABLE `bill`
  MODIFY `BILL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `car_feature`
--
ALTER TABLE `car_feature`
  MODIFY `FEATURE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `car_model`
--
ALTER TABLE `car_model`
  MODIFY `CAR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `c_card`
--
ALTER TABLE `c_card`
  MODIFY `C_CARD_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `payment`
--
ALTER TABLE `payment`
  MODIFY `PAYMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `per_cash`
--
ALTER TABLE `per_cash`
  MODIFY `per_cash_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `RESERVATION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `statement`
--
ALTER TABLE `statement`
  MODIFY `STATEMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `additional_price`
--
ALTER TABLE `additional_price`
  ADD CONSTRAINT `additional_price_ibfk_1` FOREIGN KEY (`BILL_ID`) REFERENCES `bill` (`BILL_ID`),
  ADD CONSTRAINT `additional_price_ibfk_2` FOREIGN KEY (`STATEMENT_ID`) REFERENCES `statement` (`STATEMENT_ID`);

--
-- Constraints der Tabelle `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`CAR_ID`) REFERENCES `car_model` (`CAR_ID`),
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`BILL_ID`) REFERENCES `additional_price` (`BILL_ID`);

--
-- Constraints der Tabelle `car_model`
--
ALTER TABLE `car_model`
  ADD CONSTRAINT `car_model_ibfk_1` FOREIGN KEY (`CAR_FEATURE_ID`) REFERENCES `car_feature` (`FEATURE_ID`),
  ADD CONSTRAINT `car_model_ibfk_2` FOREIGN KEY (`BILL_ID`) REFERENCES `bill` (`BILL_ID`),
  ADD CONSTRAINT `car_model_ibfk_3` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`CAR_ID`) REFERENCES `car_model` (`CAR_ID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`RESERVATION_INFO`) REFERENCES `reservation` (`RESERVATION_ID`);

--
-- Constraints der Tabelle `c_card`
--
ALTER TABLE `c_card`
  ADD CONSTRAINT `c_card_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `c_card_ibfk_2` FOREIGN KEY (`CAR_ID`) REFERENCES `car_model` (`CAR_ID`),
  ADD CONSTRAINT `c_card_ibfk_3` FOREIGN KEY (`BILL_ID`) REFERENCES `bill` (`BILL_ID`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`CASH_ID`) REFERENCES `per_cash` (`per_cash_ID`);

--
-- Constraints der Tabelle `per_cash`
--
ALTER TABLE `per_cash`
  ADD CONSTRAINT `per_cash_ibfk_1` FOREIGN KEY (`BILL_ID`) REFERENCES `bill` (`BILL_ID`),
  ADD CONSTRAINT `per_cash_ibfk_2` FOREIGN KEY (`CAR_ID`) REFERENCES `car_model` (`CAR_ID`),
  ADD CONSTRAINT `per_cash_ibfk_3` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints der Tabelle `pick_up`
--
ALTER TABLE `pick_up`
  ADD CONSTRAINT `pick_up_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`CAR_ID`) REFERENCES `car_model` (`CAR_ID`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`RESERVATION_ID`) REFERENCES `pick_up` (`RESERVATION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
