prompt PL/SQL Developer import file
prompt Created on Sunday, 28 July 2024 by Naama
set feedback off
set define off
prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  custphonenumber  VARCHAR2(20) not null,
  custname         VARCHAR2(20) not null,
  custaddress      VARCHAR2(20) not null,
  custid           INTEGER not null,
  discountpercents INTEGER,
  expirationdate   DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add primary key (CUSTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add unique (CUSTPHONENUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DATES...
create table DATES
(
  dateid NUMBER(3) not null,
  hourh  VARCHAR2(100) not null,
  dayd   VARCHAR2(100) not null,
  dated  DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DATES
  add primary key (DATEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DATES1...
create table DATES1
(
  dateid NUMBER(3) not null,
  hourh  VARCHAR2(100) not null,
  dayd   VARCHAR2(100) not null,
  dated  DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DATES1
  add primary key (DATEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MEALORTICKET...
create table MEALORTICKET
(
  mealid      INTEGER not null,
  mealname    VARCHAR2(20) not null,
  mealprice   INTEGER not null,
  genre       VARCHAR2(100),
  rating      INTEGER,
  duration    INTEGER,
  releasedate DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEALORTICKET
  add primary key (MEALID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEALORTICKET
  add unique (MEALNAME)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PROVIDERS...
create table PROVIDERS
(
  provname        VARCHAR2(20) not null,
  provphonenumber VARCHAR2(20) not null,
  provid          INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PROVIDERS
  add primary key (PROVID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PROVIDERS
  add unique (PROVPHONENUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PRODUCT...
create table PRODUCT
(
  prodid     INTEGER not null,
  prodname   VARCHAR2(20) not null,
  prodprice  INTEGER not null,
  prodamount INTEGER not null,
  provid     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add primary key (PRODID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add unique (PRODNAME)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add foreign key (PROVID)
  references PROVIDERS (PROVID);
alter table PRODUCT
  add constraint CHK_PRODPRICE
  check (prodPrice > 0);

prompt Creating INGREDIENTS...
create table INGREDIENTS
(
  ingredamount INTEGER not null,
  prodid       INTEGER not null,
  mealid       INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INGREDIENTS
  add primary key (PRODID, MEALID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INGREDIENTS
  add foreign key (PRODID)
  references PRODUCT (PRODID);
alter table INGREDIENTS
  add foreign key (MEALID)
  references MEALORTICKET (MEALID);

prompt Creating THEATERS...
create table THEATERS
(
  theaterid   NUMBER(3) not null,
  theatername VARCHAR2(100) not null,
  capacity    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table THEATERS
  add primary key (THEATERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MOVIES...
create table MOVIES
(
  movieid     NUMBER(3) not null,
  title       VARCHAR2(100) not null,
  genre       VARCHAR2(100),
  director    VARCHAR2(100),
  releasedate DATE,
  duration    INTEGER not null,
  rating      INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MOVIES
  add primary key (MOVIEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SCHEDULES...
create table SCHEDULES
(
  scheduleid     NUMBER(3) not null,
  theaterid      NUMBER(3) not null,
  availableseats INTEGER not null,
  movieid        NUMBER(3) not null,
  dateid         NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCHEDULES
  add primary key (SCHEDULEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCHEDULES
  add foreign key (MOVIEID)
  references MOVIES (MOVIEID);
alter table SCHEDULES
  add foreign key (THEATERID)
  references THEATERS (THEATERID);
alter table SCHEDULES
  add foreign key (DATEID)
  references DATES (DATEID);

prompt Creating ORDERS...
create table ORDERS
(
  orderid     INTEGER not null,
  orderprice  INTEGER not null,
  orderstatus VARCHAR2(20) not null,
  orderdate   DATE not null,
  custid      INTEGER not null,
  issold      CHAR(1) default 'N' not null,
  scheduleid  NUMBER(3)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add primary key (ORDERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add foreign key (CUSTID)
  references CUSTOMERS (CUSTID);
alter table ORDERS
  add foreign key (SCHEDULEID)
  references SCHEDULES (SCHEDULEID);
alter table ORDERS
  add constraint CHK_ORDERPRICE
  check (orderPrice >= 0);
alter table ORDERS
  add check (isSold IN ('Y', 'N'));

prompt Creating MEALORDER...
create table MEALORDER
(
  mealamount INTEGER not null,
  mealid     INTEGER not null,
  orderid    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEALORDER
  add primary key (MEALID, ORDERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEALORDER
  add foreign key (MEALID)
  references MEALORTICKET (MEALID);
alter table MEALORDER
  add foreign key (ORDERID)
  references ORDERS (ORDERID);

prompt Creating SCHEDULES1...
create table SCHEDULES1
(
  scheduleid     NUMBER(3) not null,
  theaterid      NUMBER(3) not null,
  availableseats INTEGER not null,
  mealorticketid INTEGER not null,
  dateid         NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCHEDULES1
  add primary key (SCHEDULEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCHEDULES1
  add foreign key (MEALORTICKETID)
  references MEALORTICKET (MEALID);
alter table SCHEDULES1
  add foreign key (THEATERID)
  references THEATERS (THEATERID);
alter table SCHEDULES1
  add foreign key (DATEID)
  references DATES (DATEID);

prompt Creating THEATERS1...
create table THEATERS1
(
  theaterid   NUMBER(3) not null,
  theatername VARCHAR2(100) not null,
  capacity    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table THEATERS1
  add primary key (THEATERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating WORKERS...
create table WORKERS
(
  workerid        INTEGER not null,
  workname        VARCHAR2(20) not null,
  workerjobtitle  VARCHAR2(20) not null,
  workersalary    INTEGER not null,
  workerbirthdate DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERS
  add primary key (WORKERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERS
  add constraint CHK_WORKERSALARY
  check (workerSalary > 0);

prompt Creating WORKERORDER...
create table WORKERORDER
(
  workerid INTEGER not null,
  orderid  INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERORDER
  add primary key (WORKERID, ORDERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERORDER
  add foreign key (WORKERID)
  references WORKERS (WORKERID);
alter table WORKERORDER
  add foreign key (ORDERID)
  references ORDERS (ORDERID);

prompt Disabling triggers for CUSTOMERS...
alter table CUSTOMERS disable all triggers;
prompt Disabling triggers for DATES...
alter table DATES disable all triggers;
prompt Disabling triggers for DATES1...
alter table DATES1 disable all triggers;
prompt Disabling triggers for MEALORTICKET...
alter table MEALORTICKET disable all triggers;
prompt Disabling triggers for PROVIDERS...
alter table PROVIDERS disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for INGREDIENTS...
alter table INGREDIENTS disable all triggers;
prompt Disabling triggers for THEATERS...
alter table THEATERS disable all triggers;
prompt Disabling triggers for MOVIES...
alter table MOVIES disable all triggers;
prompt Disabling triggers for SCHEDULES...
alter table SCHEDULES disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for MEALORDER...
alter table MEALORDER disable all triggers;
prompt Disabling triggers for SCHEDULES1...
alter table SCHEDULES1 disable all triggers;
prompt Disabling triggers for THEATERS1...
alter table THEATERS1 disable all triggers;
prompt Disabling triggers for WORKERS...
alter table WORKERS disable all triggers;
prompt Disabling triggers for WORKERORDER...
alter table WORKERORDER disable all triggers;
prompt Disabling foreign key constraints for PRODUCT...
alter table PRODUCT disable constraint SYS_C008293;
prompt Disabling foreign key constraints for INGREDIENTS...
alter table INGREDIENTS disable constraint SYS_C008298;
alter table INGREDIENTS disable constraint SYS_C008299;
prompt Disabling foreign key constraints for SCHEDULES...
alter table SCHEDULES disable constraint SYS_C008373;
alter table SCHEDULES disable constraint SYS_C008374;
alter table SCHEDULES disable constraint SYS_C008375;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint SYS_C008306;
alter table ORDERS disable constraint SYS_C008403;
prompt Disabling foreign key constraints for MEALORDER...
alter table MEALORDER disable constraint SYS_C008311;
alter table MEALORDER disable constraint SYS_C008312;
prompt Disabling foreign key constraints for SCHEDULES1...
alter table SCHEDULES1 disable constraint SYS_C008416;
alter table SCHEDULES1 disable constraint SYS_C008417;
alter table SCHEDULES1 disable constraint SYS_C008418;
prompt Disabling foreign key constraints for WORKERORDER...
alter table WORKERORDER disable constraint SYS_C008322;
alter table WORKERORDER disable constraint SYS_C008323;
prompt Deleting WORKERORDER...
delete from WORKERORDER;
commit;
prompt Deleting WORKERS...
delete from WORKERS;
commit;
prompt Deleting THEATERS1...
delete from THEATERS1;
commit;
prompt Deleting SCHEDULES1...
delete from SCHEDULES1;
commit;
prompt Deleting MEALORDER...
delete from MEALORDER;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
commit;
prompt Deleting SCHEDULES...
delete from SCHEDULES;
commit;
prompt Deleting MOVIES...
delete from MOVIES;
commit;
prompt Deleting THEATERS...
delete from THEATERS;
commit;
prompt Deleting INGREDIENTS...
delete from INGREDIENTS;
commit;
prompt Deleting PRODUCT...
delete from PRODUCT;
commit;
prompt Deleting PROVIDERS...
delete from PROVIDERS;
commit;
prompt Deleting MEALORTICKET...
delete from MEALORTICKET;
commit;
prompt Deleting DATES1...
delete from DATES1;
commit;
prompt Deleting DATES...
delete from DATES;
commit;
prompt Deleting CUSTOMERS...
delete from CUSTOMERS;
commit;
prompt Loading CUSTOMERS...
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('039-8398799', 'Cloris-Alda', 'Americana,3 Catherin', 603150426, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('023-8516887', 'Suzanne-Smith', 'Blacksburg,84 Syracu', 871869784, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('042-7711130', 'Bridget-Singh', 'Szazhalombatta,10 An', 594264009, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('041-2415021', 'Emily-Newman', 'Duluth,65 Branagh St', 318322784, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('089-8614436', 'Goldie-Thornton', 'Waldorf,41 Spiner Dr', 771701713, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('092-5828737', 'Elvis-Wilkinson', 'Buffalo Grove,62nd S', 736264193, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('041-4302744', 'Jeanne-Gayle', 'Fort gordon,39 Walte', 897322670, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('093-3672397', 'Glenn-Lerner', 'Cleveland,56 Kim Str', 701436220, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('063-5360355', 'Kiefer-Francis', 'Tyne & Wear,25 Buffa', 760945270, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('016-7689682', 'Delbert-Wariner', 'Tampa,44 Dennis Stre', 942708002, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('052-9559177', 'Glenn-Haggard', 'Peachtree City,53rd ', 454954065, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('097-8522479', 'Nile-Winstone', 'Madrid,68 Coyote Str', 861744214, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('015-5239687', 'Mika-Cagle', 'Wavre,21 Cate Drive', 750919835, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('099-9267329', 'Robert-Willis', 'Cobham,16 Southend o', 399318419, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('017-1234280', 'Mos-Torino', 'Dorval,64 Joli Road', 129121934, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('043-7656492', 'Miles-Dafoe', 'Aracruz,52 Lang', 899381603, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('045-7619585', 'Brothers-Thorton', 'Trento,69 Longueuil ', 157141811, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('029-8464688', 'Ceili-Mantegna', 'Charleston,71 Marie ', 296255366, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('093-6560682', 'Tilda-Lizzy', 'Morioka,49 Craddock ', 251002805, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('012-5582955', 'Lucinda-Kinnear', 'Knutsford,89 Leo Str', 496245735, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('018-8901049', 'Andy-Mandrell', 'Richmond,198 Meniket', 535781565, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('096-5818880', 'Cathy-Cockburn', 'Londrina,46 Nivola D', 436759233, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('080-4200885', 'Carole-Doucette', 'Groton,86 Blossoms S', 838802596, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('080-8249575', 'Kristin-Hewett', 'Munich,77 Bloch Driv', 192646604, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('094-2891419', 'Rip-Perez', 'Bollensen,74 Dennis ', 463371951, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('035-1582562', 'Cathy-Goodman', 'Rimini,361 Tokyo Str', 560391764, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('095-5558258', 'Udo-Durning', 'West Sussex,292 Bett', 235167090, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('069-8754038', 'Jonathan-Affleck', 'Hjallerup,38 Piven S', 777766742, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('044-1678993', 'Glenn-Bush', 'Maryville,93 Daniel ', 909589275, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('073-9832543', 'Andy-Dourif', 'Newnan,52 Geldof Str', 390110769, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('060-6304918', 'Deborah-Sayer', 'Lexington,742 Hunt V', 185636514, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('011-5478891', 'Yaphet-Union', 'Bristol,80 Bonnie Bl', 252721669, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('068-5899621', 'Rene-Puckett', 'Archbold,53 Mint', 361558168, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('055-5700759', 'Jena-Phoenix', 'Bremen,11st Street', 970287710, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('080-5649752', 'Dwight-Brickell', 'Kobe,82 Brooks Road', 199640888, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('061-8391071', 'Kevin-Woodward', 'Pomona,63 Terrence S', 395931910, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('027-5161085', 'Dianne-Costner', 'Burlington,137 Lynch', 420529630, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('016-3799987', 'Franz-Mars', 'Neustadt,61 Chaka', 166381326, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('028-8498091', 'Gavin-Reno', 'Issaquah,674 Ray Str', 336195988, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('015-4966018', 'Halle-Mulroney', 'Pasadena,62 Rob Road', 747630593, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('016-4558986', 'Michael-Hyde', 'Santa Clarita,87 Rad', 739894646, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('074-6013851', 'Latin-Bachman', 'Rheinfelden,827 Kris', 790353923, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('016-3139520', 'Taye-Spall', 'Narrows,63 Vassar Bl', 983955606, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('033-1326052', 'Cameron-Cleese', 'Varzea grande,11 San', 190012393, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('062-7142077', 'Kris-McNeice', 'San Francisco,50 Mag', 903486694, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('045-8323623', 'Nick-Kilmer', 'Oslo,33 Nanci Road', 597936180, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('070-4983265', 'Bonnie-Ribisi', 'Pacific Grove,6 Thin', 987938231, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('014-6595202', 'Moe-Ford', 'Coppell,37 Geldof St', 993714527, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('017-9410536', 'Henry-Vicious', 'Mount Olive,58 Ricky', 605867286, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('068-6647843', 'Maceo-Penders', 'Vanderbijlpark,42nd ', 746060762, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('045-2835268', 'Jet-Berenger', 'El Paso,122 Marina R', 849303235, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('028-4140182', 'Mary-Weir', 'Lexington,35 Kadison', 908589616, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('049-5841158', 'Angela-Davidson', 'Appenzell,878 Atlas ', 654684525, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('066-6570024', 'Elias-Wainwright', 'Brisbane,28 Ball Str', 275420456, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('037-6201415', 'Tramaine-Brooks', 'San Mateo,888 Ramire', 529782749, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('072-1617259', 'Roberta-Pigott-Smith', 'Londrina,62 Bellevue', 273481859, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('078-4936561', 'Howard-Sandoval', 'Derwood,86 Perry Dri', 838318068, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('057-9197515', 'Selma-Popper', 'Herzlia,13 Jackson R', 355899957, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('031-1962278', 'Garland-Detmer', 'Bartlett,74 Rundgren', 205272172, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('084-2830712', 'Bo-Short', 'Des Plaines,97 Monro', 409771057, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('018-1790221', 'Eddie-Pollak', 'Bountiful,46 Ness Dr', 895204813, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('057-6458417', 'Joe-Chao', 'Guamo,93 Tal Road', 589291628, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('098-3999434', 'Ed-Moriarty', 'Maryville,24 Payton ', 705165132, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('097-5760855', 'Cary-Kane', 'Orleans,72nd Street', 144207533, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('088-5134506', 'Carlene-Klugh', 'Rosario,9 Costa Stre', 764421102, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('053-2418600', 'Praga-Lang', 'Ferraz  vasconcelos,', 946312472, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('035-3220135', 'Brooke-Dysart', 'High Wycombe,31 Slat', 922094598, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('069-4765539', 'Hank-Rickles', 'Silverdale,45 Garber', 563480832, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('022-6043469', 'Natacha-Broza', 'Angers,16 Collective', 573755457, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('053-9237850', 'Demi-Henriksen', 'Mobile,7 Emily Stree', 620322646, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('082-9958465', 'Sam-Reid', 'Saitama,634 Jackie B', 202988966, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('097-5865129', 'Miguel-Gunton', 'Vejle,23rd Street', 735716196, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('047-2563046', 'Holly-Renfro', 'St. Petersburg,760 P', 681572378, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('070-7717018', 'Ralph-Bonneville', 'Monroe,93rd Street', 181724644, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('022-6824283', 'Danni-Gill', 'Lake worth,92nd Stre', 353134007, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('087-2345157', 'Millie-Ball', 'Herzlia,180 Silverma', 652286041, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('061-5389186', 'Laurie-Berry', 'Ashland,63rd Street', 190711252, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('021-9360617', 'Ceili-Greene', 'Wetzlar,22nd Street', 257662071, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('055-6142289', 'Mena-urban', 'Goslar,666 Boyle Dri', 416941052, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('093-8777527', 'Curt-Lerner', 'Lakeville,58 Suzi Dr', 464221141, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('088-5310917', 'Daniel-Cockburn', 'Cuenca,69 Drew Stree', 783806626, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('069-9494423', 'Paul-Pitt', 'Toyama,722 Cook Stre', 507754009, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('027-7953606', 'Sharon-Hurt', 'Samrand,64 Geoffrey ', 896151890, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('036-5094971', 'Ving-Senior', 'Lodi,86 Moore Street', 576090664, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('016-6968487', 'Danny-Bradford', 'Sant Cugat Del Valle', 987656414, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('022-2276722', 'Lois-Elizabeth', 'Syracuse,170 Meyer A', 738200510, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('030-2568721', 'Jimmy-Pearce', 'Eiksmarka,17 Lou', 251066882, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('049-8731290', 'Brian-Downey', 'Whitehouse Station,6', 960671680, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('059-8436528', 'Pamela-Affleck', 'Campinas,65 Leigh St', 177644588, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('016-6599897', 'Meg-Sossamon', 'Immenstaad,408 Jody ', 738961356, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('028-2907067', 'Vonda-Carrere', 'San Jose,78 Meppel B', 449860234, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('019-6672849', 'Vickie-Darren', 'Exeter,93rd Street', 153843514, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('023-9065231', 'Ramsey-LaBelle', 'Bad Camberg,25 Dean ', 152909198, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('069-8815006', 'LeVar-Wahlberg', 'Dardilly,95 Friedric', 352004805, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('093-3144144', 'Chubby-Tippe', 'Cesena,40 LeVar Driv', 203881975, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('033-2194026', 'Dustin-Hawthorne', 'Milano,35 Robbins Dr', 928549846, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('044-1955068', 'Cameron-Wahlberg', 'Alessandria,1 Duvall', 312294196, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('067-8617590', 'Connie-Rollins', 'Takapuna,39 Salzburg', 618573694, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('043-6848004', 'Nikki-Dern', 'Louisville,16 Haynes', 850094083, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('072-7451073', 'Mike-Morrison', 'Tulsa,787 Gordon Str', 523316363, 0, null);
commit;
prompt 100 records committed...
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('095-9291576', 'Lynn-Englund', 'Biel,36 Marshall Str', 304261315, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('077-2175527', 'Cherry-Tsettos', 'Zurich,85 Lawrence B', 789224520, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('015-9754161', 'Wallace-Midler', 'Vienna,48 Fariq Blvd', 909762395, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('071-3599094', 'Heath-MacPherson', 'Maebashi,75 Murray', 732741572, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('069-6016604', 'Marc-Magnuson', 'Cary,73rd Street', 423632765, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('046-3602401', 'Helen-Gallant', 'Mogi Guacu,80 Greenv', 862513457, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('046-3045462', 'Chaka-Fiorentino', 'St-laurent,92nd Stre', 660797697, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('088-9947248', 'Vickie-Warden', 'Toulouse,72 Lou Driv', 164502431, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('095-6953475', 'Janice-Duschel', 'Cleveland,80 Ryan Bl', 366643056, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('046-9426120', 'Viggo-Moreno', 'Huntsville,37 Ontive', 138000652, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('039-6797761', 'Chazz-Folds', 'Portland,102 Milton ', 709566924, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('093-7359833', 'Beverley-Kirshner', 'Kagoshima,71 Quinone', 906393556, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('098-9919026', 'Meredith-Hoffman', 'Thame,2 Dresden Blvd', 679380064, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('093-1271647', 'Carlene-Stiles', 'Sorocaba,55 Landau R', 927524225, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('096-1981062', 'Rip-Houston', 'Aurora,153 Coquitlam', 805854680, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('024-7586537', 'Pam-Allan', 'Melrose park,42 Neuw', 654825535, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('078-9336086', 'Jill-Keitel', 'Canberra,282 Woodwar', 463878923, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('084-7474177', 'Solomon-Lightfoot', 'Tilst,69 Pleasence S', 644923088, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('026-3662113', 'Corey-Morse', 'Redding,24 Twilley S', 733139526, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('034-8121049', 'Neve-Nicholson', 'Bartlesville,23 Mori', 750119869, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('056-8977964', 'Lily-Reilly', 'Giessen,174 Coe Driv', 369053838, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('093-1796080', 'Murray-Geldof', 'Richmond,35 Botti St', 900468358, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('012-8809438', 'Sean-Leto', 'Englewood Cliffs,8 H', 504536643, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('077-3132284', 'Thomas-Carrey', 'Highlands Ranch,41 C', 989065808, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('042-2062626', 'Doug-Carr', 'New Hyde Park,63rd S', 323148897, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('071-7357177', 'Trey-Camp', 'Waldbronn,22nd Stree', 203093493, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('045-1386274', 'Lynn-Nelson', 'Warrenton,2 McDonald', 836439971, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('035-9447057', 'Tanya-Karyo', 'Palo Alto,53 Milla D', 484733518, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('067-9816016', 'Red-Fichtner', 'Barnegat,57 Nancy Ro', 640331895, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('076-6758242', 'Ivan-Hedaya', 'Birkenhead,26 Vissel', 911729605, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('042-4695217', 'Oliver-Coverdale', 'Charleston,26 Robert', 832430127, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('048-7843412', 'Patrick-Orbit', 'Ricardson,5 Ledger S', 458886237, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('085-7992672', 'Remy-Magnuson', 'Obfelden,96 Stiles B', 251021859, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('072-7047995', 'Quentin-Summer', 'Irkutsk,58 Darius Av', 853517846, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('036-2782453', 'Kasey-Wiedlin', 'Warley,157 Carnes St', 898674199, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('056-7615871', 'Jane-Overstreet', 'Kopavogur,61 Gilley ', 567225446, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('035-4693995', 'Dennis-Del Toro', 'Granada Hills,56 Lin', 197619991, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('078-4880145', 'Mira-Gano', 'Dallas,94 Collin', 929328580, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('072-6469562', 'Terence-Penn', 'West Chester,923 Ess', 915869687, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('041-7561640', 'King-Whitley', 'Paderborn,41 Streep ', 977753609, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('098-5994659', 'Bobby-Fehr', 'Antwerpen,10 Powers ', 362427181, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('067-7846134', 'Charlize-Napolitano', 'Chaam,283 Redgrave S', 427332445, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('085-2934836', 'Harris-Schwimmer', 'Barksdale afb,34 Edm', 966414435, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('017-4665761', 'Adrien-Cattrall', 'Spring City,5 Helsin', 462977437, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('095-7109459', 'Garth-Phillippe', 'Goiania,33 Clark Str', 445757640, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('037-7021577', 'Mili-Gibson', 'Battle Creek,28 Vanc', 935291735, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('050-9955850', 'Kenneth-Uggams', 'Gifu,15 Zipf Street', 924245604, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('035-6398075', 'Latin-Reid', 'Bielefeld,1 Denzel A', 324402203, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('050-2373517', 'Stanley-Watley', 'Giessen,57 Birch Str', 295158882, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('070-4168203', 'Cyndi-Randal', 'Hjallerup,62 Dionne ', 597771718, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('090-5811378', 'Fiona-Tucci', 'Pusan-city,98 Quatro', 497469605, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('074-4583819', 'Charlie-Weisz', 'New hartford,55 Eber', 654712365, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('013-2416207', 'Gavin-Farina', 'Boston,86 Latin Road', 200082966, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('094-1220453', 'Renee-Arkin', 'Mapo-gu,80 Vaughan S', 975723107, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('079-6721717', 'First-Reinhold', 'High Wycombe,12nd St', 115550235, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('054-6693080', 'Rueben-Perlman', 'Knoxville,73 Athens ', 273626310, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('085-2841173', 'Renee-Sanders', 'Kaiserslautern,542 P', 163717059, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('064-2583921', 'Maureen-Jessee', 'Trento,45 San Jose', 867830048, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('029-1534493', 'Harriet-McCain', 'Chapel hill,79 Gosdi', 500276225, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('029-8320803', 'Jeanne-Borgnine', 'Dunn loring,265 Katt', 847683496, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('011-2106546', 'Edward-Guest', 'Courbevoie,17 Rutger', 201884188, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('040-7084106', 'Brent-LaSalle', 'Koblenz,23 Sheena Ro', 282036733, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('069-2963103', 'Juliet-Cruz', 'Park Ridge,9 Gosdin ', 193177293, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('051-7961115', 'Rik-Gellar', 'Bay Shore,54 Herbie ', 944370934, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('031-3359375', 'Daniel-Shaw', 'Foster City,326 Redg', 224495473, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('041-8670226', 'Isaiah-Damon', 'Ankara,74 Jenkins Ro', 388964714, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('090-2279209', 'Hector-Leto', 'Firenze,54 Estevez A', 789562188, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('098-4732493', 'Anita-Lang', 'Banbury,35 Chuck', 484622079, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('014-3788654', 'Thin-Horizon', 'Nanaimo,45 Tate Stre', 202938205, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('030-5713520', 'Mili-Raitt', 'Oxford,36 Bridget St', 777678448, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('031-8564677', 'Chrissie-Rhymes', 'South Weber,42 Jonat', 826107453, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('017-1648969', 'Chrissie-Alston', 'Baarn,33 Overstreet ', 544629310, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('095-9665937', 'Etta-Sylvian', 'Espoo,64 Spector Dri', 218429826, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('026-7580278', 'Hilary-Anderson', 'Orlando,448 Hong Kon', 455396724, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('061-6482468', 'Rhys-Ontiveros', 'Treviso,83rd Street', 487981995, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('060-2558353', 'Buddy-MacDonald', 'Hermitage,97 Machine', 272724345, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('023-7498613', 'Jon-Child', 'Chapel hill,82nd Str', 360260555, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('087-9815553', 'Larenz-Elwes', 'Madison,620 Pottendo', 974693239, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('021-8343650', 'Kevn-Foxx', 'Parma,83 Woodard Dri', 689426993, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('037-3894820', 'Rod-Womack', 'Corona,100 Anthony D', 990813819, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('074-1966368', 'Mark-Tucker', 'Scottsdale,93 Zeta-J', 923324345, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('038-4340258', 'Fats-Kinnear', 'Hjallerup,84 Vendett', 535355728, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('050-2737025', 'Bonnie-Hayek', 'Warrenton,100 Harnes', 202423128, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('078-1302674', 'April-Nolte', 'Borger,74 Coleman Av', 575427604, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('038-6108239', 'Aida-Bening', 'Slidel,82 Brad Stree', 151517503, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('094-1288151', 'Terri-Maguire', 'Sulzbach,27 Lloyd Dr', 673202124, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('057-7038562', 'Lynette-Barkin', 'Barnegat,686 Denny R', 655844485, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('091-2026131', 'Dustin-Duncan', 'Rockville,77 Carolin', 141067913, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('013-4233235', 'Uma-Kane', 'Caguas,20 Tilst Road', 849466338, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('042-2457156', 'Ernie-Flack', 'Coppell,8 Geggy', 341627864, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('035-6793852', 'Dar-Kidman', 'Granada Hills,65 Joa', 907287038, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('045-3638185', 'Aaron-Nicholson', 'Yamaguchi,91 Tierney', 656234359, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('088-3302509', 'Nina-El-Saher', 'Kagoshima,31 Farrow ', 167375351, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('019-8929169', 'Mint-Butler', 'El Dorado Hills,93 T', 272031711, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('042-3567257', 'Sara-Summer', 'Frederiksberg,61 Fir', 688095708, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('053-8214561', 'Ice-Hayek', 'Sugar Hill,92 Theron', 351022726, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('044-3666267', 'Sigourney-Forrest', 'Allen,67 Gates Stree', 446436968, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('099-6606819', 'Wes-Rollins', 'Albany,59 Nakai Driv', 530559367, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('072-4661896', 'Campbell-Crimson', 'Uden,468 Rhames Road', 529665183, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('018-1668589', 'Delbert-Curtis', 'Oldham,91 Pastore St', 218763605, 0, null);
commit;
prompt 200 records committed...
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('051-8296868', 'Miki-Tsettos', 'Seatle,36 Gellar', 216541625, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('074-4635845', 'Pelvic-Carr', 'Saga,75 Colombo Driv', 682288204, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('033-6186961', 'Nancy-Braugher', 'Highlands Ranch,22 T', 761433673, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('024-1278402', 'Edgar-Peet', 'Manchester,50 Terren', 815123821, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('018-2667880', 'Jena-Dench', 'Royston,80 Lummen Av', 328879351, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('045-6049390', 'Mel-Murray', 'Forest Park,11 Keene', 501237230, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('059-7644421', 'Ethan-Springfield', 'Hong Kong,102 Bristo', 171880121, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('096-2948945', 'Winona-Rossellini', 'Birmensdorf,86 Domin', 179794254, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('089-1724938', 'Rosanna-Marley', 'Sidney,21 Charleston', 886831669, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('020-2181446', 'Frederic-Yorn', 'Middleburg Heights,4', 371061470, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('055-7923969', 'Ritchie-Mollard', 'Fountain Hills,550 R', 898190326, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('032-7632232', 'Tyrone-Branagh', 'Vienna,94 Kadison Ro', 903277991, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('039-9677405', 'King-Cage', 'Ludbreg,3 Donelly Ro', 640019960, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('031-8287208', 'Jodie-Arjona', 'Bellevue,91st Street', 721140035, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('040-8227749', 'Rene-Baker', 'Kobe,99 Tooele Ave', 581815622, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('079-8051246', 'Clay-Thurman', 'Glasgow,84 Gellar St', 514205703, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('065-3621101', 'Rade-Crouch', 'Leimen,73rd Street', 979954238, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('037-7363897', 'Debbie-Curtis-Hall', 'Chur,867 Warren Stre', 479411599, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('047-5680852', 'Jill-Tomlin', 'West Drayton,637 Bac', 656442110, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('052-4174061', 'Oded-Sepulveda', 'Zaandam,82nd Street', 129466992, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('094-5957232', 'Ronny-urban', 'Mayfield Village,486', 438477170, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('019-4625160', 'Alan-Hedaya', 'Cherepovets,472 Tzi', 255733886, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('061-7385493', 'Dermot-Wilkinson', 'Amsterdam,491 Machin', 221244365, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('018-9843011', 'Roger-Carrack', 'Freiburg,407 Callow ', 590210023, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('061-5155661', 'Mitchell-Connery', 'Carmichael,81st Stre', 704448570, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('027-5694090', 'Harold-McIntosh', 'Zürich,31 Linz Road', 250944666, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('073-4319496', 'Lynette-Geldof', 'Fort worth,85 Paul R', 785335488, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('095-1792468', 'Antonio-LaPaglia', 'London,99 Hope Road', 533475097, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('089-1517241', 'Herbie-Chapman', 'Billerica,99 Rosemea', 799777319, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('069-3544791', 'Lynn-Glover', 'Ribeirao preto,636 G', 353482730, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('016-9037187', 'Lizzy-Emmerich', 'Oak park,66 Jane Ave', 242192420, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('016-7608215', 'Lauren-Olyphant', 'Yamagata,32 Furay Ro', 963819761, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('032-4794151', 'Gil-Furtado', 'Herndon,11st Street', 833739957, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('036-5154258', 'Etta-Condition', 'Kumamoto,72nd Street', 221770313, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('099-3532311', 'Larenz-Sherman', 'Helsingborg,43 Keanu', 604322566, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('084-9608701', 'Joy-Weir', 'Cottbus,32nd Street', 586258847, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('029-3065148', 'Campbell-DiBiasio', 'Padova,711 Blaine Bl', 588037827, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('028-2427986', 'Oded-Michaels', 'Hannover,81st Street', 476782813, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('061-4590865', 'Paula-Palmieri', 'West Point,771 Broth', 756920718, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('032-9959348', 'Hope-Kurtz', 'Port Macquarie,65 Tu', 907597444, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('027-3932517', 'Lennie-Osment', 'Hines,65 Hoskins Dri', 805401712, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('078-8055438', 'Nicholas-Fierstein', 'Belmont,596 England ', 894904744, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('024-9901759', 'Tom-Nugent', 'Roma,29 Wiest Drive', 349840942, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('014-7292908', 'Molly-Lewis', 'Hamburg,13rd Street', 237093998, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('085-3994185', 'King-Warden', 'Solikamsk,76 Laws Ro', 798816085, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('082-2523246', 'Jeff-Raitt', 'Englewood Cliffs,79 ', 772545227, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('095-2181948', 'Chloe-Rock', 'San Diego,9 Madonna ', 795843818, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('027-6093694', 'Dwight-Lynch', 'Kaysville,91 Northbr', 320214197, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('096-1134292', 'Christopher-Brandt', 'Hiroshima,24 Beatty ', 322102919, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('051-3938459', 'Orlando-Tierney', 'Essen,49 Cedar Rapid', 805897636, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('029-9185478', 'Brad-Mulroney', 'Sursee,38 Nielsen St', 649748137, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('054-2979770', 'Wes-Cleese', 'Veenendaal,72 Talvin', 896757685, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('031-4761505', 'Famke-Coughlan', 'Barcelona,61 Solomon', 202890933, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('093-5566616', 'Marty-Tippe', 'Juneau,1 Yokohama Ro', 449616736, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('029-1977236', 'Tyrone-Rhodes', 'Greenville,25 Readin', 620162965, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('063-1522797', 'Roberta-Mazzello', 'Torino,76 Chazz Stre', 703201506, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('057-8988986', 'Mickey-Ramis', 'Bedford,509 Karyo Ro', 745982751, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('031-9263528', 'Derrick-Hobson', 'Glasgow,53rd Street', 867901175, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('071-5993066', 'Daryle-Pollack', 'Rosario,72 West Wind', 953195098, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('038-4856571', 'Harrison-Utada', 'St. Louis,87 Imbrugl', 616193234, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('053-2368470', 'Rosco-von Sydow', 'Mt. Laurel,84 Kaunas', 775307155, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('015-2100695', 'Kirsten-Byrne', 'Newbury,62 Waltham D', 318736190, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('071-2402750', 'Stevie-Damon', 'Paraju,53rd Street', 490314299, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('030-4808161', 'Renee-Stampley', 'Varzea grande,99 Ham', 346014580, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('040-8094439', 'Spencer-Kline', 'Encinitas,47 Perrine', 301677086, 0, null);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid, discountpercents, expirationdate)
values ('081-3651072', 'Bob-Coburn', 'Jacksonville,29 Peet', 298257323, 0, null);
commit;
prompt 266 records loaded
prompt Loading DATES...
insert into DATES (dateid, hourh, dayd, dated)
values (100, '14:00', 'SAT', to_date('01-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (101, '17:00', 'SAT', to_date('01-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (102, '20:00', 'SAT', to_date('01-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (103, '23:00', 'SAT', to_date('01-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (104, '14:00', 'SUN', to_date('02-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (105, '17:00', 'SUN', to_date('02-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (106, '20:00', 'SUN', to_date('02-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (107, '23:00', 'SUN', to_date('02-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (108, '14:00', 'MON', to_date('03-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (109, '17:00', 'MON', to_date('03-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (110, '20:00', 'MON', to_date('03-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (111, '23:00', 'MON', to_date('03-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (112, '14:00', 'TUE', to_date('04-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (113, '17:00', 'TUE', to_date('04-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (114, '20:00', 'TUE', to_date('04-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (115, '23:00', 'TUE', to_date('04-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (116, '14:00', 'WED', to_date('05-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (117, '17:00', 'WED', to_date('05-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (118, '20:00', 'WED', to_date('05-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (119, '23:00', 'WED', to_date('05-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (120, '14:00', 'THU', to_date('06-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (121, '17:00', 'THU', to_date('06-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (122, '20:00', 'THU', to_date('06-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (123, '23:00', 'THU', to_date('06-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (124, '14:00', 'FRI', to_date('07-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (125, '17:00', 'FRI', to_date('07-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (126, '20:00', 'FRI', to_date('07-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (127, '23:00', 'FRI', to_date('07-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (128, '14:00', 'SAT', to_date('08-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (129, '17:00', 'SAT', to_date('08-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (130, '20:00', 'SAT', to_date('08-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (131, '23:00', 'SAT', to_date('08-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (132, '14:00', 'SUN', to_date('09-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (133, '17:00', 'SUN', to_date('09-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (134, '20:00', 'SUN', to_date('09-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (135, '23:00', 'SUN', to_date('09-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (136, '14:00', 'MON', to_date('10-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (137, '17:00', 'MON', to_date('10-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (138, '20:00', 'MON', to_date('10-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (139, '23:00', 'MON', to_date('10-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (140, '14:00', 'TUE', to_date('11-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (141, '17:00', 'TUE', to_date('11-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (142, '20:00', 'TUE', to_date('11-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (143, '23:00', 'TUE', to_date('11-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (144, '14:00', 'WED', to_date('12-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (145, '17:00', 'WED', to_date('12-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (146, '20:00', 'WED', to_date('12-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (147, '23:00', 'WED', to_date('12-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (148, '14:00', 'THU', to_date('13-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (149, '17:00', 'THU', to_date('13-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (150, '20:00', 'THU', to_date('13-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (151, '23:00', 'THU', to_date('13-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (152, '14:00', 'FRI', to_date('14-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (153, '17:00', 'FRI', to_date('14-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (154, '20:00', 'FRI', to_date('14-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (155, '23:00', 'FRI', to_date('14-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (156, '14:00', 'SAT', to_date('15-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (157, '17:00', 'SAT', to_date('15-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (158, '20:00', 'SAT', to_date('15-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (159, '23:00', 'SAT', to_date('15-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (160, '14:00', 'SUN', to_date('16-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (161, '17:00', 'SUN', to_date('16-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (162, '20:00', 'SUN', to_date('16-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (163, '23:00', 'SUN', to_date('16-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (164, '14:00', 'MON', to_date('17-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (165, '17:00', 'MON', to_date('17-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (166, '20:00', 'MON', to_date('17-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (167, '23:00', 'MON', to_date('17-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (168, '14:00', 'TUE', to_date('18-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (169, '17:00', 'TUE', to_date('18-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (170, '20:00', 'TUE', to_date('18-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (171, '23:00', 'TUE', to_date('18-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (172, '14:00', 'WED', to_date('19-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (173, '17:00', 'WED', to_date('19-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (174, '20:00', 'WED', to_date('19-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (175, '23:00', 'WED', to_date('19-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (176, '14:00', 'THU', to_date('20-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (177, '17:00', 'THU', to_date('20-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (178, '20:00', 'THU', to_date('20-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (179, '23:00', 'THU', to_date('20-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (180, '14:00', 'FRI', to_date('21-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (181, '17:00', 'FRI', to_date('21-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (182, '20:00', 'FRI', to_date('21-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (183, '23:00', 'FRI', to_date('21-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (184, '14:00', 'SAT', to_date('22-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (185, '17:00', 'SAT', to_date('22-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (186, '20:00', 'SAT', to_date('22-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (187, '23:00', 'SAT', to_date('22-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (188, '14:00', 'SUN', to_date('23-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (189, '17:00', 'SUN', to_date('23-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (190, '20:00', 'SUN', to_date('23-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (191, '23:00', 'SUN', to_date('23-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (192, '14:00', 'MON', to_date('24-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (193, '17:00', 'MON', to_date('24-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (194, '20:00', 'MON', to_date('24-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (195, '23:00', 'MON', to_date('24-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (196, '14:00', 'TUE', to_date('25-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (197, '17:00', 'TUE', to_date('25-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (198, '20:00', 'TUE', to_date('25-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (199, '23:00', 'TUE', to_date('25-06-2024', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into DATES (dateid, hourh, dayd, dated)
values (200, '14:00', 'WED', to_date('26-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (201, '17:00', 'WED', to_date('26-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (202, '20:00', 'WED', to_date('26-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (203, '23:00', 'WED', to_date('26-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (204, '14:00', 'THU', to_date('27-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (205, '17:00', 'THU', to_date('27-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (206, '20:00', 'THU', to_date('27-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (207, '23:00', 'THU', to_date('27-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (208, '14:00', 'FRI', to_date('28-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (209, '17:00', 'FRI', to_date('28-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (210, '20:00', 'FRI', to_date('28-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (211, '23:00', 'FRI', to_date('28-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (212, '14:00', 'SAT', to_date('29-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (213, '17:00', 'SAT', to_date('29-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (214, '20:00', 'SAT', to_date('29-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (215, '23:00', 'SAT', to_date('29-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (216, '14:00', 'SUN', to_date('30-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (217, '17:00', 'SUN', to_date('30-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (218, '20:00', 'SUN', to_date('30-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (219, '23:00', 'SUN', to_date('30-06-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (220, '14:00', 'MON', to_date('01-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (221, '17:00', 'MON', to_date('01-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (222, '20:00', 'MON', to_date('01-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (223, '23:00', 'MON', to_date('01-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (224, '14:00', 'TUE', to_date('02-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (225, '17:00', 'TUE', to_date('02-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (226, '20:00', 'TUE', to_date('02-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (227, '23:00', 'TUE', to_date('02-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (228, '14:00', 'WED', to_date('03-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (229, '17:00', 'WED', to_date('03-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (230, '20:00', 'WED', to_date('03-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (231, '23:00', 'WED', to_date('03-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (232, '14:00', 'THU', to_date('04-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (233, '17:00', 'THU', to_date('04-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (234, '20:00', 'THU', to_date('04-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (235, '23:00', 'THU', to_date('04-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (236, '14:00', 'FRI', to_date('05-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (237, '17:00', 'FRI', to_date('05-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (238, '20:00', 'FRI', to_date('05-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (239, '23:00', 'FRI', to_date('05-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (240, '14:00', 'SAT', to_date('06-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (241, '17:00', 'SAT', to_date('06-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (242, '20:00', 'SAT', to_date('06-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (243, '23:00', 'SAT', to_date('06-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (244, '14:00', 'SUN', to_date('07-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (245, '17:00', 'SUN', to_date('07-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (246, '20:00', 'SUN', to_date('07-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (247, '23:00', 'SUN', to_date('07-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (248, '14:00', 'MON', to_date('08-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (249, '17:00', 'MON', to_date('08-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (250, '20:00', 'MON', to_date('08-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (251, '23:00', 'MON', to_date('08-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (252, '14:00', 'TUE', to_date('09-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (253, '17:00', 'TUE', to_date('09-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (254, '20:00', 'TUE', to_date('09-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (255, '23:00', 'TUE', to_date('09-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (256, '14:00', 'WED', to_date('10-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (257, '17:00', 'WED', to_date('10-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (258, '20:00', 'WED', to_date('10-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (259, '23:00', 'WED', to_date('10-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (260, '14:00', 'THU', to_date('11-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (261, '17:00', 'THU', to_date('11-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (262, '20:00', 'THU', to_date('11-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (263, '23:00', 'THU', to_date('11-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (264, '14:00', 'FRI', to_date('12-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (265, '17:00', 'FRI', to_date('12-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (266, '20:00', 'FRI', to_date('12-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (267, '23:00', 'FRI', to_date('12-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (268, '14:00', 'SAT', to_date('13-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (269, '17:00', 'SAT', to_date('13-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (270, '20:00', 'SAT', to_date('13-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (271, '23:00', 'SAT', to_date('13-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (272, '14:00', 'SUN', to_date('14-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (273, '17:00', 'SUN', to_date('14-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (274, '20:00', 'SUN', to_date('14-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (275, '23:00', 'SUN', to_date('14-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (276, '14:00', 'MON', to_date('15-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (277, '17:00', 'MON', to_date('15-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (278, '20:00', 'MON', to_date('15-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (279, '23:00', 'MON', to_date('15-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (280, '14:00', 'TUE', to_date('16-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (281, '17:00', 'TUE', to_date('16-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (282, '20:00', 'TUE', to_date('16-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (283, '23:00', 'TUE', to_date('16-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (284, '14:00', 'WED', to_date('17-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (285, '17:00', 'WED', to_date('17-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (286, '20:00', 'WED', to_date('17-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (287, '23:00', 'WED', to_date('17-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (288, '14:00', 'THU', to_date('18-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (289, '17:00', 'THU', to_date('18-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (290, '20:00', 'THU', to_date('18-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (291, '23:00', 'THU', to_date('18-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (292, '14:00', 'FRI', to_date('19-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (293, '17:00', 'FRI', to_date('19-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (294, '20:00', 'FRI', to_date('19-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (295, '23:00', 'FRI', to_date('19-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (296, '14:00', 'SAT', to_date('20-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (297, '17:00', 'SAT', to_date('20-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (298, '20:00', 'SAT', to_date('20-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (299, '23:00', 'SAT', to_date('20-07-2024', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into DATES (dateid, hourh, dayd, dated)
values (300, '14:00', 'SUN', to_date('21-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (301, '17:00', 'SUN', to_date('21-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (302, '20:00', 'SUN', to_date('21-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (303, '23:00', 'SUN', to_date('21-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (304, '14:00', 'MON', to_date('22-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (305, '17:00', 'MON', to_date('22-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (306, '20:00', 'MON', to_date('22-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (307, '23:00', 'MON', to_date('22-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (308, '14:00', 'TUE', to_date('23-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (309, '17:00', 'TUE', to_date('23-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (310, '20:00', 'TUE', to_date('23-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (311, '23:00', 'TUE', to_date('23-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (312, '14:00', 'WED', to_date('24-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (313, '17:00', 'WED', to_date('24-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (314, '20:00', 'WED', to_date('24-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (315, '23:00', 'WED', to_date('24-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (316, '14:00', 'THU', to_date('25-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (317, '17:00', 'THU', to_date('25-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (318, '20:00', 'THU', to_date('25-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (319, '23:00', 'THU', to_date('25-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (320, '14:00', 'FRI', to_date('26-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (321, '17:00', 'FRI', to_date('26-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (322, '20:00', 'FRI', to_date('26-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (323, '23:00', 'FRI', to_date('26-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (324, '14:00', 'SAT', to_date('27-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (325, '17:00', 'SAT', to_date('27-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (326, '20:00', 'SAT', to_date('27-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (327, '23:00', 'SAT', to_date('27-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (328, '14:00', 'SUN', to_date('28-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (329, '17:00', 'SUN', to_date('28-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (330, '20:00', 'SUN', to_date('28-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (331, '23:00', 'SUN', to_date('28-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (332, '14:00', 'MON', to_date('29-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (333, '17:00', 'MON', to_date('29-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (334, '20:00', 'MON', to_date('29-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (335, '23:00', 'MON', to_date('29-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (336, '14:00', 'TUE', to_date('30-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (337, '17:00', 'TUE', to_date('30-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (338, '20:00', 'TUE', to_date('30-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (339, '23:00', 'TUE', to_date('30-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (340, '14:00', 'WED', to_date('31-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (341, '17:00', 'WED', to_date('31-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (342, '20:00', 'WED', to_date('31-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (343, '23:00', 'WED', to_date('31-07-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (344, '14:00', 'THU', to_date('01-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (345, '17:00', 'THU', to_date('01-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (346, '20:00', 'THU', to_date('01-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (347, '23:00', 'THU', to_date('01-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (348, '14:00', 'FRI', to_date('02-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (349, '17:00', 'FRI', to_date('02-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (350, '20:00', 'FRI', to_date('02-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (351, '23:00', 'FRI', to_date('02-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (352, '14:00', 'SAT', to_date('03-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (353, '17:00', 'SAT', to_date('03-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (354, '20:00', 'SAT', to_date('03-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (355, '23:00', 'SAT', to_date('03-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (356, '14:00', 'SUN', to_date('04-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (357, '17:00', 'SUN', to_date('04-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (358, '20:00', 'SUN', to_date('04-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (359, '23:00', 'SUN', to_date('04-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (360, '14:00', 'MON', to_date('05-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (361, '17:00', 'MON', to_date('05-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (362, '20:00', 'MON', to_date('05-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (363, '23:00', 'MON', to_date('05-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (364, '14:00', 'TUE', to_date('06-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (365, '17:00', 'TUE', to_date('06-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (366, '20:00', 'TUE', to_date('06-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (367, '23:00', 'TUE', to_date('06-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (368, '14:00', 'WED', to_date('07-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (369, '17:00', 'WED', to_date('07-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (370, '20:00', 'WED', to_date('07-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (371, '23:00', 'WED', to_date('07-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (372, '14:00', 'THU', to_date('08-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (373, '17:00', 'THU', to_date('08-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (374, '20:00', 'THU', to_date('08-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (375, '23:00', 'THU', to_date('08-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (376, '14:00', 'FRI', to_date('09-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (377, '17:00', 'FRI', to_date('09-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (378, '20:00', 'FRI', to_date('09-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (379, '23:00', 'FRI', to_date('09-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (380, '14:00', 'SAT', to_date('10-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (381, '17:00', 'SAT', to_date('10-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (382, '20:00', 'SAT', to_date('10-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (383, '23:00', 'SAT', to_date('10-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (384, '14:00', 'SUN', to_date('11-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (385, '17:00', 'SUN', to_date('11-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (386, '20:00', 'SUN', to_date('11-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (387, '23:00', 'SUN', to_date('11-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (388, '14:00', 'MON', to_date('12-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (389, '17:00', 'MON', to_date('12-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (390, '20:00', 'MON', to_date('12-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (391, '23:00', 'MON', to_date('12-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (392, '14:00', 'TUE', to_date('13-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (393, '17:00', 'TUE', to_date('13-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (394, '20:00', 'TUE', to_date('13-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (395, '23:00', 'TUE', to_date('13-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (396, '14:00', 'WED', to_date('14-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (397, '17:00', 'WED', to_date('14-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (398, '20:00', 'WED', to_date('14-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (399, '23:00', 'WED', to_date('14-08-2024', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into DATES (dateid, hourh, dayd, dated)
values (400, '14:00', 'THU', to_date('15-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (401, '17:00', 'THU', to_date('15-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (402, '20:00', 'THU', to_date('15-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (403, '23:00', 'THU', to_date('15-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (404, '14:00', 'FRI', to_date('16-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (405, '17:00', 'FRI', to_date('16-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (406, '20:00', 'FRI', to_date('16-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (407, '23:00', 'FRI', to_date('16-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (408, '14:00', 'SAT', to_date('17-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (409, '17:00', 'SAT', to_date('17-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (410, '20:00', 'SAT', to_date('17-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (411, '23:00', 'SAT', to_date('17-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (412, '14:00', 'SUN', to_date('18-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (413, '17:00', 'SUN', to_date('18-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (414, '20:00', 'SUN', to_date('18-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (415, '23:00', 'SUN', to_date('18-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (416, '14:00', 'MON', to_date('19-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (417, '17:00', 'MON', to_date('19-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (418, '20:00', 'MON', to_date('19-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (419, '23:00', 'MON', to_date('19-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (420, '14:00', 'TUE', to_date('20-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (421, '17:00', 'TUE', to_date('20-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (422, '20:00', 'TUE', to_date('20-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (423, '23:00', 'TUE', to_date('20-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (424, '14:00', 'WED', to_date('21-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (425, '17:00', 'WED', to_date('21-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (426, '20:00', 'WED', to_date('21-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (427, '23:00', 'WED', to_date('21-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (428, '14:00', 'THU', to_date('22-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (429, '17:00', 'THU', to_date('22-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (430, '20:00', 'THU', to_date('22-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (431, '23:00', 'THU', to_date('22-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (432, '14:00', 'FRI', to_date('23-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (433, '17:00', 'FRI', to_date('23-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (434, '20:00', 'FRI', to_date('23-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (435, '23:00', 'FRI', to_date('23-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (436, '14:00', 'SAT', to_date('24-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (437, '17:00', 'SAT', to_date('24-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (438, '20:00', 'SAT', to_date('24-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (439, '23:00', 'SAT', to_date('24-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (440, '14:00', 'SUN', to_date('25-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (441, '17:00', 'SUN', to_date('25-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (442, '20:00', 'SUN', to_date('25-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (443, '23:00', 'SUN', to_date('25-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (444, '14:00', 'MON', to_date('26-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (445, '17:00', 'MON', to_date('26-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (446, '20:00', 'MON', to_date('26-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (447, '23:00', 'MON', to_date('26-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (448, '14:00', 'TUE', to_date('27-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (449, '17:00', 'TUE', to_date('27-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (450, '20:00', 'TUE', to_date('27-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (451, '23:00', 'TUE', to_date('27-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (452, '14:00', 'WED', to_date('28-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (453, '17:00', 'WED', to_date('28-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (454, '20:00', 'WED', to_date('28-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (455, '23:00', 'WED', to_date('28-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (456, '14:00', 'THU', to_date('29-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (457, '17:00', 'THU', to_date('29-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (458, '20:00', 'THU', to_date('29-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (459, '23:00', 'THU', to_date('29-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (460, '14:00', 'FRI', to_date('30-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (461, '17:00', 'FRI', to_date('30-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (462, '20:00', 'FRI', to_date('30-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (463, '23:00', 'FRI', to_date('30-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (464, '14:00', 'SAT', to_date('31-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (465, '17:00', 'SAT', to_date('31-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (466, '20:00', 'SAT', to_date('31-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (467, '23:00', 'SAT', to_date('31-08-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (468, '14:00', 'SUN', to_date('01-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (469, '17:00', 'SUN', to_date('01-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (470, '20:00', 'SUN', to_date('01-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (471, '23:00', 'SUN', to_date('01-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (472, '14:00', 'MON', to_date('02-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (473, '17:00', 'MON', to_date('02-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (474, '20:00', 'MON', to_date('02-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (475, '23:00', 'MON', to_date('02-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (476, '14:00', 'TUE', to_date('03-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (477, '17:00', 'TUE', to_date('03-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (478, '20:00', 'TUE', to_date('03-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (479, '23:00', 'TUE', to_date('03-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (480, '14:00', 'WED', to_date('04-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (481, '17:00', 'WED', to_date('04-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (482, '20:00', 'WED', to_date('04-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (483, '23:00', 'WED', to_date('04-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (484, '14:00', 'THU', to_date('05-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (485, '17:00', 'THU', to_date('05-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (486, '20:00', 'THU', to_date('05-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (487, '23:00', 'THU', to_date('05-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (488, '14:00', 'FRI', to_date('06-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (489, '17:00', 'FRI', to_date('06-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (490, '20:00', 'FRI', to_date('06-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (491, '23:00', 'FRI', to_date('06-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (492, '14:00', 'SAT', to_date('07-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (493, '17:00', 'SAT', to_date('07-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (494, '20:00', 'SAT', to_date('07-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (495, '23:00', 'SAT', to_date('07-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (496, '14:00', 'SUN', to_date('08-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (497, '17:00', 'SUN', to_date('08-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (498, '20:00', 'SUN', to_date('08-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (499, '23:00', 'SUN', to_date('08-09-2024', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into DATES (dateid, hourh, dayd, dated)
values (500, '14:00', 'MON', to_date('09-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (501, '17:00', 'MON', to_date('09-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (502, '20:00', 'MON', to_date('09-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (503, '23:00', 'MON', to_date('09-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (504, '14:00', 'TUE', to_date('10-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (505, '17:00', 'TUE', to_date('10-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (506, '20:00', 'TUE', to_date('10-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (507, '23:00', 'TUE', to_date('10-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (508, '14:00', 'WED', to_date('11-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (509, '17:00', 'WED', to_date('11-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (510, '20:00', 'WED', to_date('11-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (511, '23:00', 'WED', to_date('11-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (512, '14:00', 'THU', to_date('12-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (513, '17:00', 'THU', to_date('12-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (514, '20:00', 'THU', to_date('12-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (515, '23:00', 'THU', to_date('12-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (516, '14:00', 'FRI', to_date('13-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (517, '17:00', 'FRI', to_date('13-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (518, '20:00', 'FRI', to_date('13-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (519, '23:00', 'FRI', to_date('13-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (520, '14:00', 'SAT', to_date('14-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (521, '17:00', 'SAT', to_date('14-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (522, '20:00', 'SAT', to_date('14-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (523, '23:00', 'SAT', to_date('14-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (524, '14:00', 'SUN', to_date('15-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (525, '17:00', 'SUN', to_date('15-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (526, '20:00', 'SUN', to_date('15-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (527, '23:00', 'SUN', to_date('15-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (528, '14:00', 'MON', to_date('16-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (529, '17:00', 'MON', to_date('16-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (530, '20:00', 'MON', to_date('16-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (531, '23:00', 'MON', to_date('16-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (532, '14:00', 'TUE', to_date('17-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (533, '17:00', 'TUE', to_date('17-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (534, '20:00', 'TUE', to_date('17-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (535, '23:00', 'TUE', to_date('17-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (536, '14:00', 'WED', to_date('18-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (537, '17:00', 'WED', to_date('18-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (538, '20:00', 'WED', to_date('18-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (539, '23:00', 'WED', to_date('18-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (540, '14:00', 'THU', to_date('19-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (541, '17:00', 'THU', to_date('19-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (542, '20:00', 'THU', to_date('19-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (543, '23:00', 'THU', to_date('19-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (544, '14:00', 'FRI', to_date('20-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (545, '17:00', 'FRI', to_date('20-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (546, '20:00', 'FRI', to_date('20-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (547, '23:00', 'FRI', to_date('20-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (548, '14:00', 'SAT', to_date('21-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (549, '17:00', 'SAT', to_date('21-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (550, '20:00', 'SAT', to_date('21-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (551, '23:00', 'SAT', to_date('21-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (552, '14:00', 'SUN', to_date('22-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (553, '17:00', 'SUN', to_date('22-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (554, '20:00', 'SUN', to_date('22-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (555, '23:00', 'SUN', to_date('22-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (556, '14:00', 'MON', to_date('23-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (557, '17:00', 'MON', to_date('23-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (558, '20:00', 'MON', to_date('23-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (559, '23:00', 'MON', to_date('23-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (560, '14:00', 'TUE', to_date('24-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (561, '17:00', 'TUE', to_date('24-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (562, '20:00', 'TUE', to_date('24-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (563, '23:00', 'TUE', to_date('24-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (564, '14:00', 'WED', to_date('25-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (565, '17:00', 'WED', to_date('25-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (566, '20:00', 'WED', to_date('25-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (567, '23:00', 'WED', to_date('25-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (568, '14:00', 'THU', to_date('26-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (569, '17:00', 'THU', to_date('26-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (570, '20:00', 'THU', to_date('26-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (571, '23:00', 'THU', to_date('26-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (572, '14:00', 'FRI', to_date('27-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (573, '17:00', 'FRI', to_date('27-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (574, '20:00', 'FRI', to_date('27-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (575, '23:00', 'FRI', to_date('27-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (576, '14:00', 'SAT', to_date('28-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (577, '17:00', 'SAT', to_date('28-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (578, '20:00', 'SAT', to_date('28-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (579, '23:00', 'SAT', to_date('28-09-2024', 'dd-mm-yyyy'));
insert into DATES (dateid, hourh, dayd, dated)
values (1, '12:00', 'Monday', to_date('10-07-2023', 'dd-mm-yyyy'));
commit;
prompt 481 records loaded
prompt Loading DATES1...
insert into DATES1 (dateid, hourh, dayd, dated)
values (1, '12:00', 'Monday', to_date('10-07-2023', 'dd-mm-yyyy'));
commit;
prompt 1 records loaded
prompt Loading MEALORTICKET...
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (774, 'steak', 52, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (519, 'kebab-skewer', 86, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (487, 'salad', 112, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (446, 'Meatballs', 32, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (173, 'Dumplings', 37, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (970, 'water', 34, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (643, 'beer', 88, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (636, 'entrecote-skewer', 20, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (364, 'chicken-skewer', 132, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (243, 'PatatasBravas', 18, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (997, 'Shakshuka', 128, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (908, 'Poutine', 144, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (369, 'BakedBeans', 120, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (816, 'FishCurry', 75, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (982, 'PolloAsado', 112, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (381, 'Sukiyaki', 21, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (412, 'TunaMelt', 39, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (357, 'Kebab', 16, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (232, 'Cornbread', 95, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (397, 'Mole', 142, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (780, 'ChowMein', 37, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (116, 'Paella', 36, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (450, 'EggRoll', 124, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (262, 'Vichyssoise', 86, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (375, 'Goulash', 114, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (893, 'PekingDuck', 91, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (463, 'Quesadilla', 107, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (254, 'StuffedPeppers', 144, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (699, 'LambChops', 91, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (926, 'TarteTatin', 134, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (691, 'Pasta', 92, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (246, 'HushPuppies', 67, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (740, 'Steak', 105, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (471, 'Enchiladas', 94, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (239, 'PulledPork', 99, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (999, 'Ratatouille', 118, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (761, 'Moussaka', 106, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (520, 'Macaroni', 44, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (600, 'CrabCakes', 69, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (121, 'VeggieBurger', 33, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (581, 'Tiramisu', 62, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (284, 'Laksa', 25, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (832, 'Spanakopita', 108, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (741, 'Ceviche', 35, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (347, 'BabaGanoush', 62, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (183, 'RedBeans', 135, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (155, 'MakiRoll', 54, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (145, 'FishandChips', 48, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (585, 'Empanadas', 36, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (620, 'Bruschetta', 99, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (442, 'PotRoast', 29, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (967, 'ZucchiniBread', 72, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (537, 'Pancakes', 101, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (123, 'Lobster', 20, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (885, 'GrilledCheese', 91, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (263, 'NasiGoreng', 90, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (853, 'TurkeySandwich', 56, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (489, 'FriedRice', 57, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (327, 'EggsBenedict', 117, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (215, 'Tapas', 84, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (795, 'Fajitas', 57, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (542, 'ShepherdsPie', 105, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (941, 'Gazpacho', 125, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (478, 'Kimchi', 99, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (653, 'HotDog', 103, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (513, 'MashedPotatoes', 64, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (843, 'Shawarma', 122, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (287, 'Pizza', 76, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (532, 'Ravioli', 68, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (673, 'SloppyJoes', 143, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (801, 'Quiche', 103, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (481, 'BeefStew', 55, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (409, 'Spaghetti', 76, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (165, 'FishTacos', 17, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (365, 'Carbonara', 38, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (841, 'Roti', 131, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (135, 'Tempura', 52, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (339, 'ChickenWings', 97, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (233, 'Nachos', 50, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (230, 'TortillaSoup', 135, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (370, 'SurfandTurf', 149, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (659, 'ScotchEgg', 142, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (719, 'Gumbo', 136, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (823, 'Oysters', 31, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (839, 'PadThai', 88, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (448, 'Falafel', 63, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (783, 'Gnocchi', 75, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (639, 'CoqauVin', 98, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (578, 'Bibimbap', 140, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (289, 'TunaSalad', 15, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (281, 'Jambalaya', 136, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (577, 'Ramen', 73, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (477, 'ChickenParm', 126, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (698, 'JalapenoPoppers', 88, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (616, 'Bangers', 73, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (170, 'Biryani', 69, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (680, 'Pho', 50, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (633, 'Sushi', 128, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (886, 'Pastrami', 22, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (686, 'Lasagna', 112, null, null, null, null);
commit;
prompt 100 records committed...
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (502, 'Chili', 120, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (879, 'StuffedCabbage', 118, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (922, 'Frittata', 102, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (443, 'Souvlaki', 54, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (541, 'TeriyakiChicken', 106, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (249, 'Pierogi', 93, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (181, 'Chowder', 148, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (786, 'Tagine', 98, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (964, 'DimSum', 17, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (645, 'ShrimpCocktail', 92, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (584, 'TomYum', 129, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (352, 'Chimichanga', 138, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (905, 'Tacos', 55, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (423, 'Onigiri', 29, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (296, 'ChiliDog', 64, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (777, 'Curry', 144, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (603, 'HuevosRancheros', 49, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (946, 'FrenchToast', 119, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (415, 'Polenta', 21, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (383, 'Omelette', 77, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (571, 'Sandwich', 37, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (379, 'WaldorfSalad', 46, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (583, 'Gravlax', 50, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (119, 'Calzone', 85, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (661, 'WontonSoup', 23, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (914, 'Vindaloo', 17, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (587, 'Crepes', 67, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (591, 'Satay', 137, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (694, 'Arancini', 53, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (193, 'Porchetta', 25, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (146, 'Burrito', 28, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (815, 'Cassoulet', 16, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (247, 'Salmon', 31, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (610, 'TandooriChicken', 113, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (188, 'chicken', 129, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (869, 'Schnitzel1', 70, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (216, 'salad1', 38, null, null, null, null);
insert into MEALORTICKET (mealid, mealname, mealprice, genre, rating, duration, releasedate)
values (453, 'kebab-skewer1', 124, null, null, null, null);
commit;
prompt 138 records loaded
prompt Loading PROVIDERS...
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jared-Van Damme', '016-8937361', 698565984);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Natalie-Rea', '019-4609999', 334758265);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hex-England', '012-3297553', 306209431);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kurt-Osbourne', '024-5989786', 785361286);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jodie-Drive', '017-4831243', 283021573);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Rosco-Bonham', '064-6906043', 333562068);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Parker-Taylor', '093-4653485', 276997485);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Roger-Irons', '048-1797387', 771233246);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mae-Perrineau', '069-6624274', 341805163);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Norm-Reubens', '091-3969652', 194731713);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Betty-Kinski', '041-9548641', 826764568);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lauren-Sutherland', '047-4006578', 743232436);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Rick-Whitford', '062-7526843', 133539453);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Spencer-Hudson', '070-4579849', 939506375);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Vince-Lucien', '047-2802517', 735700829);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jimmie-Eldard', '064-9873504', 962895138);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jeffery-Makowicz', '030-3173687', 493605634);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Pablo-Mellencamp', '019-9061780', 907325234);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Leelee-Blossoms', '096-5345751', 954152262);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bridgette-Hanley', '012-9156108', 460017316);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Claire-Trevino', '080-7072572', 614037050);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Treat-Judd', '090-5844330', 645747180);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ethan-Willard', '035-2884952', 212809504);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Clarence-Gilliam', '027-3349696', 372661128);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gina-Downie', '055-7867200', 397197584);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bruce-Heald', '023-4172255', 988738574);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Fred-Sizemore', '091-4090084', 283070253);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Udo-Bates', '027-9618695', 524140607);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jet-Conlee', '089-4386585', 813800320);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Collin-Laws', '041-2833938', 253884620);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Samuel-Bassett', '061-5387767', 984797511);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Dave-Baldwin', '096-3730125', 167542053);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Wayne-Jolie', '093-7786433', 251377600);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jamie-Depp', '086-1432544', 266857680);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Fionnula-Beals', '046-6110467', 816473662);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nelly-Nicks', '030-7405499', 717223607);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kenneth-Rickles', '084-8976989', 172646903);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Linda-Tate', '036-2950590', 921475866);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Sal-Doucette', '016-6640493', 638305947);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Phil-Weaving', '070-3285551', 508960643);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Sylvester-Clayton', '071-9531780', 736550347);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Pierce-Taha', '069-3024569', 539240805);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Madeline-Ali', '039-4409880', 949949984);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Vonda-McGill', '059-2924489', 297070338);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Sissy-May', '016-3160595', 145856680);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Crystal-Rea', '043-8012984', 847799007);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Swoosie-Lauper', '030-4839525', 415629125);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Rupert-Neill', '057-8785978', 196848740);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lenny-Pitney', '070-1496709', 151881338);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mary Beth-Evett', '022-1718901', 508882403);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Viggo-Meyer', '015-4300875', 844982984);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Meryl-Bright', '047-4546417', 113986994);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lauren-Vicious', '028-4614997', 813546770);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Domingo-Nash', '080-5072561', 459616941);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Derek-Winwood', '050-2183535', 949089568);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hilary-Mifune', '050-3566621', 813744527);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mary-Louise-Frakes', '038-5586518', 719116382);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jake-Saxon', '039-1968513', 997754790);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Brittany-Weston', '069-3596544', 524438806);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Cesar-McCracken', '096-9837455', 338212494);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Famke-Numan', '042-5041771', 434490977);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Josh-Beck', '059-4451705', 985830155);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Merrill-Berkeley', '065-3120003', 495413012);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Fats-Peet', '071-5704991', 257778631);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Martha-Davis', '016-5048193', 941956584);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jack-Griggs', '047-8224751', 882572038);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Shelby-Bruce', '040-4468162', 468052081);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Pam-Kirshner', '014-2902946', 909571259);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Charlie-Perlman', '053-7163000', 611050344);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Dorry-Mortensen', '081-9448604', 865462832);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('First-Emmerich', '095-8702853', 114547847);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kid-Owen', '025-8975756', 553438019);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Roscoe-Franks', '088-6189158', 687655564);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Heather-Hampton', '033-7142191', 641664970);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Chubby-Prinze', '028-3636159', 263467600);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Alana-Davis', '055-3397821', 264903771);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Derek-Guzman', '040-8940026', 176325932);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Coley-Diffie', '026-6597665', 655648964);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gena-Goodman', '034-7061206', 681817899);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ethan-England', '034-2138937', 606774327);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Larnelle-Hynde', '039-2873802', 324172239);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nina-James', '017-5894619', 179633941);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Queen-Arden', '042-5338865', 646170863);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Geena-O''Neal', '012-7203683', 343274904);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Vertical-Cage', '042-6125529', 914644930);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Emmylou-Torn', '036-3152152', 439618464);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Elvis-Foster', '043-4423682', 622297427);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Harriet-Jay', '031-4339211', 571723304);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Miko-Busey', '069-3797788', 135101377);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Chazz-Vincent', '022-2157663', 707557173);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Rik-Luongo', '042-3745712', 928307527);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Glen-Reynolds', '060-5439220', 980071145);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jeroen-Shue', '042-4260062', 226491211);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Pamela-Keaton', '029-5122385', 401349942);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Forest-Ness', '095-7809374', 589630570);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Heath-Tucker', '025-9949661', 938646482);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kimberly-Winwood', '068-6984576', 901270818);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Andrea-Gagnon', '062-1313657', 900976859);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Dorry-Coburn', '084-5925977', 705280627);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Meg-Logue', '043-1803960', 578875597);
commit;
prompt 100 records committed...
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Garland-Rodgers', '098-4557462', 960102555);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Chet-Bragg', '011-6980596', 122445708);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Donald-Leachman', '071-3829933', 867073011);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Chazz-Carrington', '053-2859974', 789539508);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Burt-Peet', '026-1504178', 315672029);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Chanté-Gosdin', '035-9767614', 668996395);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Blair-Blanchett', '064-6484204', 506792244);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Garry-Imperioli', '055-1588685', 394454089);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Rutger-Adler', '012-8123599', 187512313);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kathleen-Morrison', '050-1921347', 156784545);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Juliana-Ball', '067-4713872', 379644754);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Dan-Keith', '017-4653519', 553240475);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Laurence-Hawkins', '076-5303014', 342835109);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Campbell-Bean', '070-4374307', 978933148);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Eileen-Soul', '098-2751172', 503440727);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ryan-Visnjic', '096-7908069', 871296842);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Debby-Hughes', '054-2952910', 480591079);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jonny Lee-Rea', '066-3788616', 549618935);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Luis-Pierce', '016-1553092', 872949575);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Delroy-Reed', '089-5562215', 371749369);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Talvin-Russo', '068-5811556', 633759339);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Harold-Kinnear', '087-2420911', 625415687);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mary-Louise-McDowell', '050-6085983', 824429022);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nancy-Kadison', '043-7377765', 704382357);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jerry-Guzman', '062-4813812', 131532793);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Katrin-Speaks', '077-9558434', 745561170);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ronnie-Paquin', '048-2549413', 258661124);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Miko-Brickell', '024-9310273', 299880849);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Freddy-Ripley', '025-7774185', 218621516);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Micky-Guinness', '059-9942971', 610592110);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jodie-Brock', '061-4844806', 819717459);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Fionnula-Myles', '027-7458149', 399941308);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Daryle-Potter', '042-9800781', 540007528);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gena-Thomson', '095-9043744', 885458349);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hugo-Guilfoyle', '078-5149988', 904453488);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gaby-Blanchett', '028-5180174', 560472573);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jena-Magnuson', '043-1634609', 366150958);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Carla-MacIsaac', '025-8373711', 135449490);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Woody-Chandler', '040-3460743', 822176520);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Victor-Stone', '060-9909189', 558442646);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Geoff-Newman', '043-9664223', 544758706);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bobby-Tsettos', '027-6265932', 936600715);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Miko-Tinsley', '049-8738278', 868376185);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bradley-Coolidge', '075-9523084', 966260205);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Clint-Kirkwood', '085-3587947', 609671163);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Viggo-Chilton', '016-6193339', 202244433);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Miguel-Sainte-Marie', '075-4301468', 187517400);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Quentin-Davies', '067-9245297', 213135275);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gran-Spector', '091-7695882', 810755875);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Yolanda-Huston', '023-8048577', 322929987);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Timothy-Rodgers', '014-5658354', 966562504);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ned-McKean', '075-7824826', 397307967);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Pierce-Douglas', '029-7299481', 384252594);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Michelle-Palmieri', '070-4467241', 605822521);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Chaka-Rispoli', '064-3415751', 500889229);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Melba-MacLachlan', '057-7301310', 557478597);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Leonardo-Jane', '035-8503149', 494125272);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Malcolm-Oldman', '033-6500086', 721914358);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Elias-Kadison', '083-3905874', 118715610);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Judd-Ferry', '095-1771852', 778439197);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bill-Spine', '050-7290066', 941643229);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mitchell-Skarsgard', '089-9606398', 980493310);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Frank-Tinsley', '096-9057765', 616809625);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kathy-Berkley', '079-8354012', 728128634);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Colm-Everett', '072-8338923', 407080369);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lydia-Linney', '083-8718561', 472534609);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Angela-Cook', '025-1485716', 304705770);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Giancarlo-Isaacs', '092-1317216', 445555791);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jeremy-Warden', '012-5099331', 431865787);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Steven-D''Onofrio', '038-4461133', 569127554);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Shirley-O''Connor', '047-2989171', 421317475);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Greg-Bruce', '049-3688109', 754590797);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Brad-Witherspoon', '025-3764806', 238407991);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Casey-Keener', '014-7052210', 149936885);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Davis-Pacino', '069-1325178', 687834239);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Martin-Bugnon', '056-6190990', 900846538);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Juliet-Stiers', '087-7115538', 818148283);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jack-Suchet', '076-2192644', 270032207);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Temuera-Olin', '017-4558980', 871903488);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lin-Dunaway', '070-7828864', 119983778);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Machine-Hershey', '099-9758740', 496176647);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Robbie-Brooke', '039-5470879', 640085474);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Marianne-Baldwin', '033-4520502', 460319375);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Chris-Fierstein', '021-3521791', 290217673);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lonnie-Costner', '019-5183220', 847410135);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bonnie-Hanley', '065-5144528', 739380973);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Denny-Guinness', '072-6450076', 315218529);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Brittany-Shorter', '092-4219188', 821803441);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Powers-Reno', '036-7267092', 283778196);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Campbell-Nugent', '049-4270909', 825526695);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Rosario-Nugent', '090-8583403', 633227189);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gary-Francis', '040-8236091', 269612325);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gord-Seagal', '066-2210822', 854081615);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Karen-Clayton', '059-2047645', 993644869);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jodie-Randal', '020-4314636', 415893063);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Thelma-Macy', '068-4785603', 710464487);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Rueben-Deejay', '026-6867850', 687080625);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kurt-D''Onofrio', '089-5335559', 215597231);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Amanda-Clark', '038-1798708', 326401907);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Christine-Harry', '032-4013070', 482441073);
commit;
prompt 200 records committed...
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nicky-Patrick', '061-2778336', 730589955);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Laurie-Garza', '094-3558308', 178689441);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Al-Woodward', '016-4742882', 363134381);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Grant-O''Hara', '071-1170888', 216731006);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Clea-Davidtz', '081-6322699', 439358607);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Brendan-Webb', '036-2395415', 298854686);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mae-Kennedy', '036-7026440', 891729855);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Luis-Moriarty', '031-7017263', 203679161);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Aidan-Adkins', '043-4300499', 842289906);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mary-Isaacs', '067-9463149', 727760877);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Sean-Hutton', '033-2676269', 688434927);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mekhi-Eckhart', '099-3188936', 245813707);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Harriet-Bratt', '029-2018004', 752890719);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Maria-Peniston', '081-9622145', 173285917);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lena-Tippe', '019-6059456', 980847791);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Meryl-Goldblum', '049-3520083', 928408174);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nelly-Atkins', '089-6523322', 553505400);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Eric-Worrell', '067-5328422', 463916564);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Buddy-Geldof', '080-8265131', 694391748);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Glenn-Berry', '031-4501840', 127022688);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nicholas-Lattimore', '016-9850218', 650556669);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Harry-Van Der Beek', '066-4111138', 676515368);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nile-Gary', '042-2314420', 335073464);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Roger-Neil', '066-1410238', 127024366);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Carrie-Anne-Jolie', '029-3798389', 586904556);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lea-Senior', '091-6371530', 313566754);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hilary-Studi', '084-7615204', 161303711);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Buddy-Englund', '066-8852531', 952309108);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Terri-Frost', '015-6666859', 575212290);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Juice-Coyote', '065-4475250', 127124513);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ronny-Head', '019-8522773', 742002836);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hilton-D''Onofrio', '081-8926374', 167113660);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ralph-Gellar', '032-4579392', 327319121);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Olga-Dourif', '029-6332555', 964460672);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Angelina-Chappelle', '072-8534157', 887102065);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Clive-Austin', '062-1297413', 970362406);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gloria-Birch', '030-5596367', 943508991);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nikka-Hector', '086-9994115', 343749083);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gordie-Satriani', '035-3866152', 603218413);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Trini-Shepherd', '029-2834152', 401993318);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mykelti-McCain', '032-7029767', 736675025);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Rene-Camp', '014-9123563', 912561522);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Cate-Curtis', '025-2389228', 949503212);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Davy-Torres', '080-6661233', 814040859);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Fisher-Walken', '019-7489082', 977490975);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Tal-Zane', '041-4763445', 719731836);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Denzel-Osmond', '049-2778473', 890886467);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Roscoe-Johansson', '015-1603337', 870364714);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Greg-Withers', '011-1852554', 435589604);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hank-Ledger', '060-9922352', 342254815);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Fred-Dooley', '023-2075976', 357050380);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Anthony-Wells', '090-4103044', 783357690);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Quentin-Holly', '061-6247100', 480636906);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Yolanda-Tippe', '086-9066562', 797775342);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Dustin-Warwick', '087-4303570', 271020929);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nik-Jones', '068-3584876', 718188339);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Salma-Stevenson', '097-2342480', 951635491);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Elisabeth-Hauser', '071-5710648', 173223372);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Isaiah-Rhys-Davies', '065-4987029', 311266395);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kimberly-Tarantino', '077-8904405', 850689407);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jeanne-Graham', '068-3598580', 113901579);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Liquid-Fariq', '065-9079258', 677928089);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jean-Luc-Tankard', '086-8675055', 726747272);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Donald-McGoohan', '031-3521321', 231669908);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Carole-Dolenz', '023-3882492', 689826723);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kurtwood-Bandy', '023-8590080', 718433434);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Teena-Rosas', '094-5425282', 524362018);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jay-Nielsen', '029-1479794', 721539684);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Breckin-Rippy', '099-6649829', 171757581);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Vienna-Carrack', '036-4907989', 147792820);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bernard-Matheson', '053-3340624', 570455296);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ralph-Leguizamo', '035-7390572', 259135362);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Trace-Matheson', '075-6218055', 736438189);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bobby-Epps', '067-8542591', 842120773);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Davis-Diaz', '048-3128197', 814722057);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jody-Fender', '053-5831475', 839747699);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Denise-Armatrading', '036-8215160', 524903629);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Temuera-Milsap', '088-8072511', 979401531);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nina-Lightfoot', '061-7319696', 622618564);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Yolanda-Lee', '044-1138524', 799572536);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Robbie-Atlas', '071-9620352', 273936185);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Walter-LaSalle', '022-1190857', 284443469);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Nikki-Garber', '033-7903228', 757947028);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Drew-Costello', '019-6337686', 781585360);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Alan-Rankin', '047-3257868', 840750679);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Saul-Gellar', '074-6210749', 837201582);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Sandra-Gore', '011-5005497', 446169409);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Teri-Numan', '077-6633918', 535617265);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hookah-Hershey', '017-2716143', 273686744);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Candice-Loeb', '013-9447596', 708356913);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mili-von Sydow', '072-4818783', 949005940);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kay-Kidman', '042-5096390', 372076739);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Liam-Chappelle', '045-5886756', 192796929);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Moe-Francis', '063-1672539', 130486255);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jonny Lee-Lillard', '041-9411588', 636429487);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Marty-Colon', '029-2623213', 866539503);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Debi-Lewis', '024-4206515', 355330642);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Maureen-Flemyng', '068-1275979', 135377693);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Teri-Condition', '065-4395204', 542166846);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Burton-Torres', '045-6491252', 856873083);
commit;
prompt 300 records committed...
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Liv-Belles', '030-4685992', 503336147);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Cameron-Senior', '083-8446715', 476936417);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jeremy-Bloch', '077-5973945', 499929219);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Embeth-Clooney', '080-4018771', 219007204);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Michael-Damon', '041-7363409', 368380614);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Peter-Gryner', '057-5783384', 325791928);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ivan-Tomlin', '040-8906848', 846482955);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hugo-Woods', '082-8979828', 796350028);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Cornell-Harrison', '053-7489424', 486166007);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ming-Na-Witherspoon', '049-7421524', 999495522);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mel-Logue', '035-8019714', 899893908);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bryan-Mraz', '084-6187059', 857850215);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Corey-Thurman', '099-5081708', 473818580);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Edie-Cagle', '095-9870701', 436641380);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kathy-Hutton', '081-1461947', 754612075);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jane-Gooding', '084-4103986', 904149271);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Delbert-Day', '075-6710431', 533740870);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bobby-Flatts', '056-2200601', 456577944);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Vienna-Rucker', '044-1680401', 712840954);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Joy-Sirtis', '080-7570170', 641268611);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Carrie-Parker', '096-6597979', 614581755);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Leon-Whitman', '053-8770523', 957487341);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Burt-Cassidy', '097-2304692', 893858286);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Fairuza-Mars', '014-9389207', 941275791);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Neve-Leachman', '077-7449570', 770991223);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jeanne-Strathairn', '049-6585605', 761166200);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Candice-Berenger', '084-2471738', 229621528);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Amanda-Walken', '045-3974022', 831596578);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jody-Askew', '012-1431452', 263826538);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Cloris-DeVito', '060-6029791', 146174525);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Miki-Dutton', '078-5672874', 499435819);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Marty-Clinton', '076-1799450', 221306179);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Morgan-Curfman', '063-2824432', 275809793);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Natalie-Johansen', '034-8169972', 333241506);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Debbie-Yankovic', '088-1317982', 834240009);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Samantha-Winter', '062-7856553', 628288531);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Chad-Aiken', '098-3880544', 228747958);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Zooey-Tate', '025-7381316', 742372731);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Samantha-Reid', '093-1655518', 343288510);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Ving-Anderson', '075-9525345', 837819198);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jay-Burrows', '049-3188392', 132870992);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Trace-Gugino', '030-5821550', 396658773);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Debra-Paige', '077-4465115', 960451214);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Percy-Carlyle', '084-3727023', 645349663);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Meryl-Buffalo', '084-9186058', 287732448);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Talvin-Botti', '057-8504200', 292229624);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Davey-Berkeley', '067-3050527', 162909237);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hector-Bale', '081-6550165', 280715224);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Steven-Chan', '033-3682697', 543005915);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Brothers-Davis', '024-5498573', 220466058);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Charlize-Statham', '053-7282926', 770579834);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lonnie-Fiorentino', '021-8545322', 222099840);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Sandra-McCoy', '050-3583258', 660843959);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Bill-Lennix', '093-3339803', 639690177);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Leelee-Crewson', '018-6111208', 367937146);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Al-Colon', '070-9993576', 996980140);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jean-Emmett', '037-5677433', 877021786);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Dylan-Hauser', '024-9954525', 860224001);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Carole-Conners', '099-8622649', 445450999);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Marina-Bloch', '053-6010163', 122826376);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Colm-Herndon', '036-1576184', 202532294);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Seann-McIntosh', '061-4074390', 140038339);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Billy-Mortensen', '064-9626130', 913421542);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Peter-Pepper', '064-6899832', 451449216);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Wally-Zevon', '045-3212500', 896188069);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Joseph-Graham', '023-2331884', 510436386);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Donald-Heald', '064-3507933', 974320825);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Vondie-Stoltz', '017-3625055', 847547918);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Colm-Plowright', '086-3767507', 205452549);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Beth-Jordan', '048-1677316', 595660924);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Joy-Hughes', '092-3443436', 895307993);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Whoopi-Smurfit', '054-3803747', 798682119);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hex-Ferry', '013-5549695', 472722577);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Elias-Spiner', '061-3644768', 134758474);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Edwin-Schiff', '070-7492488', 333695863);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Chaka-Lerner', '084-8097611', 998333899);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Dustin-Torn', '092-8577281', 482062339);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Benjamin-Pierce', '034-9217005', 469589278);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Neneh-Griffith', '088-6439586', 645924449);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Hank-Rippy', '055-3518888', 832615684);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Cledus-Esposito', '038-6947017', 476944253);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lloyd-Sedaka', '028-8594900', 707316445);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Andy-Minogue', '079-6017716', 166152543);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Leelee-Beckham', '068-7961069', 145623975);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Roddy-Driver', '065-6739471', 168441240);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Collin-Bassett', '073-1288032', 154596497);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Malcolm-Bruce', '041-2821445', 996134015);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mili-Rauhofer', '042-6925774', 436216694);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Lennie-Francis', '072-1432973', 386648168);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Gavin-Cage', '091-4165364', 954026843);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Rowan-Hong', '098-6548131', 736934395);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Corey-Van Shelton', '026-7862495', 861214139);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Noah-Beatty', '042-3020702', 583665791);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Scott-Quaid', '034-7327093', 631183546);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jimmie-Kennedy', '062-7872811', 593043285);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Miles-Rifkin', '022-4204507', 642245770);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Queen-Preston', '051-7025327', 618702745);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kitty-Costner', '059-8769907', 927249356);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Jim-Reubens', '065-6817889', 168327050);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Frances-Imbruglia', '024-7850970', 140131722);
commit;
prompt 400 records committed...
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Natalie-Stone', '049-3507505', 664648560);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Donna-Idle', '035-2417113', 861389149);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Caroline-Stanton', '014-2622650', 167015927);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Davy-Whitwam', '042-6349627', 544141090);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Kay-Clooney', '078-8083037', 361010243);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Mekhi-Craig', '096-9550647', 118445788);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Eddie-Torn', '015-7774111', 279495735);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Laurence-Summer', '014-9308520', 672678413);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Wang-Woodard', '093-1826064', 863517926);
insert into PROVIDERS (provname, provphonenumber, provid)
values ('Edgar-Conroy', '060-9782547', 267364515);
commit;
prompt 410 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (372, 'chicken soup', 43, 25, 618702745);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (250, 'ketchup', 15, 76, 796350028);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (484, 'salt', 24, 41, 676515368);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (67, 'pickles', 146, 37, 957487341);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (723, 'hummus', 21, 68, 251377600);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (291, 'tomato', 24, 51, 367937146);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (740, 'chicken-breast', 7, 35, 847547918);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (880, 'cucumber', 72, 86, 524362018);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (53, 'steak', 20, 11, 837201582);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (310, 'Sugar', 31, 100, 984797511);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (952, 'tahini', 8, 26, 524140607);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (548, 'shawarma', 5, 53, 797775342);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (149, 'eggplant', 76, 15, 221306179);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (244, 'eggs', 48, 83, 270032207);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (153, 'potatoes', 72, 63, 912561522);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (563, 'turmeric', 67, 54, 439618464);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (873, 'paprika', 78, 90, 871903488);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (199, 'black-pepper', 30, 95, 372661128);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (386, 'Chardal', 103, 91, 676515368);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (387, 'WATER', 103, 91, 676515368);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (388, 'juice', 36, 80, 283021573);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (389, 'vanile', 32, 105, 283021573);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (390, 'paprica', 93, 16, 283021573);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (293, 'water', 103, 91, 283021573);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (402, 'water-melon', 97, 23, 785361286);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (949, 'lemon', 55, 5, 785361286);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (366, 'coconut soup', 19, 40, 306209431);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (65, 'melon', 43, 89, 306209431);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (427, 'oil', 110, 46, 306209431);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (994, 'chiken-soup', 51, 53, 306209431);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (586, 'chawaige', 62, 46, 306209431);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (394, 'gold-spray', 62, 46, 333562068);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (631, 'color', 32, 26, 333562068);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (934, 'mashroums', 51, 53, 698565984);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (894, 'pampkins', 62, 46, 698565984);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (831, 'grass', 32, 26, 698565984);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (891, 'mashroums pouder', 32, 26, 334758265);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (921, 'egg', 73, -96, 781585360);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (887, 'eg6gs', 73, -96, 781585360);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (87, 'eg0gs', 73, -96, 781585360);
commit;
prompt 40 records loaded
prompt Loading INGREDIENTS...
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (16, 952, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (152, 67, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (34, 563, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (2, 952, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (188, 723, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (62, 153, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (131, 563, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (27, 880, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (26, 53, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (159, 548, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (153, 548, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (58, 740, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (77, 372, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (6, 67, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (47, 53, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (120, 310, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (146, 563, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (138, 291, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (179, 153, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (14, 548, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (62, 244, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (166, 199, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (110, 723, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (124, 880, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (166, 149, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (53, 53, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (151, 53, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (93, 149, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (85, 548, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (95, 952, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (79, 53, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (41, 880, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (74, 484, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (69, 291, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (34, 723, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (173, 740, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (129, 563, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (107, 250, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (190, 873, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (173, 740, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (40, 67, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (32, 873, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (133, 199, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (151, 250, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (169, 372, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (162, 53, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (8, 484, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (169, 250, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (105, 149, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (137, 548, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (105, 873, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (75, 952, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (63, 372, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (145, 149, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (29, 153, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (173, 244, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (23, 372, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (68, 291, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (109, 310, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (185, 880, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (94, 740, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (150, 880, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (172, 952, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (136, 67, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (82, 199, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (162, 723, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (188, 723, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (131, 880, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (166, 740, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (135, 873, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (195, 880, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (35, 484, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (101, 484, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (74, 199, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (63, 291, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (122, 310, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (97, 372, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (179, 291, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (132, 153, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (117, 149, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (31, 484, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (103, 548, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (194, 53, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (153, 199, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (103, 484, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (41, 153, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (34, 484, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (21, 740, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (79, 563, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (34, 723, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (123, 310, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (192, 67, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (121, 952, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (160, 880, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (127, 740, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (90, 740, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (177, 250, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (69, 153, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (92, 563, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (181, 291, 487);
commit;
prompt 100 records committed...
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (16, 952, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (99, 291, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (21, 199, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (161, 372, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (18, 244, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (115, 952, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (24, 53, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (166, 244, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (180, 372, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (9, 372, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (14, 153, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (136, 563, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (126, 149, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (65, 723, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (91, 563, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (40, 53, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (38, 873, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (134, 952, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (51, 873, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (87, 250, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (87, 67, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (142, 67, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (64, 149, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (14, 873, 446);
commit;
prompt 124 records loaded
prompt Loading THEATERS...
insert into THEATERS (theaterid, theatername, capacity)
values (100, 'Gladiolus', 242);
insert into THEATERS (theaterid, theatername, capacity)
values (101, 'Rose', 193);
insert into THEATERS (theaterid, theatername, capacity)
values (102, 'Tulip', 167);
insert into THEATERS (theaterid, theatername, capacity)
values (103, 'Lily', 251);
insert into THEATERS (theaterid, theatername, capacity)
values (104, 'Daisy', 263);
insert into THEATERS (theaterid, theatername, capacity)
values (105, 'Sunflower', 168);
insert into THEATERS (theaterid, theatername, capacity)
values (106, 'Marigold', 138);
insert into THEATERS (theaterid, theatername, capacity)
values (107, 'Orchid', 33);
insert into THEATERS (theaterid, theatername, capacity)
values (108, 'Lavender', 151);
insert into THEATERS (theaterid, theatername, capacity)
values (109, 'Poppy', 216);
insert into THEATERS (theaterid, theatername, capacity)
values (110, 'Peony', 148);
insert into THEATERS (theaterid, theatername, capacity)
values (111, 'Iris', 278);
insert into THEATERS (theaterid, theatername, capacity)
values (112, 'Chrysanthemum', 296);
insert into THEATERS (theaterid, theatername, capacity)
values (113, 'Daffodil', 172);
insert into THEATERS (theaterid, theatername, capacity)
values (114, 'Geranium', 188);
insert into THEATERS (theaterid, theatername, capacity)
values (115, 'Hibiscus', 57);
insert into THEATERS (theaterid, theatername, capacity)
values (116, 'Jasmine', 70);
insert into THEATERS (theaterid, theatername, capacity)
values (117, 'Lilac', 289);
insert into THEATERS (theaterid, theatername, capacity)
values (118, 'Magnolia', 162);
insert into THEATERS (theaterid, theatername, capacity)
values (119, 'Petunia', 199);
insert into THEATERS (theaterid, theatername, capacity)
values (120, 'Violet', 284);
insert into THEATERS (theaterid, theatername, capacity)
values (121, 'Begonia', 58);
insert into THEATERS (theaterid, theatername, capacity)
values (122, 'Carnation', 144);
insert into THEATERS (theaterid, theatername, capacity)
values (123, 'Camellia', 165);
insert into THEATERS (theaterid, theatername, capacity)
values (124, 'Azalea', 242);
insert into THEATERS (theaterid, theatername, capacity)
values (125, 'Buttercup', 51);
insert into THEATERS (theaterid, theatername, capacity)
values (126, 'Bluebell', 71);
insert into THEATERS (theaterid, theatername, capacity)
values (127, 'Crocus', 121);
insert into THEATERS (theaterid, theatername, capacity)
values (128, 'Dahlia', 260);
insert into THEATERS (theaterid, theatername, capacity)
values (129, 'Foxglove', 99);
insert into THEATERS (theaterid, theatername, capacity)
values (130, 'Gardenia', 94);
insert into THEATERS (theaterid, theatername, capacity)
values (1, 'Main Theater', 150);
commit;
prompt 32 records loaded
prompt Loading MOVIES...
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (100, 'Crash', 'Musical', 'Ulrike Do Rosario', to_date('24-07-2019', 'dd-mm-yyyy'), 102, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (101, 'Notorious', 'Animation', 'Chanda Stirland', to_date('15-02-2017', 'dd-mm-yyyy'), 107, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (102, 'Giant', 'Biography', 'Dwight Lopez', to_date('02-02-2014', 'dd-mm-yyyy'), 108, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (103, 'Moana', 'Comedy', 'Grannie Brosnan', to_date('11-03-2007', 'dd-mm-yyyy'), 148, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (104, 'Deadpool', 'Fantasy', 'Lenard Pothergill', to_date('20-01-2002', 'dd-mm-yyyy'), 124, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (105, 'Gandhi', 'Action', 'Kele Hastin', to_date('31-12-2010', 'dd-mm-yyyy'), 94, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (106, 'Jumper', 'Documentary', 'Merlina Venables', to_date('21-06-2014', 'dd-mm-yyyy'), 76, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (107, 'Maverick', 'Fantasy', 'Zack Jeandet', to_date('22-07-2018', 'dd-mm-yyyy'), 61, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (108, 'Thor', 'Crime', 'Albertine Sedgwick', to_date('18-01-2016', 'dd-mm-yyyy'), 112, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (109, 'Iron Man', 'Comedy', 'Nefen Bruyett', to_date('06-03-2017', 'dd-mm-yyyy'), 169, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (110, 'Crash', 'Biography', 'Ninnetta Klewi', to_date('10-09-2022', 'dd-mm-yyyy'), 180, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (111, 'Star Trek', 'Action', 'Kirstin Meas', to_date('24-03-2012', 'dd-mm-yyyy'), 94, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (112, 'Brave', 'Horror', 'Farly Haverty', to_date('29-01-2011', 'dd-mm-yyyy'), 129, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (113, 'Witness', 'Sport', 'Bruce Shrimpton', to_date('05-01-2021', 'dd-mm-yyyy'), 82, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (114, 'Zombieland', 'Biography', 'Felecia Simoneschi', to_date('31-05-2001', 'dd-mm-yyyy'), 177, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (115, 'Dumbo', 'Comedy', 'Avictor Hews', to_date('02-05-2015', 'dd-mm-yyyy'), 127, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (116, 'Clerks', 'Comedy', 'Nada Cogar', to_date('01-07-2003', 'dd-mm-yyyy'), 114, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (117, 'Amelie', 'Thriller', 'Ossie Ilyushkin', to_date('22-07-2012', 'dd-mm-yyyy'), 176, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (118, 'Trumbo', 'Documentary', 'Maisey Haughton', to_date('30-06-2009', 'dd-mm-yyyy'), 111, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (119, 'Rio', 'Romance', 'Reiko Bucher', to_date('11-09-2008', 'dd-mm-yyyy'), 144, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (120, 'Black Swan', 'Adventure', 'Esta Papen', to_date('14-06-2005', 'dd-mm-yyyy'), 114, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (121, 'Goonies', 'Sport', 'Philippe Conradie', to_date('05-03-2009', 'dd-mm-yyyy'), 99, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (122, 'Rio', 'Documentary', 'Norman Deadman', to_date('22-12-2015', 'dd-mm-yyyy'), 73, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (123, 'Twister', 'Horror', 'Ursola Masson', to_date('27-03-2022', 'dd-mm-yyyy'), 64, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (124, 'Jaws', 'Adventure', 'Kizzie Keepin', to_date('17-01-2008', 'dd-mm-yyyy'), 91, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (125, 'Singles', 'Romance', 'Gene Fulloway', to_date('25-11-2006', 'dd-mm-yyyy'), 149, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (126, 'Contact', 'Action', 'Lark Wolfindale', to_date('04-12-2009', 'dd-mm-yyyy'), 106, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (127, 'Witness', 'Biography', 'Patty Teasdale', to_date('16-08-2001', 'dd-mm-yyyy'), 89, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (128, 'Shrek', 'Fantasy', 'Blane Edge', to_date('11-12-2020', 'dd-mm-yyyy'), 109, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (129, 'Superbad', 'Sci-Fi', 'Filbert Muzzollo', to_date('09-11-2007', 'dd-mm-yyyy'), 111, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (130, 'Watchmen', 'Adventure', 'Ana England', to_date('19-07-2000', 'dd-mm-yyyy'), 62, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (131, 'Trumbo', 'Horror', 'Mallorie Lilly', to_date('06-09-2004', 'dd-mm-yyyy'), 120, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (132, 'Shrek', 'History', 'Aldis Luton', to_date('28-11-2004', 'dd-mm-yyyy'), 125, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (133, 'Gandhi', 'War', 'Lorraine Bothbie', to_date('18-04-2013', 'dd-mm-yyyy'), 89, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (134, 'Matilda', 'Comedy', 'Manolo Vasilkov', to_date('12-11-2009', 'dd-mm-yyyy'), 87, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (135, 'Dumbo', 'Family', 'Rebekkah Leverette', to_date('07-06-2004', 'dd-mm-yyyy'), 72, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (136, 'Jumanji', 'Drama', 'Roseann Esmond', to_date('01-08-2016', 'dd-mm-yyyy'), 81, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (137, 'Star Trek', 'Thriller', 'Giacobo Carty', to_date('14-04-2013', 'dd-mm-yyyy'), 116, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (138, 'Gandhi', 'Thriller', 'Patton Bussy', to_date('30-07-2009', 'dd-mm-yyyy'), 103, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (139, 'Bolt', 'Thriller', 'Ophelie Ertel', to_date('01-03-2013', 'dd-mm-yyyy'), 144, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (140, 'Superbad', 'Sci-Fi', 'Peri Lambkin', to_date('19-02-2014', 'dd-mm-yyyy'), 138, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (141, 'Looper', 'Biography', 'Benn Richings', to_date('29-07-2013', 'dd-mm-yyyy'), 97, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (142, 'Cop Land', 'Thriller', 'Vasilis Hannum', to_date('18-05-2020', 'dd-mm-yyyy'), 87, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (143, 'Selma', 'Documentary', 'Gordie Chilley', to_date('20-11-2020', 'dd-mm-yyyy'), 118, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (144, 'Rushmore', 'Mystery', 'Sindee Chieze', to_date('10-05-2002', 'dd-mm-yyyy'), 155, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (145, 'Xanadu', 'Thriller', 'Tedie Benne', to_date('30-03-2005', 'dd-mm-yyyy'), 174, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (146, 'Erin Brock', 'Mystery', 'Elwood Nelissen', to_date('05-02-2013', 'dd-mm-yyyy'), 108, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (147, 'Witness', 'Sci-Fi', 'Brion Fellows', to_date('16-07-2010', 'dd-mm-yyyy'), 97, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (148, 'Gandhi', 'Family', 'Rabi Champley', to_date('07-03-2003', 'dd-mm-yyyy'), 172, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (149, 'Jumper', 'Sport', 'Pietra Folshom', to_date('20-02-2019', 'dd-mm-yyyy'), 162, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (150, 'Tombstone', 'Sci-Fi', 'Mike Grimsell', to_date('13-05-2021', 'dd-mm-yyyy'), 122, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (151, 'Speed', 'Thriller', 'Graehme Presnail', to_date('05-06-2008', 'dd-mm-yyyy'), 151, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (152, 'Hancock', 'Mystery', 'Aylmer Crombie', to_date('03-11-2002', 'dd-mm-yyyy'), 104, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (153, 'Gandhi', 'Sci-Fi', 'Abra Parkisson', to_date('18-11-2003', 'dd-mm-yyyy'), 67, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (154, 'Gandhi', 'Western', 'Nevile Waterfall', to_date('03-09-2022', 'dd-mm-yyyy'), 125, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (155, 'Deadpool', 'Musical', 'Enrichetta Goff', to_date('12-07-2006', 'dd-mm-yyyy'), 138, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (156, 'Gremlins', 'Western', 'Kelsi Blayd', to_date('28-11-2021', 'dd-mm-yyyy'), 136, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (157, 'Memento', 'War', 'Corrine Pannett', to_date('17-06-2009', 'dd-mm-yyyy'), 86, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (158, 'Rushmore', 'Romance', 'Audi Kubacki', to_date('24-08-2007', 'dd-mm-yyyy'), 65, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (159, 'The Mask', 'Sport', 'Gwenette Physick', to_date('22-11-2010', 'dd-mm-yyyy'), 78, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (160, 'Speed', 'Drama', 'Raff Manus', to_date('03-02-2007', 'dd-mm-yyyy'), 174, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (161, 'Twister', 'History', 'Natal Haslock', to_date('17-05-2011', 'dd-mm-yyyy'), 145, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (162, 'X-', 'Mystery', 'Kaitlyn Kibbey', to_date('01-12-2003', 'dd-mm-yyyy'), 108, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (163, 'Rocky', 'Adventure', 'Sunshine Veazey', to_date('05-07-2022', 'dd-mm-yyyy'), 79, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (164, 'Coraline', 'Western', 'Drucill Beaves', to_date('23-10-2004', 'dd-mm-yyyy'), 127, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (165, 'Gattaca', 'Sci-Fi', 'Sherry Cawood', to_date('17-05-2015', 'dd-mm-yyyy'), 134, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (166, 'Nim''s Island', 'Drama', 'Gwendolyn Howes', to_date('27-02-2023', 'dd-mm-yyyy'), 124, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (167, 'Deadpool', 'Documentary', 'Sammy Madrell', to_date('03-12-2012', 'dd-mm-yyyy'), 93, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (168, 'Lincoln', 'Sci-Fi', 'Mendie Mushet', to_date('28-06-2015', 'dd-mm-yyyy'), 75, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (169, 'Coco', 'Western', 'Farly Dumbelton', to_date('25-03-2016', 'dd-mm-yyyy'), 148, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (170, 'Casino', 'Biography', 'Bogart Burle', to_date('21-03-2016', 'dd-mm-yyyy'), 127, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (171, 'Gattaca', 'History', 'Shir Redman', to_date('16-09-2020', 'dd-mm-yyyy'), 166, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (172, 'Moana', 'Drama', 'Astrid Cinelli', to_date('09-03-2002', 'dd-mm-yyyy'), 149, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (173, 'Aliens', 'Horror', 'Annamaria Ismead', to_date('11-11-2002', 'dd-mm-yyyy'), 160, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (174, 'Dumbo', 'Adventure', 'Consuelo Impey', to_date('12-10-2021', 'dd-mm-yyyy'), 83, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (175, 'Risen', 'Animation', 'Sharla Dorcey', to_date('14-08-2011', 'dd-mm-yyyy'), 105, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (176, 'Whiplash', 'Biography', 'Nadia Peddowe', to_date('11-08-2007', 'dd-mm-yyyy'), 106, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (177, 'Poltergeist', 'Biography', 'Sterling Ingles', to_date('09-11-2012', 'dd-mm-yyyy'), 84, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (178, 'Doubt', 'History', 'Venus Bumfrey', to_date('06-02-2011', 'dd-mm-yyyy'), 135, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (179, 'Twister', 'Drama', 'Cletus Staley', to_date('02-03-2015', 'dd-mm-yyyy'), 163, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (180, 'Zoolander', 'Crime', 'Frieda McGorley', to_date('09-01-2015', 'dd-mm-yyyy'), 87, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (181, 'Sin City', 'Fantasy', 'Gard Vannoort', to_date('25-10-2014', 'dd-mm-yyyy'), 89, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (182, 'Ali', 'Adventure', 'Felipe Bignal', to_date('07-11-2005', 'dd-mm-yyyy'), 145, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (183, 'Chappie', 'Sport', 'Gustavus Wilbor', to_date('26-04-2016', 'dd-mm-yyyy'), 156, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (184, 'Risen', 'Sci-Fi', 'Jemimah Aldritt', to_date('10-09-2020', 'dd-mm-yyyy'), 163, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (185, 'Thor', 'Documentary', 'Thorvald Bagenal', to_date('11-09-2011', 'dd-mm-yyyy'), 172, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (186, 'Avatar', 'Romance', 'Joline Picford', to_date('04-09-2000', 'dd-mm-yyyy'), 73, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (187, 'Iron Man', 'Romance', 'Sargent Collar', to_date('06-08-2017', 'dd-mm-yyyy'), 160, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (188, 'Godzilla', 'Crime', 'Ivor Halshaw', to_date('11-07-2002', 'dd-mm-yyyy'), 60, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (189, 'Maverick', 'Sport', 'Hirsch Becks', to_date('18-11-2001', 'dd-mm-yyyy'), 115, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (190, 'Chocolat', 'Biograp', 'Sam Antoniewicz', to_date('07-04-2012', 'dd-mm-yyyy'), 127, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (191, 'Moana', 'Thriller', 'Witty Zimmerman', to_date('11-05-2013', 'dd-mm-yyyy'), 113, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (192, 'Casino', 'Adventure', 'Lynelle Adnams', to_date('04-08-2002', 'dd-mm-yyyy'), 67, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (193, 'Witness', 'Thriller', 'Aida Tourne', to_date('26-10-2019', 'dd-mm-yyyy'), 120, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (194, 'Sideways', 'Western', 'Pris Brach', to_date('09-08-2009', 'dd-mm-yyyy'), 90, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (195, 'Matilda', 'Drama', 'Cord MacKnockiter', to_date('10-05-2004', 'dd-mm-yyyy'), 119, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (196, 'Elf', 'Sport', 'Rabbi Pershouse', to_date('11-05-2013', 'dd-mm-yyyy'), 146, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (197, 'Rocky', 'Horror', 'Joey Aitken', to_date('17-06-2006', 'dd-mm-yyyy'), 90, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (198, 'Moonlight', 'Sci-Fi', 'Randi Pattini', to_date('02-09-2008', 'dd-mm-yyyy'), 69, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (199, 'Labyrinth', 'Mystery', 'Olly Schubuser', to_date('09-04-2014', 'dd-mm-yyyy'), 133, 9);
commit;
prompt 100 records committed...
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (200, 'Moon', 'Horror', 'Margarethe De Simoni', to_date('30-05-2011', 'dd-mm-yyyy'), 116, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (201, 'Contact', 'Comedy', 'Katleen Fermor', to_date('06-07-2014', 'dd-mm-yyyy'), 72, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (202, 'Unforgiven', 'Sport', 'Isidro Marini', to_date('30-03-2004', 'dd-mm-yyyy'), 78, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (203, 'Ant-Man', 'Fantasy', 'Albie Cheak', to_date('12-12-2014', 'dd-mm-yyyy'), 71, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (204, 'Trumbo', 'Sci-Fi', 'Ola Quantick', to_date('23-12-2022', 'dd-mm-yyyy'), 180, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (205, 'Frida', 'Animation', 'Batholomew Rains', to_date('14-03-2005', 'dd-mm-yyyy'), 133, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (206, 'Hancock', 'Biography', 'Jenni Fantin', to_date('27-05-2013', 'dd-mm-yyyy'), 117, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (207, 'Gandhi', 'Mystery', 'Spence Orwell', to_date('13-04-2007', 'dd-mm-yyyy'), 146, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (208, 'Amelie', 'War', 'Benni Gergely', to_date('20-05-2016', 'dd-mm-yyyy'), 79, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (209, 'Witness', 'War', 'Cathe Kulver', to_date('25-12-2000', 'dd-mm-yyyy'), 142, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (210, 'Sideways', 'Romance', 'Fara Bumby', to_date('26-01-2021', 'dd-mm-yyyy'), 140, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (211, 'Rocky', 'Romance', 'Whit Welfair', to_date('24-11-2015', 'dd-mm-yyyy'), 180, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (212, 'Twister', 'Crime', 'Aloise Boom', to_date('02-05-2023', 'dd-mm-yyyy'), 111, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (213, 'Giant', 'Drama', 'Luke Strognell', to_date('04-10-2019', 'dd-mm-yyyy'), 81, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (214, 'Whiplash', 'Crime', 'Bobbye Durnall', to_date('07-04-2020', 'dd-mm-yyyy'), 66, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (215, 'Zombieland', 'War', 'Saunders Purbrick', to_date('21-06-2023', 'dd-mm-yyyy'), 108, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (216, 'Fargo', 'Animation', 'Giralda Oyley', to_date('04-12-2000', 'dd-mm-yyyy'), 96, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (217, 'Giant', 'Adventure', 'Lorain Buttrick', to_date('07-06-2019', 'dd-mm-yyyy'), 100, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (218, 'Black Swan', 'Musical', 'Luce Rantoull', to_date('30-08-2004', 'dd-mm-yyyy'), 68, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (219, 'Twister', 'Fantasy', 'Zitella Baxstair', to_date('14-03-2019', 'dd-mm-yyyy'), 166, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (220, 'Paprika', 'Sci-Fi', 'Lolly McIlenna', to_date('22-12-2021', 'dd-mm-yyyy'), 152, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (221, 'Fargo', 'Musical', 'Powell Remmer', to_date('10-02-2011', 'dd-mm-yyyy'), 88, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (222, 'Rushmore', 'History', 'Ronny Brownsmith', to_date('16-02-2013', 'dd-mm-yyyy'), 120, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (223, 'Witness', 'Romance', 'Etta Sackett', to_date('28-11-2022', 'dd-mm-yyyy'), 110, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (224, 'Bolt', 'Fantasy', 'Ivar Riddoch', to_date('13-02-2024', 'dd-mm-yyyy'), 179, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (225, 'Beetlejuice', 'Action', 'Eunice Goligher', to_date('21-11-2017', 'dd-mm-yyyy'), 179, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (226, 'Chocolat', 'Animation', 'Isaak Frye', to_date('24-10-2020', 'dd-mm-yyyy'), 108, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (227, 'Paprika', 'Adventure', 'Jeanne Dafforne', to_date('21-09-2016', 'dd-mm-yyyy'), 78, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (228, 'Signs', 'Crime', 'Chelsie Thorneley', to_date('12-12-2018', 'dd-mm-yyyy'), 159, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (229, 'Amelie', 'Drama', 'Esra Bretelle', to_date('17-03-2012', 'dd-mm-yyyy'), 112, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (230, 'Up', 'Comedy', 'Ciro Ellesmere', to_date('15-02-2001', 'dd-mm-yyyy'), 140, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (231, 'Signs', 'Animation', 'Torrance Dobrowlski', to_date('17-08-2014', 'dd-mm-yyyy'), 104, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (232, 'Whiplash', 'Horror', 'Lamar Adnett', to_date('18-06-2023', 'dd-mm-yyyy'), 146, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (233, 'Coraline', 'Drama', 'Lib Frost', to_date('29-01-2020', 'dd-mm-yyyy'), 71, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (234, 'Moon', 'Western', 'Ulrick Skrzynski', to_date('05-04-2009', 'dd-mm-yyyy'), 169, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (235, 'Memento', 'Biography', 'Adriano Chapling', to_date('26-08-2019', 'dd-mm-yyyy'), 175, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (236, 'Gigi', 'Adventure', 'Otto Schrir', to_date('06-04-2020', 'dd-mm-yyyy'), 137, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (237, 'Gremlins', 'Drama', 'Nell Augur', to_date('21-09-2016', 'dd-mm-yyyy'), 99, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (238, 'Wild', 'Animation', 'Janis Normanton', to_date('29-05-2012', 'dd-mm-yyyy'), 177, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (239, 'Clerks', 'Action', 'Olivero Djordjevic', to_date('25-07-2001', 'dd-mm-yyyy'), 112, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (240, 'Superbad', 'Thriller', 'Karlis De Goey', to_date('26-02-2005', 'dd-mm-yyyy'), 163, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (241, 'Thor', 'Sport', 'Ethelbert Pelman', to_date('16-04-2019', 'dd-mm-yyyy'), 141, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (242, 'Thor', 'Thriller', 'Bruno Plaster', to_date('01-04-2018', 'dd-mm-yyyy'), 117, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (243, 'Avatar', 'Documentary', 'Randy Truscott', to_date('05-05-2010', 'dd-mm-yyyy'), 98, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (244, 'Erin Brock', 'Horror', 'Randy Benedettini', to_date('11-05-2012', 'dd-mm-yyyy'), 146, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (245, 'Spartacus', 'Horror', 'Kamilah Beckerleg', to_date('02-09-2008', 'dd-mm-yyyy'), 164, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (246, 'Matilda', 'Action', 'Erv Syrie', to_date('04-01-2012', 'dd-mm-yyyy'), 72, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (247, 'Scarface', 'Family', 'Walden Proger', to_date('05-01-2007', 'dd-mm-yyyy'), 154, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (248, 'Hercules', 'Horror', 'Allegra Connett', to_date('08-12-2002', 'dd-mm-yyyy'), 94, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (249, 'Labyrinth', 'Sport', 'Dew Norway', to_date('02-07-2020', 'dd-mm-yyyy'), 111, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (250, 'Titanic', 'Comedy', 'Elayne Markwick', to_date('05-08-2005', 'dd-mm-yyyy'), 167, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (251, 'Babe', 'History', 'Alison Fellibrand', to_date('14-02-2012', 'dd-mm-yyyy'), 156, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (252, 'Ratatouille', 'War', 'Colly Novic', to_date('02-09-2017', 'dd-mm-yyyy'), 179, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (253, 'Risen', 'War', 'Cordula Lehrer', to_date('16-06-2006', 'dd-mm-yyyy'), 99, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (254, 'Patton', 'History', 'Briggs Lortzing', to_date('18-12-2007', 'dd-mm-yyyy'), 141, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (255, 'Singles', 'Horror', 'Amanda Gerwood', to_date('01-05-2010', 'dd-mm-yyyy'), 108, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (256, 'Black Swan', 'Action', 'Aaren Mangan', to_date('13-03-2018', 'dd-mm-yyyy'), 122, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (257, 'Contact', 'Thriller', 'Octavius Kinneir', to_date('28-06-2020', 'dd-mm-yyyy'), 89, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (258, 'Rudy', 'Animation', 'Avrit Janata', to_date('18-04-2010', 'dd-mm-yyyy'), 127, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (259, 'Casino', 'Action', 'Finlay Swalteridge', to_date('07-12-2016', 'dd-mm-yyyy'), 96, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (260, 'Rushmore', 'Musical', 'Alonzo Pavy', to_date('23-01-2021', 'dd-mm-yyyy'), 103, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (261, 'Zoolander', 'Adventure', 'Giffard Naire', to_date('10-04-2012', 'dd-mm-yyyy'), 149, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (262, 'Gravity', 'Family', 'Clair Bantock', to_date('22-11-2023', 'dd-mm-yyyy'), 131, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (263, 'Paprika', 'Sci-Fi', 'Issie Olrenshaw', to_date('20-09-2016', 'dd-mm-yyyy'), 156, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (264, 'Psycho', 'Adventure', 'Alfi Hammerberger', to_date('07-09-2023', 'dd-mm-yyyy'), 162, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (265, 'Labyrinth', 'Fantasy', 'Marian Lutsch', to_date('13-02-2010', 'dd-mm-yyyy'), 135, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (266, 'Thor', 'War', 'Kerrill Highton', to_date('09-04-2023', 'dd-mm-yyyy'), 122, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (267, 'Unbroken', 'Adventure', 'Iolande Comusso', to_date('13-06-2023', 'dd-mm-yyyy'), 60, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (268, 'Dumbo', 'Musical', 'Wilt Margarson', to_date('27-02-2020', 'dd-mm-yyyy'), 130, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (269, 'Jaws', 'Thriller', 'Marylinda Copas', to_date('05-05-2021', 'dd-mm-yyyy'), 82, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (270, 'Bolt', 'Crime', 'Raynell Lamminam', to_date('22-08-2001', 'dd-mm-yyyy'), 164, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (271, 'Shutter', 'Comedy', 'Jolene Denisevich', to_date('17-05-2002', 'dd-mm-yyyy'), 97, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (272, 'Spartacus', 'Mystery', 'Ardyce Beckensall', to_date('08-02-2022', 'dd-mm-yyyy'), 132, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (273, 'Matilda', 'Western', 'Kathi Castillon', to_date('19-06-2012', 'dd-mm-yyyy'), 172, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (274, 'Hackers', 'Action', 'Alina Liddel', to_date('20-04-2021', 'dd-mm-yyyy'), 108, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (275, 'Notorious', 'Action', 'Brynne Manuello', to_date('13-08-2022', 'dd-mm-yyyy'), 147, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (276, 'Amadeus', 'Fantasy', 'Harman Crate', to_date('22-11-2005', 'dd-mm-yyyy'), 122, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (277, 'Deadpool', 'Sport', 'Erica Langley', to_date('21-10-2022', 'dd-mm-yyyy'), 175, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (278, 'Arrival', 'Documentary', 'Niall Mustard', to_date('23-09-2007', 'dd-mm-yyyy'), 127, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (279, 'Clueless', 'Biography', 'Clywd Finlaison', to_date('28-02-2016', 'dd-mm-yyyy'), 119, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (280, 'Kill Bill', 'Drama', 'Fanchette Brothers', to_date('13-03-2015', 'dd-mm-yyyy'), 83, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (281, 'Gigi', 'Family', 'Ellene Drinkel', to_date('13-09-2005', 'dd-mm-yyyy'), 180, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (282, 'Cinderella', 'Mystery', 'Merralee Wrench', to_date('27-09-2009', 'dd-mm-yyyy'), 63, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (283, 'Rango', 'Crime', 'Kenon Paulitschke', to_date('01-11-2007', 'dd-mm-yyyy'), 79, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (284, 'Moonlight', 'War', 'Giralda Conachie', to_date('28-02-2009', 'dd-mm-yyyy'), 85, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (285, 'Spartacus', 'Documentary', 'Gwendolen Marians', to_date('31-12-2004', 'dd-mm-yyyy'), 113, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (286, 'Hugo', 'Mystery', 'Alexine Mowday', to_date('10-07-2009', 'dd-mm-yyyy'), 149, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (287, 'Trumbo', 'Drama', 'Nonah Hiscoke', to_date('24-12-2013', 'dd-mm-yyyy'), 134, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (288, 'Rio', 'Horror', 'Emogene Hadgraft', to_date('12-02-2006', 'dd-mm-yyyy'), 98, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (289, 'District 9', 'Horror', 'Seka Allbones', to_date('05-11-2011', 'dd-mm-yyyy'), 180, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (290, 'Split', 'History', 'Maryanna Streader', to_date('12-09-2003', 'dd-mm-yyyy'), 109, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (291, 'Airplane', 'Sci-Fi', 'Zara Kiljan', to_date('14-11-2018', 'dd-mm-yyyy'), 82, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (292, 'Boyhood', 'Action', 'Alley Mark', to_date('09-12-2022', 'dd-mm-yyyy'), 82, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (293, 'Risen', 'Sci-Fi', 'Trumaine Yanov', to_date('02-06-2014', 'dd-mm-yyyy'), 119, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (294, 'Coraline', 'Adventure', 'Enrichetta Conlon', to_date('28-06-2009', 'dd-mm-yyyy'), 96, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (295, 'Notebook', 'Comedy', 'Dredi Cansdell', to_date('02-06-2012', 'dd-mm-yyyy'), 63, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (296, 'Cop Land', 'Biography', 'Tully Torn', to_date('19-11-2022', 'dd-mm-yyyy'), 139, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (297, 'Boyhood', 'Crime', 'Barde Eeles', to_date('28-08-2017', 'dd-mm-yyyy'), 162, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (298, 'Contact', 'Drama', 'Jennine Bottlestone', to_date('22-12-2017', 'dd-mm-yyyy'), 156, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (299, 'Twister', 'Thriller', 'Eddie Lince', to_date('09-01-2015', 'dd-mm-yyyy'), 108, 10);
commit;
prompt 200 records committed...
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (300, 'Split', 'Comedy', 'Rafaelita Drummond', to_date('18-05-2016', 'dd-mm-yyyy'), 147, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (301, 'Capote', 'Mystery', 'Staci Abdee', to_date('06-04-2014', 'dd-mm-yyyy'), 160, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (302, 'Goonies', 'War', 'Tally Deeney', to_date('27-09-2019', 'dd-mm-yyyy'), 70, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (303, 'Rudy', 'Horror', 'Latashia Romi', to_date('15-08-2010', 'dd-mm-yyyy'), 104, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (304, 'Sideways', 'Thriller', 'Pasquale Barstowk', to_date('11-01-2016', 'dd-mm-yyyy'), 143, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (305, 'Scream', 'War', 'Dorelia Millmoe', to_date('26-09-2014', 'dd-mm-yyyy'), 135, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (306, 'Avatar', 'Action', 'Lek Darrigone', to_date('15-06-2018', 'dd-mm-yyyy'), 99, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (307, 'Memento', 'Animation', 'Giusto Normington', to_date('12-08-2012', 'dd-mm-yyyy'), 154, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (308, 'Platoon', 'Musical', 'Dinny Wichard', to_date('10-06-2003', 'dd-mm-yyyy'), 77, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (309, 'Hancock', 'Sci-Fi', 'Eugine Skynner', to_date('02-02-2006', 'dd-mm-yyyy'), 110, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (310, 'Gandhi', 'Sport', 'Frasco Milch', to_date('27-03-2006', 'dd-mm-yyyy'), 108, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (311, 'Moana', 'Sci-Fi', 'Anita Westbrook', to_date('13-11-2006', 'dd-mm-yyyy'), 151, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (312, 'Hugo', 'Fantasy', 'Dell Skipworth', to_date('09-10-2003', 'dd-mm-yyyy'), 113, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (313, 'Twister', 'History', 'Lauralee Saltern', to_date('01-04-2002', 'dd-mm-yyyy'), 176, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (314, 'Ted', 'History', 'Fleming De Lorenzo', to_date('20-09-2005', 'dd-mm-yyyy'), 156, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (315, 'Avatar', 'Drama', 'Winfield Abrashkov', to_date('14-02-2004', 'dd-mm-yyyy'), 166, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (316, 'Patton', 'Musical', 'Dael Lockyear', to_date('26-10-2015', 'dd-mm-yyyy'), 129, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (317, 'Frida', 'Drama', 'Buddy Beadell', to_date('16-08-2016', 'dd-mm-yyyy'), 84, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (318, 'Grease', 'Crime', 'Jewel Southey', to_date('06-11-2023', 'dd-mm-yyyy'), 122, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (319, 'Capote', 'Sport', 'Jacenta Clendennen', to_date('20-03-2022', 'dd-mm-yyyy'), 103, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (320, 'Doubt', 'Drama', 'Dione Piddlesden', to_date('29-05-2023', 'dd-mm-yyyy'), 68, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (321, 'Gravity', 'Biography', 'Hal Trevillion', to_date('21-08-2021', 'dd-mm-yyyy'), 63, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (322, 'Black Swan', 'Mystery', 'Farah Beaford', to_date('14-02-2007', 'dd-mm-yyyy'), 160, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (323, 'Unforgiven', 'Musical', 'Mirabelle Paver', to_date('20-04-2022', 'dd-mm-yyyy'), 89, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (324, 'Crash', 'Musical', 'Clarice Batman', to_date('07-11-2014', 'dd-mm-yyyy'), 75, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (325, 'Witness', 'Family', 'Lodovico Franseco', to_date('22-05-2000', 'dd-mm-yyyy'), 166, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (326, 'Platoon', 'Documentary', 'Osmund Springer', to_date('31-08-2014', 'dd-mm-yyyy'), 171, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (327, 'Cowboys', 'Horror', 'Wilfrid Rizzardini', to_date('24-07-2016', 'dd-mm-yyyy'), 102, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (328, 'Star Trek', 'Documentary', 'Colleen Goulstone', to_date('13-06-2001', 'dd-mm-yyyy'), 75, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (329, 'Twister', 'Sport', 'Demott Hebson', to_date('19-03-2022', 'dd-mm-yyyy'), 118, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (330, 'Tombstone', 'Thriller', 'Norry Rollings', to_date('24-11-2016', 'dd-mm-yyyy'), 110, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (331, 'Speed', 'Adventure', 'Ingrim Adds', to_date('23-01-2018', 'dd-mm-yyyy'), 98, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (332, 'Thor', 'Family', 'Blanche Jaques', to_date('02-06-2016', 'dd-mm-yyyy'), 124, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (333, 'Rango', 'History', 'Clayson MacCorkell', to_date('28-05-2004', 'dd-mm-yyyy'), 160, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (334, 'Arrival', 'Sci-Fi', 'Dion McCumskay', to_date('08-01-2015', 'dd-mm-yyyy'), 126, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (335, 'Skyfall', 'Animation', 'Maxwell Syder', to_date('04-02-2024', 'dd-mm-yyyy'), 110, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (336, 'Holes', 'Documentary', 'Annmaria Bromidge', to_date('15-09-2011', 'dd-mm-yyyy'), 175, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (337, 'Chocolat', 'Animation', 'Reiko Palluschek', to_date('03-12-2017', 'dd-mm-yyyy'), 85, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (338, 'Flubber', 'Mystery', 'Shawn Dougherty', to_date('05-09-2023', 'dd-mm-yyyy'), 136, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (339, 'Split', 'Musical', 'Nona Benneton', to_date('08-10-2000', 'dd-mm-yyyy'), 72, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (340, 'Gladiator', 'Action', 'Kizzie Dulieu', to_date('30-01-2024', 'dd-mm-yyyy'), 142, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (341, 'Casino', 'Thriller', 'Shawn Williscroft', to_date('12-01-2011', 'dd-mm-yyyy'), 139, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (342, 'X-', 'Musical', 'Chris Elvy', to_date('20-02-2024', 'dd-mm-yyyy'), 79, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (343, 'Jumanji', 'Crime', 'Noll Mannix', to_date('15-02-2013', 'dd-mm-yyyy'), 139, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (344, 'Shutter', 'Crime', 'Theda Sarchwell', to_date('02-09-2014', 'dd-mm-yyyy'), 67, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (345, 'Giant', 'Documentary', 'Marissa Picot', to_date('22-02-2013', 'dd-mm-yyyy'), 73, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (346, 'Star Trek', 'Sport', 'Leanor Woodcroft', to_date('02-11-2005', 'dd-mm-yyyy'), 156, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (347, 'Amelie', 'Thriller', 'Hunt Ashbey', to_date('27-08-2018', 'dd-mm-yyyy'), 138, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (348, 'Witness', 'Sport', 'Lief Ronisch', to_date('07-12-2000', 'dd-mm-yyyy'), 80, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (349, 'Crash', 'Biography', 'Neil Gilliam', to_date('17-12-2001', 'dd-mm-yyyy'), 177, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (350, 'Crash', 'Action', 'Hedvig Mars', to_date('05-09-2002', 'dd-mm-yyyy'), 134, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (351, 'Kill Bill', 'Crime', 'Leesa Dalwood', to_date('23-07-2005', 'dd-mm-yyyy'), 135, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (352, 'Ratatouille', 'History', 'Carlotta Winstone', to_date('02-06-2010', 'dd-mm-yyyy'), 67, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (353, 'Trumbo', 'History', 'Salome Gredden', to_date('01-06-2009', 'dd-mm-yyyy'), 178, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (354, 'Speed', 'Mystery', 'Levey Paudin', to_date('13-03-2012', 'dd-mm-yyyy'), 129, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (355, 'Stargate', 'History', 'Ruthy Rosenstein', to_date('08-11-2010', 'dd-mm-yyyy'), 146, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (356, 'Sideways', 'Animation', 'Bert Slowan', to_date('26-09-2009', 'dd-mm-yyyy'), 72, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (357, 'Airplane', 'War', 'Connie Withull', to_date('17-02-2015', 'dd-mm-yyyy'), 122, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (358, 'Clerks', 'History', 'Fawnia Heaysman', to_date('31-07-2004', 'dd-mm-yyyy'), 99, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (359, 'Ted', 'Family', 'Luigi Bossons', to_date('18-10-2019', 'dd-mm-yyyy'), 130, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (360, 'Fences', 'Horror', 'Darlene McKinty', to_date('04-09-2007', 'dd-mm-yyyy'), 104, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (361, 'Flubber', 'Musical', 'Errick Aulton', to_date('02-07-2001', 'dd-mm-yyyy'), 145, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (362, 'Bolt', 'Crime', 'Toby Humblestone', to_date('13-10-2015', 'dd-mm-yyyy'), 92, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (363, 'Twister', 'Horror', 'Evangelina Saw', to_date('21-10-2009', 'dd-mm-yyyy'), 159, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (364, 'Tombstone', 'Crime', 'Doralynne Gannaway', to_date('12-11-2001', 'dd-mm-yyyy'), 150, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (365, 'Aliens', 'Mystery', 'Abbey Robel', to_date('25-12-2016', 'dd-mm-yyyy'), 87, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (366, 'Gravity', 'Animation', 'Natka Tysack', to_date('04-03-2004', 'dd-mm-yyyy'), 127, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (367, 'Iron Man', 'Horror', 'Gregorio Hirsthouse', to_date('05-03-2015', 'dd-mm-yyyy'), 161, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (368, 'Signs', 'Mystery', 'Seymour Jatczak', to_date('28-05-2003', 'dd-mm-yyyy'), 77, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (369, 'Capote', 'Mystery', 'Greta Bras', to_date('08-10-2014', 'dd-mm-yyyy'), 67, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (370, 'Whiplash', 'Documentary', 'Cristine Gagan', to_date('08-10-2018', 'dd-mm-yyyy'), 112, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (371, 'Casino', 'Sport', 'Cassy Killingworth', to_date('22-02-2010', 'dd-mm-yyyy'), 129, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (372, 'Logan', 'Biography', 'Candy Le Gassick', to_date('27-01-2023', 'dd-mm-yyyy'), 131, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (373, 'Aliens', 'Family', 'Mattias Braybrook', to_date('15-10-2023', 'dd-mm-yyyy'), 147, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (374, 'Lincoln', 'Biography', 'Ewell Korb', to_date('31-05-2019', 'dd-mm-yyyy'), 134, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (375, 'Spartacus', 'Fantasy', 'Roselin Gurnay', to_date('26-10-2020', 'dd-mm-yyyy'), 135, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (376, 'Sideways', 'History', 'Evania Curton', to_date('18-03-2016', 'dd-mm-yyyy'), 159, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (377, 'Singles', 'Thriller', 'Elnar Foulis', to_date('25-02-2011', 'dd-mm-yyyy'), 105, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (378, 'Mad Max', 'Sci-Fi', 'Albertina Shinfield', to_date('23-06-2022', 'dd-mm-yyyy'), 101, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (379, 'Shrek', 'History', 'Goldina Lovie', to_date('21-09-2006', 'dd-mm-yyyy'), 131, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (380, 'Hancock', 'Mystery', 'Laurene Cristofolo', to_date('30-10-2006', 'dd-mm-yyyy'), 100, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (381, 'Selma', 'Documentary', 'Clemmie Verni', to_date('06-01-2005', 'dd-mm-yyyy'), 150, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (382, 'Gattaca', 'Action', 'Roobbie Possek', to_date('02-08-2016', 'dd-mm-yyyy'), 133, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (383, 'Ray', 'Family', 'Goober Withull', to_date('05-09-2003', 'dd-mm-yyyy'), 95, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (384, 'Notorious', 'Sport', 'Wendy Langthorne', to_date('18-02-2019', 'dd-mm-yyyy'), 171, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (385, 'True Lies', 'Action', 'Dorise Rhead', to_date('30-05-2001', 'dd-mm-yyyy'), 81, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (386, 'Speed', 'Western', 'Hartwell Ertelt', to_date('25-12-2010', 'dd-mm-yyyy'), 83, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (387, 'Sideways', 'Sport', 'Grant Suttle', to_date('27-07-2010', 'dd-mm-yyyy'), 103, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (388, 'Unforgiven', 'History', 'Lorne Springate', to_date('15-06-2019', 'dd-mm-yyyy'), 176, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (389, 'Dumbo', 'Drama', 'Edlin Samper', to_date('28-09-2014', 'dd-mm-yyyy'), 164, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (390, 'Giant', 'History', 'Abran Sabbin', to_date('21-10-2001', 'dd-mm-yyyy'), 117, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (391, 'Shutter', 'Biography', 'Buffy Kolakovic', to_date('18-06-2020', 'dd-mm-yyyy'), 94, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (392, 'Up', 'Animation', 'Jeannine Garfoot', to_date('04-08-2020', 'dd-mm-yyyy'), 156, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (393, 'Frozen', 'Action', 'Braden Tivenan', to_date('17-07-2008', 'dd-mm-yyyy'), 88, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (394, 'Hancock', 'Animation', 'Rois Bucknall', to_date('08-10-2013', 'dd-mm-yyyy'), 85, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (395, 'Looper', 'Mystery', 'Reta Skelhorn', to_date('06-10-2023', 'dd-mm-yyyy'), 134, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (396, 'Moana', 'Thriller', 'Dory Wilstead', to_date('20-05-2010', 'dd-mm-yyyy'), 150, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (397, 'Watchmen', 'War', 'Thorsten Pillman', to_date('06-03-2003', 'dd-mm-yyyy'), 82, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (398, 'Coraline', 'Biograp', 'Ynes O'' Mullan', to_date('08-11-2016', 'dd-mm-yyyy'), 171, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (399, 'Brave', 'Biography', 'Webster Ellse', to_date('05-10-2020', 'dd-mm-yyyy'), 143, 7);
commit;
prompt 300 records committed...
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (400, 'Lincoln', 'Action', 'Ebenezer Tapner', to_date('19-01-2016', 'dd-mm-yyyy'), 73, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (401, 'Matilda', 'Thriller', 'Kris Colter', to_date('13-03-2002', 'dd-mm-yyyy'), 124, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (402, 'Clueless', 'Documentary', 'Teresa Mair', to_date('15-06-2001', 'dd-mm-yyyy'), 72, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (403, 'Superbad', 'Thriller', 'Leslie O''Hear', to_date('02-04-2022', 'dd-mm-yyyy'), 76, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (404, 'Gattaca', 'Western', 'Nettie Whipple', to_date('30-05-2011', 'dd-mm-yyyy'), 176, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (405, 'Casino', 'Mystery', 'Hamnet McKenzie', to_date('29-12-2006', 'dd-mm-yyyy'), 128, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (406, 'Trumbo', 'Horror', 'Maure Olijve', to_date('09-02-2006', 'dd-mm-yyyy'), 95, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (407, 'Xanadu', 'Fantasy', 'Dorie Joskovitch', to_date('13-06-2006', 'dd-mm-yyyy'), 144, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (408, 'Bambi', 'Mystery', 'Mareah Fussell', to_date('22-02-2005', 'dd-mm-yyyy'), 80, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (409, 'Black Swan', 'Sci-Fi', 'Georgianne Leiden', to_date('25-05-2001', 'dd-mm-yyyy'), 66, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (410, 'Sin City', 'Romance', 'Ray O''Hallagan', to_date('17-10-2008', 'dd-mm-yyyy'), 176, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (411, 'Sideways', 'History', 'Ana Pittam', to_date('10-07-2003', 'dd-mm-yyyy'), 99, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (412, 'Grease', 'Sci-Fi', 'Aline Huck', to_date('06-04-2022', 'dd-mm-yyyy'), 87, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (413, 'Iron Man', 'Drama', 'Baxie Bellson', to_date('30-01-2017', 'dd-mm-yyyy'), 116, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (414, 'Jumper', 'Horror', 'Cassius Creelman', to_date('19-03-2018', 'dd-mm-yyyy'), 150, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (415, 'Grease', 'Mystery', 'Genevra Dietmar', to_date('20-07-2004', 'dd-mm-yyyy'), 135, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (416, 'Manhunter', 'War', 'Curry Longmuir', to_date('30-08-2013', 'dd-mm-yyyy'), 99, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (417, 'Black Swan', 'Documentary', 'Brittne Emilien', to_date('15-07-2016', 'dd-mm-yyyy'), 114, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (418, 'Fury', 'Biography', 'Augustus Dabs', to_date('28-06-2018', 'dd-mm-yyyy'), 85, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (419, 'Aliens', 'Romance', 'Effie Van Der Weedenburg', to_date('28-03-2009', 'dd-mm-yyyy'), 67, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (420, 'Arrival', 'History', 'Lanette Beeho', to_date('05-01-2002', 'dd-mm-yyyy'), 67, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (421, 'Contact', 'Animation', 'Amby Cruddace', to_date('22-10-2017', 'dd-mm-yyyy'), 157, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (422, 'Big Fish', 'Crime', 'Kamilah Izkovici', to_date('26-03-2013', 'dd-mm-yyyy'), 175, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (423, 'Ted', 'Comedy', 'Corrie Atkyns', to_date('06-03-2002', 'dd-mm-yyyy'), 78, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (424, 'Aliens', 'Family', 'Richy Matfin', to_date('26-06-2000', 'dd-mm-yyyy'), 143, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (425, 'Lincoln', 'Mystery', 'Stephine Bassham', to_date('18-05-2023', 'dd-mm-yyyy'), 124, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (426, 'Rushmore', 'Action', 'Loy Senechell', to_date('12-05-2009', 'dd-mm-yyyy'), 136, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (427, 'Up', 'War', 'Ellette Sidey', to_date('03-02-2022', 'dd-mm-yyyy'), 80, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (428, 'Moana', 'Thriller', 'Joelynn Elster', to_date('14-12-2015', 'dd-mm-yyyy'), 140, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (429, 'Brave', 'Musical', 'Meredeth Szymanek', to_date('04-10-2004', 'dd-mm-yyyy'), 139, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (430, 'Coco', 'Action', 'Florrie Flury', to_date('21-06-2022', 'dd-mm-yyyy'), 159, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (431, 'Signs', 'Animation', 'Natalie Hoodspeth', to_date('01-01-2019', 'dd-mm-yyyy'), 140, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (432, 'Memento', 'War', 'Sacha Henzley', to_date('22-05-2010', 'dd-mm-yyyy'), 101, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (433, 'Godzilla', 'Comedy', 'Emalia Scopyn', to_date('30-01-2009', 'dd-mm-yyyy'), 156, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (434, 'Elf', 'Action', 'Odessa Friedlos', to_date('22-06-2001', 'dd-mm-yyyy'), 165, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (435, 'Unforgiven', 'Horror', 'Monty Lehrmann', to_date('18-05-2004', 'dd-mm-yyyy'), 71, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (436, 'Rudy', 'Thriller', 'Sile Gimblet', to_date('22-11-2021', 'dd-mm-yyyy'), 180, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (437, 'Deadpool', 'Western', 'Agatha Huckabe', to_date('07-02-2007', 'dd-mm-yyyy'), 135, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (438, 'Serenity', 'Action', 'Ari Cotterel', to_date('20-07-2002', 'dd-mm-yyyy'), 161, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (439, 'Tombstone', 'Documentary', 'Pansie Rosencwaig', to_date('04-10-2010', 'dd-mm-yyyy'), 67, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (440, 'Dune', 'Romance', 'Catie MacRury', to_date('18-05-2012', 'dd-mm-yyyy'), 158, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (441, 'Boyhood', 'Family', 'Ashlin Daish', to_date('20-05-2003', 'dd-mm-yyyy'), 161, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (442, 'Xanadu', 'Sci-Fi', 'Armando Carass', to_date('12-04-2019', 'dd-mm-yyyy'), 179, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (443, 'Godzilla', 'Biography', 'Adriana Windle', to_date('02-05-2010', 'dd-mm-yyyy'), 178, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (444, 'Unforgiven', 'History', 'Lauree Pilgrim', to_date('11-08-2005', 'dd-mm-yyyy'), 107, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (445, 'Rudy', 'Romance', 'Kilian Giacomazzo', to_date('15-06-2004', 'dd-mm-yyyy'), 115, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (446, 'Spartacus', 'Western', 'Lyon Cleyburn', to_date('04-10-2015', 'dd-mm-yyyy'), 60, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (447, 'Gandhi', 'Musical', 'Sibylle MacFadyen', to_date('07-07-2009', 'dd-mm-yyyy'), 164, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (448, 'Fargo', 'Horror', 'Grethel Darter', to_date('03-03-2002', 'dd-mm-yyyy'), 129, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (449, 'Goonies', 'Western', 'Gina Hollyman', to_date('03-02-2011', 'dd-mm-yyyy'), 96, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (450, 'Fences', 'Western', 'Arleyne Hedgecock', to_date('11-12-2014', 'dd-mm-yyyy'), 70, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (451, 'Titanic', 'Fantasy', 'Vernor Whyke', to_date('15-06-2023', 'dd-mm-yyyy'), 171, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (452, 'Amelie', 'Sci-Fi', 'Laure Noye', to_date('04-03-2017', 'dd-mm-yyyy'), 122, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (453, 'Clueless', 'Sport', 'Penn Hewlings', to_date('12-10-2003', 'dd-mm-yyyy'), 107, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (454, 'Gattaca', 'Comedy', 'Daron Cash', to_date('11-11-2021', 'dd-mm-yyyy'), 144, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (455, 'Gandhi', 'Biography', 'Daniella Showler', to_date('27-08-2006', 'dd-mm-yyyy'), 128, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (456, 'Kill Bill', 'Western', 'Abbi Casa', to_date('04-05-2004', 'dd-mm-yyyy'), 137, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (457, 'Wild', 'Sci-Fi', 'Benni Curley', to_date('17-11-2013', 'dd-mm-yyyy'), 121, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (458, 'Stargate', 'Crime', 'Elissa Francillo', to_date('06-09-2002', 'dd-mm-yyyy'), 139, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (459, 'Gladiator', 'Thriller', 'Filip Martell', to_date('10-06-2010', 'dd-mm-yyyy'), 129, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (460, 'Doubt', 'Family', 'Ber MacGillavery', to_date('04-03-2021', 'dd-mm-yyyy'), 66, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (461, 'Amadeus', 'War', 'Salaidh Gever', to_date('28-01-2005', 'dd-mm-yyyy'), 94, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (462, 'Coco', 'Mystery', 'Cordelie Girard', to_date('27-08-2019', 'dd-mm-yyyy'), 128, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (463, 'Twister', 'Musical', 'Isac Bickerstaff', to_date('31-08-2006', 'dd-mm-yyyy'), 179, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (464, 'Frida', 'War', 'Hirsch Dubble', to_date('03-10-2000', 'dd-mm-yyyy'), 135, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (465, 'Creed', 'Horror', 'Eadie McKern', to_date('20-12-2010', 'dd-mm-yyyy'), 171, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (466, 'Split', 'Sport', 'Mikael Libermore', to_date('09-01-2017', 'dd-mm-yyyy'), 65, 7);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (467, 'Unbroken', 'War', 'Jayson Winser', to_date('14-10-2009', 'dd-mm-yyyy'), 172, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (468, 'Memento', 'Romance', 'Constantino Scandred', to_date('22-09-2022', 'dd-mm-yyyy'), 114, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (469, 'Capote', 'Western', 'Titos Fairbrass', to_date('15-06-2001', 'dd-mm-yyyy'), 142, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (470, 'Twister', 'Family', 'Eryn Gouch', to_date('19-12-2010', 'dd-mm-yyyy'), 176, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (471, 'Clerks', 'Western', 'Maddie Wisedale', to_date('12-11-2008', 'dd-mm-yyyy'), 163, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (472, 'Ben-Hur', 'Comedy', 'Esteban Junifer', to_date('08-03-2006', 'dd-mm-yyyy'), 95, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (473, 'Manhunter', 'War', 'Bernadina Shoppee', to_date('14-01-2022', 'dd-mm-yyyy'), 126, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (474, 'Logan', 'Crime', 'Rafaela Trevena', to_date('08-12-2007', 'dd-mm-yyyy'), 164, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (475, 'Serenity', 'Thriller', 'Flin Murphey', to_date('02-05-2017', 'dd-mm-yyyy'), 137, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (476, 'Hugo', 'Sci-Fi', 'Robbi Clampett', to_date('27-01-2009', 'dd-mm-yyyy'), 90, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (477, 'Frozen', 'Thriller', 'Alexandre Schlagman', to_date('15-05-2016', 'dd-mm-yyyy'), 176, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (478, 'Birdman', 'Drama', 'Delmor Rosie', to_date('07-03-2006', 'dd-mm-yyyy'), 132, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (479, 'Grease', 'Sci-Fi', 'Trix Palfery', to_date('22-04-2006', 'dd-mm-yyyy'), 119, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (480, 'Gattaca', 'Crime', 'Lotty Minshall', to_date('23-03-2013', 'dd-mm-yyyy'), 158, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (481, 'Trumbo', 'Sci-Fi', 'Saudra Duce', to_date('19-05-2020', 'dd-mm-yyyy'), 85, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (482, 'The Mask', 'Western', 'Alano Purdon', to_date('16-01-2024', 'dd-mm-yyyy'), 145, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (483, 'Titanic', 'Sport', 'Zsa zsa Southan', to_date('27-03-2015', 'dd-mm-yyyy'), 119, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (484, 'Labyrinth', 'Documentary', 'Ange Midgely', to_date('03-01-2010', 'dd-mm-yyyy'), 146, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (485, 'Casino', 'Documentary', 'Monique Paff', to_date('28-05-2006', 'dd-mm-yyyy'), 64, 4);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (486, 'Giant', 'Biography', 'Yettie Partridge', to_date('06-11-2003', 'dd-mm-yyyy'), 150, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (487, 'Doubt', 'Documentary', 'Kinnie Reede', to_date('23-08-2012', 'dd-mm-yyyy'), 153, 2);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (488, 'Grease', 'Sci-Fi', 'Ludwig Valentelli', to_date('26-03-2006', 'dd-mm-yyyy'), 135, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (489, 'Crash', 'History', 'Griff Welling', to_date('14-07-2006', 'dd-mm-yyyy'), 143, 6);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (490, 'Serenity', 'Animation', 'Spenser Bartels-Ellis', to_date('24-10-2018', 'dd-mm-yyyy'), 155, 3);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (491, 'Elf', 'Drama', 'Vivienne Grimditch', to_date('13-11-2009', 'dd-mm-yyyy'), 117, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (492, 'Scarface', 'Fantasy', 'Cobby Tossell', to_date('27-07-2005', 'dd-mm-yyyy'), 128, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (493, 'Clerks', 'Crime', 'Quinlan Pargent', to_date('13-05-2011', 'dd-mm-yyyy'), 116, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (494, 'Rocky II', 'Adventure', 'Lena Metheringham', to_date('27-02-2003', 'dd-mm-yyyy'), 79, 1);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (495, 'Hancock', 'Thriller', 'Morton Worts', to_date('19-04-2018', 'dd-mm-yyyy'), 63, 9);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (496, 'Zoolander', 'Action', 'Aretha Crosthwaite', to_date('08-04-2022', 'dd-mm-yyyy'), 105, 8);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (497, 'Amadeus', 'Western', 'Wheeler Dougher', to_date('04-03-2017', 'dd-mm-yyyy'), 100, 5);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (498, 'Ant-Man', 'Documentary', 'Essie Decroix', to_date('30-07-2001', 'dd-mm-yyyy'), 118, 10);
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (499, 'Holes', 'Horror', 'Ephrem Whitebread', to_date('07-10-2002', 'dd-mm-yyyy'), 87, 1);
commit;
prompt 400 records committed...
insert into MOVIES (movieid, title, genre, director, releasedate, duration, rating)
values (500, 'Spartacus', 'Animation', 'Brunhilde Gyrgorcewicx', to_date('09-05-2012', 'dd-mm-yyyy'), 166, 2);
commit;
prompt 401 records loaded
prompt Loading SCHEDULES...
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (100, 100, 241, 382, 563);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (101, 116, 69, 424, 383);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (102, 117, 287, 230, 417);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (103, 102, 166, 375, 321);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (105, 115, 57, 440, 483);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (106, 100, 242, 109, 192);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (108, 119, 199, 437, 197);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (109, 116, 69, 115, 576);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (110, 113, 172, 305, 183);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (111, 115, 57, 392, 171);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (112, 111, 277, 321, 433);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (113, 115, 56, 296, 214);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (115, 114, 187, 230, 113);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (116, 108, 151, 352, 503);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (117, 109, 216, 224, 217);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (118, 126, 71, 454, 184);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (119, 123, 164, 410, 127);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (120, 109, 216, 441, 208);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (121, 106, 138, 126, 362);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (122, 127, 121, 477, 504);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (123, 110, 146, 459, 305);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (124, 125, 50, 363, 558);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (125, 121, 58, 181, 558);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (126, 116, 70, 108, 114);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (127, 122, 142, 348, 104);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (128, 115, 55, 325, 552);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (129, 100, 240, 294, 112);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (130, 100, 237, 441, 118);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (131, 102, 163, 265, 551);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (132, 120, 282, 346, 280);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (133, 104, 262, 275, 384);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (134, 124, 241, 260, 198);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (135, 115, 55, 386, 514);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (136, 114, 187, 427, 434);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (137, 100, 241, 413, 261);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (138, 121, 57, 229, 113);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (139, 104, 263, 255, 559);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (140, 101, 193, 332, 135);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (141, 125, 51, 451, 435);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (142, 107, 33, 254, 426);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (143, 112, 296, 156, 307);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (144, 122, 142, 157, 381);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (146, 120, 284, 467, 337);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (147, 104, 260, 492, 164);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (148, 105, 166, 110, 265);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (149, 120, 283, 309, 124);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (150, 103, 251, 192, 349);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (151, 127, 121, 351, 456);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (152, 121, 57, 282, 179);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (153, 115, 56, 457, 380);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (154, 130, 94, 132, 365);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (155, 130, 94, 493, 208);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (156, 108, 150, 424, 369);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (157, 106, 138, 308, 557);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (158, 130, 92, 132, 165);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (159, 122, 142, 315, 385);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (160, 125, 51, 122, 494);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (161, 119, 199, 296, 411);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (162, 109, 215, 163, 291);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (163, 120, 283, 433, 547);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (164, 112, 295, 173, 434);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (165, 124, 241, 160, 168);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (166, 127, 121, 490, 169);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (168, 112, 294, 358, 415);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (169, 109, 216, 317, 106);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (170, 118, 161, 251, 379);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (171, 115, 57, 342, 431);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (172, 121, 57, 416, 358);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (173, 112, 296, 437, 175);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (174, 110, 147, 434, 322);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (175, 104, 263, 218, 448);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (176, 125, 51, 222, 415);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (178, 110, 148, 446, 568);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (179, 128, 258, 108, 298);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (180, 105, 167, 363, 414);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (181, 123, 164, 163, 517);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (182, 109, 214, 292, 247);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (183, 105, 168, 132, 547);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (184, 108, 151, 307, 329);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (185, 115, 56, 153, 304);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (186, 116, 70, 351, 293);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (187, 118, 161, 276, 463);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (188, 125, 51, 184, 261);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (189, 106, 137, 422, 350);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (190, 106, 138, 348, 156);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (191, 111, 277, 164, 256);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (192, 130, 93, 159, 381);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (193, 109, 216, 333, 553);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (194, 115, 56, 329, 308);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (195, 112, 295, 443, 284);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (196, 118, 161, 205, 434);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (197, 128, 259, 352, 192);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (198, 127, 121, 440, 367);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (199, 114, 188, 142, 163);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (200, 105, 168, 282, 190);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (201, 108, 150, 224, 177);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (202, 104, 263, 297, 385);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (203, 113, 170, 465, 155);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (204, 111, 277, 108, 370);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (205, 121, 58, 347, 218);
commit;
prompt 100 records committed...
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (206, 121, 57, 365, 417);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (207, 111, 276, 149, 203);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (208, 128, 259, 136, 225);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (209, 126, 69, 349, 463);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (210, 122, 142, 129, 461);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (211, 128, 260, 455, 395);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (212, 130, 92, 130, 371);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (213, 100, 240, 460, 404);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (214, 112, 295, 274, 412);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (215, 107, 33, 126, 404);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (216, 109, 216, 137, 370);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (217, 104, 262, 488, 377);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (218, 100, 241, 455, 112);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (219, 111, 275, 380, 449);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (220, 108, 150, 265, 149);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (221, 103, 250, 397, 518);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (222, 106, 137, 276, 132);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (223, 111, 276, 269, 291);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (224, 110, 148, 457, 389);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (225, 129, 97, 476, 169);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (226, 106, 138, 261, 461);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (227, 114, 188, 466, 194);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (228, 130, 92, 264, 218);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (229, 128, 259, 321, 480);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (230, 125, 51, 434, 384);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (231, 109, 216, 231, 368);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (232, 100, 242, 224, 419);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (233, 125, 50, 204, 284);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (234, 129, 99, 490, 411);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (235, 102, 166, 394, 534);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (236, 124, 240, 433, 113);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (237, 101, 192, 454, 113);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (238, 111, 278, 370, 273);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (239, 124, 242, 321, 184);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (240, 109, 214, 323, 487);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (241, 129, 98, 422, 540);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (242, 110, 147, 440, 408);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (243, 109, 215, 500, 321);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (244, 112, 294, 435, 107);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (245, 125, 50, 270, 324);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (246, 113, 171, 461, 419);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (247, 122, 144, 304, 247);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (248, 101, 193, 195, 481);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (249, 109, 216, 333, 348);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (250, 130, 92, 166, 575);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (251, 113, 172, 177, 578);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (252, 112, 295, 490, 411);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (253, 109, 215, 102, 468);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (254, 102, 167, 238, 136);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (255, 110, 148, 201, 140);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (256, 103, 249, 238, 203);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (258, 126, 70, 481, 573);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (259, 130, 93, 276, 126);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (260, 111, 275, 171, 205);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (261, 105, 168, 340, 551);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (262, 122, 143, 393, 271);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (263, 127, 120, 290, 350);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (264, 108, 151, 204, 311);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (265, 125, 51, 332, 180);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (266, 114, 187, 149, 262);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (267, 119, 198, 301, 418);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (268, 125, 50, 412, 420);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (269, 128, 260, 227, 268);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (270, 112, 295, 371, 445);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (271, 130, 94, 306, 528);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (272, 108, 151, 404, 374);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (273, 111, 276, 309, 462);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (274, 121, 58, 298, 208);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (275, 107, 32, 417, 439);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (276, 106, 138, 299, 452);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (277, 119, 199, 265, 250);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (278, 114, 188, 373, 321);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (279, 110, 148, 237, 164);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (280, 125, 51, 102, 325);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (281, 126, 70, 159, 468);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (282, 129, 99, 406, 490);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (283, 130, 92, 238, 137);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (284, 130, 92, 278, 574);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (285, 105, 166, 212, 249);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (286, 123, 165, 157, 220);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (287, 128, 259, 331, 355);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (288, 117, 288, 323, 487);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (289, 123, 165, 168, 491);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (290, 101, 191, 309, 367);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (291, 103, 251, 443, 391);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (292, 116, 70, 147, 326);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (293, 102, 166, 280, 314);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (294, 119, 198, 239, 110);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (295, 127, 120, 291, 218);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (296, 104, 262, 244, 574);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (297, 105, 168, 277, 106);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (298, 107, 31, 200, 250);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (299, 105, 167, 360, 243);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (300, 105, 168, 265, 324);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (301, 119, 199, 340, 267);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (302, 124, 242, 289, 505);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (303, 119, 198, 475, 307);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (304, 102, 166, 400, 121);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (305, 130, 94, 483, 578);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (306, 109, 215, 227, 159);
commit;
prompt 200 records committed...
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (307, 126, 71, 377, 147);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (308, 105, 168, 344, 435);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (309, 123, 165, 318, 177);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (310, 114, 185, 333, 185);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (311, 120, 284, 298, 250);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (312, 127, 120, 281, 130);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (313, 123, 164, 441, 472);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (314, 113, 172, 497, 218);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (315, 103, 249, 337, 561);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (316, 124, 241, 253, 452);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (317, 103, 251, 196, 333);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (318, 110, 148, 355, 480);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (319, 124, 241, 232, 148);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (320, 100, 242, 336, 425);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (321, 121, 58, 261, 180);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (322, 107, 31, 269, 253);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (323, 100, 242, 340, 434);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (324, 107, 31, 417, 561);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (325, 102, 166, 414, 356);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (326, 115, 56, 295, 368);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (327, 129, 97, 205, 107);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (328, 128, 259, 367, 291);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (329, 125, 51, 111, 242);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (330, 125, 50, 362, 183);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (331, 128, 260, 341, 339);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (332, 119, 199, 217, 230);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (333, 120, 284, 265, 107);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (334, 116, 68, 447, 483);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (335, 111, 278, 401, 211);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (336, 130, 93, 334, 314);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (337, 122, 142, 214, 547);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (338, 122, 144, 349, 574);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (339, 109, 215, 152, 252);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (340, 101, 193, 392, 473);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (341, 120, 282, 301, 112);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (342, 114, 188, 263, 575);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (343, 111, 277, 459, 167);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (344, 114, 186, 353, 517);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (345, 126, 71, 448, 132);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (346, 130, 94, 160, 574);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (347, 130, 92, 243, 175);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (348, 118, 162, 236, 108);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (349, 117, 289, 329, 238);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (350, 124, 240, 353, 446);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (352, 122, 142, 297, 224);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (353, 106, 138, 349, 366);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (354, 130, 93, 482, 504);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (355, 125, 51, 137, 131);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (356, 107, 33, 399, 249);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (357, 115, 57, 213, 161);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (358, 112, 292, 481, 208);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (360, 128, 259, 193, 250);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (361, 118, 160, 308, 413);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (362, 121, 58, 357, 352);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (363, 129, 98, 417, 126);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (365, 111, 277, 273, 194);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (366, 121, 57, 366, 453);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (367, 126, 69, 455, 317);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (368, 108, 151, 227, 230);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (369, 115, 56, 375, 144);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (370, 114, 188, 384, 212);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (371, 123, 164, 316, 187);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (372, 119, 199, 265, 481);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (373, 122, 143, 485, 495);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (374, 116, 68, 486, 487);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (375, 103, 251, 290, 505);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (376, 128, 259, 340, 193);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (377, 101, 192, 252, 148);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (378, 102, 167, 318, 273);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (379, 122, 139, 130, 383);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (380, 105, 167, 450, 347);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (381, 127, 120, 481, 432);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (382, 105, 167, 474, 198);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (383, 128, 260, 433, 259);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (384, 128, 259, 228, 575);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (385, 105, 166, 101, 317);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (386, 125, 50, 270, 407);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (387, 120, 284, 410, 267);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (388, 110, 147, 317, 401);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (389, 124, 242, 349, 181);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (390, 111, 278, 319, 152);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (391, 126, 69, 462, 286);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (392, 111, 277, 145, 119);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (393, 114, 187, 138, 338);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (394, 113, 169, 308, 120);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (395, 114, 187, 358, 377);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (396, 129, 98, 500, 256);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (397, 104, 261, 236, 127);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (398, 109, 214, 368, 489);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (399, 122, 144, 208, 265);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (400, 106, 137, 101, 533);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (401, 104, 263, 237, 132);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (402, 101, 192, 455, 446);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (403, 109, 216, 239, 290);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (404, 121, 58, 184, 391);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (405, 110, 147, 341, 381);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (406, 119, 198, 121, 579);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (407, 116, 70, 165, 385);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (408, 113, 172, 263, 354);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (409, 108, 151, 326, 275);
commit;
prompt 300 records committed...
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (410, 109, 215, 292, 225);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (411, 117, 287, 169, 101);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (412, 108, 149, 315, 208);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (413, 114, 187, 123, 432);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (414, 115, 56, 238, 268);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (415, 115, 55, 277, 355);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (416, 129, 99, 151, 111);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (417, 115, 57, 392, 272);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (418, 108, 149, 154, 301);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (419, 122, 143, 125, 295);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (420, 109, 215, 394, 435);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (421, 109, 214, 295, 431);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (422, 111, 277, 132, 229);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (423, 130, 94, 347, 375);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (424, 117, 287, 246, 528);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (425, 108, 149, 475, 272);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (426, 115, 56, 336, 206);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (428, 111, 277, 475, 252);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (429, 112, 295, 426, 312);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (430, 110, 147, 375, 142);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (431, 120, 283, 435, 180);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (432, 103, 249, 380, 340);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (433, 119, 197, 273, 220);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (434, 130, 94, 284, 103);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (435, 105, 167, 493, 448);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (436, 100, 240, 372, 169);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (437, 128, 259, 143, 262);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (438, 126, 71, 292, 300);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (439, 109, 215, 455, 461);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (440, 110, 146, 145, 195);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (441, 112, 294, 342, 300);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (442, 103, 250, 204, 198);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (443, 117, 288, 133, 110);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (444, 121, 56, 455, 104);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (445, 122, 144, 329, 235);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (446, 123, 165, 369, 238);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (447, 128, 257, 178, 479);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (448, 100, 241, 490, 543);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (449, 103, 248, 492, 479);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (450, 125, 51, 258, 488);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (452, 127, 121, 449, 285);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (453, 115, 57, 321, 426);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (454, 115, 57, 242, 561);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (455, 124, 242, 435, 455);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (456, 123, 164, 115, 186);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (457, 129, 97, 187, 449);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (458, 114, 187, 162, 492);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (459, 115, 57, 127, 514);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (460, 130, 93, 234, 480);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (461, 116, 70, 315, 315);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (462, 127, 121, 309, 427);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (463, 108, 151, 305, 167);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (464, 106, 138, 283, 420);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (465, 125, 49, 154, 203);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (466, 124, 240, 392, 383);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (467, 113, 171, 449, 561);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (468, 110, 146, 250, 202);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (469, 125, 50, 161, 141);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (470, 104, 261, 121, 300);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (471, 100, 242, 332, 322);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (472, 128, 259, 409, 368);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (473, 110, 147, 371, 439);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (474, 102, 167, 176, 505);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (475, 127, 118, 192, 293);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (476, 106, 138, 291, 385);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (477, 102, 167, 169, 317);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (478, 101, 193, 387, 163);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (479, 127, 120, 110, 233);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (480, 113, 171, 464, 559);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (481, 126, 71, 472, 178);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (482, 101, 192, 302, 260);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (483, 101, 190, 182, 420);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (484, 127, 120, 305, 374);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (485, 123, 165, 300, 163);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (486, 123, 164, 170, 136);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (487, 126, 68, 294, 156);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (488, 107, 33, 177, 290);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (489, 111, 277, 150, 140);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (490, 125, 51, 311, 258);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (491, 110, 146, 299, 106);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (492, 118, 161, 401, 365);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (493, 129, 99, 174, 133);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (494, 128, 260, 492, 468);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (495, 106, 136, 191, 333);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (496, 123, 163, 233, 419);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (497, 118, 161, 353, 295);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (498, 100, 242, 102, 208);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (499, 108, 150, 281, 401);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (500, 113, 172, 441, 445);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (501, 115, 57, 269, 453);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (502, 118, 162, 329, 129);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (503, 111, 278, 167, 130);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (504, 112, 296, 274, 113);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (505, 130, 94, 485, 449);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (506, 122, 144, 331, 433);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (507, 122, 144, 119, 109);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (508, 118, 162, 444, 117);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (509, 128, 260, 316, 197);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (510, 110, 148, 214, 103);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (511, 100, 242, 445, 245);
commit;
prompt 400 records committed...
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (512, 114, 188, 496, 307);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (513, 120, 284, 406, 128);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (514, 112, 296, 409, 436);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (515, 119, 199, 466, 270);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (516, 102, 167, 185, 161);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (517, 113, 172, 103, 122);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (518, 104, 263, 238, 559);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (520, 108, 151, 452, 554);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (521, 113, 172, 434, 557);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (522, 103, 251, 102, 322);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (523, 106, 138, 225, 173);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (524, 128, 260, 397, 355);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (525, 100, 242, 277, 195);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (526, 114, 188, 446, 285);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (527, 105, 168, 466, 334);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (528, 102, 167, 253, 558);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (529, 127, 121, 140, 255);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (530, 105, 168, 336, 326);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (531, 126, 71, 158, 439);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (532, 104, 263, 366, 338);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (533, 109, 216, 337, 260);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (534, 105, 168, 438, 272);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (535, 100, 242, 334, 424);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (536, 102, 167, 164, 534);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (537, 107, 33, 356, 103);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (538, 116, 70, 389, 327);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (539, 105, 168, 487, 306);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (540, 118, 162, 337, 129);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (541, 118, 162, 241, 348);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (543, 128, 260, 352, 155);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (544, 112, 296, 207, 568);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (545, 112, 296, 366, 555);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (546, 115, 57, 299, 333);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (547, 130, 94, 482, 469);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (548, 106, 138, 310, 557);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (549, 130, 94, 404, 260);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (550, 121, 58, 369, 335);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (551, 116, 70, 420, 308);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (553, 102, 167, 311, 419);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (554, 125, 51, 458, 503);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (555, 109, 216, 476, 147);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (556, 124, 242, 443, 379);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (558, 117, 289, 492, 452);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (559, 123, 165, 299, 281);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (560, 113, 172, 363, 421);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (561, 118, 162, 390, 321);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (562, 124, 242, 415, 103);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (563, 109, 216, 256, 543);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (564, 104, 263, 246, 315);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (565, 120, 284, 237, 563);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (566, 129, 99, 370, 359);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (567, 117, 289, 403, 402);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (568, 106, 138, 100, 332);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (570, 102, 167, 474, 483);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (571, 113, 172, 265, 352);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (572, 100, 242, 191, 367);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (573, 117, 289, 217, 286);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (574, 101, 193, 187, 178);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (575, 109, 216, 204, 567);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (576, 114, 188, 421, 394);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (577, 100, 242, 422, 186);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (578, 124, 242, 497, 256);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (579, 109, 216, 403, 380);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (580, 102, 167, 101, 452);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (581, 123, 165, 272, 157);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (582, 113, 172, 483, 125);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (583, 113, 172, 230, 572);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (584, 104, 263, 129, 122);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (585, 105, 168, 252, 579);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (586, 116, 70, 301, 105);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (587, 123, 165, 425, 339);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (588, 130, 94, 361, 368);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (589, 125, 51, 297, 193);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (590, 107, 33, 151, 553);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (591, 118, 162, 464, 289);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (592, 102, 167, 185, 295);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (593, 118, 162, 371, 250);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (594, 112, 296, 461, 242);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (595, 124, 242, 343, 503);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (596, 109, 216, 305, 303);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (597, 129, 99, 242, 271);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (598, 128, 260, 447, 430);
insert into SCHEDULES (scheduleid, theaterid, availableseats, movieid, dateid)
values (599, 121, 58, 347, 175);
commit;
prompt 483 records loaded
prompt Loading ORDERS...
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (59182, 188, 'Delivered', to_date('04-01-2024', 'dd-mm-yyyy'), 199640888, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65592, 90, 'Delivered', to_date('20-04-2024', 'dd-mm-yyyy'), 296255366, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (61398, 135, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 216541625, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (41599, 299, 'Delivered', to_date('28-02-2024', 'dd-mm-yyyy'), 296255366, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (80222, 259, 'Delivered', to_date('04-02-2024', 'dd-mm-yyyy'), 390110769, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (84259, 145, 'Delivered', to_date('06-04-2024', 'dd-mm-yyyy'), 789562188, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (56419, 269, 'Delivered', to_date('27-01-2024', 'dd-mm-yyyy'), 738961356, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (50051, 1, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 974693239, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (88351, 72, 'Delivered', to_date('22-02-2024', 'dd-mm-yyyy'), 966414435, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (88653, 179, 'Delivered', to_date('04-01-2024', 'dd-mm-yyyy'), 656442110, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (13604, 75, 'Delivered', to_date('13-03-2024', 'dd-mm-yyyy'), 464221141, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (52830, 135, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 739894646, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (90296, 149, 'Delivered', to_date('17-01-2024', 'dd-mm-yyyy'), 966414435, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (81313, 27, 'Delivered', to_date('26-04-2024', 'dd-mm-yyyy'), 586258847, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (12869, 179, 'Delivered', to_date('12-02-2024', 'dd-mm-yyyy'), 850094083, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (53802, 10, 'Delivered', to_date('06-02-2024', 'dd-mm-yyyy'), 620322646, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95864, 179, 'Delivered', to_date('24-01-2024', 'dd-mm-yyyy'), 861744214, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (26757, 140, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 605867286, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (27308, 7, 'Delivered', to_date('04-03-2024', 'dd-mm-yyyy'), 251002805, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70117, 59, 'Delivered', to_date('07-03-2024', 'dd-mm-yyyy'), 907287038, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (83038, 265, 'Delivered', to_date('03-05-2024', 'dd-mm-yyyy'), 689426993, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (77648, 159, 'Delivered', to_date('19-04-2024', 'dd-mm-yyyy'), 989065808, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (43344, 59, 'Delivered', to_date('27-02-2024', 'dd-mm-yyyy'), 275420456, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (55995, 375, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 709566924, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (91609, 9, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 157141811, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70838, 39, 'Delivered', to_date('18-01-2024', 'dd-mm-yyyy'), 836439971, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (62222, 239, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 390110769, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (26243, 10, 'Delivered', to_date('22-01-2024', 'dd-mm-yyyy'), 850094083, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (58566, 99, 'Delivered', to_date('26-01-2024', 'dd-mm-yyyy'), 894904744, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (91902, 69, 'Delivered', to_date('16-01-2024', 'dd-mm-yyyy'), 618573694, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (20340, 35, 'Delivered', to_date('28-02-2024', 'dd-mm-yyyy'), 224495473, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (55900, 10, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 771701713, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (21626, 115, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 654712365, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (17887, 159, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 445757640, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (43689, 9, 'Delivered', to_date('21-01-2024', 'dd-mm-yyyy'), 427332445, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (32407, 209, 'Delivered', to_date('09-05-2024', 'dd-mm-yyyy'), 166381326, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95080, 1, 'Delivered', to_date('12-05-2024', 'dd-mm-yyyy'), 589291628, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (59102, 119, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 942708002, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (51690, 5, 'Delivered', to_date('08-05-2024', 'dd-mm-yyyy'), 903486694, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (36670, 135, 'Delivered', to_date('25-04-2024', 'dd-mm-yyyy'), 282036733, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (88772, 344, 'Delivered', to_date('11-05-2024', 'dd-mm-yyyy'), 458886237, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (76341, 385, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 649748137, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (59034, 25, 'Delivered', to_date('05-01-2024', 'dd-mm-yyyy'), 974693239, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (29434, 45, 'Delivered', to_date('08-01-2024', 'dd-mm-yyyy'), 660797697, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (85504, 39, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 977753609, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (94380, 45, 'Delivered', to_date('27-01-2024', 'dd-mm-yyyy'), 560391764, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (57470, 44, 'Delivered', to_date('01-01-2024', 'dd-mm-yyyy'), 805854680, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (30440, 35, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 328879351, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (25469, 179, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 935291735, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (99235, 38, 'Delivered', to_date('17-04-2024', 'dd-mm-yyyy'), 129121934, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70591, 199, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 324402203, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (44549, 49, 'Received', to_date('25-05-2024', 'dd-mm-yyyy'), 202988966, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (12999, 125, 'Delivered', to_date('03-02-2024', 'dd-mm-yyyy'), 388964714, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (73356, 195, 'Delivered', to_date('24-02-2024', 'dd-mm-yyyy'), 833739957, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (19134, 375, 'Delivered', to_date('01-01-2024', 'dd-mm-yyyy'), 935291735, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (77882, 139, 'Delivered', to_date('29-04-2024', 'dd-mm-yyyy'), 295158882, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (60888, 79, 'Delivered', to_date('05-01-2024', 'dd-mm-yyyy'), 746060762, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (89590, 43, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 237093998, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (34274, 35, 'Delivered', to_date('18-04-2024', 'dd-mm-yyyy'), 454954065, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (75923, 265, 'Delivered', to_date('28-03-2024', 'dd-mm-yyyy'), 349840942, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (54264, 71, 'Delivered', to_date('26-01-2024', 'dd-mm-yyyy'), 756920718, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (40297, 385, 'Delivered', to_date('02-05-2024', 'dd-mm-yyyy'), 446436968, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (11979, 139, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 704448570, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (82193, 1, 'Delivered', to_date('05-03-2024', 'dd-mm-yyyy'), 190711252, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (27027, 149, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 777678448, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (22459, 28, 'Delivered', to_date('11-02-2024', 'dd-mm-yyyy'), 144207533, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (68154, 89, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 115550235, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49445, 18, 'Delivered', to_date('24-03-2024', 'dd-mm-yyyy'), 805401712, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (66170, 519, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 777766742, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (21832, 125, 'Delivered', to_date('15-01-2024', 'dd-mm-yyyy'), 192646604, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (20942, 579, 'Delivered', to_date('05-04-2024', 'dd-mm-yyyy'), 983955606, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (90871, 8, 'Delivered', to_date('14-05-2024', 'dd-mm-yyyy'), 785335488, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70342, 35, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 514205703, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (50309, 179, 'Delivered', to_date('02-04-2024', 'dd-mm-yyyy'), 463878923, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (48817, 265, 'Delivered', to_date('09-05-2024', 'dd-mm-yyyy'), 151517503, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (25495, 115, 'Delivered', to_date('25-01-2024', 'dd-mm-yyyy'), 216541625, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (55724, 142, 'Delivered', to_date('09-05-2024', 'dd-mm-yyyy'), 924245604, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (46222, 76, 'Ready', to_date('18-05-2024', 'dd-mm-yyyy'), 535355728, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (73066, 10, 'Delivered', to_date('21-01-2024', 'dd-mm-yyyy'), 530559367, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (27478, 194, 'Delivered', to_date('14-01-2024', 'dd-mm-yyyy'), 897322670, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (35602, 28, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 361558168, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (25069, 94, 'Delivered', to_date('01-04-2024', 'dd-mm-yyyy'), 197619991, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (57715, 219, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 202423128, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (33488, 24, 'Delivered', to_date('21-03-2024', 'dd-mm-yyyy'), 563480832, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (33364, 10, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 242192420, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (12632, 199, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 735716196, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (64409, 24, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 849303235, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (28977, 7, 'Delivered', to_date('17-02-2024', 'dd-mm-yyyy'), 907287038, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (99743, 185, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 479411599, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (25737, 20, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 815123821, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (77517, 69, 'Delivered', to_date('04-05-2024', 'dd-mm-yyyy'), 603150426, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (67538, 618, 'Delivered', to_date('08-04-2024', 'dd-mm-yyyy'), 987656414, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49599, 49, 'Delivered', to_date('17-03-2024', 'dd-mm-yyyy'), 409771057, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (32626, 250, 'Delivered', to_date('02-04-2024', 'dd-mm-yyyy'), 423632765, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (81401, 39, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 529782749, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (55270, 229, 'Delivered', to_date('01-03-2024', 'dd-mm-yyyy'), 575427604, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (77945, 25, 'Delivered', to_date('29-03-2024', 'dd-mm-yyyy'), 761433673, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (24870, 169, 'Delivered', to_date('08-05-2024', 'dd-mm-yyyy'), 946312472, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (94029, 149, 'Delivered', to_date('27-03-2024', 'dd-mm-yyyy'), 974693239, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65447, 9, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 177644588, 'N', null);
commit;
prompt 100 records committed...
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (59409, 28, 'Delivered', to_date('17-05-2024', 'dd-mm-yyyy'), 908589616, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (88324, 72, 'Delivered', to_date('19-05-2024', 'dd-mm-yyyy'), 497469605, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (61084, 78, 'Delivered', to_date('13-05-2024', 'dd-mm-yyyy'), 903277991, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (15420, 99, 'Delivered', to_date('18-01-2024', 'dd-mm-yyyy'), 322102919, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (68596, 35, 'Delivered', to_date('18-01-2024', 'dd-mm-yyyy'), 573755457, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (27300, 19, 'Delivered', to_date('15-03-2024', 'dd-mm-yyyy'), 360260555, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70313, 56, 'Delivered', to_date('02-01-2024', 'dd-mm-yyyy'), 427332445, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (48816, 35, 'Delivered', to_date('30-01-2024', 'dd-mm-yyyy'), 689426993, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (58886, 58, 'Delivered', to_date('12-01-2024', 'dd-mm-yyyy'), 654712365, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (73892, 70, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 733139526, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (34690, 109, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 927524225, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (54976, 209, 'Delivered', to_date('30-01-2024', 'dd-mm-yyyy'), 688095708, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (37145, 95, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 853517846, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (58849, 175, 'Delivered', to_date('19-04-2024', 'dd-mm-yyyy'), 423632765, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (59718, 69, 'Delivered', to_date('02-05-2024', 'dd-mm-yyyy'), 783806626, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (68695, 255, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 896757685, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49636, 8, 'Delivered', to_date('07-05-2024', 'dd-mm-yyyy'), 296255366, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (42600, 265, 'Delivered', to_date('15-04-2024', 'dd-mm-yyyy'), 649748137, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65660, 179, 'Delivered', to_date('14-01-2024', 'dd-mm-yyyy'), 282036733, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (26631, 39, 'Delivered', to_date('01-01-2024', 'dd-mm-yyyy'), 351022726, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (27738, 99, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 205272172, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (93938, 239, 'Delivered', to_date('20-03-2024', 'dd-mm-yyyy'), 504536643, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (13340, 399, 'Delivered', to_date('05-04-2024', 'dd-mm-yyyy'), 476782813, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (45695, 69, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 216541625, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (97641, 229, 'Received', to_date('21-05-2024', 'dd-mm-yyyy'), 487981995, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (37194, 875, 'Delivered', to_date('21-03-2024', 'dd-mm-yyyy'), 218763605, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (59889, 121, 'Delivered', to_date('29-01-2024', 'dd-mm-yyyy'), 909762395, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (99773, 85, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 899381603, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (24848, 16, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 681572378, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (99848, 145, 'Delivered', to_date('20-04-2024', 'dd-mm-yyyy'), 138000652, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (81934, 48, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 895204813, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (37868, 45, 'Delivered', to_date('25-01-2024', 'dd-mm-yyyy'), 438477170, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (42104, 255, 'Delivered', to_date('11-02-2024', 'dd-mm-yyyy'), 738961356, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (36951, 109, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 275420456, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70413, 229, 'Delivered', to_date('22-04-2024', 'dd-mm-yyyy'), 944370934, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (20030, 375, 'Delivered', to_date('15-05-2024', 'dd-mm-yyyy'), 826107453, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (87126, 121, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 366643056, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (19888, 20, 'Delivered', to_date('10-03-2024', 'dd-mm-yyyy'), 255733886, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (78934, 89, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 928549846, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (47475, 99, 'Delivered', to_date('23-04-2024', 'dd-mm-yyyy'), 544629310, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (98756, 159, 'Delivered', to_date('05-03-2024', 'dd-mm-yyyy'), 977753609, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (21392, 10, 'Delivered', to_date('16-05-2024', 'dd-mm-yyyy'), 682288204, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (29875, 3, 'Delivered', to_date('15-05-2024', 'dd-mm-yyyy'), 141067913, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (41047, 179, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 605867286, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (42371, 68, 'Delivered', to_date('15-05-2024', 'dd-mm-yyyy'), 352004805, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (50999, 45, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 652286041, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (60140, 75, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 903486694, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (77761, 22, 'Delivered', to_date('29-02-2024', 'dd-mm-yyyy'), 656234359, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (46483, 20, 'Delivered', to_date('14-05-2024', 'dd-mm-yyyy'), 252721669, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (61773, 76, 'Delivered', to_date('07-05-2024', 'dd-mm-yyyy'), 533475097, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (66321, 14, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 163717059, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (61805, 89, 'Delivered', to_date('24-04-2024', 'dd-mm-yyyy'), 395931910, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (76937, 365, 'Delivered', to_date('14-01-2024', 'dd-mm-yyyy'), 960671680, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (60239, 49, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 783806626, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (64517, 439, 'Delivered', to_date('20-03-2024', 'dd-mm-yyyy'), 915869687, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (84168, 94, 'Delivered', to_date('20-01-2024', 'dd-mm-yyyy'), 911729605, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (19516, 138, 'Delivered', to_date('13-01-2024', 'dd-mm-yyyy'), 847683496, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (84806, 69, 'Delivered', to_date('20-03-2024', 'dd-mm-yyyy'), 862513457, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (69001, 198, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 202988966, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (80621, 8, 'Delivered', to_date('17-05-2024', 'dd-mm-yyyy'), 907597444, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (86256, 109, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 496245735, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95732, 139, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 484733518, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (82772, 8, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 171880121, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (86660, 90, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 618573694, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (60728, 155, 'Delivered', to_date('06-01-2024', 'dd-mm-yyyy'), 362427181, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (19701, 106, 'Delivered', to_date('17-04-2024', 'dd-mm-yyyy'), 567225446, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (15279, 265, 'Delivered', to_date('04-01-2024', 'dd-mm-yyyy'), 190012393, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (99134, 99, 'Delivered', to_date('19-01-2024', 'dd-mm-yyyy'), 756920718, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (97579, 10, 'Delivered', to_date('25-03-2024', 'dd-mm-yyyy'), 977753609, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (36485, 135, 'Delivered', to_date('21-05-2024', 'dd-mm-yyyy'), 750919835, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (75930, 209, 'Delivered', to_date('13-02-2024', 'dd-mm-yyyy'), 993714527, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (87608, 139, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 328879351, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (36044, 99, 'Delivered', to_date('01-02-2024', 'dd-mm-yyyy'), 273626310, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (61886, 109, 'Delivered', to_date('19-03-2024', 'dd-mm-yyyy'), 500276225, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (80875, 109, 'Delivered', to_date('01-02-2024', 'dd-mm-yyyy'), 849466338, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (98527, 38, 'Delivered', to_date('08-03-2024', 'dd-mm-yyyy'), 620162965, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (76051, 519, 'Delivered', to_date('08-04-2024', 'dd-mm-yyyy'), 436759233, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (69995, 28, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 826107453, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (43910, 3, 'Delivered', to_date('03-05-2024', 'dd-mm-yyyy'), 193177293, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (61893, 92, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 738200510, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (87739, 89, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 446436968, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (75609, 155, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 320214197, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (88995, 249, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 805897636, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (87961, 35, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 371061470, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (91903, 209, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 575427604, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (42080, 385, 'Delivered', to_date('18-02-2024', 'dd-mm-yyyy'), 862513457, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (55213, 10, 'Delivered', to_date('26-02-2024', 'dd-mm-yyyy'), 224495473, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (19231, 59, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 673202124, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (26630, 45, 'Delivered', to_date('15-02-2024', 'dd-mm-yyyy'), 427332445, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (90988, 5, 'Delivered', to_date('04-03-2024', 'dd-mm-yyyy'), 975723107, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (76133, 145, 'Delivered', to_date('01-02-2024', 'dd-mm-yyyy'), 427332445, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (47456, 135, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 200082966, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (48748, 149, 'Delivered', to_date('11-05-2024', 'dd-mm-yyyy'), 179794254, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (78919, 18, 'Delivered', to_date('04-03-2024', 'dd-mm-yyyy'), 563480832, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (59943, 65, 'Delivered', to_date('19-02-2024', 'dd-mm-yyyy'), 805854680, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49835, 139, 'Delivered', to_date('01-04-2024', 'dd-mm-yyyy'), 242192420, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (63144, 219, 'Delivered', to_date('02-01-2024', 'dd-mm-yyyy'), 772545227, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (28836, 205, 'Delivered', to_date('20-04-2024', 'dd-mm-yyyy'), 507754009, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (18980, 30, 'Delivered', to_date('29-01-2024', 'dd-mm-yyyy'), 790353923, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (31887, 38, 'Delivered', to_date('25-04-2024', 'dd-mm-yyyy'), 747630593, 'N', null);
commit;
prompt 200 records committed...
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (39657, 115, 'in-preparation', to_date('19-05-2024', 'dd-mm-yyyy'), 179794254, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (81331, 519, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 218429826, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (19492, 18, 'Delivered', to_date('06-04-2024', 'dd-mm-yyyy'), 250944666, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (86739, 8, 'Delivered', to_date('10-01-2024', 'dd-mm-yyyy'), 576090664, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (32848, 189, 'Delivered', to_date('10-03-2024', 'dd-mm-yyyy'), 573755457, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (75486, 159, 'Delivered', to_date('13-02-2024', 'dd-mm-yyyy'), 756920718, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (55778, 23, 'Delivered', to_date('29-01-2024', 'dd-mm-yyyy'), 318322784, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (80531, 35, 'Delivered', to_date('23-05-2024', 'dd-mm-yyyy'), 420529630, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (86569, 75, 'Delivered', to_date('24-01-2024', 'dd-mm-yyyy'), 721140035, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (46819, 145, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 216541625, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (86234, 99, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 736264193, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95905, 85, 'Delivered', to_date('17-03-2024', 'dd-mm-yyyy'), 679380064, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49739, 9, 'Delivered', to_date('16-05-2024', 'dd-mm-yyyy'), 838802596, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (18733, 235, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 750919835, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (46561, 58, 'Delivered', to_date('05-03-2024', 'dd-mm-yyyy'), 336195988, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (21059, 299, 'Delivered', to_date('27-03-2024', 'dd-mm-yyyy'), 867830048, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (63034, 119, 'Delivered', to_date('23-05-2024', 'dd-mm-yyyy'), 833739957, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (63840, 35, 'Delivered', to_date('26-04-2024', 'dd-mm-yyyy'), 750119869, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (33204, 8, 'Delivered', to_date('13-03-2024', 'dd-mm-yyyy'), 640331895, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (71880, 179, 'Delivered', to_date('21-03-2024', 'dd-mm-yyyy'), 688095708, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (98441, 5, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 251066882, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (33769, 179, 'in-preparation', to_date('19-05-2024', 'dd-mm-yyyy'), 654684525, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (72289, 389, 'Delivered', to_date('11-03-2024', 'dd-mm-yyyy'), 900468358, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (56866, 159, 'Delivered', to_date('03-05-2024', 'dd-mm-yyyy'), 903277991, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (66958, 239, 'Delivered', to_date('17-03-2024', 'dd-mm-yyyy'), 349840942, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (67193, 659, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 815123821, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (67124, 8, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 896151890, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (16791, 595, 'Delivered', to_date('29-04-2024', 'dd-mm-yyyy'), 341627864, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (76381, 145, 'Delivered', to_date('19-02-2024', 'dd-mm-yyyy'), 497469605, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (74675, 289, 'Delivered', to_date('27-03-2024', 'dd-mm-yyyy'), 203881975, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95091, 40, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 894904744, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (93280, 149, 'Delivered', to_date('03-02-2024', 'dd-mm-yyyy'), 798816085, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (87787, 9, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 581815622, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65615, 159, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 644923088, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (91425, 215, 'Delivered', to_date('17-04-2024', 'dd-mm-yyyy'), 272724345, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (80447, 20, 'Delivered', to_date('12-01-2024', 'dd-mm-yyyy'), 935291735, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (19322, 23, 'Delivered', to_date('18-01-2024', 'dd-mm-yyyy'), 362427181, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (93691, 169, 'Delivered', to_date('21-01-2024', 'dd-mm-yyyy'), 388964714, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (24062, 289, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 399318419, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (24895, 95, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 501237230, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (34808, 7, 'Delivered', to_date('14-03-2024', 'dd-mm-yyyy'), 640019960, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (41614, 5, 'Delivered', to_date('24-04-2024', 'dd-mm-yyyy'), 152909198, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (85929, 149, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 704448570, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (61558, 121, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 620162965, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65762, 109, 'Delivered', to_date('07-04-2024', 'dd-mm-yyyy'), 153843514, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (21603, 229, 'Ready', to_date('23-05-2024', 'dd-mm-yyyy'), 654825535, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (97733, 6, 'Delivered', to_date('22-02-2024', 'dd-mm-yyyy'), 993714527, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95118, 105, 'Delivered', to_date('23-04-2024', 'dd-mm-yyyy'), 861744214, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (37671, 125, 'Delivered', to_date('19-03-2024', 'dd-mm-yyyy'), 216541625, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (56847, 106, 'Delivered', to_date('06-04-2024', 'dd-mm-yyyy'), 929328580, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (92098, 269, 'Delivered', to_date('01-04-2024', 'dd-mm-yyyy'), 898674199, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (47834, 198, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 458886237, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (71353, 8, 'Delivered', to_date('30-04-2024', 'dd-mm-yyyy'), 529665183, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (42565, 65, 'Delivered', to_date('15-04-2024', 'dd-mm-yyyy'), 203093493, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (72084, 155, 'Delivered', to_date('22-04-2024', 'dd-mm-yyyy'), 960671680, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (83491, 595, 'Delivered', to_date('06-04-2024', 'dd-mm-yyyy'), 484622079, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (41351, 165, 'Delivered', to_date('19-03-2024', 'dd-mm-yyyy'), 750919835, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (29727, 39, 'Delivered', to_date('02-05-2024', 'dd-mm-yyyy'), 990813819, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70495, 78, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 167375351, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (61649, 398, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 588037827, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (28857, 54, 'Delivered', to_date('11-03-2024', 'dd-mm-yyyy'), 761433673, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (96704, 8, 'Delivered', to_date('21-04-2024', 'dd-mm-yyyy'), 544629310, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (58572, 239, 'Delivered', to_date('30-04-2024', 'dd-mm-yyyy'), 903486694, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (76355, 2, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 336195988, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (28892, 1, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 701436220, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (74134, 169, 'Delivered', to_date('08-02-2024', 'dd-mm-yyyy'), 789224520, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (74919, 6, 'Delivered', to_date('21-04-2024', 'dd-mm-yyyy'), 237093998, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (44590, 159, 'Delivered', to_date('04-02-2024', 'dd-mm-yyyy'), 323148897, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49231, 92, 'Delivered', to_date('11-05-2024', 'dd-mm-yyyy'), 202890933, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (32723, 20, 'Delivered', to_date('07-05-2024', 'dd-mm-yyyy'), 805401712, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (78815, 29, 'Delivered', to_date('22-04-2024', 'dd-mm-yyyy'), 202938205, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65289, 289, 'Received', to_date('20-05-2024', 'dd-mm-yyyy'), 318322784, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (71930, 179, 'Delivered', to_date('27-02-2024', 'dd-mm-yyyy'), 563480832, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65915, 135, 'Delivered', to_date('13-01-2024', 'dd-mm-yyyy'), 202988966, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (32090, 48, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 871869784, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (91999, 299, 'Delivered', to_date('31-03-2024', 'dd-mm-yyyy'), 304261315, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (81587, 29, 'Delivered', to_date('17-05-2024', 'dd-mm-yyyy'), 463371951, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (54954, 159, 'Delivered', to_date('03-05-2024', 'dd-mm-yyyy'), 764421102, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (24835, 229, 'Delivered', to_date('12-02-2024', 'dd-mm-yyyy'), 974693239, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (62208, 119, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 604322566, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (31211, 327, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 395931910, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (37148, 359, 'Delivered', to_date('17-01-2024', 'dd-mm-yyyy'), 908589616, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (15782, 199, 'Delivered', to_date('26-05-2024', 'dd-mm-yyyy'), 987656414, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (48643, 75, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 530559367, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (83159, 72, 'Delivered', to_date('12-01-2024', 'dd-mm-yyyy'), 688095708, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (42625, 39, 'Delivered', to_date('05-02-2024', 'dd-mm-yyyy'), 529665183, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (24858, 45, 'Delivered', to_date('18-05-2024', 'dd-mm-yyyy'), 895204813, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (20029, 45, 'Delivered', to_date('24-04-2024', 'dd-mm-yyyy'), 833739957, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (62671, 399, 'Delivered', to_date('05-04-2024', 'dd-mm-yyyy'), 895204813, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (64860, 136, 'Delivered', to_date('08-02-2024', 'dd-mm-yyyy'), 221770313, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (37623, 10, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 867830048, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65475, 119, 'Delivered', to_date('27-02-2024', 'dd-mm-yyyy'), 272031711, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (17045, 119, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 353482730, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (52464, 125, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 597771718, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (59111, 11, 'Delivered', to_date('29-04-2024', 'dd-mm-yyyy'), 847683496, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (92215, 389, 'Delivered', to_date('19-01-2024', 'dd-mm-yyyy'), 903277991, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (62397, 259, 'Delivered', to_date('30-04-2024', 'dd-mm-yyyy'), 192646604, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (98632, 40, 'Delivered', to_date('31-01-2024', 'dd-mm-yyyy'), 164502431, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65668, 275, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 464221141, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (73079, 95, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 355899957, 'N', null);
commit;
prompt 300 records committed...
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (33286, 375, 'Delivered', to_date('21-02-2024', 'dd-mm-yyyy'), 682288204, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49082, 9, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 922094598, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70069, 55, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 701436220, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (75660, 119, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 911729605, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (94928, 152, 'Delivered', to_date('16-01-2024', 'dd-mm-yyyy'), 750919835, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (82646, 56, 'Delivered', to_date('17-05-2024', 'dd-mm-yyyy'), 221244365, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (92979, 125, 'Delivered', to_date('11-03-2024', 'dd-mm-yyyy'), 897322670, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (38435, 125, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 900468358, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (33271, 132, 'Received', to_date('22-05-2024', 'dd-mm-yyyy'), 795843818, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (18689, 36, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 764421102, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (33802, 169, 'Received', to_date('21-05-2024', 'dd-mm-yyyy'), 705165132, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (81348, 75, 'Delivered', to_date('29-03-2024', 'dd-mm-yyyy'), 655844485, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (27108, 255, 'Delivered', to_date('23-04-2024', 'dd-mm-yyyy'), 563480832, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (16625, 229, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 709566924, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (78421, 198, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 251002805, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (27249, 299, 'Delivered', to_date('04-03-2024', 'dd-mm-yyyy'), 533475097, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (39709, 16, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 197619991, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (21699, 109, 'Delivered', to_date('14-05-2024', 'dd-mm-yyyy'), 138000652, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (81336, 36, 'Delivered', to_date('14-01-2024', 'dd-mm-yyyy'), 909762395, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (32789, 89, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 838318068, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (56387, 55, 'Delivered', to_date('30-01-2024', 'dd-mm-yyyy'), 312294196, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (44544, 44, 'Delivered', to_date('14-04-2024', 'dd-mm-yyyy'), 416941052, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (26352, 118, 'Delivered', to_date('13-03-2024', 'dd-mm-yyyy'), 446436968, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (71835, 299, 'Delivered', to_date('08-01-2024', 'dd-mm-yyyy'), 181724644, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (38809, 95, 'Delivered', to_date('12-04-2024', 'dd-mm-yyyy'), 750919835, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95330, 7, 'Delivered', to_date('26-01-2024', 'dd-mm-yyyy'), 257662071, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (47782, 179, 'Delivered', to_date('26-04-2024', 'dd-mm-yyyy'), 202423128, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (36681, 20, 'Delivered', to_date('24-03-2024', 'dd-mm-yyyy'), 681572378, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (89117, 45, 'Delivered', to_date('25-03-2024', 'dd-mm-yyyy'), 129466992, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (37794, 43, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 756920718, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (27419, 75, 'Delivered', to_date('08-05-2024', 'dd-mm-yyyy'), 590210023, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (22328, 289, 'Delivered', to_date('19-04-2024', 'dd-mm-yyyy'), 963819761, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (94695, 198, 'Delivered', to_date('09-05-2024', 'dd-mm-yyyy'), 705165132, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95100, 24, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 201884188, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49245, 35, 'Delivered', to_date('09-04-2024', 'dd-mm-yyyy'), 929328580, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (25789, 44, 'Delivered', to_date('01-01-2024', 'dd-mm-yyyy'), 507754009, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (13297, 159, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 320214197, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95007, 24, 'Delivered', to_date('05-03-2024', 'dd-mm-yyyy'), 218429826, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (82691, 519, 'Delivered', to_date('04-05-2024', 'dd-mm-yyyy'), 181724644, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (92346, 129, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 449616736, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (24927, 78, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 709566924, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (97433, 149, 'Delivered', to_date('11-05-2024', 'dd-mm-yyyy'), 312294196, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (43069, 156, 'Delivered', to_date('25-04-2024', 'dd-mm-yyyy'), 979954238, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (96276, 25, 'Sent', to_date('26-05-2024', 'dd-mm-yyyy'), 898190326, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (65757, 125, 'Delivered', to_date('05-02-2024', 'dd-mm-yyyy'), 296255366, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (91881, 399, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 909589275, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (66680, 22, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 898190326, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (54648, 138, 'Delivered', to_date('24-03-2024', 'dd-mm-yyyy'), 193177293, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (59350, 10, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 603150426, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (30036, 39, 'Delivered', to_date('04-01-2024', 'dd-mm-yyyy'), 656442110, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (60302, 72, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 449860234, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (28357, 99, 'Delivered', to_date('07-04-2024', 'dd-mm-yyyy'), 221770313, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49352, 16, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 216541625, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (58785, 129, 'Delivered', to_date('24-02-2024', 'dd-mm-yyyy'), 970287710, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (95918, 23, 'Delivered', to_date('07-02-2024', 'dd-mm-yyyy'), 760945270, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (20127, 39, 'Sent', to_date('25-05-2024', 'dd-mm-yyyy'), 654712365, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (82287, 79, 'Delivered', to_date('20-02-2024', 'dd-mm-yyyy'), 990813819, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (41176, 40, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 353134007, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (43714, 45, 'Delivered', to_date('25-04-2024', 'dd-mm-yyyy'), 838802596, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (34742, 169, 'Delivered', to_date('22-04-2024', 'dd-mm-yyyy'), 826107453, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (66809, 42, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 923324345, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (52809, 385, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 523316363, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (58643, 5, 'Delivered', to_date('14-04-2024', 'dd-mm-yyyy'), 463371951, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (44583, 20, 'Delivered', to_date('17-03-2024', 'dd-mm-yyyy'), 312294196, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (35836, 289, 'Delivered', to_date('12-04-2024', 'dd-mm-yyyy'), 205272172, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (96721, 125, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 221244365, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (91377, 24, 'Delivered', to_date('29-03-2024', 'dd-mm-yyyy'), 185636514, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70179, 99, 'Delivered', to_date('18-04-2024', 'dd-mm-yyyy'), 805854680, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (15697, 89, 'Sent', to_date('23-05-2024', 'dd-mm-yyyy'), 273481859, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (57588, 15, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 369053838, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (83376, 43, 'Delivered', to_date('24-02-2024', 'dd-mm-yyyy'), 656234359, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (74382, 118, 'Delivered', to_date('11-02-2024', 'dd-mm-yyyy'), 251021859, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (62055, 69, 'Delivered', to_date('17-04-2024', 'dd-mm-yyyy'), 318322784, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49420, 19, 'in-preparation', to_date('24-05-2024', 'dd-mm-yyyy'), 906393556, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (39128, 35, 'Delivered', to_date('13-05-2024', 'dd-mm-yyyy'), 597936180, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (13231, 55, 'Delivered', to_date('16-02-2024', 'dd-mm-yyyy'), 704448570, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (66724, 209, 'Delivered', to_date('17-05-2024', 'dd-mm-yyyy'), 462977437, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (88687, 229, 'Delivered', to_date('10-01-2024', 'dd-mm-yyyy'), 203881975, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (79722, 24, 'Delivered', to_date('13-03-2024', 'dd-mm-yyyy'), 886831669, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (53224, 10, 'Delivered', to_date('13-01-2024', 'dd-mm-yyyy'), 181724644, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (28486, 265, 'Delivered', to_date('06-01-2024', 'dd-mm-yyyy'), 799777319, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (91497, 45, 'Delivered', to_date('21-04-2024', 'dd-mm-yyyy'), 497469605, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (70816, 18, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 732741572, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (98042, 35, 'Delivered', to_date('15-04-2024', 'dd-mm-yyyy'), 420529630, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (80923, 49, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 832430127, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (60090, 155, 'Delivered', to_date('12-01-2024', 'dd-mm-yyyy'), 640331895, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (40275, 35, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 594264009, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (12250, 38, 'Delivered', to_date('19-01-2024', 'dd-mm-yyyy'), 761433673, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (37009, 35, 'Delivered', to_date('17-05-2024', 'dd-mm-yyyy'), 987938231, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (79488, 6, 'Delivered', to_date('03-01-2024', 'dd-mm-yyyy'), 738200510, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (45203, 235, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 455396724, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (84999, 156, 'Delivered', to_date('24-02-2024', 'dd-mm-yyyy'), 152909198, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (99066, 99, 'Delivered', to_date('02-01-2024', 'dd-mm-yyyy'), 703201506, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (34030, 145, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 960671680, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (36975, 115, 'Delivered', to_date('25-05-2024', 'dd-mm-yyyy'), 235167090, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (54591, 99, 'Delivered', to_date('13-02-2024', 'dd-mm-yyyy'), 251066882, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (49361, 29, 'Delivered', to_date('04-05-2024', 'dd-mm-yyyy'), 257662071, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (42390, 259, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 336195988, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (28440, 209, 'Delivered', to_date('04-02-2024', 'dd-mm-yyyy'), 272724345, 'N', null);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid, issold, scheduleid)
values (14722, 25, 'Delivered', to_date('03-02-2024', 'dd-mm-yyyy'), 535781565, 'N', null);
commit;
prompt 400 records loaded
prompt Loading MEALORDER...
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 55270);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 55270);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 91377);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 173, 70179);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 64517);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 36485);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 30440);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 95864);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 636, 46483);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 27027);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 42625);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 173, 76355);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 364, 95100);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 25737);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 970, 54591);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 446, 80531);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 519, 65447);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 55900);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 21392);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 66958);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 87961);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 68596);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 364, 42390);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 62208);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 970, 77882);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 88995);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 43689);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 41599);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 41599);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 487, 49445);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 970, 97733);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 364, 52809);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 64409);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 95905);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 20942);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 50051);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 364, 61649);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 173, 42371);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 35602);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 446, 52464);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 66321);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 65475);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 173, 32407);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 48817);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 92346);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 26757);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 774, 72289);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 65615);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 36485);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 43910);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 58785);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 26243);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 88687);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 487, 80447);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 14722);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 487, 71880);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 95905);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 33286);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 62208);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 519, 59350);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 84259);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 11979);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 487, 15420);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 173, 88772);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 28892);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 774, 16625);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 20340);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 446, 88324);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 364, 76355);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 97733);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 68596);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 68695);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 32789);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 39657);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 487, 42600);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 65475);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 15420);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 519, 66958);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 774, 76051);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 70342);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 487, 19516);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 91902);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 58572);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 35602);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 39657);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 487, 63034);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 28977);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 97641);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 970, 71930);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 50309);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 643, 20029);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 173, 57715);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 446, 76381);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 43689);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 24835);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 774, 87961);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 74675);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 173, 22459);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 13231);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 774, 99848);
commit;
prompt 100 records committed...
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 12250);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 98527);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 364, 19134);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 87608);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 65447);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 99066);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 92215);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 98756);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 487, 89590);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 58849);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 25495);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 86569);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 364, 28857);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 446, 76937);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 62671);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 25469);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 94380);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 56387);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 970, 81313);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 49599);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 643, 81401);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 636, 27738);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 65615);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 82287);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 83376);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 446, 16625);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 67193);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 55995);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 99743);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 173, 74919);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 15279);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 173, 95080);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 42600);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 65475);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 970, 70838);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 50999);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 26630);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 643, 66680);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 22459);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 99235);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 970, 79488);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 487, 94928);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 99134);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 446, 41047);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 173, 91902);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 72289);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 99235);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 636, 31887);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 41176);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 636, 28486);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 364, 42080);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 49835);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 58785);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 44583);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 27419);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 643, 69995);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 57588);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 24848);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 487, 43910);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 173, 13340);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 28857);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 54264);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 76341);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 636, 55213);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 446, 65668);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 446, 31211);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 446, 33802);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 78934);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 91425);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 83159);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 970, 32723);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 970, 20029);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 636, 29875);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 487, 49739);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 173, 65757);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 519, 59182);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 60239);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 487, 93691);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 643, 28977);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 98756);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 446, 38435);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 446, 42600);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 774, 63034);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 24927);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 13340);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 774, 95732);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 64860);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 81313);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 61886);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 78919);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 40297);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 446, 91377);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 49231);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 46222);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 12999);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 519, 29875);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 90988);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 45203);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 636, 71930);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 59034);
commit;
prompt 200 records committed...
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 49835);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 66809);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 37194);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 643, 49835);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 58849);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 54976);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 97733);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 774, 46819);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 92098);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 173, 94029);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 446, 49245);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 75923);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 487, 29727);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 19134);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 26630);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 58849);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 80875);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 20340);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 77761);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 446, 65762);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 636, 45695);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 364, 83038);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 774, 61649);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 61805);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 970, 81348);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 30036);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 487, 22459);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 91999);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 487, 85504);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 970, 87608);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 446, 49636);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 28440);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 12999);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 519, 15782);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 774, 85929);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 88772);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 519, 45203);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 173, 75923);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 43069);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 774, 47456);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 69995);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 97733);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 59889);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 446, 43910);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 76937);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 446, 48816);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 96704);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 970, 25495);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 519, 43714);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 173, 32789);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 45695);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 446, 72084);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 59409);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 27249);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 65915);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 636, 76133);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 82772);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 38435);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 487, 59111);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 19322);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 173, 27108);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 519, 86256);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 774, 84259);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 774, 18689);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 774, 60728);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 48643);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 487, 78919);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 91902);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 446, 98042);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 49245);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 636, 88324);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 636, 33769);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 33769);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 173, 48748);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 13297);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 643, 31887);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 970, 61773);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 25789);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 643, 59111);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 364, 88772);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 33364);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 487, 47782);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 519, 67538);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 50999);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 91903);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 95905);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 30440);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 970, 91425);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 49245);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 91903);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 63144);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 86739);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 64409);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 19231);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 487, 70117);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 364, 16625);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 65915);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 91609);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 446, 80222);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 15782);
commit;
prompt 300 records committed...
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 643, 36975);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 65757);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 173, 21832);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 643, 17045);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 24858);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 643, 34274);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 14722);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 94029);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 91377);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 55724);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 92979);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 92215);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 90871);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 81313);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 46483);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 47475);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 446, 37868);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 96704);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 87126);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 69995);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 173, 47782);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 173, 34274);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 98632);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 519, 37794);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 19701);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 970, 82772);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 97579);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 173, 87961);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 43344);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 35836);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 21626);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 49420);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 970, 70313);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 55724);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 173, 38809);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 81336);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 519, 41614);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 32090);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 42390);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 70838);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 173, 49361);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 636, 63034);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 70495);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 55724);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 77882);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 61398);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 446, 29434);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 34690);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 15420);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 61893);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 49352);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 91497);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 84806);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 970, 35602);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 173, 92215);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 636, 26757);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 774, 96721);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 65447);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 13297);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 81348);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 15420);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 62222);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 774, 62222);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 54648);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 16625);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 173, 26243);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 22328);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 44544);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 57470);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 42104);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 59718);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 173, 13604);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 487, 47834);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 93280);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 173, 41614);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 774, 33286);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 80447);
commit;
prompt 377 records loaded
prompt Loading SCHEDULES1...
prompt Table is empty
prompt Loading THEATERS1...
insert into THEATERS1 (theaterid, theatername, capacity)
values (1, 'Main Theater', 150);
commit;
prompt 1 records loaded
prompt Loading WORKERS...
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (886633965, 'Kylie-Atkinson', 'Dishwasher', 9023, to_date('22-09-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (549264564, 'Sarah-Chestnut', 'Sous-chef', 9414, to_date('19-10-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (394524091, 'Rhea-Bragg', 'Delivery-guy', 8464, to_date('29-09-1988', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (333067647, 'Colm-Nicks', 'Chef', 9746, to_date('18-10-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (171664309, 'Simon-Vai', 'Cleaner', 10261, to_date('13-03-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (143274912, 'Elle-Mac', 'Dishwasher', 18299, to_date('17-07-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (719635118, 'Lindsay-Zane', 'Dishwasher', 7178, to_date('26-07-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (718339906, 'Tramaine-Milsap', 'Sous-chef', 9794, to_date('25-02-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (744468530, 'Penelope-Lopez', 'Delivery-guy', 7456, to_date('05-11-1965', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (799323735, 'Taylor-Rain', 'Delivery-guy', 6188, to_date('16-03-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (355004851, 'Forest-Short', 'Cleaner', 7978, to_date('20-08-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (611069104, 'Nastassja-Vannelli', 'Chef', 10174, to_date('01-01-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (962903534, 'Joaquin-MacNeil', 'Director', 9487, to_date('18-08-1965', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (753964648, 'Micky-Gaynor', 'Director', 6658, to_date('28-05-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (544633195, 'Spike-McCready', 'Director', 5277, to_date('19-05-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (464632858, 'Lois-Hatchet', 'Sous-chef', 8579, to_date('17-03-1981', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (334885243, 'Claire-Jenkins', 'Sous-chef', 8971, to_date('17-07-1960', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (314986077, 'Carrie-Anne-Stanley', 'Sous-chef', 7014, to_date('03-08-1955', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (131966671, 'Dwight-Gough', 'Cleaner', 6294, to_date('08-06-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (419094984, 'Beth-McCain', 'Director', 8461, to_date('06-09-1966', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (506838691, 'Melba-Klein', 'Director', 9474, to_date('23-02-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (550647367, 'Ernie-Shawn', 'Cleaner', 6521, to_date('01-11-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (207467856, 'Lynette-Black', 'Director', 7662, to_date('07-01-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (795997162, 'Nik-Sizemore', 'Delivery-guy', 6029, to_date('27-06-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (383489695, 'Rachid-Heron', 'Delivery-guy', 8522, to_date('27-09-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (701137116, 'Shirley-Webb', 'Dishwasher', 8380, to_date('27-04-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (811740389, 'Nils-Rebhorn', 'Delivery-guy', 7356, to_date('18-11-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (426483937, 'Neneh-Crudup', 'Dishwasher', 9566, to_date('09-08-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (192100963, 'Jeffery-Sartain', 'Dishwasher', 5938, to_date('12-02-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (534475954, 'Mel-Jeter', 'Cleaner', 7703, to_date('14-05-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (360876188, 'Samuel-Geldof', 'Dishwasher', 6924, to_date('01-12-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (812761051, 'Gin-Jeter', 'Delivery-guy', 9051, to_date('24-04-1959', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (268930432, 'Pablo-Warburton', 'Dishwasher', 9983, to_date('05-01-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (535752654, 'Jody-Finney', 'Chef', 6293, to_date('19-02-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (460691565, 'Pelvic-Chandler', 'Sous-chef', 9543, to_date('21-05-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (122887112, 'Earl-Dayne', 'Cleaner', 9104, to_date('04-03-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (790134037, 'Herbie-DiCaprio', 'Chef', 8302, to_date('10-02-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (818582464, 'Christopher-Palmieri', 'Dishwasher', 7745, to_date('13-12-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (998741113, 'Antonio-Reilly', 'Chef', 8371, to_date('04-10-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (130009704, 'Howie-Conley', 'Cleaner', 10238, to_date('09-09-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (669335166, 'Lucy-Coyote', 'Cleaner', 10208, to_date('20-09-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (536565440, 'Eddie-Guilfoyle', 'Delivery-guy', 5846, to_date('29-03-1990', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (625220482, 'Aida-Matthau', 'Sous-chef', 7230, to_date('06-03-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (318268161, 'Swoosie-Curry', 'Sous-chef', 9917, to_date('16-07-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (955194097, 'Carlene-Winwood', 'Chef', 8746, to_date('16-01-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (461411448, 'Isaac-Fiorentino', 'Director', 8305, to_date('01-02-1989', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (844980272, 'Joshua-Walker', 'Sous-chef', 9088, to_date('31-07-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (488696353, 'Paul-Richardson', 'Sous-chef', 8942, to_date('18-06-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (284533000, 'Pat-McGoohan', 'Delivery-guy', 6097, to_date('08-02-1982', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (727731831, 'Pelvic-Byrne', 'Delivery-guy', 5776, to_date('12-06-1966', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (387317698, 'Emm-Reubens', 'Cleaner', 7354, to_date('27-05-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (309569900, 'Dennis-Cobbs', 'Sous-chef', 5631, to_date('02-10-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (168794272, 'Tom-King', 'Chef', 6277, to_date('13-04-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (855608849, 'Alice-Roth', 'Chef', 9216, to_date('07-12-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (297990477, 'Rowan-O''Neal', 'Delivery-guy', 7500, to_date('07-12-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (255642288, 'Edward-Beck', 'Dishwasher', 5831, to_date('30-05-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (558276647, 'Whoopi-Sanchez', 'Director', 6157, to_date('15-06-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (273165130, 'Kristin-Flatts', 'Delivery-guy', 7529, to_date('16-04-1988', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (197897385, 'Belinda-Tate', 'Sous-chef', 6472, to_date('11-04-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (380714312, 'Jena-Spacey', 'Chef', 9724, to_date('14-11-1970', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (795260193, 'Gabrielle-Diggs', 'Cleaner', 5790, to_date('18-10-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (228021998, 'Shannyn-Leto', 'Cleaner', 7050, to_date('10-06-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (819536592, 'Raymond-Lyonne', 'Dishwasher', 10438, to_date('20-12-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (479092409, 'Trini-Foster', 'Cleaner', 9957, to_date('23-05-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (622686873, 'Christine-Holiday', 'Director', 7061, to_date('11-03-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (865424474, 'Jon-Short', 'Cleaner', 6819, to_date('03-03-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (376797326, 'Busta-Levy', 'Dishwasher', 7327, to_date('10-03-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (747046992, 'Frankie-Cagle', 'Sous-chef', 9581, to_date('27-01-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (359507764, 'LeVar-Polley', 'Sous-chef', 9632, to_date('04-04-1989', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (584144058, 'Ani-Cross', 'Cleaner', 9182, to_date('21-06-1990', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (768084873, 'Lara-Weaver', 'Chef', 9197, to_date('06-08-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (277604116, 'Tanya-Lovitz', 'Chef', 8306, to_date('17-06-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (242696947, 'Michelle-Stowe', 'Dishwasher', 10216, to_date('07-01-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (336825944, 'Ned-Adler', 'Chef', 7696, to_date('16-06-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (501667802, 'Yaphet-Englund', 'Sous-chef', 7407, to_date('31-10-1982', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (499781590, 'Frank-Conners', 'Dishwasher', 5562, to_date('25-10-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (713709839, 'Eric-Aglukark', 'Chef', 7156, to_date('07-03-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (430336249, 'Warren-Brothers', 'Sous-chef', 8351, to_date('09-12-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (121025184, 'Jerry-Russell', 'Cleaner', 8601, to_date('03-08-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (228936198, 'John-Reno', 'Dishwasher', 7377, to_date('27-12-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (982719305, 'Val-Crystal', 'Delivery-guy', 7820, to_date('16-01-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (492775897, 'Natascha-Stuart', 'Dishwasher', 9104, to_date('15-08-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (574638261, 'Morris-Rooker', 'Director', 8511, to_date('06-05-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (994888701, 'Mena-Warwick', 'Cleaner', 5065, to_date('04-12-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (315073992, 'Albertina-Rhames', 'Cleaner', 6299, to_date('15-01-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (829383402, 'Juliana-Hayes', 'Director', 6721, to_date('01-12-1981', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (752448780, 'Judy-Epps', 'Cleaner', 8565, to_date('17-09-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (425604389, 'Demi-Gibbons', 'Director', 7232, to_date('19-10-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (262201104, 'Donna-Spiner', 'Delivery-guy', 6931, to_date('23-11-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (722882082, 'Glenn-Matarazzo', 'Director', 8944, to_date('17-05-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (411206210, 'Bill-Gibbons', 'Chef', 8311, to_date('29-05-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (353095864, 'Frederic-Griggs', 'Chef', 7086, to_date('30-09-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (725842517, 'Pat-Visnjic', 'Sous-chef', 7130, to_date('27-05-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (789382847, 'Ron-Katt', 'Dishwasher', 7449, to_date('07-10-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (488703859, 'Stockard-Sinise', 'Director', 5655, to_date('08-11-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (308214700, 'Carole-Gracie', 'Delivery-guy', 7565, to_date('15-04-1995', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (522290889, 'Wesley-Lindo', 'Director', 6025, to_date('07-11-1969', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (500953635, 'Annette-Mars', 'Chef', 8140, to_date('08-10-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (806903873, 'Mary-Louise-Tah', 'Delivery-guy', 6911, to_date('23-05-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (404332006, 'Danni-Osborne', 'Chef', 8779, to_date('08-04-1983', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (668847990, 'Jonathan-Olyphant', 'Delivery-guy', 8921, to_date('16-01-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (652633305, 'Nils-Danes', 'Chef', 8740, to_date('10-04-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (497284454, 'Mos-Shalhoub', 'Dishwasher', 6657, to_date('23-02-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (276574532, 'Judge-Shalhoub', 'Director', 8760, to_date('18-07-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (614727484, 'Howie-Vicious', 'Cleaner', 6558, to_date('20-12-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (996112191, 'Mos-Arquette', 'Chef', 6698, to_date('05-05-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (259520422, 'Rosario-Penders', 'Sous-chef', 5914, to_date('23-06-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (298838557, 'Brooke-Rawls', 'Delivery-guy', 9526, to_date('19-03-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (749735483, 'Rowan-Yulin', 'Dishwasher', 6703, to_date('28-01-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (151190438, 'Kathy-Heald', 'Chef', 10415, to_date('04-10-1988', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (231274875, 'Denise-Harmon', 'Chef', 7632, to_date('01-02-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (634137117, 'Bobby-Bates', 'Delivery-guy', 8458, to_date('26-06-1984', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (524062213, 'Brittany-Peniston', 'Dishwasher', 7031, to_date('14-03-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (461680777, 'Pierce-Brown', 'Director', 5768, to_date('26-03-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (580213084, 'Roberta-De Niro', 'Director', 10484, to_date('04-10-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (784947221, 'Ritchie-Hoffman', 'Chef', 9991, to_date('18-03-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (179184793, 'Lionel-Ripley', 'Cleaner', 9837, to_date('30-01-1972', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (906866857, 'Ceili-Tierney', 'Dishwasher', 7970, to_date('17-03-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (373794154, 'Rutger-Duchovny', 'Delivery-guy', 7482, to_date('02-09-1965', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (532445967, 'Dick-Weller', 'Director', 7616, to_date('23-12-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (756547789, 'Micky-Berkoff', 'Dishwasher', 10051, to_date('13-07-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (290739361, 'Jeff-Dukakis', 'Delivery-guy', 6211, to_date('23-04-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (949062696, 'Thomas-Weller', 'Delivery-guy', 5402, to_date('28-05-1955', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (486857760, 'Celia-Robbins', 'Sous-chef', 9191, to_date('21-11-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (606243771, 'Collective-Harry', 'Sous-chef', 8568, to_date('22-03-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (931232113, 'Dustin-Brando', 'Director', 6643, to_date('27-05-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (449107156, 'Elizabeth-Michaels', 'Delivery-guy', 7015, to_date('06-07-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (471134871, 'Sally-Hawke', 'Cleaner', 10072, to_date('11-12-1956', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (840138313, 'Brian-Schiff', 'Delivery-guy', 8393, to_date('03-02-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (405013747, 'Malcolm-McBride', 'Cleaner', 9657, to_date('17-04-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (859518151, 'Elisabeth-Conway', 'Sous-chef', 8639, to_date('06-10-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (182415768, 'Barbara-Kelly', 'Dishwasher', 6050, to_date('08-01-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (173883880, 'Jane-Nugent', 'Delivery-guy', 6092, to_date('18-05-1984', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (681168260, 'Earl-Bradford', 'Sous-chef', 7474, to_date('13-01-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (878180135, 'Hal-Saxon', 'Sous-chef', 8001, to_date('20-12-1972', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (353483451, 'Jack-Heatherly', 'Dishwasher', 9607, to_date('11-07-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (491155942, 'Laura-Wilder', 'Delivery-guy', 8566, to_date('14-04-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (865986682, 'Tyrone-Birch', 'Dishwasher', 7065, to_date('18-11-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (396174177, 'Emma-Sandler', 'Dishwasher', 10411, to_date('25-06-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (858668229, 'Nina-Beckinsale', 'Director', 6470, to_date('18-08-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (907889083, 'Solomon-McCoy', 'Delivery-guy', 7121, to_date('07-04-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (225536517, 'Guy-Buscemi', 'Cleaner', 9363, to_date('04-11-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (589791847, 'Larnelle-Diesel', 'Chef', 7742, to_date('08-04-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (208639386, 'Curtis-McCoy', 'Cleaner', 9504, to_date('02-03-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (780957556, 'Oliver-Potter', 'Cleaner', 9371, to_date('04-12-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (819342302, 'Wang-Witt', 'Sous-chef', 5297, to_date('19-11-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (512549110, 'Elvis-Chung', 'Cleaner', 9742, to_date('24-08-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (878530182, 'Joanna-Duncan', 'Delivery-guy', 9885, to_date('16-02-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (994633620, 'Leelee-Crewson', 'Dishwasher', 9438, to_date('24-07-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (856288382, 'Mili-Ruiz', 'Chef', 8141, to_date('24-09-1970', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (853866878, 'Horace-Connelly', 'Sous-chef', 8629, to_date('16-08-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (913840631, 'Davis-Heron', 'Chef', 9116, to_date('11-10-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (858156979, 'Lari-Chan', 'Dishwasher', 5966, to_date('03-05-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (994966133, 'Cate-Cartlidge', 'Director', 6168, to_date('30-04-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (642196010, 'Alessandro-Stallone', 'Chef', 8029, to_date('22-11-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (258562500, 'Vertical-Gertner', 'Sous-chef', 6329, to_date('07-06-1957', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (392193120, 'Janeane-Gaynor', 'Cleaner', 8463, to_date('14-01-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (477354519, 'Crispin-Hynde', 'Cleaner', 5126, to_date('21-11-1959', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (225920093, 'Dorry-Leary', 'Director', 10206, to_date('21-05-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (472193198, 'Franco-Kier', 'Chef', 8424, to_date('28-10-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (893069423, 'Mindy-Bell', 'Director', 8929, to_date('04-07-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (873611755, 'Ronnie-Crimson', 'Chef', 8516, to_date('07-08-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (754258216, 'Emily-Matarazzo', 'Director', 5606, to_date('18-07-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (502305221, 'Dylan-Graham', 'Sous-chef', 10499, to_date('07-02-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (219233491, 'Wallace-Leachman', 'Director', 8821, to_date('02-09-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (549089202, 'Adrien-Holeman', 'Delivery-guy', 6190, to_date('05-12-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (158167749, 'Patty-Mills', 'Chef', 5731, to_date('18-02-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (957115597, 'Davey-Tambor', 'Director', 6605, to_date('24-06-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (577711489, 'Barry-Shocked', 'Cleaner', 8317, to_date('11-03-1996', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (298011916, 'Josh-Astin', 'Sous-chef', 10260, to_date('26-07-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (742358232, 'Jay-Shocked', 'Delivery-guy', 5801, to_date('24-09-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (878055329, 'Rosanna-Levine', 'Dishwasher', 5312, to_date('16-06-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (366122029, 'Rip-Northam', 'Dishwasher', 8396, to_date('11-10-1996', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (588270318, 'Crispin-Holeman', 'Chef', 5816, to_date('30-12-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (832860820, 'Gene-Checker', 'Director', 8247, to_date('25-10-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (345672173, 'Maxine-Lunch', 'Cleaner', 8586, to_date('25-09-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (292467836, 'Lorraine-Crouch', 'Sous-chef', 5732, to_date('20-01-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (195100751, 'Michael-Wine', 'Delivery-guy', 9964, to_date('08-09-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (702375505, 'Tzi-Steiger', 'Cleaner', 8504, to_date('04-07-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (918866751, 'Luke-Keen', 'Dishwasher', 5975, to_date('10-09-1984', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (661594084, 'Celia-Wong', 'Director', 7899, to_date('21-02-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (668099366, 'Albert-Romijn-Stamos', 'Sous-chef', 8166, to_date('28-11-1972', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (551173895, 'Tobey-Stevenson', 'Delivery-guy', 9131, to_date('20-11-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (351906438, 'Etta-Holden', 'Director', 9115, to_date('13-07-1995', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (494980064, 'Kathy-Benoit', 'Delivery-guy', 6385, to_date('12-10-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (631569343, 'Annie-Curry', 'Chef', 8903, to_date('03-03-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (321335320, 'Angela-Hershey', 'Cleaner', 6224, to_date('29-12-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (255883695, 'Billy-Michael', 'Director', 9542, to_date('07-01-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (261641954, 'Jeroen-Sawa', 'Cleaner', 7927, to_date('17-02-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (362645896, 'Stevie-Santa Rosa', 'Chef', 5641, to_date('12-04-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (455427394, 'Isabella-Hudson', 'Chef', 7164, to_date('31-05-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (926841070, 'Wes-Travolta', 'Delivery-guy', 6818, to_date('17-11-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (220146719, 'Boz-Firth', 'Delivery-guy', 5151, to_date('11-03-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (647199048, 'Louise-Wright', 'Sous-chef', 10120, to_date('20-01-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (932964346, 'Chalee-Kristofferson', 'Delivery-guy', 6157, to_date('28-06-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (229451753, 'Ice-Hunt', 'Chef', 8476, to_date('13-10-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (593959323, 'Tyrone-Evett', 'Delivery-guy', 5528, to_date('29-10-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (357958630, 'Kazem-Benet', 'Cleaner', 5943, to_date('16-08-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (362420906, 'Corey-Cummings', 'Delivery-guy', 9599, to_date('14-03-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (980700135, 'Mili-Collette', 'Dishwasher', 5764, to_date('28-12-1959', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (913456625, 'Cole-Milsap', 'Sous-chef', 8141, to_date('31-05-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (754861504, 'Julianne-Bachman', 'Dishwasher', 7492, to_date('17-05-1995', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (462135087, 'Lena-Faithfull', 'Delivery-guy', 9746, to_date('06-08-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (166895689, 'Gloria-Rundgren', 'Director', 9717, to_date('03-08-1995', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (302385709, 'Denise-Garber', 'Sous-chef', 5764, to_date('23-02-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (507621009, 'Sophie-Pressly', 'Chef', 8640, to_date('05-07-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (818988740, 'Roberta-Caine', 'Dishwasher', 8709, to_date('05-12-2013', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (882909089, 'Jude-Gore', 'Delivery-guy', 10028, to_date('23-05-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (486544440, 'Parker-Faithfull', 'Cleaner', 9758, to_date('12-12-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (996074180, 'Freddy-Rucker', 'Delivery-guy', 7292, to_date('04-04-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (813754771, 'Toni-Tomei', 'Chef', 6742, to_date('08-05-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (771408317, 'Joe-DeVito', 'Chef', 8740, to_date('05-06-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (858017575, 'Ralph-Gary', 'Sous-chef', 8270, to_date('23-12-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (554973419, 'Helen-Spacek', 'Delivery-guy', 7225, to_date('01-09-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (713111039, 'Joaquin-Holland', 'Dishwasher', 6362, to_date('10-04-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (517650332, 'Sigourney-Yorn', 'Chef', 7249, to_date('24-01-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (706079543, 'Hilary-Baranski', 'Chef', 9260, to_date('30-10-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (774333712, 'Andrea-Redford', 'Sous-chef', 7750, to_date('25-01-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (150543124, 'Tanya-Curry', 'Cleaner', 6770, to_date('06-05-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (399828289, 'Barbara-Goodman', 'Sous-chef', 6117, to_date('16-10-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (614763884, 'Kasey-Bailey', 'Director', 8820, to_date('14-04-1996', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (855335413, 'Sammy-Posey', 'Sous-chef', 5680, to_date('12-02-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (218358224, 'Lili-Lennox', 'Chef', 6082, to_date('11-01-1965', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (894974321, 'Loretta-Eder', 'Cleaner', 10200, to_date('25-07-1953', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (360432701, 'Andrae-Singh', 'Chef', 9826, to_date('30-09-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (466227015, 'Boyd-Salt', 'Sous-chef', 8116, to_date('08-07-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (281921262, 'Lucy-Meyer', 'Director', 8887, to_date('08-11-1981', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (229306755, 'Hal-Armatrading', 'Cleaner', 9084, to_date('29-10-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (420457209, 'Illeana-Forrest', 'Director', 5887, to_date('04-04-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (431561267, 'Machine-Carlton', 'Chef', 5540, to_date('20-04-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (182779884, 'Gran-Salt', 'Director', 7103, to_date('26-03-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (428577343, 'Rene-Gray', 'Director', 5343, to_date('18-02-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (870787183, 'Grace-Orton', 'Director', 5117, to_date('29-02-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (365875725, 'Jonny-Kirkwood', 'Delivery-guy', 7225, to_date('18-10-1988', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (719567243, 'Dar-Tisdale', 'Dishwasher', 7651, to_date('16-12-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (535085143, 'Juliana-Rickman', 'Director', 5598, to_date('01-06-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (339075958, 'Ann-Yulin', 'Director', 7209, to_date('30-05-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (362928866, 'Laurie-Platt', 'Chef', 9955, to_date('10-03-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (628904772, 'Janeane-Holy', 'Sous-chef', 6441, to_date('16-04-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (991357078, 'Bette-Plummer', 'Delivery-guy', 9398, to_date('05-11-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (346694314, 'Jesse-Hedaya', 'Director', 7836, to_date('10-06-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (518269533, 'Praga-Glover', 'Delivery-guy', 10057, to_date('14-09-1953', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (732971629, 'Lucy-Branagh', 'Chef', 9175, to_date('03-09-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (523828491, 'Lea-Barrymore', 'Cleaner', 7905, to_date('05-05-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (817411037, 'Carrie-Anne-Paltrow', 'Director', 6348, to_date('24-09-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (951806375, 'Davy-Domino', 'Delivery-guy', 7749, to_date('06-06-1953', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (142629699, 'Dick-Chinlund', 'Sous-chef', 9953, to_date('05-02-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (637634813, 'Machine-Hatchet', 'Chef', 5900, to_date('19-09-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (974962360, 'Ernie-Marsden', 'Chef', 8294, to_date('17-12-1953', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (552599520, 'Connie-Dreyfuss', 'Chef', 6297, to_date('05-10-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (516104146, 'Rich-Cattrall', 'Dishwasher', 7697, to_date('24-01-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (833625450, 'Noah-McLean', 'Sous-chef', 9596, to_date('25-05-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (296176965, 'Brent-Luongo', 'Director', 9252, to_date('15-10-1960', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (668096680, 'Rose-Zane', 'Director', 9988, to_date('17-06-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (595441751, 'Robin-Clinton', 'Director', 5895, to_date('07-03-1982', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (547599895, 'Benicio-Gray', 'Cleaner', 9265, to_date('02-11-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (408545424, 'Hope-Craddock', 'Delivery-guy', 8470, to_date('07-04-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (404480378, 'Parker-Owen', 'Director', 6905, to_date('07-05-1982', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (576302575, 'Maria-Spine', 'Chef', 10141, to_date('21-05-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (700654948, 'Edwin-Prinze', 'Chef', 9676, to_date('02-07-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (821122982, 'Mike-Chesnutt', 'Director', 5821, to_date('13-11-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (427015167, 'Goldie-Wilkinson', 'Cleaner', 9537, to_date('17-08-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (311084962, 'Chaka-Shelton', 'Director', 8996, to_date('19-10-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (416198611, 'Sara-Shocked', 'Delivery-guy', 8850, to_date('30-06-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (933210108, 'Gaby-McFadden', 'Sous-chef', 6073, to_date('03-03-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (149283744, 'Chalee-Zeta-Jones', 'Cleaner', 5171, to_date('27-10-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (234272756, 'Collective-Owen', 'Sous-chef', 10173, to_date('12-03-1955', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (459186191, 'Millie-McLachlan', 'Dishwasher', 9123, to_date('31-10-1966', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (320810829, 'Gran-Emmerich', 'Sous-chef', 6468, to_date('05-02-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (755756390, 'Lucy-Evanswood', 'Delivery-guy', 9628, to_date('01-05-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (565560307, 'Sona-Matthau', 'Director', 7007, to_date('01-02-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (953134195, 'Al-Lynne', 'Sous-chef', 8520, to_date('20-04-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (856424401, 'Donal-Crewson', 'Cleaner', 9111, to_date('18-11-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (724360420, 'Alfred-Streep', 'Sous-chef', 8282, to_date('21-08-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (568533024, 'Kurtwood-Jenkins', 'Delivery-guy', 7772, to_date('24-06-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (486023106, 'Madeline-Metcalf', 'Cleaner', 7449, to_date('18-12-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (884392525, 'Christina-Pollak', 'Delivery-guy', 8181, to_date('22-07-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (737938512, 'David-Jamal', 'Delivery-guy', 10419, to_date('12-02-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (531570152, 'Robby-O''Neal', 'Dishwasher', 9775, to_date('05-03-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (160644603, 'Hex-Brickell', 'Cleaner', 5202, to_date('23-04-1955', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (118468794, 'Lea-Gooding', 'Cleaner', 9943, to_date('21-02-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (206818154, 'Simon-Laws', 'Delivery-guy', 6382, to_date('27-06-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (248747551, 'Carol-Fiorentino', 'Dishwasher', 8790, to_date('13-10-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (144948788, 'Bobbi-Mueller-Stahl', 'Chef', 9769, to_date('22-12-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (150499253, 'Wes-Blanchett', 'Director', 8584, to_date('01-06-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (513603308, 'Saffron-Osbourne', 'Chef', 7555, to_date('06-11-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (222962696, 'Johnette-Aniston', 'Delivery-guy', 8794, to_date('20-04-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (277946958, 'Miguel-Dern', 'Chef', 7960, to_date('24-02-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (570214056, 'Gerald-Choice', 'Dishwasher', 9849, to_date('05-05-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (757966082, 'Colleen-Weir', 'Director', 7136, to_date('30-05-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (257948565, 'Jennifer-Hobson', 'Director', 6511, to_date('04-05-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (286725499, 'Jose-Harrison', 'Sous-chef', 5854, to_date('27-07-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (473908032, 'Elijah-Mohr', 'Cleaner', 7502, to_date('26-01-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (223660610, 'Bo-Cruise', 'Delivery-guy', 8737, to_date('13-10-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (772509749, 'Morgan-Armstrong', 'Sous-chef', 9279, to_date('18-12-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (503459771, 'Hilary-Cummings', 'Dishwasher', 7544, to_date('24-02-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (917565677, 'Andrea-Dench', 'Sous-chef', 5090, to_date('23-08-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (456648062, 'Juice-Kleinenberg', 'Director', 7292, to_date('05-12-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (614758568, 'Lara-Shepherd', 'Director', 5218, to_date('06-03-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (415761333, 'Leo-Pitney', 'Delivery-guy', 9204, to_date('25-03-1991', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (314430603, 'Liam-Benson', 'Delivery-guy', 8526, to_date('29-03-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (732110525, 'Mel-Mortensen', 'Chef', 9777, to_date('23-09-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (265240066, 'Caroline-Goodman', 'Sous-chef', 6722, to_date('06-01-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (383691830, 'Buffy-Balaban', 'Delivery-guy', 10464, to_date('17-06-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (554797202, 'Tom-McCoy', 'Chef', 5974, to_date('11-02-1990', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (243687120, 'Holly-Secada', 'Cleaner', 9744, to_date('03-03-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (651168122, 'Mark-Finn', 'Delivery-guy', 9253, to_date('08-04-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (301221329, 'Marisa-Swayze', 'Chef', 8100, to_date('22-04-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (736913428, 'Ashley-Harper', 'Sous-chef', 7566, to_date('10-02-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (792710108, 'Gailard-Coltrane', 'Director', 6664, to_date('27-02-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (238439344, 'Tea-Rourke', 'Chef', 8455, to_date('25-10-1984', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (535464425, 'Harold-Spector', 'Chef', 5040, to_date('04-03-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (731216901, 'Randall-Hamilton', 'Delivery-guy', 5910, to_date('04-11-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (199663225, 'Murray-Laws', 'Sous-chef', 7591, to_date('24-12-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (179202508, 'Lindsay-Blades', 'Director', 9079, to_date('17-08-1969', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (699249693, 'Judge-Wilder', 'Sous-chef', 7675, to_date('01-03-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (355682136, 'Chloe-Navarro', 'Cleaner', 6925, to_date('17-06-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (437862243, 'Chad-Bacon', 'Chef', 7127, to_date('03-05-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (626094671, 'Burt-Williamson', 'Dishwasher', 10215, to_date('02-05-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (701466901, 'Rik-Culkin', 'Dishwasher', 7982, to_date('16-06-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (384501096, 'Edwin-Richter', 'Director', 8481, to_date('26-01-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (267135514, 'Grant-Dayne', 'Dishwasher', 5708, to_date('24-01-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (657588397, 'Leonardo-Pesci', 'Sous-chef', 7345, to_date('19-06-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (519636463, 'Madeline-Bracco', 'Cleaner', 8972, to_date('23-04-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (945652635, 'Arturo-Rudd', 'Cleaner', 8854, to_date('09-10-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (811948984, 'Gwyneth-Paige', 'Director', 9698, to_date('09-06-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (925561192, 'Gordie-Garner', 'Director', 7702, to_date('16-04-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (472478879, 'Claire-Graham', 'Director', 5434, to_date('06-09-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (862916390, 'Noah-Peet', 'Chef', 6497, to_date('24-04-1996', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (972864512, 'Oro-Bergen', 'Delivery-guy', 9799, to_date('11-02-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (136198293, 'Liam-Steagall', 'Chef', 5446, to_date('15-04-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (214706402, 'Bret-Prowse', 'Sous-chef', 7508, to_date('02-07-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (608997777, 'Ellen-Khan', 'Chef', 9617, to_date('17-05-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (449109328, 'Liquid-Child', 'Delivery-guy', 7770, to_date('09-09-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (475339882, 'Harvey-Rossellini', 'Dishwasher', 8147, to_date('06-04-2013', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (898481372, 'Jonny-Morse', 'Chef', 9051, to_date('14-07-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (869764106, 'King-Purefoy', 'Chef', 8566, to_date('27-06-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (594478800, 'Jack-Starr', 'Sous-chef', 9964, to_date('29-11-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (644939423, 'Vern-Craven', 'Chef', 7588, to_date('16-01-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (723763437, 'Rueben-Broderick', 'Director', 7335, to_date('19-11-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (275147357, 'Donald-Stone', 'Sous-chef', 8552, to_date('23-07-1960', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (439905884, 'Pamela-Holliday', 'Cleaner', 9167, to_date('22-06-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (510633107, 'Lindsey-McCready', 'Cleaner', 6871, to_date('02-11-1989', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (766434556, 'Vern-Palin', 'Cleaner', 10048, to_date('21-02-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (296713624, 'Rhett-Spiner', 'Cleaner', 7650, to_date('13-01-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (327141679, 'Jonathan-Li', 'Chef', 9262, to_date('22-06-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (471531514, 'Austin-Bello', 'Delivery-guy', 7347, to_date('23-03-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (639757330, 'John-Henstridge', 'Cleaner', 5605, to_date('11-02-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (423010338, 'Sona-Kudrow', 'Sous-chef', 7137, to_date('11-09-1960', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (709102649, 'Dionne-Murray', 'Director', 9697, to_date('20-06-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (885566843, 'Lizzy-Coolidge', 'Delivery-guy', 8848, to_date('19-09-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (878055555, 'Dave-Shue', 'Cleaner', 6277, to_date('21-03-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (501580155, 'Salma-Feuerstein', 'Delivery-guy', 9631, to_date('19-01-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (561328954, 'Jason-Feore', 'Chef', 5270, to_date('04-03-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (661506793, 'Nigel-Haynes', 'Chef', 7236, to_date('06-01-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (487061452, 'Kirk-Collins', 'Sous-chef', 6631, to_date('25-06-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (469863737, 'Betty-Westerberg', 'Cleaner', 6048, to_date('18-05-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (737887232, 'Alfred-Lane', 'Dishwasher', 7225, to_date('08-10-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (350968456, 'Rosanna-Whitaker', 'Dishwasher', 9768, to_date('03-11-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (327596213, 'Deborah-Hidalgo', 'Chef', 8780, to_date('02-03-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (141658081, 'Salma-Frakes', 'Director', 7371, to_date('25-05-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (716162261, 'Gil-Cash', 'Cleaner', 6654, to_date('08-11-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (851543318, 'Roberta-Levine', 'Chef', 8263, to_date('27-05-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (777028343, 'Jonatha-Marx', 'Sous-chef', 7949, to_date('14-01-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (826908186, 'Harris-Tankard', 'Cleaner', 6726, to_date('14-07-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (286093075, 'Kyle-Liu', 'Cleaner', 5726, to_date('03-01-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (387700034, 'Bill-Cagle', 'Dishwasher', 10098, to_date('07-07-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (779620875, 'Jay-Zappacosta', 'Chef', 6352, to_date('21-03-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (784832057, 'Frankie-Ball', 'Delivery-guy', 9279, to_date('06-11-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (850520181, 'Sissy-Williamson', 'Dishwasher', 9719, to_date('22-12-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (436131650, 'Tcheky-Valentin', 'Chef', 9497, to_date('21-04-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (952434154, 'Patty-Pitt', 'Director', 7381, to_date('18-09-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (510379034, 'Jean-Murdock', 'Chef', 10436, to_date('21-07-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (114421674, 'Swoosie-Hersh', 'Director', 6856, to_date('26-06-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (151102830, 'Avril-Hoffman', 'Delivery-guy', 6648, to_date('23-07-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (969006386, 'Richard-Santana', 'Dishwasher', 10108, to_date('17-07-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (965132574, 'Nick-Eldard', 'Dishwasher', 5866, to_date('10-03-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (607482682, 'Gilberto-Benet', 'Sous-chef', 9980, to_date('16-09-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (623130405, 'Quentin-Capshaw', 'Cleaner', 10127, to_date('12-09-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (998589755, 'Rupert-Walker', 'Cleaner', 7099, to_date('18-06-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (974879690, 'Max-Carrington', 'Director', 6829, to_date('30-05-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (928887028, 'Taryn-Dupree', 'Dishwasher', 6507, to_date('18-04-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (304330600, 'Ty-Bacharach', 'Dishwasher', 9131, to_date('22-05-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (978719866, 'Seth-Van Der Beek', 'Cleaner', 7541, to_date('21-05-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (904958179, 'Ving-Fierstein', 'Sous-chef', 6816, to_date('17-05-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (825442235, 'Richie-Dillon', 'Delivery-guy', 6223, to_date('04-02-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (267099586, 'Sheryl-Hudson', 'Chef', 6029, to_date('28-09-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (387785187, 'Gordie-Dench', 'Delivery-guy', 7684, to_date('10-05-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (168937171, 'Mia-Pride', 'Chef', 8009, to_date('19-10-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (547482300, 'Campbell-Arkin', 'Sous-chef', 9374, to_date('12-06-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (629460708, 'Vienna-Harper', 'Sous-chef', 9225, to_date('06-03-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (295374274, 'Rory-Pullman', 'Cleaner', 9088, to_date('11-03-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (126186583, 'Cary-Pitt', 'Cleaner', 7543, to_date('13-08-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (704770476, 'Ashton-Garofalo', 'Dishwasher', 7569, to_date('21-02-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (591522810, 'Belinda-Root', 'Cleaner', 6326, to_date('24-11-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (579289656, 'Brian-Hatfield', 'Dishwasher', 9693, to_date('25-09-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (812779885, 'Wayne-Walker', 'Chef', 10092, to_date('01-04-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (844624266, 'Sylvester-Overstreet', 'Chef', 5013, to_date('25-12-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (305271909, 'Trey-Tarantino', 'Cleaner', 7636, to_date('19-12-1957', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (309228396, 'Lin-Borden', 'Director', 7190, to_date('23-09-1952', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (712436131, 'Azucar-Almond', 'Sous-chef', 8015, to_date('10-11-1960', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (248763975, 'Dom-Sevigny', 'Dishwasher', 7211, to_date('08-06-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (111523976, 'Rebecca-Cagle', 'Dishwasher', 9653, to_date('13-10-1965', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (284203126, 'Collin-Dysart', 'Director', 7857, to_date('27-08-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (431420896, 'Emm-Rispoli', 'Chef', 9898, to_date('30-05-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (932030371, 'Freddie-Raybon', 'Sous-chef', 7158, to_date('02-05-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (259057003, 'Winona-Sample', 'Chef', 8054, to_date('15-11-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (630484278, 'Latin-McElhone', 'Dishwasher', 8029, to_date('28-06-1996', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (281689216, 'Chely-Moffat', 'Director', 7840, to_date('08-02-1995', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (322309844, 'Curtis-Rippy', 'Director', 9305, to_date('06-09-2001', 'dd-mm-yyyy'));
commit;
prompt 410 records loaded
prompt Loading WORKERORDER...
insert into WORKERORDER (workerid, orderid)
values (114421674, 37148);
insert into WORKERORDER (workerid, orderid)
values (114421674, 46483);
insert into WORKERORDER (workerid, orderid)
values (121025184, 88324);
insert into WORKERORDER (workerid, orderid)
values (121025184, 90296);
insert into WORKERORDER (workerid, orderid)
values (130009704, 12250);
insert into WORKERORDER (workerid, orderid)
values (130009704, 95905);
insert into WORKERORDER (workerid, orderid)
values (141658081, 17045);
insert into WORKERORDER (workerid, orderid)
values (143274912, 20340);
insert into WORKERORDER (workerid, orderid)
values (143274912, 26243);
insert into WORKERORDER (workerid, orderid)
values (143274912, 42625);
insert into WORKERORDER (workerid, orderid)
values (143274912, 70117);
insert into WORKERORDER (workerid, orderid)
values (143274912, 93691);
insert into WORKERORDER (workerid, orderid)
values (144948788, 37194);
insert into WORKERORDER (workerid, orderid)
values (144948788, 54591);
insert into WORKERORDER (workerid, orderid)
values (150499253, 55900);
insert into WORKERORDER (workerid, orderid)
values (151102830, 37671);
insert into WORKERORDER (workerid, orderid)
values (151190438, 15782);
insert into WORKERORDER (workerid, orderid)
values (151190438, 18733);
insert into WORKERORDER (workerid, orderid)
values (151190438, 19888);
insert into WORKERORDER (workerid, orderid)
values (151190438, 25789);
insert into WORKERORDER (workerid, orderid)
values (158167749, 27027);
insert into WORKERORDER (workerid, orderid)
values (166895689, 99848);
insert into WORKERORDER (workerid, orderid)
values (168794272, 97733);
insert into WORKERORDER (workerid, orderid)
values (171664309, 24870);
insert into WORKERORDER (workerid, orderid)
values (171664309, 59111);
insert into WORKERORDER (workerid, orderid)
values (173883880, 76341);
insert into WORKERORDER (workerid, orderid)
values (182415768, 68154);
insert into WORKERORDER (workerid, orderid)
values (182779884, 99235);
insert into WORKERORDER (workerid, orderid)
values (197897385, 61893);
insert into WORKERORDER (workerid, orderid)
values (206818154, 61649);
insert into WORKERORDER (workerid, orderid)
values (206818154, 67538);
insert into WORKERORDER (workerid, orderid)
values (206818154, 92215);
insert into WORKERORDER (workerid, orderid)
values (208639386, 19888);
insert into WORKERORDER (workerid, orderid)
values (208639386, 56419);
insert into WORKERORDER (workerid, orderid)
values (208639386, 61084);
insert into WORKERORDER (workerid, orderid)
values (218358224, 66809);
insert into WORKERORDER (workerid, orderid)
values (219233491, 41047);
insert into WORKERORDER (workerid, orderid)
values (222962696, 76341);
insert into WORKERORDER (workerid, orderid)
values (223660610, 81348);
insert into WORKERORDER (workerid, orderid)
values (225536517, 43714);
insert into WORKERORDER (workerid, orderid)
values (225536517, 88687);
insert into WORKERORDER (workerid, orderid)
values (225920093, 27419);
insert into WORKERORDER (workerid, orderid)
values (228936198, 37671);
insert into WORKERORDER (workerid, orderid)
values (229306755, 58566);
insert into WORKERORDER (workerid, orderid)
values (229306755, 87126);
insert into WORKERORDER (workerid, orderid)
values (234272756, 87608);
insert into WORKERORDER (workerid, orderid)
values (238439344, 57470);
insert into WORKERORDER (workerid, orderid)
values (238439344, 66170);
insert into WORKERORDER (workerid, orderid)
values (238439344, 76381);
insert into WORKERORDER (workerid, orderid)
values (242696947, 33488);
insert into WORKERORDER (workerid, orderid)
values (243687120, 60140);
insert into WORKERORDER (workerid, orderid)
values (248747551, 50051);
insert into WORKERORDER (workerid, orderid)
values (255642288, 67124);
insert into WORKERORDER (workerid, orderid)
values (255883695, 80923);
insert into WORKERORDER (workerid, orderid)
values (255883695, 93938);
insert into WORKERORDER (workerid, orderid)
values (255883695, 99066);
insert into WORKERORDER (workerid, orderid)
values (258562500, 13340);
insert into WORKERORDER (workerid, orderid)
values (259520422, 28892);
insert into WORKERORDER (workerid, orderid)
values (259520422, 62397);
insert into WORKERORDER (workerid, orderid)
values (261641954, 11979);
insert into WORKERORDER (workerid, orderid)
values (261641954, 34274);
insert into WORKERORDER (workerid, orderid)
values (261641954, 61649);
insert into WORKERORDER (workerid, orderid)
values (261641954, 70413);
insert into WORKERORDER (workerid, orderid)
values (262201104, 78815);
insert into WORKERORDER (workerid, orderid)
values (262201104, 94928);
insert into WORKERORDER (workerid, orderid)
values (265240066, 25737);
insert into WORKERORDER (workerid, orderid)
values (267099586, 42080);
insert into WORKERORDER (workerid, orderid)
values (267099586, 77517);
insert into WORKERORDER (workerid, orderid)
values (267135514, 56866);
insert into WORKERORDER (workerid, orderid)
values (268930432, 12869);
insert into WORKERORDER (workerid, orderid)
values (273165130, 36975);
insert into WORKERORDER (workerid, orderid)
values (275147357, 53224);
insert into WORKERORDER (workerid, orderid)
values (275147357, 70342);
insert into WORKERORDER (workerid, orderid)
values (277604116, 56866);
insert into WORKERORDER (workerid, orderid)
values (277604116, 61805);
insert into WORKERORDER (workerid, orderid)
values (277604116, 61893);
insert into WORKERORDER (workerid, orderid)
values (277946958, 73066);
insert into WORKERORDER (workerid, orderid)
values (277946958, 82287);
insert into WORKERORDER (workerid, orderid)
values (281921262, 51690);
insert into WORKERORDER (workerid, orderid)
values (284533000, 15420);
insert into WORKERORDER (workerid, orderid)
values (284533000, 49361);
insert into WORKERORDER (workerid, orderid)
values (286725499, 85929);
insert into WORKERORDER (workerid, orderid)
values (292467836, 17045);
insert into WORKERORDER (workerid, orderid)
values (292467836, 18689);
insert into WORKERORDER (workerid, orderid)
values (292467836, 92346);
insert into WORKERORDER (workerid, orderid)
values (295374274, 70069);
insert into WORKERORDER (workerid, orderid)
values (295374274, 94029);
insert into WORKERORDER (workerid, orderid)
values (296176965, 21832);
insert into WORKERORDER (workerid, orderid)
values (297990477, 36670);
insert into WORKERORDER (workerid, orderid)
values (297990477, 78919);
insert into WORKERORDER (workerid, orderid)
values (297990477, 84999);
insert into WORKERORDER (workerid, orderid)
values (297990477, 95091);
insert into WORKERORDER (workerid, orderid)
values (298011916, 20340);
insert into WORKERORDER (workerid, orderid)
values (298011916, 73066);
insert into WORKERORDER (workerid, orderid)
values (302385709, 94928);
insert into WORKERORDER (workerid, orderid)
values (302385709, 97579);
insert into WORKERORDER (workerid, orderid)
values (304330600, 24870);
insert into WORKERORDER (workerid, orderid)
values (305271909, 80621);
insert into WORKERORDER (workerid, orderid)
values (311084962, 70179);
insert into WORKERORDER (workerid, orderid)
values (314430603, 81587);
commit;
prompt 100 records committed...
insert into WORKERORDER (workerid, orderid)
values (314986077, 54954);
insert into WORKERORDER (workerid, orderid)
values (315073992, 53224);
insert into WORKERORDER (workerid, orderid)
values (320810829, 61886);
insert into WORKERORDER (workerid, orderid)
values (320810829, 82646);
insert into WORKERORDER (workerid, orderid)
values (320810829, 90296);
insert into WORKERORDER (workerid, orderid)
values (334885243, 27419);
insert into WORKERORDER (workerid, orderid)
values (339075958, 76051);
insert into WORKERORDER (workerid, orderid)
values (339075958, 82287);
insert into WORKERORDER (workerid, orderid)
values (345672173, 82772);
insert into WORKERORDER (workerid, orderid)
values (351906438, 24062);
insert into WORKERORDER (workerid, orderid)
values (353095864, 63144);
insert into WORKERORDER (workerid, orderid)
values (353483451, 84999);
insert into WORKERORDER (workerid, orderid)
values (355004851, 26757);
insert into WORKERORDER (workerid, orderid)
values (355004851, 41047);
insert into WORKERORDER (workerid, orderid)
values (355004851, 54976);
insert into WORKERORDER (workerid, orderid)
values (357958630, 36975);
insert into WORKERORDER (workerid, orderid)
values (357958630, 85504);
insert into WORKERORDER (workerid, orderid)
values (360432701, 68154);
insert into WORKERORDER (workerid, orderid)
values (360432701, 69001);
insert into WORKERORDER (workerid, orderid)
values (360876188, 95905);
insert into WORKERORDER (workerid, orderid)
values (362928866, 87126);
insert into WORKERORDER (workerid, orderid)
values (362928866, 96721);
insert into WORKERORDER (workerid, orderid)
values (366122029, 56847);
insert into WORKERORDER (workerid, orderid)
values (366122029, 95091);
insert into WORKERORDER (workerid, orderid)
values (376797326, 42371);
insert into WORKERORDER (workerid, orderid)
values (376797326, 49739);
insert into WORKERORDER (workerid, orderid)
values (376797326, 66724);
insert into WORKERORDER (workerid, orderid)
values (383489695, 28977);
insert into WORKERORDER (workerid, orderid)
values (383691830, 77882);
insert into WORKERORDER (workerid, orderid)
values (384501096, 31211);
insert into WORKERORDER (workerid, orderid)
values (387317698, 49835);
insert into WORKERORDER (workerid, orderid)
values (387317698, 82772);
insert into WORKERORDER (workerid, orderid)
values (387700034, 12999);
insert into WORKERORDER (workerid, orderid)
values (387700034, 13340);
insert into WORKERORDER (workerid, orderid)
values (387700034, 92098);
insert into WORKERORDER (workerid, orderid)
values (387785187, 98527);
insert into WORKERORDER (workerid, orderid)
values (392193120, 91999);
insert into WORKERORDER (workerid, orderid)
values (396174177, 86256);
insert into WORKERORDER (workerid, orderid)
values (399828289, 59102);
insert into WORKERORDER (workerid, orderid)
values (404480378, 38809);
insert into WORKERORDER (workerid, orderid)
values (408545424, 29434);
insert into WORKERORDER (workerid, orderid)
values (408545424, 77761);
insert into WORKERORDER (workerid, orderid)
values (411206210, 26243);
insert into WORKERORDER (workerid, orderid)
values (411206210, 33204);
insert into WORKERORDER (workerid, orderid)
values (415761333, 25069);
insert into WORKERORDER (workerid, orderid)
values (416198611, 83159);
insert into WORKERORDER (workerid, orderid)
values (420457209, 12250);
insert into WORKERORDER (workerid, orderid)
values (427015167, 82287);
insert into WORKERORDER (workerid, orderid)
values (430336249, 89117);
insert into WORKERORDER (workerid, orderid)
values (431561267, 98632);
insert into WORKERORDER (workerid, orderid)
values (436131650, 41047);
insert into WORKERORDER (workerid, orderid)
values (436131650, 43069);
insert into WORKERORDER (workerid, orderid)
values (437862243, 12632);
insert into WORKERORDER (workerid, orderid)
values (439905884, 91425);
insert into WORKERORDER (workerid, orderid)
values (449107156, 43069);
insert into WORKERORDER (workerid, orderid)
values (449109328, 47456);
insert into WORKERORDER (workerid, orderid)
values (455427394, 19134);
insert into WORKERORDER (workerid, orderid)
values (456648062, 19134);
insert into WORKERORDER (workerid, orderid)
values (456648062, 78421);
insert into WORKERORDER (workerid, orderid)
values (459186191, 88687);
insert into WORKERORDER (workerid, orderid)
values (460691565, 73066);
insert into WORKERORDER (workerid, orderid)
values (461411448, 27249);
insert into WORKERORDER (workerid, orderid)
values (461680777, 67538);
insert into WORKERORDER (workerid, orderid)
values (462135087, 80531);
insert into WORKERORDER (workerid, orderid)
values (462135087, 86234);
insert into WORKERORDER (workerid, orderid)
values (466227015, 43714);
insert into WORKERORDER (workerid, orderid)
values (466227015, 88687);
insert into WORKERORDER (workerid, orderid)
values (469863737, 29875);
insert into WORKERORDER (workerid, orderid)
values (469863737, 46483);
insert into WORKERORDER (workerid, orderid)
values (469863737, 49245);
insert into WORKERORDER (workerid, orderid)
values (471134871, 38809);
insert into WORKERORDER (workerid, orderid)
values (471134871, 46222);
insert into WORKERORDER (workerid, orderid)
values (471531514, 77648);
insert into WORKERORDER (workerid, orderid)
values (472193198, 39657);
insert into WORKERORDER (workerid, orderid)
values (473908032, 96276);
insert into WORKERORDER (workerid, orderid)
values (475339882, 27249);
insert into WORKERORDER (workerid, orderid)
values (475339882, 70117);
insert into WORKERORDER (workerid, orderid)
values (479092409, 57715);
insert into WORKERORDER (workerid, orderid)
values (479092409, 70179);
insert into WORKERORDER (workerid, orderid)
values (486544440, 65915);
insert into WORKERORDER (workerid, orderid)
values (486857760, 63144);
insert into WORKERORDER (workerid, orderid)
values (487061452, 54591);
insert into WORKERORDER (workerid, orderid)
values (488703859, 60888);
insert into WORKERORDER (workerid, orderid)
values (492775897, 34690);
insert into WORKERORDER (workerid, orderid)
values (494980064, 47834);
insert into WORKERORDER (workerid, orderid)
values (494980064, 70591);
insert into WORKERORDER (workerid, orderid)
values (494980064, 87961);
insert into WORKERORDER (workerid, orderid)
values (500953635, 55900);
insert into WORKERORDER (workerid, orderid)
values (502305221, 26352);
insert into WORKERORDER (workerid, orderid)
values (503459771, 77945);
insert into WORKERORDER (workerid, orderid)
values (507621009, 81336);
insert into WORKERORDER (workerid, orderid)
values (510379034, 26243);
insert into WORKERORDER (workerid, orderid)
values (510379034, 66724);
insert into WORKERORDER (workerid, orderid)
values (510379034, 68596);
insert into WORKERORDER (workerid, orderid)
values (510379034, 98042);
insert into WORKERORDER (workerid, orderid)
values (510633107, 26243);
insert into WORKERORDER (workerid, orderid)
values (510633107, 29434);
insert into WORKERORDER (workerid, orderid)
values (510633107, 37868);
insert into WORKERORDER (workerid, orderid)
values (512549110, 22328);
insert into WORKERORDER (workerid, orderid)
values (518269533, 33802);
commit;
prompt 200 records committed...
insert into WORKERORDER (workerid, orderid)
values (519636463, 51690);
insert into WORKERORDER (workerid, orderid)
values (519636463, 65447);
insert into WORKERORDER (workerid, orderid)
values (522290889, 52830);
insert into WORKERORDER (workerid, orderid)
values (522290889, 78919);
insert into WORKERORDER (workerid, orderid)
values (524062213, 60090);
insert into WORKERORDER (workerid, orderid)
values (531570152, 40297);
insert into WORKERORDER (workerid, orderid)
values (531570152, 48748);
insert into WORKERORDER (workerid, orderid)
values (534475954, 56419);
insert into WORKERORDER (workerid, orderid)
values (536565440, 13340);
insert into WORKERORDER (workerid, orderid)
values (536565440, 15697);
insert into WORKERORDER (workerid, orderid)
values (536565440, 96721);
insert into WORKERORDER (workerid, orderid)
values (547482300, 48817);
insert into WORKERORDER (workerid, orderid)
values (547482300, 58785);
insert into WORKERORDER (workerid, orderid)
values (549089202, 15782);
insert into WORKERORDER (workerid, orderid)
values (549089202, 34808);
insert into WORKERORDER (workerid, orderid)
values (550647367, 82646);
insert into WORKERORDER (workerid, orderid)
values (554797202, 49245);
insert into WORKERORDER (workerid, orderid)
values (554797202, 78919);
insert into WORKERORDER (workerid, orderid)
values (554973419, 27738);
insert into WORKERORDER (workerid, orderid)
values (554973419, 45695);
insert into WORKERORDER (workerid, orderid)
values (558276647, 56847);
insert into WORKERORDER (workerid, orderid)
values (565560307, 46222);
insert into WORKERORDER (workerid, orderid)
values (568533024, 97641);
insert into WORKERORDER (workerid, orderid)
values (570214056, 39657);
insert into WORKERORDER (workerid, orderid)
values (570214056, 44544);
insert into WORKERORDER (workerid, orderid)
values (574638261, 30440);
insert into WORKERORDER (workerid, orderid)
values (576302575, 70413);
insert into WORKERORDER (workerid, orderid)
values (579289656, 43689);
insert into WORKERORDER (workerid, orderid)
values (580213084, 56847);
insert into WORKERORDER (workerid, orderid)
values (584144058, 72084);
insert into WORKERORDER (workerid, orderid)
values (589791847, 24848);
insert into WORKERORDER (workerid, orderid)
values (589791847, 27738);
insert into WORKERORDER (workerid, orderid)
values (591522810, 52464);
insert into WORKERORDER (workerid, orderid)
values (593959323, 21392);
insert into WORKERORDER (workerid, orderid)
values (593959323, 34742);
insert into WORKERORDER (workerid, orderid)
values (593959323, 83038);
insert into WORKERORDER (workerid, orderid)
values (593959323, 98042);
insert into WORKERORDER (workerid, orderid)
values (606243771, 76937);
insert into WORKERORDER (workerid, orderid)
values (608997777, 74919);
insert into WORKERORDER (workerid, orderid)
values (611069104, 24835);
insert into WORKERORDER (workerid, orderid)
values (611069104, 47475);
insert into WORKERORDER (workerid, orderid)
values (611069104, 65660);
insert into WORKERORDER (workerid, orderid)
values (614727484, 34274);
insert into WORKERORDER (workerid, orderid)
values (614763884, 65762);
insert into WORKERORDER (workerid, orderid)
values (622686873, 66724);
insert into WORKERORDER (workerid, orderid)
values (623130405, 50999);
insert into WORKERORDER (workerid, orderid)
values (623130405, 55995);
insert into WORKERORDER (workerid, orderid)
values (626094671, 50309);
insert into WORKERORDER (workerid, orderid)
values (628904772, 49082);
insert into WORKERORDER (workerid, orderid)
values (628904772, 88687);
insert into WORKERORDER (workerid, orderid)
values (629460708, 45695);
insert into WORKERORDER (workerid, orderid)
values (631569343, 27738);
insert into WORKERORDER (workerid, orderid)
values (634137117, 48816);
insert into WORKERORDER (workerid, orderid)
values (637634813, 75930);
insert into WORKERORDER (workerid, orderid)
values (637634813, 95118);
insert into WORKERORDER (workerid, orderid)
values (639757330, 66958);
insert into WORKERORDER (workerid, orderid)
values (639757330, 81336);
insert into WORKERORDER (workerid, orderid)
values (647199048, 36951);
insert into WORKERORDER (workerid, orderid)
values (651168122, 13604);
insert into WORKERORDER (workerid, orderid)
values (651168122, 25789);
insert into WORKERORDER (workerid, orderid)
values (651168122, 65447);
insert into WORKERORDER (workerid, orderid)
values (651168122, 98756);
insert into WORKERORDER (workerid, orderid)
values (661506793, 98632);
insert into WORKERORDER (workerid, orderid)
values (661594084, 41614);
insert into WORKERORDER (workerid, orderid)
values (661594084, 44544);
insert into WORKERORDER (workerid, orderid)
values (661594084, 97433);
insert into WORKERORDER (workerid, orderid)
values (668096680, 66724);
insert into WORKERORDER (workerid, orderid)
values (668847990, 35602);
insert into WORKERORDER (workerid, orderid)
values (668847990, 42371);
insert into WORKERORDER (workerid, orderid)
values (669335166, 88324);
insert into WORKERORDER (workerid, orderid)
values (699249693, 24848);
insert into WORKERORDER (workerid, orderid)
values (700654948, 15697);
insert into WORKERORDER (workerid, orderid)
values (700654948, 80923);
insert into WORKERORDER (workerid, orderid)
values (701137116, 94380);
insert into WORKERORDER (workerid, orderid)
values (704770476, 97733);
insert into WORKERORDER (workerid, orderid)
values (706079543, 59102);
insert into WORKERORDER (workerid, orderid)
values (706079543, 62055);
insert into WORKERORDER (workerid, orderid)
values (713111039, 59409);
insert into WORKERORDER (workerid, orderid)
values (713111039, 79488);
insert into WORKERORDER (workerid, orderid)
values (713709839, 65668);
insert into WORKERORDER (workerid, orderid)
values (713709839, 82646);
insert into WORKERORDER (workerid, orderid)
values (716162261, 48816);
insert into WORKERORDER (workerid, orderid)
values (718339906, 22459);
insert into WORKERORDER (workerid, orderid)
values (718339906, 60140);
insert into WORKERORDER (workerid, orderid)
values (719635118, 55900);
insert into WORKERORDER (workerid, orderid)
values (719635118, 75930);
insert into WORKERORDER (workerid, orderid)
values (722882082, 95118);
insert into WORKERORDER (workerid, orderid)
values (723763437, 60728);
insert into WORKERORDER (workerid, orderid)
values (727731831, 28836);
insert into WORKERORDER (workerid, orderid)
values (727731831, 49352);
insert into WORKERORDER (workerid, orderid)
values (731216901, 67193);
insert into WORKERORDER (workerid, orderid)
values (737887232, 57715);
insert into WORKERORDER (workerid, orderid)
values (737938512, 28440);
insert into WORKERORDER (workerid, orderid)
values (737938512, 33488);
insert into WORKERORDER (workerid, orderid)
values (752448780, 48748);
insert into WORKERORDER (workerid, orderid)
values (753964648, 80923);
insert into WORKERORDER (workerid, orderid)
values (754861504, 13604);
insert into WORKERORDER (workerid, orderid)
values (754861504, 76051);
insert into WORKERORDER (workerid, orderid)
values (754861504, 88653);
insert into WORKERORDER (workerid, orderid)
values (756547789, 37671);
commit;
prompt 300 records committed...
insert into WORKERORDER (workerid, orderid)
values (757966082, 77761);
insert into WORKERORDER (workerid, orderid)
values (766434556, 24927);
insert into WORKERORDER (workerid, orderid)
values (766434556, 33769);
insert into WORKERORDER (workerid, orderid)
values (772509749, 88653);
insert into WORKERORDER (workerid, orderid)
values (774333712, 54976);
insert into WORKERORDER (workerid, orderid)
values (774333712, 93691);
insert into WORKERORDER (workerid, orderid)
values (779620875, 59102);
insert into WORKERORDER (workerid, orderid)
values (779620875, 61398);
insert into WORKERORDER (workerid, orderid)
values (789382847, 56866);
insert into WORKERORDER (workerid, orderid)
values (792710108, 70117);
insert into WORKERORDER (workerid, orderid)
values (806903873, 92098);
insert into WORKERORDER (workerid, orderid)
values (811740389, 96721);
insert into WORKERORDER (workerid, orderid)
values (812779885, 33769);
insert into WORKERORDER (workerid, orderid)
values (812779885, 49245);
insert into WORKERORDER (workerid, orderid)
values (817411037, 27027);
insert into WORKERORDER (workerid, orderid)
values (817411037, 47782);
insert into WORKERORDER (workerid, orderid)
values (817411037, 49445);
insert into WORKERORDER (workerid, orderid)
values (818988740, 75609);
insert into WORKERORDER (workerid, orderid)
values (818988740, 94380);
insert into WORKERORDER (workerid, orderid)
values (819536592, 65915);
insert into WORKERORDER (workerid, orderid)
values (821122982, 59718);
insert into WORKERORDER (workerid, orderid)
values (821122982, 98527);
insert into WORKERORDER (workerid, orderid)
values (829383402, 63034);
insert into WORKERORDER (workerid, orderid)
values (833625450, 16791);
insert into WORKERORDER (workerid, orderid)
values (844980272, 59111);
insert into WORKERORDER (workerid, orderid)
values (850520181, 58849);
insert into WORKERORDER (workerid, orderid)
values (851543318, 20942);
insert into WORKERORDER (workerid, orderid)
values (853866878, 26243);
insert into WORKERORDER (workerid, orderid)
values (853866878, 61805);
insert into WORKERORDER (workerid, orderid)
values (855608849, 34690);
insert into WORKERORDER (workerid, orderid)
values (856288382, 17887);
insert into WORKERORDER (workerid, orderid)
values (856424401, 83038);
insert into WORKERORDER (workerid, orderid)
values (858017575, 26352);
insert into WORKERORDER (workerid, orderid)
values (858017575, 27419);
insert into WORKERORDER (workerid, orderid)
values (858017575, 80531);
insert into WORKERORDER (workerid, orderid)
values (858017575, 88995);
insert into WORKERORDER (workerid, orderid)
values (858156979, 71880);
insert into WORKERORDER (workerid, orderid)
values (858668229, 29434);
insert into WORKERORDER (workerid, orderid)
values (858668229, 98632);
insert into WORKERORDER (workerid, orderid)
values (862916390, 33488);
insert into WORKERORDER (workerid, orderid)
values (865424474, 74675);
insert into WORKERORDER (workerid, orderid)
values (873611755, 96704);
insert into WORKERORDER (workerid, orderid)
values (878055555, 34274);
insert into WORKERORDER (workerid, orderid)
values (878180135, 35602);
insert into WORKERORDER (workerid, orderid)
values (878180135, 57715);
insert into WORKERORDER (workerid, orderid)
values (882909089, 41351);
insert into WORKERORDER (workerid, orderid)
values (885566843, 98042);
insert into WORKERORDER (workerid, orderid)
values (886633965, 72289);
insert into WORKERORDER (workerid, orderid)
values (893069423, 60140);
insert into WORKERORDER (workerid, orderid)
values (894974321, 44583);
insert into WORKERORDER (workerid, orderid)
values (904958179, 46819);
insert into WORKERORDER (workerid, orderid)
values (906866857, 70342);
insert into WORKERORDER (workerid, orderid)
values (913456625, 74675);
insert into WORKERORDER (workerid, orderid)
values (913840631, 76355);
insert into WORKERORDER (workerid, orderid)
values (913840631, 87126);
insert into WORKERORDER (workerid, orderid)
values (918866751, 76341);
insert into WORKERORDER (workerid, orderid)
values (925561192, 27027);
insert into WORKERORDER (workerid, orderid)
values (925561192, 42600);
insert into WORKERORDER (workerid, orderid)
values (925561192, 98756);
insert into WORKERORDER (workerid, orderid)
values (926841070, 20030);
insert into WORKERORDER (workerid, orderid)
values (926841070, 28486);
insert into WORKERORDER (workerid, orderid)
values (928887028, 67538);
insert into WORKERORDER (workerid, orderid)
values (931232113, 75486);
insert into WORKERORDER (workerid, orderid)
values (932964346, 38435);
insert into WORKERORDER (workerid, orderid)
values (932964346, 49352);
insert into WORKERORDER (workerid, orderid)
values (933210108, 33204);
insert into WORKERORDER (workerid, orderid)
values (933210108, 43910);
insert into WORKERORDER (workerid, orderid)
values (933210108, 50051);
insert into WORKERORDER (workerid, orderid)
values (933210108, 65447);
insert into WORKERORDER (workerid, orderid)
values (951806375, 20942);
insert into WORKERORDER (workerid, orderid)
values (952434154, 37671);
insert into WORKERORDER (workerid, orderid)
values (952434154, 44544);
insert into WORKERORDER (workerid, orderid)
values (952434154, 61649);
insert into WORKERORDER (workerid, orderid)
values (953134195, 49636);
insert into WORKERORDER (workerid, orderid)
values (953134195, 70313);
insert into WORKERORDER (workerid, orderid)
values (955194097, 27308);
insert into WORKERORDER (workerid, orderid)
values (955194097, 33802);
insert into WORKERORDER (workerid, orderid)
values (955194097, 48816);
insert into WORKERORDER (workerid, orderid)
values (962903534, 98042);
insert into WORKERORDER (workerid, orderid)
values (969006386, 44590);
insert into WORKERORDER (workerid, orderid)
values (969006386, 56419);
insert into WORKERORDER (workerid, orderid)
values (972864512, 42080);
insert into WORKERORDER (workerid, orderid)
values (978719866, 42625);
insert into WORKERORDER (workerid, orderid)
values (980700135, 12632);
insert into WORKERORDER (workerid, orderid)
values (980700135, 13231);
insert into WORKERORDER (workerid, orderid)
values (980700135, 37671);
insert into WORKERORDER (workerid, orderid)
values (980700135, 49361);
insert into WORKERORDER (workerid, orderid)
values (991357078, 52464);
insert into WORKERORDER (workerid, orderid)
values (991357078, 80923);
insert into WORKERORDER (workerid, orderid)
values (994966133, 24848);
insert into WORKERORDER (workerid, orderid)
values (994966133, 59718);
insert into WORKERORDER (workerid, orderid)
values (994966133, 91903);
insert into WORKERORDER (workerid, orderid)
values (996074180, 39128);
insert into WORKERORDER (workerid, orderid)
values (998589755, 66809);
insert into WORKERORDER (workerid, orderid)
values (998589755, 87608);
insert into WORKERORDER (workerid, orderid)
values (998741113, 37868);
insert into WORKERORDER (workerid, orderid)
values (998741113, 38809);
insert into WORKERORDER (workerid, orderid)
values (998741113, 71353);
commit;
prompt 398 records loaded
prompt Enabling foreign key constraints for PRODUCT...
alter table PRODUCT enable constraint SYS_C008293;
prompt Enabling foreign key constraints for INGREDIENTS...
alter table INGREDIENTS enable constraint SYS_C008298;
alter table INGREDIENTS enable constraint SYS_C008299;
prompt Enabling foreign key constraints for SCHEDULES...
alter table SCHEDULES enable constraint SYS_C008373;
alter table SCHEDULES enable constraint SYS_C008374;
alter table SCHEDULES enable constraint SYS_C008375;
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint SYS_C008306;
alter table ORDERS enable constraint SYS_C008403;
prompt Enabling foreign key constraints for MEALORDER...
alter table MEALORDER enable constraint SYS_C008311;
alter table MEALORDER enable constraint SYS_C008312;
prompt Enabling foreign key constraints for SCHEDULES1...
alter table SCHEDULES1 enable constraint SYS_C008416;
alter table SCHEDULES1 enable constraint SYS_C008417;
alter table SCHEDULES1 enable constraint SYS_C008418;
prompt Enabling foreign key constraints for WORKERORDER...
alter table WORKERORDER enable constraint SYS_C008322;
alter table WORKERORDER enable constraint SYS_C008323;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for DATES...
alter table DATES enable all triggers;
prompt Enabling triggers for DATES1...
alter table DATES1 enable all triggers;
prompt Enabling triggers for MEALORTICKET...
alter table MEALORTICKET enable all triggers;
prompt Enabling triggers for PROVIDERS...
alter table PROVIDERS enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for INGREDIENTS...
alter table INGREDIENTS enable all triggers;
prompt Enabling triggers for THEATERS...
alter table THEATERS enable all triggers;
prompt Enabling triggers for MOVIES...
alter table MOVIES enable all triggers;
prompt Enabling triggers for SCHEDULES...
alter table SCHEDULES enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for MEALORDER...
alter table MEALORDER enable all triggers;
prompt Enabling triggers for SCHEDULES1...
alter table SCHEDULES1 enable all triggers;
prompt Enabling triggers for THEATERS1...
alter table THEATERS1 enable all triggers;
prompt Enabling triggers for WORKERS...
alter table WORKERS enable all triggers;
prompt Enabling triggers for WORKERORDER...
alter table WORKERORDER enable all triggers;
set feedback on
set define on
prompt Done.
