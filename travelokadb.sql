-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Nov 2023 pada 19.12
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelokadb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `airlinetypes`
--

CREATE TABLE `airlinetypes` (
  `AirlineTypeID` int(11) NOT NULL,
  `TypeName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `flightbookings`
--

CREATE TABLE `flightbookings` (
  `BookingID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FlightID` int(11) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `flights`
--

CREATE TABLE `flights` (
  `FlightID` int(11) NOT NULL,
  `AirlineTypeID` int(11) DEFAULT NULL,
  `DepartureLocationID` int(11) DEFAULT NULL,
  `ArrivalLocationID` int(11) DEFAULT NULL,
  `DepartureTime` datetime DEFAULT NULL,
  `ArrivalTime` datetime DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hotelbookings`
--

CREATE TABLE `hotelbookings` (
  `BookingID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `HotelID` int(11) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `CheckInDate` date DEFAULT NULL,
  `CheckOutDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hotels`
--

CREATE TABLE `hotels` (
  `HotelID` int(11) NOT NULL,
  `HotelName` varchar(100) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `HotelTypeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hoteltypes`
--

CREATE TABLE `hoteltypes` (
  `HotelTypeID` int(11) NOT NULL,
  `TypeName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `locations`
--

CREATE TABLE `locations` (
  `LocationID` int(11) NOT NULL,
  `LocationName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `RegistrationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `airlinetypes`
--
ALTER TABLE `airlinetypes`
  ADD PRIMARY KEY (`AirlineTypeID`);

--
-- Indeks untuk tabel `flightbookings`
--
ALTER TABLE `flightbookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `FlightID` (`FlightID`);

--
-- Indeks untuk tabel `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`FlightID`),
  ADD KEY `AirlineTypeID` (`AirlineTypeID`),
  ADD KEY `DepartureLocationID` (`DepartureLocationID`),
  ADD KEY `ArrivalLocationID` (`ArrivalLocationID`);

--
-- Indeks untuk tabel `hotelbookings`
--
ALTER TABLE `hotelbookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `HotelID` (`HotelID`);

--
-- Indeks untuk tabel `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`HotelID`),
  ADD KEY `LocationID` (`LocationID`),
  ADD KEY `HotelTypeID` (`HotelTypeID`);

--
-- Indeks untuk tabel `hoteltypes`
--
ALTER TABLE `hoteltypes`
  ADD PRIMARY KEY (`HotelTypeID`);

--
-- Indeks untuk tabel `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`LocationID`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `airlinetypes`
--
ALTER TABLE `airlinetypes`
  MODIFY `AirlineTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `flightbookings`
--
ALTER TABLE `flightbookings`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `flights`
--
ALTER TABLE `flights`
  MODIFY `FlightID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hotelbookings`
--
ALTER TABLE `hotelbookings`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hotels`
--
ALTER TABLE `hotels`
  MODIFY `HotelID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hoteltypes`
--
ALTER TABLE `hoteltypes`
  MODIFY `HotelTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `locations`
--
ALTER TABLE `locations`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `flightbookings`
--
ALTER TABLE `flightbookings`
  ADD CONSTRAINT `flightbookings_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `flightbookings_ibfk_2` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`);

--
-- Ketidakleluasaan untuk tabel `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`AirlineTypeID`) REFERENCES `airlinetypes` (`AirlineTypeID`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`DepartureLocationID`) REFERENCES `locations` (`LocationID`),
  ADD CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`ArrivalLocationID`) REFERENCES `locations` (`LocationID`);

--
-- Ketidakleluasaan untuk tabel `hotelbookings`
--
ALTER TABLE `hotelbookings`
  ADD CONSTRAINT `hotelbookings_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `hotelbookings_ibfk_2` FOREIGN KEY (`HotelID`) REFERENCES `hotels` (`HotelID`);

--
-- Ketidakleluasaan untuk tabel `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `locations` (`LocationID`),
  ADD CONSTRAINT `hotels_ibfk_2` FOREIGN KEY (`HotelTypeID`) REFERENCES `hoteltypes` (`HotelTypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
