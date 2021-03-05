-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 10.2.49.46:3306
-- Generation Time: Mar 05, 2021 at 11:08 AM
-- Server version: 10.0.38-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `polsci_timetable`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `classID` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` varchar(100) NOT NULL,
  `semesterID` int(11) NOT NULL,
  `mandatory` tinyint(1) NOT NULL,
  `virtualClass` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`classID`, `code`, `description`, `semesterID`, `mandatory`, `virtualClass`) VALUES
(1, 'ΚΥ0101', 'Εισαγωγή στην Πολιτική Επιστήμη I', 1, 1, 'https://authgr.zoom.us/j/98764420148?pwd=TEVkNnZMcmgyM3U0Zy9HY2NmYlhtZz09  KAI Meeting ID: 987 6442 0148 Passcode: 734745'),
(3, 'ΚΥ0102', 'Πολιτική Φιλοσοφία στην Αρχαία Ελλάδα', 1, 1, 'https://authgr.zoom.us/j/98566299185?pwd=TnNFd2JvMTZjRGtjK0VaM0JoV1hCUT09'),
(4, 'ΚΥ0103', 'Νεώτερη Ελληνική Πολιτική Ιστορία (1821-1909)', 1, 1, 'https://meet.lync.com/aristotleuniversity-office365/nrotzoko/O2KHKS95'),
(5, 'ΚΥ0104', 'Νεότερη Πολιτική Φιλοσοφία I', 1, 1, 'https://authgr.zoom.us/j/94336928983?pwd=eG5DYnQxVG4xYmROUU9YVThGMk54QT09 '),
(6, 'ΚΥ0105', 'Διεθνείς Σχέσεις', 1, 1, 'https://authgr.zoom.us/j/7753332377  Meeting ID: 775 333 2377'),
(7, 'ΚΥ0206 ', 'Μαθηματικά στην Πολιτική Επιστήμη: Εισαγωγή ', 1, 1, 'Πληροφορίες σύνδεσης στο elearning του μαθήματος'),
(8, 'ΚΥ0301', 'Εισαγωγή στην Πολιτική Κοινωνιολογία', 3, 1, 'https://authgr.zoom.us/j/92977239956?pwd=SU1JVkloTE9CTXhxTWNVV1l5MnlHUT09 Meeting ID: 929 7723 9956 Passcode: 731758'),
(9, 'ΚΥ0302', 'Σύγχρονες Πολιτικές θεωρίες Ι', 3, 1, 'https://authgr.zoom.us/j/98946029421 Meeting ID: 989 4602 9421'),
(10, 'ΚΥ0303', 'Διαφωτισμός και Διαμόρφωση των Πολιτικών Ιδεολογιών στην Ελλάδα ', 3, 1, 'https://authgr.zoom.us/j/96772847345'),
(11, 'ΚΥ0304', 'Πολιτικό Σύστημα και Κομματικοί Σχηματισμοί στη Σύγχρονη Ελλάδα (1946-1974)', 3, 1, 'https://authgr.zoom.us/j/3140386739 Meeting ID: 314 038 6739'),
(12, 'ΚΥ0305', 'Κοινωνική Στατιστική', 3, 1, 'Πληροφορίες σύνδεσης στο elearning του μαθήματος'),
(13, 'ΚΥ0501', 'Το Πολιτικό Σύστημα της Ευρωπαϊκής Ένωσης', 5, 1, 'https://authgr.zoom.us/j/98347734351?pwd=N1pLUGhLVFZwc3R1Y20vTWwvdzhWQT09 Meeting ID: 983 4773 4351, Passcode: 307685'),
(14, 'ΚΥ0503', ' Ελληνική Εξωτερική Πολιτική (μετά τον Β\' Παγκόσμιο Πόλεμο)', 5, 1, 'https://authgr.zoom.us/j/97166915369?pwd=eURKcjdBMkxxZmk4eElEOXM4NlQ3UT09 '),
(15, 'ΚΥ0504', 'Ανάλυση Πολιτικού Λόγου', 5, 1, 'https://authgr.zoom.us/j/6191200391 Meeting ID: 619 120 039'),
(16, 'ΚΥ0606 ', 'Θεωρίες Κοινωνικού Συμβολαίου', 5, 1, 'https://authgr.zoom.us/j/98566299185?pwd=TnNFd2JvMTZjRGtjK0VaM0JoV1hCUT09'),
(17, 'ΚΥ0701', 'Σύγχρονη Κοινωνική Θεωρία', 7, 1, 'https://authgr.zoom.us/j/98648193766?pwd=QXpjejQrR0ZDU0h1bEJpRVVTd1RFQT09   Meeting ID: 986 4819 3766 Passcode: 550653'),
(18, 'ΚΥ0702', 'Κοινωνική και Εκλογική Γεωγραφία της Ελλάδας', 7, 1, 'https://authgr.zoom.us/j/92862976042?pwd=YTA4NGZNa0NWUFU3N2VnTGpJWTRRdz09 Meeting ID: 928 6297 6042 Passcode: 575046 και το φροντιστήριο στο https://authgr.zoom.us/j/94871683474 Meeting ID: 948 7168 3474'),
(19, 'ΚΥ0705', 'Διεθνής Πολιτική Οικονομία και Ανάπτυξη ', 7, 1, 'https://meet.google.com/ven-fkyi-jku'),
(20, 'ΚΥ0706', 'Πόλεμος και Πολιτική', 7, 1, 'https://authgr.zoom.us/j/93773753629?pwd=Z3ZvVzZmSU1tTGt5dnRSbzZSMThSZz09 Meeting ID: 937 7375 3629 Passcode: 116573'),
(21, 'ΚΥ0804', 'Εμφύλιοι Πόλεμοι στον Σύγχρονο Κόσμο', 7, 1, 'Πληροφορίες σύνδεσης στο elearning του μαθήματος'),
(22, 'ΚΥ0106', 'Σύγχρονη Ευρωπαϊκή Ιστορία', 2, 1, 'https://authgr.zoom.us/j/95929361611?pwd=UjR5MGI2KzFmekwxUU1ydGdJR3c3Zz09'),
(23, 'ΚΥ0201', 'Εισαγωγή στη Συγκριτική Πολιτική: τα Πολιτικά Συστήματα στη Σύγχρονη Ευρώπη', 2, 1, 'https://authgr.zoom.us/j/97123235127'),
(24, 'ΚΥ0203', ' Σύγχρονη Ελληνική Πολιτική Ιστορία (1910-1974) ', 2, 1, 'https://meet.lync.com/aristotleuniversity-office365/nrotzoko/O2KHKS95 '),
(25, 'ΚΥ0204', 'Νεότερη Πολιτική Φιλοσοφία II: 19ος αιώνας ', 2, 1, 'https://authgr.zoom.us/j/96400855387?pwd=KzRJL2RWaStWbEk5QnptVmtTZTNkQT09'),
(26, 'ΚΥ0205', 'Συνταγματική Συγκρότηση του Κράτους: Οργανωτικές Βάσεις του Ισχύοντος Πολιτεύματος', 2, 1, 'https://authgr.zoom.us/j/93331105674'),
(27, 'ΚΥ0208', 'Εισαγωγή στην Πολιτική Επιστήμη ΙΙ', 2, 1, 'https://authgr.zoom.us/j/91023616862?pwd=SjhLNEczZGlRSFBuSGVPemN1bklLUT09'),
(28, 'ΚΥ0401', 'Το Ελληνικό Σύστημα Διακυβέρνησης', 6, 1, 'https://authgr.zoom.us/j/99327695518?pwd=NVc5UUJ2ZU81T2d2WHk4L1liQ29BZz09'),
(29, 'ΚΥ0402', 'Κλασσική Κοινωνική Θεωρία ', 4, 1, 'https://authgr.zoom.us/j/93564921806?pwd=SVVXUE1ETmN1ejM5eXJUbDBGMGtHUT09'),
(30, 'ΚΥ0403', 'Ιστορία, Θεωρίες και Θεσμοί της Ευρωπαϊκής Ολοκλήρωσης', 4, 1, 'https://authgr.zoom.us/j/94982539656?pwd=UUxHd3dBZEJvMlpDOVRaMG9ZT29MQT09'),
(31, 'ΚΥ0404', 'Εισαγωγή στην Πολιτική Οικονομία', 4, 1, 'https://meet.google.com/ven-fkyi-jku'),
(32, 'ΚΥ0405', 'Ποσοτικές Μέθοδοι Ανάλυσης στις Κοινωνικές Επιστήμες', 4, 1, 'https://authgr.zoom.us/j/96627323045?pwd=TmNuMTRyL0ZrbWJOVEdRa1hqMG9mUT09 με κωδικό 441320'),
(33, 'ΚΥ0502', 'Κράτος θεσμοί και δημόσιες πολιτικές', 4, 1, 'https://authgr.zoom.us/j/97741865693'),
(34, 'ΚΥ0602', 'Σύγχρονες Πολιτικές Θεωρίες ΙΙ ', 6, 1, 'https://authgr.zoom.us/j/6191200391'),
(35, 'ΚΥ0604', 'Αντικοινοβουλευτισμός, Δικτατορίες και Άκρα Δεξιά', 6, 1, 'https://authgr.zoom.us/j/97853866911'),
(36, 'ΚΥ0607', 'Μειονότητες και Πολιτική στα Βαλκάνια', 6, 1, 'https://authgr.zoom.us/j/98934108731?pwd=UDY2cmhESnJpUmJMa01qb3JRNDdIQT09'),
(37, 'ΚΥ0802', 'Ηθική και Πολιτική', 8, 1, 'https://authgr.zoom.us/j/99692937554'),
(38, 'ΚΥ0805', 'Τα πολιτικά Κόμματα μετά το 1974', 8, 1, 'https://authgr.zoom.us/j/3140386739'),
(39, 'ΚΥ0806', 'Νέα Κοινωνικά Κινήματα', 8, 1, 'https://authgr.zoom.us/j/93479728649?pwd=UG51OTBnTVJBaklLcFVGWExySWhXZz09'),
(40, 'ΚΥ0000', 'Εισαγωγή στην Εκπόνηση Εργασίας', 3, 1, 'https://authgr.zoom.us/j/8116180592 '),
(41, 'ΚΥ0000', 'Εισαγωγή στην Εκπόνηση Εργασίας', 4, 1, 'https://authgr.zoom.us/j/8116180592'),
(43, 'ΚΕ0Χ49', 'Εκπαιδευτικές Πρακτικές και Πολιτική', 9, 0, 'https://authgr.zoom.us/j/8116180592 '),
(44, 'ΚΕ0Ε17', 'Ιστορία των Οικονομικών Κρίσεων', 9, 0, 'https://authgr.zoom.us/j/94913891521\r\nMeeting ID: 949 1389 1521'),
(45, 'ΚΕ0Ε19', 'Πολιτική και θρησκεύματα', 9, 0, 'https://authgr.zoom.us/j/96418079701?pwd=K0g0R1dQUnB4VTdIT20vcEROVEhTdz09'),
(46, 'ΚΕ0Ε24', 'Παράδοση και Εκσυγχρονισμός στη Μεταπολεμική Ελλάδα', 9, 0, 'https://authgr.zoom.us/j/3140386739  Meeting ID: 314 038 6739 '),
(47, 'ΚΕ0Ε33', 'Μοντέλα Ανάλυσης Εκλογικής Συμπεριφοράς', 9, 0, 'https://authgr.zoom.us/j/92713449121?pwd=VlNDU2hDWlhqVnhnTXR0b0F5ZlFjUT09 Meeting ID: 927 1344 9121 Passcode: 602079'),
(48, 'ΚΕ0Ε44', 'Θέματα Σύγχρονης Πολιτικής Φιλοσοφίας', 9, 0, 'https://authgr.zoom.us/j/95407540724'),
(49, 'ΚΕ0Χ03', 'Τα ΜΜΕ στην Ελλάδα Σήμερα', 9, 0, 'https://authgr.zoom.us/j/96339819685?pwd=RHRReUVjVUtheFpOdTFsVjc0cjYrUT09'),
(50, 'ΚΕ0Χ04', 'Πολιτικές των ανθρωπίνων δικαιωμάτων', 9, 0, 'https://authgr.zoom.us/j/2186758469 meeting ID 218 675 8469 '),
(51, 'ΚΕ0Χ08', 'Εθνικισμός: Ιδεολογίες και πρακτικές', 9, 0, 'https://authgr.zoom.us/j/97338071016 Meeting ID: 973 3807 1016'),
(52, 'ΚΕ0Χ20', 'Πολιτική Οικονομία της Μεταπολεμικής Ελλάδας', 9, 0, 'https://meet.google.com/ven-fkyi-jku'),
(53, 'ΚΕ0Χ25', 'European Union Institutions and Policies', 9, 0, 'https://authgr.zoom.us/j/94811919420?pwd=WE1zR0xiWVVERVFHY1FRREpVRmFjdz09 Meeting ID: 948 1191 9420 Passcode: 303005'),
(54, 'ΚΕ0Χ11', 'Θέματα Εφαρμοσμένης Πολιτικής Ανάλυσης', 9, 0, 'https://authgr.zoom.us/j/95948352539?pwd=UkVoaDZVNXBOSGpNc2M3bXYzdzQ0UT09 Meeting ID: 959 4835 2539 Passcode: 585089'),
(55, 'ΚΕ0Χ27', 'Μουσική, Ιστορία, Πολιτική: Από τον Ρεαλισμό στον Μεταμοντερνισμό', 9, 0, 'https://authgr.zoom.us/j/96772847345'),
(56, 'ΚΕ0Χ31', 'Σύγχρονα Θέματα Διεθνούς Πολιτικής', 9, 0, 'https://authgr.zoom.us/j/438548836 '),
(57, 'ΚΕ0Χ32', 'Ο Αντισημιτισμός στον 20ό αιώνα ', 9, 0, 'https://meet.lync.com/aristotleuniversity-office365/mgkavala/48EX8ADM '),
(58, 'ΚΕ0Χ34', 'Διαδικτυακές Πολιτικές Έρευνες', 9, 0, 'https://authgr.zoom.us/j/98090347802?pwd=eDB1c2RsbXFabEZhVW5RVUJ0VW9lUT09'),
(59, 'ΚΕ0Χ33', 'Εμβάθυνση στη Συγκριτική Πολιτική:Τα Πολιτικά Συστήματα της Γαλλίας και της Μεγάλης Βρετανίας', 9, 0, 'https://authgr.zoom.us/j/921238288 '),
(60, 'ΚΕ0Χ37', 'Κράτος και Αγορά: Φιλελευθερισμός, Νεοφιλελευθερισμός και Δημοκρατία', 9, 0, ''),
(61, 'ΚΕ0Χ39', 'Greek Politics (διδάσκεται στα αγγλικά)', 9, 0, 'https://authgr.zoom.us/j/95572923463?pwd=ejJHWERMSk5STXpmUnRhbEViaUVWUT09 Meeting ID: 955 7292 3463 Passcode: 652205'),
(62, 'ΚΕ0Χ43', 'Κοινωνική και Αλληλέγγυα Οικονομία', 9, 0, 'https://authgr.zoom.us/j/93564921806?pwd=SVVXUE1ETmN1ejM5eXJUbDBGMGtHUT09 Meeting ID: 935 6492 1806 Passcode: 270581'),
(63, 'ΚΕ0Χ44', 'Πολιτικές και Πρακτικές Καταστολής στον Σϋγχρονο Κόσμο', 9, 0, 'https://meet.google.com/xse-yznc-xvc'),
(64, 'ΚΕ0Χ48', 'Ενεργειακοί Πόροι και Πολιτική: Από τον 19ο στον 21ο αιώνα', 9, 0, 'https://meet.google.com/ggr-tdip-tvc'),
(65, 'ER000', 'Greece today (διδάσκεται στα Αγγλικά)', 9, 0, 'https://authgr.zoom.us/j/93740929104?pwd=NlZBTFd2cHY1YVduSk00bWl4dE8rQT09'),
(66, 'ΚΕ0Χ46', 'Διδακτική της Πολιτικής Παιδείας', 9, 0, 'https://authgr.zoom.us/j/93870065349?pwd=QzdOR1BMSXlaWkZSY2lkbHJUSFlmdz09 με κωδικό 008546'),
(67, 'ΞΓ1000', 'Αγγλική Γλώσσα για Πολιτικούς Επιστήμονες', 9, 0, ''),
(68, 'ΚΕΣ001', 'Πρακτική Άσκηση Φοιτητών', 9, 0, 'https://authgr.zoom.us/j/92506676086?pwd=MWk5Yk1oNkZGUUU2ZEhSTTJkMGFnZz09'),
(69, 'ΚΕ0Ε53', 'Εκλογική Συμπεριφορά και Πολυεπίπεδη Διακυβέρνηση ', 9, 0, 'https://authgr.zoom.us/j/99842818605?pwd=U1dKdmNiT3FwMWV3QWlWRmhpRkpSZz09'),
(70, 'ΚΕ0Ε54', 'Η Έννοια της \"Εθνικοφροσύνης\": Ιστορία, Ιδεολογία και Πολιτική Πρακτική ', 9, 0, 'https://meet.google.com/use-kehm-wwi'),
(71, 'ΚΕ0Ε01', 'Κράτος και Κοινωνία στη Νεώτερη Ελλάδα ', 9, 0, 'https://meet.lync.com/aristotleuniversity-office365/nrotzoko/DX4DO9GX '),
(72, 'ΚΕ0Ε02', 'Το Κυπριακό Ζήτημα', 9, 0, 'https://authgr.zoom.us/j/98826194453?pwd=MFZhaTFqU3kwY0cwTFd0cTlsWlFEQT09'),
(73, 'ΚΕ0Ε03', 'Εισαγωγή στη Δημόσια Οικονομική', 9, 0, 'https://meet.google.com/ven-fkyi-jku'),
(74, 'ΚΕ0Ε04', 'Political Systems in the Balkans (διδάσκεται στα αγγλικά)', 9, 0, 'https://authgr.zoom.us/j/7753332377'),
(75, 'ΚΕ0Ε07', 'Ιστορία των Ριζοσπαστικών Ιδεών και Κινημάτων στην Ευρώπη', 9, 0, ''),
(76, 'ΚΕ0Ε16', 'Ουτοπίες και πολιτική φαντασία στη Νεοτερικότητα', 9, 0, ''),
(77, 'ΚΕ0Ε20', 'Φιλοσοφίες της Ελευθερίας', 9, 0, ' 	https://authgr.zoom.us/j/98360002209?pwd=YVRhNWdwZWNmMWpYVy9neXhGT1BkUT09'),
(78, 'ΚΕ0Ε22', 'Regional Inequalities and Cohesion in the European Union', 9, 0, ''),
(79, 'ΚΕ0Ε25', 'Εισαγωγή στην Πολιτική Επικοινωνία', 9, 0, 'https://authgr.zoom.us/j/96339819685?pwd=RHRReUVjVUtheFpOdTFsVjc0cjYrUT09'),
(80, 'ΚΕ0Ε28', 'Ο εκτός Ευρώπης κόσμος', 9, 0, 'https://authgr.zoom.us/j/96420084235 '),
(81, 'ΚΕ0Ε30', 'Χώρος και Εκλογική Ανάλυση', 9, 0, 'https://authgr.zoom.us/j/98090347802?pwd=eDB1c2RsbXFabEZhVW5RVUJ0VW9lUT09'),
(82, 'ΚΕ0Ε31', 'Πολιτικές της Ευρωπαϊκής Ένωσης', 9, 0, 'https://authgr.zoom.us/j/91277077060'),
(83, 'ΚΕ0Ε37', 'Ολοκαύτωμα και Ιστορική Μνήμη', 9, 0, 'https://authgr.zoom.us/j/92297734064?pwd=Nk9YWGVjbURjVWk5SEREZk1Jdklydz09'),
(84, 'ΚΕ0Ε38', 'Ανασυγκρότηση της Εβραϊκής Κοινότητας. Συγκρίσεις με την Ευρώπη', 9, 0, ''),
(85, 'ΚΕ0Ε40', 'Θεωρίες Παιγνίων και Διαμόρφωση Στρατηγικής', 9, 0, 'https://join.skype.com/godBYCEt984S'),
(86, 'ΚΕ0Ε42', 'Σύγχρονα Θέματα Δημοκρατίας', 9, 0, 'https://authgr.zoom.us/j/98648193766?pwd=QXpjejQrR0ZDU0h1bEJpRVVTd1RFQT09 '),
(87, 'ΚΕ0Ε43', 'Ηλεκτρονικοί Σύμβουλοι Ψήψου', 9, 0, ''),
(88, 'ΚΕ0Ε45', 'Λαϊκισμός και Δημοκρατία', 9, 0, 'https://authgr.zoom.us/j/6191200391 Meeting ID: 619 120 039'),
(89, 'ΚΕ0Ε46', 'The Greek Crisis (διδάσκεται στα αγγλικά)', 9, 0, 'https://authgr.zoom.us/j/94643935078'),
(90, 'ΚΕ0Ε47', 'Ανατολική Μεσόγειος: Σύγχρονη Διπλωματία και Πολιτική', 9, 0, 'https://authgr.zoom.us/j/92223073073?pwd=RFBVQ3M3QzBJOG1YUEZqem9pZzdZUT09'),
(91, 'ΚΕ0Ε49', 'Ρομ: Ιστορία, Πολιτική, Ολοκαύτωμα', 9, 0, 'https://authgr.zoom.us/j/95166262880'),
(92, 'ΚΕ0Ε50', 'Ρωσική Επανάσταση και Σοβιετική Εξουσία', 9, 0, ''),
(93, 'ΚΕ0Ε51', 'Νεανική πολιτική δράση και σχολεία', 9, 0, 'https://authgr.zoom.us/j/8116180592'),
(94, 'ΚΕ0Ε52', 'Διεθνείς Οργανισμοί ', 9, 0, 'https://authgr.zoom.us/j/93193369171'),
(95, 'ΚΕ0Ε55', 'Νέες Τεχνολογίες, Πολιτικές Θεωρίες και Διεθνείς Σχέσεις: ο Ρόλος της Τεχνητής Νοημοσύνης', 9, 0, 'https://authgr.zoom.us/j/99738910357?pwd=THE0L2hqZXVEd20vYksrZTJOT3Y3Zz09'),
(96, 'ΚΕ0Ε56', 'Politics and Government in Southern Europe. A Comparative Analysis', 9, 0, 'https://authgr.zoom.us/j/95072194717?pwd=aTdGUjFUVVVxMThaRC9ucFlYcWRhdz09'),
(97, 'ΚΕ0Χ30', 'Διοικητική Οργάνωση του Κράτους', 9, 0, 'https://authgr.zoom.us/j/97145489485?pwd=U1lrMHRxUHlOVlJKbVhwU1RTeHhmUT09 με κωδικό 306456'),
(98, 'ΚΕ0Χ40', 'Πρόσφυγες και Μετανάστες', 9, 0, 'https://authgr.zoom.us/j/92202431211?pwd=MklTSHFvd2tPOVVZbUx6aVpmWURRQT09'),
(99, 'ΚΕ0Χ47', 'Η Μέση Ανατολή σήμερα', 9, 0, 'https://authgr.zoom.us/j/93740929104?pwd=NlZBTFd2cHY1YVduSk00bWl4dE8rQT09'),
(101, 'ΚΕ0Χ38', 'Mεταπολεμικός κόσμος. Ανασυγκρότηση  της  Ευρώπης, εβραϊκές κοινότητες', 9, 0, 'https://meet.lync.com/aristotleuniversity-office365/mgkavala/DP3ODX44'),
(102, 'ΚΕ0Ε21', 'Φύλο και Πολιτική', 9, 0, 'https://authgr.zoom.us/j/97338071016 Meeting ID: 973 3807 1016'),
(103, 'ΚΕ0Χ51', 'Οθωμανική  Αυτοκρατορία  και  Ελληνική Επανάσταση:  Πολιτικές  και  Κοινωνικές  Πτυχές ', 9, 0, 'https://authgr.zoom.us/j/7753332377  Meeting ID: 775 333 2377'),
(104, 'ΚΕ0Χ52', 'Επανάσταση 1821. Οι Προετοιμασίες και η Εξέγερση', 9, 0, 'https://authgr.zoom.us/j/97614783650?pwd=V3RNazJDak9CdklRQm1jT2k3eUZlUT09\r\nMeeting ID: 976 1478 3650, Passcode: 786620'),
(105, 'ΚΕ0Χ45', 'Στοιχεία για το Ελληνικό Εργατικό Κίνημα', 9, 0, 'https://authgr.zoom.us/j/95351927712?pwd=cDJadnJGVDBHckJHaHVaaXhFNEt3UT09 Μeeting ID είναι 953 5192 7712 passcode 320040'),
(106, 'ΚΕ0Ε58', 'Λατινική Αμερική. Πολιτική, Κοινωνία και Διεθνείς Σχέσεις', 9, 0, 'https://authgr.zoom.us/j/97952038462'),
(107, 'ΚΕ0Ε60', 'Επανάσταση 1821. Ο Πόλεμος για την Ανεξαρτησία', 9, 0, 'https://authgr.zoom.us/j/95929361611?pwd=UjR5MGI2KzFmekwxUU1ydGdJR3c3Zz09'),
(108, 'ΚΕ0Χ13', 'Από τη Μεγάλη Γαλλική Επανάσταση στο 1848', 9, 0, 'https://authgr.zoom.us/j/95982669087?pwd=SUhwakd4SVZ2aE1OcW1wSEMzVHdFZz09'),
(111, 'ΚΕ0Ε57', 'Πολιτική και Κοινωνία στις Παραμονές της Επανάστασης του 1821', 9, 0, 'https://authgr.zoom.us/j/95484408768?pwd=L01ZM2J2WHBjUHpzM0MrNXE1VlpaUT09'),
(112, 'ΚΕ0Ε35', 'European Union Politics and Government', 9, 0, 'https://authgr.zoom.us/j/97920660914'),
(113, 'ΚΕ0Ε59', 'Θέματα Κοινωνικής Φιλοσοφίας', 9, 0, 'https://authgr.zoom.us/j/94869124654?pwd=c25tcVVac1gxME5nd0RWYjhEUCsvUT09'),
(114, 'ΚΕ0Χ53', 'Ποιοτικές Μέθοδοι Έρευνας στην Ψηφιακή Εποχή', 9, 0, 'https://authgr.zoom.us/j/93807100820?pwd=NFFLY1gvYzBONlBTdkNHSnVvajQyZz09');

-- --------------------------------------------------------

--
-- Table structure for table `coteaching`
--

CREATE TABLE `coteaching` (
  `coteachingID` int(11) NOT NULL,
  `teacherID` int(11) NOT NULL,
  `classID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coteaching`
--

INSERT INTO `coteaching` (`coteachingID`, `teacherID`, `classID`) VALUES
(7, 3, 28),
(8, 20, 28),
(9, 21, 22),
(10, 19, 96),
(11, 22, 66);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `daysID` int(11) NOT NULL,
  `greekName` varchar(10) NOT NULL,
  `englishName` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`daysID`, `greekName`, `englishName`) VALUES
(1, 'Δευτέρα', 'monday'),
(2, 'Τρίτη', 'tuesday'),
(3, 'Τετάρτη', 'wednesday'),
(4, 'Πέμπτη', 'thursday'),
(5, 'Παρασκευή', 'friday');

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `hoursID` int(11) NOT NULL,
  `hoursStart` int(11) NOT NULL,
  `hoursEnd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hours`
--

INSERT INTO `hours` (`hoursID`, `hoursStart`, `hoursEnd`) VALUES
(1, 9, 12),
(2, 12, 15),
(3, 15, 18),
(4, 18, 21);

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `placeID` int(11) NOT NULL,
  `placeName` varchar(100) NOT NULL,
  `placeAddress` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`placeID`, `placeName`, `placeAddress`) VALUES
(1, 'A', 'Κεντρικό Κτήριο ΟΠΕ - ΑΠΘ'),
(2, 'Β', 'Κεντρικό Κτήριο ΟΠΕ - ΑΠΘ'),
(3, '10', 'Κτήριο Τμήματος Δημοσιογραφίας'),
(4, '7', 'Κτήριο Τμήματος Δημοσιογραφίας'),
(5, '3Α', 'Κτήριο Τμήματος Δημοσιογραφίας'),
(6, '3Δ', 'Κτήριο Τμήματος Δημοσιογραφίας'),
(7, '107', 'Κεντρικό Κτήριο ΟΠΕ - ΑΠΘ'),
(8, '212', 'Κεντρικό Κτήριο ΟΠΕ - ΑΠΘ'),
(9, 'OnLine', 'Διαδικτυακά - Χωρίς φυσική παρουσία'),
(10, 'Δεν Ορίστηκε', 'Δεν Ορίστηκε'),
(11, 'Αίθουσα 1', 'Κεντρικό Κτήριο ΟΠΕ - ΑΠΘ'),
(12, 'Αίθουσα 2', 'Κεντρικό Κτήριο ΟΠΕ - ΑΠΘ'),
(13, 'Μεικτός Τρόπος - Αίθουσα και Εξ\'αποστάσεως', 'Παρακαλώ δείτε τα σχόλια');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semesterID` int(11) NOT NULL,
  `semesterName` varchar(10) NOT NULL,
  `semesterMsgName` varchar(10) NOT NULL,
  `isRunning` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semesterID`, `semesterName`, `semesterMsgName`, `isRunning`) VALUES
(1, 'Α', 'semester_a', 0),
(2, 'Β', 'semester_b', 1),
(3, 'Γ', 'semester_c', 0),
(4, 'Δ', 'semester_d', 1),
(5, 'Ε', 'semester_e', 0),
(6, 'ΣΤ', 'semester_f', 1),
(7, 'Ζ', 'semester_z', 0),
(8, 'Η', 'semester_h', 1),
(9, 'ΕΠ', 'elective', 0);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacherID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `placeCooperation` longtext NOT NULL,
  `timesCooperation` varchar(1000) NOT NULL,
  `isTeaching` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacherID`, `name`, `surname`, `email`, `placeCooperation`, `timesCooperation`, `isTeaching`) VALUES
