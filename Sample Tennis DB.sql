DROP SCHEMA IF EXISTS `tennis` ;
CREATE SCHEMA IF NOT EXISTS `tennis` DEFAULT CHARACTER SET latin1 ;
USE `tennis` ;

CREATE TABLE PLAYERS

      (PLAYERNO     INTEGER NOT NULL PRIMARY KEY,

       NAME         CHAR(15) NOT NULL,

       INITIALS     CHAR(3) NOT NULL,

       BIRTH_DATE   DATE,

       SEX          CHAR(1) NOT NULL

                    CHECK(SEX IN ('M','F')),

       JOINED       SMALLINT NOT NULL

                    CHECK(JOINED > 1969) ,

       STREET       CHAR(30) NOT NULL,

       HOUSENO      CHAR(4),

       POSTCODE     CHAR(6) CHECK(POSTCODE LIKE '______'),

       TOWN         CHAR(10) NOT NULL,

       PHONENO      CHAR(13),

       LEAGUENO     CHAR(4))

;

CREATE TABLE TEAMS

      (TEAMNO       INTEGER NOT NULL PRIMARY KEY,

       PLAYERNO     INTEGER NOT NULL,

       DIVISION     CHAR(6)  NOT NULL

                    CHECK(DIVISION IN ('first','second')),

       FOREIGN KEY  (PLAYERNO) REFERENCES PLAYERS (PLAYERNO))

;

CREATE TABLE MATCHES

      (MATCHNO      INTEGER NOT NULL PRIMARY KEY,

       TEAMNO       INTEGER NOT NULL,

       PLAYERNO     INTEGER NOT NULL,

       WON          SMALLINT NOT NULL

                    CHECK(WON BETWEEN 0 AND 3),

       LOST         SMALLINT NOT NULL

                    CHECK(LOST BETWEEN 0 AND 3),

       FOREIGN KEY (TEAMNO) REFERENCES TEAMS (TEAMNO),

       FOREIGN KEY (PLAYERNO) REFERENCES PLAYERS (PLAYERNO))

;

CREATE TABLE PENALTIES

      (PAYMENTNO    INTEGER NOT NULL PRIMARY KEY,

       PLAYERNO     INTEGER NOT NULL,

       PAYMENT_DATE DATE NOT NULL

                    CHECK(PAYMENT_DATE >= DATE('1969-12-31')),

       AMOUNT       DECIMAL(7,2)  NOT NULL

                    CHECK (AMOUNT > 0),

       FOREIGN KEY (PLAYERNO) REFERENCES PLAYERS (PLAYERNO))

;

CREATE TABLE COMMITTEE_MEMBERS

      (PLAYERNO     INTEGER NOT NULL,

       BEGIN_DATE   DATE NOT NULL,

       END_DATE     DATE,

       POSITION     CHAR(20),

       PRIMARY KEY  (PLAYERNO, BEGIN_DATE),

       FOREIGN KEY  (PLAYERNO) REFERENCES PLAYERS (PLAYERNO),

       CHECK(BEGIN_DATE < END_DATE),

       CHECK(BEGIN_DATE >= DATE('1990-01-01')))

;

COMMIT WORK

;

INSERT INTO PLAYERS VALUES (

  2, 'Everett', 'R', '1948-09-01', 'M', 1975, 'Stoney Road',

    '43', '3575NH', 'Stratford', '070-237893', '2411')

;

INSERT INTO PLAYERS VALUES (

  6, 'Parmenter', 'R', '1964-06-25', 'M', 1977, 'Haseltine Lane',

    '80', '1234KK', 'Stratford', '070-476537', '8467')

;

INSERT INTO PLAYERS VALUES (

  7, 'Wise', 'GWS', '1963-05-11', 'M', 1981, 'Edgecombe Way',

    '39', '9758VB', 'Stratford', '070-347689', NULL)

;

INSERT INTO PLAYERS VALUES (

  8, 'Newcastle', 'B', '1962-07-08', 'F', 1980, 'Station Road',

    '4', '6584WO', 'Inglewood', '070-458458', '2983')

;

INSERT INTO PLAYERS VALUES (

 27, 'Collins', 'DD', '1964-12-28', 'F', 1983, 'Long Drive',

    '804', '8457DK', 'Eltham', '079-234857', '2513')

;

INSERT INTO PLAYERS VALUES (

 28, 'Collins', 'C', '1963-06-22', 'F', 1983, 'Old Main Road',

    '10', '1294QK', 'Midhurst', '010-659599', NULL)

;

INSERT INTO PLAYERS VALUES (

 39, 'Bishop', 'D', '1956-10-29', 'M', 1980, 'Eaton Square',

    '78', '9629CD', 'Stratford', '070-393435', NULL)

;

INSERT INTO PLAYERS VALUES (

 44, 'Baker', 'E', '1963-01-09', 'M', 1980, 'Lewis Street',

    '23', '4444LJ', 'Inglewood', '070-368753', '1124')

