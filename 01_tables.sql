CREATE TABLE termek(
       termek_id NUMBER PRIMARY KEY,
       beszallito_id NUMBER NOT NULL,
       raktar_id NUMBER NOT NULL,
       megnevezes VARCHAR2(30) NOT NULL,
       termekkor VARCHAR2(30) NOT NULL,
       mennyiseg NUMBER NOT NULL,
       meret VARCHAR2(20), 
       egyseg VARCHAR2(10),      
       ar NUMBER NOT NULL,
       min_mennyiseg NUMBER,
       max_mennyiseg NUMBER,
       created_on TIMESTAMP DEFAULT SYSDATE NOT NULL,
       last_mod TIMESTAMP,
       DML_FLAG VARCHAR2(1),
       VERSION NUMBER    
)TABLESPACE users;

CREATE TABLE raktar(
       raktar_id NUMBER PRIMARY KEY,
       megnevezes VARCHAR2(30) NOT NULL,       
       raktaros_id NUMBER NOT NULL,
       created_on TIMESTAMP DEFAULT SYSDATE NOT NULL,
       last_mod TIMESTAMP,
       DML_FLAG VARCHAR2(1),
       VERSION NUMBER    
)TABLESPACE users;

CREATE TABLE raktaros(
       raktaros_id NUMBER PRIMARY KEY,
       nev VARCHAR2(50) NOT NULL,
       rendfokozat VARCHAR2(30),
       telefonszam VARCHAR2(20) NOT NULL,
       email VARCHAR2(40),
       created_on TIMESTAMP DEFAULT SYSDATE NOT NULL,
       last_mod TIMESTAMP,
       DML_FLAG VARCHAR2(1),
       VERSION NUMBER        
)TABLESPACE users;

CREATE TABLE beszallito(
       beszallito_id NUMBER PRIMARY KEY,
       nev VARCHAR2(50) NOT NULL,
       iranyitoszam NUMBER NOT NULL,
       varos VARCHAR2(20) NOT NULL,
       utca VARCHAR2(50) NOT NULL,
       telefonszam VARCHAR2(20) NOT NULL,
       email VARCHAR2(40),
       kapcsolattarto VARCHAR2(50),
       created_on TIMESTAMP DEFAULT SYSDATE NOT NULL,
       last_mod TIMESTAMP,
       DML_FLAG VARCHAR2(1),
       VERSION NUMBER         
)TABLESPACE users;

CREATE TABLE reszleg(
       reszleg_id NUMBER PRIMARY KEY,
       megnevezes VARCHAR2(50) NOT NULL,
       telefonszam VARCHAR2(20) NOT NULL,
       email VARCHAR2(40),
       anyagkezelo VARCHAR2(50),
       created_on TIMESTAMP DEFAULT SYSDATE NOT NULL,
       last_mod TIMESTAMP,
       DML_FLAG VARCHAR2(1),
       VERSION NUMBER        
)TABLESPACE users;

CREATE TABLE rendeles(
       rendeles_id NUMBER PRIMARY KEY,
       termek_id NUMBER NOT NULL,
       partner_id NUMBER NOT NULL,
       partner_tipus VARCHAR2(50) NOT NULL,
       mennyiseg NUMBER NOT NULL,
       rendeles_datum DATE NOT NULL,
       teljesites_datum DATE,
       statusz VARCHAR2(30) NOT NULL,
       created_on TIMESTAMP DEFAULT SYSDATE NOT NULL,
       last_mod TIMESTAMP,
       DML_FLAG VARCHAR2(1),
       VERSION NUMBER         
)TABLESPACE users;