(1, 'Vemund', 'Aarbakke ', 'vaarbakk@polsci.auth.gr', 'https://authgr.zoom.us/j/7753332377', 'Πέμπτη 13-15', 1),
(2, 'Γιάννης', 'Ανδρεάδης ', 'john@auth.gr', 'https://authgr.zoom.us/j/98090347802?pwd=eDB1c2RsbXFabEZhVW5RVUJ0VW9lUT09', 'Τρίτη και Πέμπτη 18:00-19:00', 1),
(3, 'Γεώργιος', 'Ανδρέου', 'gioandreou@polsci.auth.gr', 'https://authgr.zoom.us/j/99931620062', 'Τετάρτη 15-17', 1),
(4, 'Χριστόφορος', 'Βερναρδάκης', 'xvernard@gmail.com', 'Δεν ασκεί καθήκοντα', 'Δεν ασκεί καθήκοντα', 0),
(5, 'Γιώργος', 'Δουράκης', 'gdour@polsci.auth.gr', 'https://meet.google.com/ven-fkyi-jku', 'Πέμπτη, 14-16', 1),
(6, 'Διονύσιος', 'Δρόσος', ' drden25@gmail.com', 'https://authgr.zoom.us/j/99692937554', 'Τρίτη 11-12 ή κατόπιν συνεννοήσεως', 1),
(7, 'Μαρία', 'Καβάλα', 'kavalamaria@yahoo.com', 'https://authgr.zoom.us/j/99160450245?pwd=ei9OYlZ6cVJJNTVXbjNxNkFETEdTQT09', 'Τετάρτη 10.30-13.30 ή ύστερα από συνεννόηση', 1),
(8, 'Κάρολος-Ιωσήφ', 'Καβουλάκος', 'kkavoula@gmail.com', 'https://authgr.zoom.us/j/97685741740?pwd=QVBYM2d4RjZpT0FCRG9MRkZkZ3haZz09', 'Δευτέρα 17:00-18:00', 1),
(9, 'Αλέξανδρος', 'Κιουπκιολής', 'alkioup@polsci.auth.gr', 'Επικοινωνήστε με τον διδάσκοντα στο alkioup@polsci.auth.gr για να κανονίσετε τηλεσυνάντηση', 'Επικοινωνήστε με τον διδάσκοντα στο alkioup@polsci.auth.gr για να κανονίσετε τηλεσυνάντηση', 1),
(10, 'Γιώργος', 'Μαργαρίτης ', 'gmargar@polsci.auth.gr', 'https://authgr.zoom.us/j/95929361611?pwd=UjR5MGI2KzFmekwxUU1ydGdJR3c3Zz09', 'Πέμπτη 12.00 με 14.00 ή μετά από επικοινωνία με τον διδάσκοντα', 1),
(11, 'Σπύρος', 'Μαρκέτος', 'spyrosmarchetos@gmail.com', 'Σύνδεση στο Skype με τον χρήση με username: Robespyros', 'Θα ανακοινωθεί', 1),
(12, 'Ανδρέας', 'Πανταζόπουλος', 'anpantaz@gmail.com', 'https://authgr.zoom.us/j/3140386739  ', 'Τρίτη: 17-18, Τετάρτη, 12-13', 1),
(13, 'Ιωάννης', 'Παπαγεωργίου', 'ipapageo@polsci.auth.gr', 'https://authgr.zoom.us/j/98676476494', 'Πέμπτη 17-18, Παρασκευή 11-12', 1),
(14, 'Ιωάννης', 'Παπαστάθης', 'kpapastathis@polsci.auth.gr', 'https://authgr.zoom.us/j/93740929104?pwd=NlZBTFd2cHY1YVduSk00bWl4dE8rQT09', 'Πέμπτη: 14:00-15:00', 1),
(15, 'Νίκος', 'Ροτζώκος', 'rotzokos@hotmail.com ', 'https://meet.lync.com/aristotleuniversity-office365/nrotzoko/DX4DO9GX ', 'Τρίτη, 16-18', 1),
(16, 'Νικόλας', 'Σεβαστάκης', 'nsevas@polsci.auth.gr', 'https://authgr.zoom.us/j/94869124654?pwd=c25tcVVac1gxME5nd0RWYjhEUCsvUT09', 'Τετάρτη 4-6', 1),
(17, 'Γιάννης', 'Σταυρακάκης', 'yanstavr@yahoo.co.uk', 'https://authgr.zoom.us/j/6191200391', 'Πέμπτη 15-16, Παρασκευή 18-19', 1),
(18, 'Άρης', 'Στυλιανού', ' stilianu@polsci.auth.gr ', 'https://authgr.zoom.us/j/98566299185?pwd=TnNFd2JvMTZjRGtjK0VaM0JoV1hCUT09', 'Τρίτη 3-4 μμ, Τετάρτη 2-3 μμ', 1),
(19, 'Ευτυχία', 'Τεπέρογλου', 'efteperoglou@polsci.auth.gr', 'https://authgr.zoom.us/j/6965643585?pwd=NklkQk1SeDEzWHgzbmxGTWwrTmtYQT09', 'Δευτέρα 13-14 και Τρίτη 18-19', 1),
(20, 'Θεόδωρος', 'Χατζηπαντελής', 'chadji@polsci.auth.gr', 'https://authgr.zoom.us/j/99694530385?pwd=NVYxTUxpNmFRYkNxS0U0ZnhrMkFWZz099', 'Τετάρτη 13:30-1500', 1),
(21, 'Βασιλική', 'Λάζου', ' vlazou@polsci.auth.gr', 'https://meet.google.com/shi-xisg-ocb', 'Τρίτη 12-13 και Τετάρτη 17-18', 1),
(22, 'Αντώνης ', 'Παπαοικονόμου', 'papaoikoa@polsci.auth.gr', 'https://authgr.zoom.us/j/8116180592', 'Τρίτη, Τετάρτη, Πέμπτη και Παρασκευή 10-12', 1),
(23, 'Μακρίνα', 'Ζαφείρη', 'm_nzafiri@yahoo.gr', 'Χωρίς Αναθέσεις', 'Χωρίς Αναθέσεις', 0),
(24, 'Αντώνης', 'Σκαμνάκης', 'askamnak@jour.auth.gr', 'Αναμένεται ανακοίνωση', 'Αναμένεται ανακοίνωση', 1),
(25, 'Γεώργιος', 'Καραβοκύρης', 'gkaravok@law.auth.gr', 'https://authgr.zoom.us/j/98394272470', 'Παρασκευή 10-12', 1),
(26, 'Ιωάννης', 'Στεφανίδης', 'ids@law.auth.gr', 'τηλ. 2310 996488, γραφείο 412 κτιρίου ΝΟΠΕ', 'Τετάρτη,Πέμπτη 12-14', 1),
(27, 'Νίκος ', 'Γαϊτενίδης', 'nikgait@yahoo.com', 'https://authgr.zoom.us/j/92662955272', 'Παρασκευή 15:30 - 16:30', 1),
(28, 'Λεωνίδας', 'Μακρής', 'lmakris2@yahoo.com', 'Χωρίς Αναθέσεις', 'Χωρίς Αναθέσεις', 0),
(29, 'Ευαγγελία', 'Μαρκάκη', 'markakievi@yahoo.gr', 'Skype name: eyh.markaki', 'Κατόπιν ραντεβού τηλεφωνικά ή μέσω skype ', 1),
(30, 'Γεωργία', 'Παναγιωτίδου', 'vzgp@hotmail.com', 'https://authgr.zoom.us/j/92743578574?pwd=di9xdGJKNGhMRXluSzRIM2M3Z0VKQT09', 'Τετάρτη 15:00-17:00', 1),
(31, 'Κώστας', 'Τζιάρας', 'ktziaras@auth.gr', 'Χωρίς Αναθέσεις', 'Χωρίς Αναθέσεις', 0),
(32, 'Με ανάθεση', 'Με ανάθεση', '-----------------', '', '', 0),
(33, 'Δημήτρης', 'Μηλώσης', 'dmilosis@polsci.auth.gr', 'https://authgr.zoom.us/j/94871683474', 'Δευτέρα 12:00-15:00', 0),
(34, 'Δήμητρα', 'Μαρέτα', 'dimitra.mareta@gmail.com', 'https://authgr.zoom.us/j/93021815635', 'Τετάρτη 15:00-16:00', 1),
(35, 'Ανδρέας ', 'Μπουρούτης', 'abouroutis@gmail.com', 'https://authgr.zoom.us/j/94135189195?pwd=VktmTkl4WlBqVVlkTlBWMjNjdDB0Zz09', 'Τετάρτη 12.00 - 13.00', 1),
(36, 'Ιφιγένεια', 'Καμτσίδου', 'ifigenei@law.auth.gr', '', '', 0),
(37, 'Ιάκωβος', 'Μαθιουδάκης', 'imathioud@law.auth.gr', '', '', 0),
(38, 'Θωμάς', 'Σιώμος', 'siomos.thomas@gmail.com', 'Αναμένεται ανακοίνωση', 'Αναμένεται ανακοίνωση', 1),
(39, 'Θέμης', 'Τζήμας', '', 'Αναμένεται ανακοίνωση', 'Αναμένεται ανακοίνωση', 1);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `timetableID` int(11) NOT NULL,
  `classID` int(11) NOT NULL,
  `teacherID` int(11) NOT NULL,
  `placeID` int(11) DEFAULT NULL,
  `daysID` int(11) NOT NULL,
  `hoursID` int(11) NOT NULL,
  `comments` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`timetableID`, `classID`, `teacherID`, `placeID`, `daysID`, `hoursID`, `comments`) VALUES