;

INSERT INTO PLAYERS VALUES (

 57, 'Brown', 'M', '1971-08-17', 'M', 1985, 'Edgecombe Way',

    '16', '4377CB', 'Stratford', '070-473458', '6409')

;

INSERT INTO PLAYERS VALUES (

 83, 'Hope', 'PK', '1956-11-11', 'M', 1982, 'Magdalene Road',

    '16A', '1812UP', 'Stratford', '070-353548', '1608')

;

INSERT INTO PLAYERS VALUES (

 95, 'Miller', 'P', '1963-05-14', 'M', 1972, 'High Street',

    '33A', '5746OP', 'Douglas', '070-867564', NULL)

;

INSERT INTO PLAYERS VALUES (

100, 'Parmenter', 'P', '1963-02-28', 'M', 1979, 'Haseltine Lane',

    '80', '6494SG', 'Stratford', '070-494593', '6524')

;

INSERT INTO PLAYERS VALUES (

104, 'Moorman', 'D', '1970-05-10', 'F', 1984, 'Stout Street',

    '65', '9437AO', 'Eltham', '079-987571', '7060')

;

INSERT INTO PLAYERS VALUES (

112, 'Bailey', 'IP', '1963-10-01', 'F', 1984, 'Vixen Road',

    '8', '6392LK', 'Plymouth', '010-548745', '1319')

;

INSERT INTO TEAMS VALUES (1,  6, 'first')

;

INSERT INTO TEAMS VALUES (2, 27, 'second')

;

INSERT INTO MATCHES VALUES ( 1, 1,   6, 3, 1)

;

INSERT INTO MATCHES VALUES ( 2, 1,   6, 2, 3)

;

INSERT INTO MATCHES VALUES ( 3, 1,   6, 3, 0)

;

INSERT INTO MATCHES VALUES ( 4, 1,  44, 3, 2)

;

INSERT INTO MATCHES VALUES ( 5, 1,  83, 0, 3)

;

INSERT INTO MATCHES VALUES ( 6, 1,   2, 1, 3)

;

INSERT INTO MATCHES VALUES ( 7, 1,  57, 3, 0)

;

INSERT INTO MATCHES VALUES ( 8, 1,   8, 0, 3)

;

INSERT INTO MATCHES VALUES ( 9, 2,  27, 3, 2)

;

INSERT INTO MATCHES VALUES (10, 2, 104, 3, 2)

;

INSERT INTO MATCHES VALUES (11, 2, 112, 2, 3)

;

INSERT INTO MATCHES VALUES (12, 2, 112, 1, 3)

;

INSERT INTO MATCHES VALUES (13, 2,   8, 0, 3)

;

INSERT INTO PENALTIES VALUES (1,  6, '1980-12-08',100)

;

INSERT INTO PENALTIES VALUES (2, 44, '1981-05-05', 75)

;

INSERT INTO PENALTIES VALUES (3, 27, '1983-09-10',100)

;

INSERT INTO PENALTIES VALUES (4,104, '1984-12-08', 50)

;

INSERT INTO PENALTIES VALUES (5, 44, '1980-12-08', 25)

;

INSERT INTO PENALTIES VALUES (6,  8, '1980-12-08', 25)

;

INSERT INTO PENALTIES VALUES (7, 44, '1982-12-30', 30)

;

INSERT INTO PENALTIES VALUES (8, 27, '1984-11-12', 75)

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  6, '1990-01-01', '1990-12-31', 'Secretary')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  6, '1991-01-01', '1992-12-31', 'Member')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  6, '1992-01-01', '1993-12-31', 'Treasurer')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  6, '1993-01-01',  NULL, 'Chairman')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  2, '1990-01-01', '1992-12-31', 'Chairman')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  2, '1994-01-01',  NULL, 'Member')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (112, '1992-01-01', '1992-12-31', 'Member')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (112, '1994-01-01',  NULL, 'Secretary')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  8, '1990-01-01', '1990-12-31', 'Treasurer')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  8, '1991-01-01', '1991-12-31', 'Secretary')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  8, '1993-01-01', '1993-12-31', 'Member')

;

INSERT INTO COMMITTEE_MEMBERS VALUES (  8, '1994-01-01',  NULL, 'Member')

;

INSERT INTO COMMITTEE_MEMBERS VALUES ( 57, '1992-01-01', '1992-12-31', 'Secretary')

;

INSERT INTO COMMITTEE_MEMBERS VALUES ( 27, '1990-01-01', '1990-12-31', 'Member')

;

INSERT INTO COMMITTEE_MEMBERS VALUES ( 27, '1991-01-01', '1991-12-31', 'Treasurer')

;

INSERT INTO COMMITTEE_MEMBERS VALUES ( 27, '1993-01-01', '1993-12-31', 'Treasurer')

;

INSERT INTO COMMITTEE_MEMBERS VALUES ( 95, '1994-01-01',  NULL, 'Treasurer')

;