(57, 22, 10, 9, 4, 1, 'Συνδιδασκαλία Μαργαρίτης - Λάζου \r\n(Τμήμα Α-Ω) '),
(58, 23, 13, 9, 5, 2, ''),
(59, 24, 15, 9, 1, 1, ''),
(60, 25, 16, 9, 4, 2, ''),
(61, 26, 25, 9, 3, 3, 'Συνδιδασκαλία Καραβοκύρης/Καϊδατζής'),
(62, 27, 19, 9, 2, 2, ''),
(63, 28, 19, 9, 2, 3, 'Συνδιδασκαλία Τεπέρογλου/ Ανδρέου/ Χατζηπαντελής'),
(64, 29, 8, 9, 2, 2, ''),
(65, 30, 13, 9, 4, 4, ''),
(66, 31, 5, 9, 5, 1, ''),
(67, 32, 30, 9, 1, 2, ''),
(68, 32, 30, 9, 4, 3, 'Φροντιστηριακό Μάθημα'),
(69, 33, 3, 9, 3, 2, ''),
(70, 34, 17, 9, 4, 2, ''),
(71, 35, 11, 9, 2, 4, ''),
(72, 36, 1, 9, 4, 3, ''),
(73, 37, 6, 9, 1, 2, ''),
(74, 38, 12, 9, 3, 1, ''),
(75, 39, 8, 9, 1, 4, ''),
(76, 41, 22, 9, 1, 1, ''),
(77, 71, 15, 9, 2, 4, ''),
(78, 74, 1, 9, 5, 3, ''),
(79, 73, 5, 9, 5, 2, ''),
(80, 72, 26, 9, 4, 1, ''),
(81, 79, 24, 9, 2, 2, ''),
(82, 80, 27, 9, 5, 1, ''),
(83, 81, 2, 9, 2, 3, ''),
(84, 82, 3, 9, 5, 2, ''),
(85, 83, 35, 9, 1, 3, ''),
(86, 85, 29, 9, 3, 4, ''),
(87, 86, 9, 9, 4, 4, ''),
(88, 48, 34, 9, 5, 1, ''),
(89, 112, 3, 9, 4, 2, ''),
(91, 89, 11, 9, 3, 4, ''),
(92, 90, 39, 9, 4, 3, ''),
(93, 91, 11, 9, 2, 3, ''),
(94, 69, 19, 9, 1, 3, ''),
(95, 94, 27, 9, 5, 2, ''),
(96, 93, 22, 9, 2, 2, ''),
(97, 70, 21, 9, 2, 3, ''),
(98, 95, 39, 9, 2, 1, ''),
(99, 96, 13, 9, 3, 3, 'Συνδιδασκαλία Παπαγεωργίου - Τεπέρογλου'),
(100, 111, 7, 9, 5, 3, ''),
(101, 106, 13, 9, 5, 3, ''),
(102, 113, 16, 9, 3, 2, ''),
(103, 107, 10, 9, 3, 2, ''),
(104, 108, 11, 9, 3, 3, ''),
(105, 97, 37, 9, 3, 3, ''),
(106, 58, 2, 9, 4, 3, ''),
(107, 98, 35, 9, 2, 1, ''),
(108, 99, 14, 9, 4, 1, ''),
(109, 65, 14, 9, 4, 3, ''),
(110, 66, 20, 9, 4, 2, 'Συνδιδασκαλία Χατζηπαντελής - Παπαοικονόμου'),
(111, 68, 20, 9, 3, 3, ''),
(112, 114, 38, 9, 2, 4, ''),
(113, 77, 9, 9, 4, 2, '');

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`classID`),
  ADD KEY `semesterIDCon` (`semesterID`);

--
-- Indexes for table `coteaching`
--
ALTER TABLE `coteaching`
  ADD PRIMARY KEY (`coteachingID`),
  ADD KEY `teacherIDCon` (`teacherID`),
  ADD KEY `coteachingClassIDCon` (`classID`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`daysID`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`hoursID`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`placeID`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semesterID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacherID`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`timetableID`),
  ADD KEY `classIDCon` (`classID`),
  ADD KEY `daysIDCon` (`daysID`),
  ADD KEY `hoursIDCon` (`hoursID`),
  ADD KEY `placeIDCon` (`placeID`),
  ADD KEY `teachersIDCon` (`teacherID`);


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `coteaching`
--
ALTER TABLE `coteaching`
  MODIFY `coteachingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `daysID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `hoursID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `place`
--
ALTER TABLE `place`
  MODIFY `placeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semesterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `timetableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `semesterIDCon` FOREIGN KEY (`semesterID`) REFERENCES `semesters` (`semesterID`);

--
-- Constraints for table `coteaching`
--
ALTER TABLE `coteaching`
  ADD CONSTRAINT `coteachingClassIDCon` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`),
  ADD CONSTRAINT `teacherIDCon` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`teacherID`);

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `classIDCon` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`),
  ADD CONSTRAINT `daysIDCon` FOREIGN KEY (`daysID`) REFERENCES `days` (`daysID`),
  ADD CONSTRAINT `hoursIDCon` FOREIGN KEY (`hoursID`) REFERENCES `hours` (`hoursID`),
  ADD CONSTRAINT `placeIDCon` FOREIGN KEY (`placeID`) REFERENCES `place` (`placeID`),
  ADD CONSTRAINT `teachersIDCon` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`teacherID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
