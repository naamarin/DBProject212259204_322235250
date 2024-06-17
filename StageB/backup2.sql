prompt PL/SQL Developer import file
prompt Created on Monday, 17 June 2024 by Naama
set feedback off
set define off
prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  custphonenumber VARCHAR2(20) not null,
  custname        VARCHAR2(20) not null,
  custaddress     VARCHAR2(20) not null,
  custid          INTEGER not null
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

prompt Creating MEAL...
create table MEAL
(
  mealid    INTEGER not null,
  mealname  VARCHAR2(20) not null,
  mealprice INTEGER not null
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
alter table MEAL
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
alter table MEAL
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
  references MEAL (MEALID);

prompt Creating ORDERS...
create table ORDERS
(
  orderid     INTEGER not null,
  orderprice  INTEGER not null,
  orderstatus VARCHAR2(20) not null,
  orderdate   DATE not null,
  custid      INTEGER not null
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
  add constraint CHK_ORDERPRICE
  check (orderPrice >= 0);

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
  references MEAL (MEALID);
alter table MEALORDER
  add foreign key (ORDERID)
  references ORDERS (ORDERID);

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
prompt Disabling triggers for MEAL...
alter table MEAL disable all triggers;
prompt Disabling triggers for PROVIDERS...
alter table PROVIDERS disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for INGREDIENTS...
alter table INGREDIENTS disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for MEALORDER...
alter table MEALORDER disable all triggers;
prompt Disabling triggers for WORKERS...
alter table WORKERS disable all triggers;
prompt Disabling triggers for WORKERORDER...
alter table WORKERORDER disable all triggers;
prompt Disabling foreign key constraints for PRODUCT...
alter table PRODUCT disable constraint SYS_C008293;
prompt Disabling foreign key constraints for INGREDIENTS...
alter table INGREDIENTS disable constraint SYS_C008298;
alter table INGREDIENTS disable constraint SYS_C008299;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint SYS_C008306;
prompt Disabling foreign key constraints for MEALORDER...
alter table MEALORDER disable constraint SYS_C008311;
alter table MEALORDER disable constraint SYS_C008312;
prompt Disabling foreign key constraints for WORKERORDER...
alter table WORKERORDER disable constraint SYS_C008322;
alter table WORKERORDER disable constraint SYS_C008323;
prompt Deleting WORKERORDER...
delete from WORKERORDER;
commit;
prompt Deleting WORKERS...
delete from WORKERS;
commit;
prompt Deleting MEALORDER...
delete from MEALORDER;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
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
prompt Deleting MEAL...
delete from MEAL;
commit;
prompt Deleting CUSTOMERS...
delete from CUSTOMERS;
commit;
prompt Loading CUSTOMERS...
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('039-8398799', 'Cloris-Alda', 'Americana,3 Catherin', 603150426);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('023-8516887', 'Suzanne-Smith', 'Blacksburg,84 Syracu', 871869784);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('042-7711130', 'Bridget-Singh', 'Szazhalombatta,10 An', 594264009);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('041-2415021', 'Emily-Newman', 'Duluth,65 Branagh St', 318322784);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('089-8614436', 'Goldie-Thornton', 'Waldorf,41 Spiner Dr', 771701713);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('092-5828737', 'Elvis-Wilkinson', 'Buffalo Grove,62nd S', 736264193);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('041-4302744', 'Jeanne-Gayle', 'Fort gordon,39 Walte', 897322670);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('093-3672397', 'Glenn-Lerner', 'Cleveland,56 Kim Str', 701436220);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('063-5360355', 'Kiefer-Francis', 'Tyne & Wear,25 Buffa', 760945270);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('016-7689682', 'Delbert-Wariner', 'Tampa,44 Dennis Stre', 942708002);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('052-9559177', 'Glenn-Haggard', 'Peachtree City,53rd ', 454954065);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('097-8522479', 'Nile-Winstone', 'Madrid,68 Coyote Str', 861744214);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('015-5239687', 'Mika-Cagle', 'Wavre,21 Cate Drive', 750919835);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('099-9267329', 'Robert-Willis', 'Cobham,16 Southend o', 399318419);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('017-1234280', 'Mos-Torino', 'Dorval,64 Joli Road', 129121934);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('043-7656492', 'Miles-Dafoe', 'Aracruz,52 Lang', 899381603);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('045-7619585', 'Brothers-Thorton', 'Trento,69 Longueuil ', 157141811);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('029-8464688', 'Ceili-Mantegna', 'Charleston,71 Marie ', 296255366);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('093-6560682', 'Tilda-Lizzy', 'Morioka,49 Craddock ', 251002805);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('012-5582955', 'Lucinda-Kinnear', 'Knutsford,89 Leo Str', 496245735);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('018-8901049', 'Andy-Mandrell', 'Richmond,198 Meniket', 535781565);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('096-5818880', 'Cathy-Cockburn', 'Londrina,46 Nivola D', 436759233);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('080-4200885', 'Carole-Doucette', 'Groton,86 Blossoms S', 838802596);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('080-8249575', 'Kristin-Hewett', 'Munich,77 Bloch Driv', 192646604);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('094-2891419', 'Rip-Perez', 'Bollensen,74 Dennis ', 463371951);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('035-1582562', 'Cathy-Goodman', 'Rimini,361 Tokyo Str', 560391764);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('095-5558258', 'Udo-Durning', 'West Sussex,292 Bett', 235167090);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('069-8754038', 'Jonathan-Affleck', 'Hjallerup,38 Piven S', 777766742);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('044-1678993', 'Glenn-Bush', 'Maryville,93 Daniel ', 909589275);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('073-9832543', 'Andy-Dourif', 'Newnan,52 Geldof Str', 390110769);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('060-6304918', 'Deborah-Sayer', 'Lexington,742 Hunt V', 185636514);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('011-5478891', 'Yaphet-Union', 'Bristol,80 Bonnie Bl', 252721669);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('068-5899621', 'Rene-Puckett', 'Archbold,53 Mint', 361558168);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('055-5700759', 'Jena-Phoenix', 'Bremen,11st Street', 970287710);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('080-5649752', 'Dwight-Brickell', 'Kobe,82 Brooks Road', 199640888);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('061-8391071', 'Kevin-Woodward', 'Pomona,63 Terrence S', 395931910);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('027-5161085', 'Dianne-Costner', 'Burlington,137 Lynch', 420529630);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('016-3799987', 'Franz-Mars', 'Neustadt,61 Chaka', 166381326);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('028-8498091', 'Gavin-Reno', 'Issaquah,674 Ray Str', 336195988);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('015-4966018', 'Halle-Mulroney', 'Pasadena,62 Rob Road', 747630593);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('016-4558986', 'Michael-Hyde', 'Santa Clarita,87 Rad', 739894646);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('074-6013851', 'Latin-Bachman', 'Rheinfelden,827 Kris', 790353923);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('016-3139520', 'Taye-Spall', 'Narrows,63 Vassar Bl', 983955606);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('033-1326052', 'Cameron-Cleese', 'Varzea grande,11 San', 190012393);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('062-7142077', 'Kris-McNeice', 'San Francisco,50 Mag', 903486694);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('045-8323623', 'Nick-Kilmer', 'Oslo,33 Nanci Road', 597936180);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('070-4983265', 'Bonnie-Ribisi', 'Pacific Grove,6 Thin', 987938231);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('014-6595202', 'Moe-Ford', 'Coppell,37 Geldof St', 993714527);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('017-9410536', 'Henry-Vicious', 'Mount Olive,58 Ricky', 605867286);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('068-6647843', 'Maceo-Penders', 'Vanderbijlpark,42nd ', 746060762);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('045-2835268', 'Jet-Berenger', 'El Paso,122 Marina R', 849303235);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('028-4140182', 'Mary-Weir', 'Lexington,35 Kadison', 908589616);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('049-5841158', 'Angela-Davidson', 'Appenzell,878 Atlas ', 654684525);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('066-6570024', 'Elias-Wainwright', 'Brisbane,28 Ball Str', 275420456);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('037-6201415', 'Tramaine-Brooks', 'San Mateo,888 Ramire', 529782749);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('072-1617259', 'Roberta-Pigott-Smith', 'Londrina,62 Bellevue', 273481859);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('078-4936561', 'Howard-Sandoval', 'Derwood,86 Perry Dri', 838318068);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('057-9197515', 'Selma-Popper', 'Herzlia,13 Jackson R', 355899957);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('031-1962278', 'Garland-Detmer', 'Bartlett,74 Rundgren', 205272172);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('084-2830712', 'Bo-Short', 'Des Plaines,97 Monro', 409771057);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('018-1790221', 'Eddie-Pollak', 'Bountiful,46 Ness Dr', 895204813);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('057-6458417', 'Joe-Chao', 'Guamo,93 Tal Road', 589291628);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('098-3999434', 'Ed-Moriarty', 'Maryville,24 Payton ', 705165132);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('097-5760855', 'Cary-Kane', 'Orleans,72nd Street', 144207533);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('088-5134506', 'Carlene-Klugh', 'Rosario,9 Costa Stre', 764421102);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('053-2418600', 'Praga-Lang', 'Ferraz  vasconcelos,', 946312472);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('035-3220135', 'Brooke-Dysart', 'High Wycombe,31 Slat', 922094598);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('069-4765539', 'Hank-Rickles', 'Silverdale,45 Garber', 563480832);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('022-6043469', 'Natacha-Broza', 'Angers,16 Collective', 573755457);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('053-9237850', 'Demi-Henriksen', 'Mobile,7 Emily Stree', 620322646);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('082-9958465', 'Sam-Reid', 'Saitama,634 Jackie B', 202988966);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('097-5865129', 'Miguel-Gunton', 'Vejle,23rd Street', 735716196);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('047-2563046', 'Holly-Renfro', 'St. Petersburg,760 P', 681572378);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('070-7717018', 'Ralph-Bonneville', 'Monroe,93rd Street', 181724644);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('022-6824283', 'Danni-Gill', 'Lake worth,92nd Stre', 353134007);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('087-2345157', 'Millie-Ball', 'Herzlia,180 Silverma', 652286041);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('061-5389186', 'Laurie-Berry', 'Ashland,63rd Street', 190711252);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('021-9360617', 'Ceili-Greene', 'Wetzlar,22nd Street', 257662071);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('055-6142289', 'Mena-urban', 'Goslar,666 Boyle Dri', 416941052);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('093-8777527', 'Curt-Lerner', 'Lakeville,58 Suzi Dr', 464221141);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('088-5310917', 'Daniel-Cockburn', 'Cuenca,69 Drew Stree', 783806626);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('069-9494423', 'Paul-Pitt', 'Toyama,722 Cook Stre', 507754009);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('027-7953606', 'Sharon-Hurt', 'Samrand,64 Geoffrey ', 896151890);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('036-5094971', 'Ving-Senior', 'Lodi,86 Moore Street', 576090664);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('016-6968487', 'Danny-Bradford', 'Sant Cugat Del Valle', 987656414);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('022-2276722', 'Lois-Elizabeth', 'Syracuse,170 Meyer A', 738200510);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('030-2568721', 'Jimmy-Pearce', 'Eiksmarka,17 Lou', 251066882);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('049-8731290', 'Brian-Downey', 'Whitehouse Station,6', 960671680);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('059-8436528', 'Pamela-Affleck', 'Campinas,65 Leigh St', 177644588);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('016-6599897', 'Meg-Sossamon', 'Immenstaad,408 Jody ', 738961356);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('028-2907067', 'Vonda-Carrere', 'San Jose,78 Meppel B', 449860234);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('019-6672849', 'Vickie-Darren', 'Exeter,93rd Street', 153843514);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('023-9065231', 'Ramsey-LaBelle', 'Bad Camberg,25 Dean ', 152909198);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('069-8815006', 'LeVar-Wahlberg', 'Dardilly,95 Friedric', 352004805);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('093-3144144', 'Chubby-Tippe', 'Cesena,40 LeVar Driv', 203881975);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('033-2194026', 'Dustin-Hawthorne', 'Milano,35 Robbins Dr', 928549846);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('044-1955068', 'Cameron-Wahlberg', 'Alessandria,1 Duvall', 312294196);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('067-8617590', 'Connie-Rollins', 'Takapuna,39 Salzburg', 618573694);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('043-6848004', 'Nikki-Dern', 'Louisville,16 Haynes', 850094083);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('072-7451073', 'Mike-Morrison', 'Tulsa,787 Gordon Str', 523316363);
commit;
prompt 100 records committed...
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('095-9291576', 'Lynn-Englund', 'Biel,36 Marshall Str', 304261315);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('077-2175527', 'Cherry-Tsettos', 'Zurich,85 Lawrence B', 789224520);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('015-9754161', 'Wallace-Midler', 'Vienna,48 Fariq Blvd', 909762395);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('071-3599094', 'Heath-MacPherson', 'Maebashi,75 Murray', 732741572);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('069-6016604', 'Marc-Magnuson', 'Cary,73rd Street', 423632765);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('046-3602401', 'Helen-Gallant', 'Mogi Guacu,80 Greenv', 862513457);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('046-3045462', 'Chaka-Fiorentino', 'St-laurent,92nd Stre', 660797697);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('088-9947248', 'Vickie-Warden', 'Toulouse,72 Lou Driv', 164502431);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('095-6953475', 'Janice-Duschel', 'Cleveland,80 Ryan Bl', 366643056);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('046-9426120', 'Viggo-Moreno', 'Huntsville,37 Ontive', 138000652);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('039-6797761', 'Chazz-Folds', 'Portland,102 Milton ', 709566924);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('093-7359833', 'Beverley-Kirshner', 'Kagoshima,71 Quinone', 906393556);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('098-9919026', 'Meredith-Hoffman', 'Thame,2 Dresden Blvd', 679380064);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('093-1271647', 'Carlene-Stiles', 'Sorocaba,55 Landau R', 927524225);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('096-1981062', 'Rip-Houston', 'Aurora,153 Coquitlam', 805854680);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('024-7586537', 'Pam-Allan', 'Melrose park,42 Neuw', 654825535);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('078-9336086', 'Jill-Keitel', 'Canberra,282 Woodwar', 463878923);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('084-7474177', 'Solomon-Lightfoot', 'Tilst,69 Pleasence S', 644923088);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('026-3662113', 'Corey-Morse', 'Redding,24 Twilley S', 733139526);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('034-8121049', 'Neve-Nicholson', 'Bartlesville,23 Mori', 750119869);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('056-8977964', 'Lily-Reilly', 'Giessen,174 Coe Driv', 369053838);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('093-1796080', 'Murray-Geldof', 'Richmond,35 Botti St', 900468358);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('012-8809438', 'Sean-Leto', 'Englewood Cliffs,8 H', 504536643);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('077-3132284', 'Thomas-Carrey', 'Highlands Ranch,41 C', 989065808);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('042-2062626', 'Doug-Carr', 'New Hyde Park,63rd S', 323148897);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('071-7357177', 'Trey-Camp', 'Waldbronn,22nd Stree', 203093493);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('045-1386274', 'Lynn-Nelson', 'Warrenton,2 McDonald', 836439971);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('035-9447057', 'Tanya-Karyo', 'Palo Alto,53 Milla D', 484733518);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('067-9816016', 'Red-Fichtner', 'Barnegat,57 Nancy Ro', 640331895);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('076-6758242', 'Ivan-Hedaya', 'Birkenhead,26 Vissel', 911729605);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('042-4695217', 'Oliver-Coverdale', 'Charleston,26 Robert', 832430127);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('048-7843412', 'Patrick-Orbit', 'Ricardson,5 Ledger S', 458886237);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('085-7992672', 'Remy-Magnuson', 'Obfelden,96 Stiles B', 251021859);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('072-7047995', 'Quentin-Summer', 'Irkutsk,58 Darius Av', 853517846);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('036-2782453', 'Kasey-Wiedlin', 'Warley,157 Carnes St', 898674199);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('056-7615871', 'Jane-Overstreet', 'Kopavogur,61 Gilley ', 567225446);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('035-4693995', 'Dennis-Del Toro', 'Granada Hills,56 Lin', 197619991);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('078-4880145', 'Mira-Gano', 'Dallas,94 Collin', 929328580);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('072-6469562', 'Terence-Penn', 'West Chester,923 Ess', 915869687);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('041-7561640', 'King-Whitley', 'Paderborn,41 Streep ', 977753609);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('098-5994659', 'Bobby-Fehr', 'Antwerpen,10 Powers ', 362427181);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('067-7846134', 'Charlize-Napolitano', 'Chaam,283 Redgrave S', 427332445);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('085-2934836', 'Harris-Schwimmer', 'Barksdale afb,34 Edm', 966414435);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('017-4665761', 'Adrien-Cattrall', 'Spring City,5 Helsin', 462977437);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('095-7109459', 'Garth-Phillippe', 'Goiania,33 Clark Str', 445757640);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('037-7021577', 'Mili-Gibson', 'Battle Creek,28 Vanc', 935291735);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('050-9955850', 'Kenneth-Uggams', 'Gifu,15 Zipf Street', 924245604);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('035-6398075', 'Latin-Reid', 'Bielefeld,1 Denzel A', 324402203);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('050-2373517', 'Stanley-Watley', 'Giessen,57 Birch Str', 295158882);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('070-4168203', 'Cyndi-Randal', 'Hjallerup,62 Dionne ', 597771718);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('090-5811378', 'Fiona-Tucci', 'Pusan-city,98 Quatro', 497469605);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('074-4583819', 'Charlie-Weisz', 'New hartford,55 Eber', 654712365);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('013-2416207', 'Gavin-Farina', 'Boston,86 Latin Road', 200082966);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('094-1220453', 'Renee-Arkin', 'Mapo-gu,80 Vaughan S', 975723107);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('079-6721717', 'First-Reinhold', 'High Wycombe,12nd St', 115550235);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('054-6693080', 'Rueben-Perlman', 'Knoxville,73 Athens ', 273626310);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('085-2841173', 'Renee-Sanders', 'Kaiserslautern,542 P', 163717059);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('064-2583921', 'Maureen-Jessee', 'Trento,45 San Jose', 867830048);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('029-1534493', 'Harriet-McCain', 'Chapel hill,79 Gosdi', 500276225);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('029-8320803', 'Jeanne-Borgnine', 'Dunn loring,265 Katt', 847683496);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('011-2106546', 'Edward-Guest', 'Courbevoie,17 Rutger', 201884188);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('040-7084106', 'Brent-LaSalle', 'Koblenz,23 Sheena Ro', 282036733);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('069-2963103', 'Juliet-Cruz', 'Park Ridge,9 Gosdin ', 193177293);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('051-7961115', 'Rik-Gellar', 'Bay Shore,54 Herbie ', 944370934);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('031-3359375', 'Daniel-Shaw', 'Foster City,326 Redg', 224495473);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('041-8670226', 'Isaiah-Damon', 'Ankara,74 Jenkins Ro', 388964714);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('090-2279209', 'Hector-Leto', 'Firenze,54 Estevez A', 789562188);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('098-4732493', 'Anita-Lang', 'Banbury,35 Chuck', 484622079);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('014-3788654', 'Thin-Horizon', 'Nanaimo,45 Tate Stre', 202938205);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('030-5713520', 'Mili-Raitt', 'Oxford,36 Bridget St', 777678448);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('031-8564677', 'Chrissie-Rhymes', 'South Weber,42 Jonat', 826107453);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('017-1648969', 'Chrissie-Alston', 'Baarn,33 Overstreet ', 544629310);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('095-9665937', 'Etta-Sylvian', 'Espoo,64 Spector Dri', 218429826);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('026-7580278', 'Hilary-Anderson', 'Orlando,448 Hong Kon', 455396724);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('061-6482468', 'Rhys-Ontiveros', 'Treviso,83rd Street', 487981995);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('060-2558353', 'Buddy-MacDonald', 'Hermitage,97 Machine', 272724345);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('023-7498613', 'Jon-Child', 'Chapel hill,82nd Str', 360260555);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('087-9815553', 'Larenz-Elwes', 'Madison,620 Pottendo', 974693239);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('021-8343650', 'Kevn-Foxx', 'Parma,83 Woodard Dri', 689426993);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('037-3894820', 'Rod-Womack', 'Corona,100 Anthony D', 990813819);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('074-1966368', 'Mark-Tucker', 'Scottsdale,93 Zeta-J', 923324345);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('038-4340258', 'Fats-Kinnear', 'Hjallerup,84 Vendett', 535355728);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('050-2737025', 'Bonnie-Hayek', 'Warrenton,100 Harnes', 202423128);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('078-1302674', 'April-Nolte', 'Borger,74 Coleman Av', 575427604);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('038-6108239', 'Aida-Bening', 'Slidel,82 Brad Stree', 151517503);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('094-1288151', 'Terri-Maguire', 'Sulzbach,27 Lloyd Dr', 673202124);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('057-7038562', 'Lynette-Barkin', 'Barnegat,686 Denny R', 655844485);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('091-2026131', 'Dustin-Duncan', 'Rockville,77 Carolin', 141067913);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('013-4233235', 'Uma-Kane', 'Caguas,20 Tilst Road', 849466338);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('042-2457156', 'Ernie-Flack', 'Coppell,8 Geggy', 341627864);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('035-6793852', 'Dar-Kidman', 'Granada Hills,65 Joa', 907287038);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('045-3638185', 'Aaron-Nicholson', 'Yamaguchi,91 Tierney', 656234359);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('088-3302509', 'Nina-El-Saher', 'Kagoshima,31 Farrow ', 167375351);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('019-8929169', 'Mint-Butler', 'El Dorado Hills,93 T', 272031711);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('042-3567257', 'Sara-Summer', 'Frederiksberg,61 Fir', 688095708);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('053-8214561', 'Ice-Hayek', 'Sugar Hill,92 Theron', 351022726);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('044-3666267', 'Sigourney-Forrest', 'Allen,67 Gates Stree', 446436968);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('099-6606819', 'Wes-Rollins', 'Albany,59 Nakai Driv', 530559367);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('072-4661896', 'Campbell-Crimson', 'Uden,468 Rhames Road', 529665183);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('018-1668589', 'Delbert-Curtis', 'Oldham,91 Pastore St', 218763605);
commit;
prompt 200 records committed...
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('051-8296868', 'Miki-Tsettos', 'Seatle,36 Gellar', 216541625);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('074-4635845', 'Pelvic-Carr', 'Saga,75 Colombo Driv', 682288204);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('033-6186961', 'Nancy-Braugher', 'Highlands Ranch,22 T', 761433673);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('024-1278402', 'Edgar-Peet', 'Manchester,50 Terren', 815123821);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('018-2667880', 'Jena-Dench', 'Royston,80 Lummen Av', 328879351);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('045-6049390', 'Mel-Murray', 'Forest Park,11 Keene', 501237230);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('059-7644421', 'Ethan-Springfield', 'Hong Kong,102 Bristo', 171880121);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('096-2948945', 'Winona-Rossellini', 'Birmensdorf,86 Domin', 179794254);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('089-1724938', 'Rosanna-Marley', 'Sidney,21 Charleston', 886831669);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('020-2181446', 'Frederic-Yorn', 'Middleburg Heights,4', 371061470);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('055-7923969', 'Ritchie-Mollard', 'Fountain Hills,550 R', 898190326);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('032-7632232', 'Tyrone-Branagh', 'Vienna,94 Kadison Ro', 903277991);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('039-9677405', 'King-Cage', 'Ludbreg,3 Donelly Ro', 640019960);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('031-8287208', 'Jodie-Arjona', 'Bellevue,91st Street', 721140035);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('040-8227749', 'Rene-Baker', 'Kobe,99 Tooele Ave', 581815622);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('079-8051246', 'Clay-Thurman', 'Glasgow,84 Gellar St', 514205703);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('065-3621101', 'Rade-Crouch', 'Leimen,73rd Street', 979954238);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('037-7363897', 'Debbie-Curtis-Hall', 'Chur,867 Warren Stre', 479411599);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('047-5680852', 'Jill-Tomlin', 'West Drayton,637 Bac', 656442110);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('052-4174061', 'Oded-Sepulveda', 'Zaandam,82nd Street', 129466992);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('094-5957232', 'Ronny-urban', 'Mayfield Village,486', 438477170);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('019-4625160', 'Alan-Hedaya', 'Cherepovets,472 Tzi', 255733886);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('061-7385493', 'Dermot-Wilkinson', 'Amsterdam,491 Machin', 221244365);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('018-9843011', 'Roger-Carrack', 'Freiburg,407 Callow ', 590210023);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('061-5155661', 'Mitchell-Connery', 'Carmichael,81st Stre', 704448570);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('027-5694090', 'Harold-McIntosh', 'Zürich,31 Linz Road', 250944666);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('073-4319496', 'Lynette-Geldof', 'Fort worth,85 Paul R', 785335488);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('095-1792468', 'Antonio-LaPaglia', 'London,99 Hope Road', 533475097);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('089-1517241', 'Herbie-Chapman', 'Billerica,99 Rosemea', 799777319);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('069-3544791', 'Lynn-Glover', 'Ribeirao preto,636 G', 353482730);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('016-9037187', 'Lizzy-Emmerich', 'Oak park,66 Jane Ave', 242192420);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('016-7608215', 'Lauren-Olyphant', 'Yamagata,32 Furay Ro', 963819761);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('032-4794151', 'Gil-Furtado', 'Herndon,11st Street', 833739957);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('036-5154258', 'Etta-Condition', 'Kumamoto,72nd Street', 221770313);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('099-3532311', 'Larenz-Sherman', 'Helsingborg,43 Keanu', 604322566);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('084-9608701', 'Joy-Weir', 'Cottbus,32nd Street', 586258847);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('029-3065148', 'Campbell-DiBiasio', 'Padova,711 Blaine Bl', 588037827);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('028-2427986', 'Oded-Michaels', 'Hannover,81st Street', 476782813);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('061-4590865', 'Paula-Palmieri', 'West Point,771 Broth', 756920718);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('032-9959348', 'Hope-Kurtz', 'Port Macquarie,65 Tu', 907597444);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('027-3932517', 'Lennie-Osment', 'Hines,65 Hoskins Dri', 805401712);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('078-8055438', 'Nicholas-Fierstein', 'Belmont,596 England ', 894904744);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('024-9901759', 'Tom-Nugent', 'Roma,29 Wiest Drive', 349840942);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('014-7292908', 'Molly-Lewis', 'Hamburg,13rd Street', 237093998);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('085-3994185', 'King-Warden', 'Solikamsk,76 Laws Ro', 798816085);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('082-2523246', 'Jeff-Raitt', 'Englewood Cliffs,79 ', 772545227);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('095-2181948', 'Chloe-Rock', 'San Diego,9 Madonna ', 795843818);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('027-6093694', 'Dwight-Lynch', 'Kaysville,91 Northbr', 320214197);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('096-1134292', 'Christopher-Brandt', 'Hiroshima,24 Beatty ', 322102919);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('051-3938459', 'Orlando-Tierney', 'Essen,49 Cedar Rapid', 805897636);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('029-9185478', 'Brad-Mulroney', 'Sursee,38 Nielsen St', 649748137);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('054-2979770', 'Wes-Cleese', 'Veenendaal,72 Talvin', 896757685);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('031-4761505', 'Famke-Coughlan', 'Barcelona,61 Solomon', 202890933);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('093-5566616', 'Marty-Tippe', 'Juneau,1 Yokohama Ro', 449616736);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('029-1977236', 'Tyrone-Rhodes', 'Greenville,25 Readin', 620162965);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('063-1522797', 'Roberta-Mazzello', 'Torino,76 Chazz Stre', 703201506);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('057-8988986', 'Mickey-Ramis', 'Bedford,509 Karyo Ro', 745982751);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('031-9263528', 'Derrick-Hobson', 'Glasgow,53rd Street', 867901175);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('071-5993066', 'Daryle-Pollack', 'Rosario,72 West Wind', 953195098);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('038-4856571', 'Harrison-Utada', 'St. Louis,87 Imbrugl', 616193234);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('053-2368470', 'Rosco-von Sydow', 'Mt. Laurel,84 Kaunas', 775307155);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('015-2100695', 'Kirsten-Byrne', 'Newbury,62 Waltham D', 318736190);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('071-2402750', 'Stevie-Damon', 'Paraju,53rd Street', 490314299);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('030-4808161', 'Renee-Stampley', 'Varzea grande,99 Ham', 346014580);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('040-8094439', 'Spencer-Kline', 'Encinitas,47 Perrine', 301677086);
insert into CUSTOMERS (custphonenumber, custname, custaddress, custid)
values ('081-3651072', 'Bob-Coburn', 'Jacksonville,29 Peet', 298257323);
commit;
prompt 266 records loaded
prompt Loading MEAL...
insert into MEAL (mealid, mealname, mealprice)
values (774, 'steak', 52);
insert into MEAL (mealid, mealname, mealprice)
values (519, 'kebab-skewer', 86);
insert into MEAL (mealid, mealname, mealprice)
values (487, 'salad', 112);
insert into MEAL (mealid, mealname, mealprice)
values (446, 'Meatballs', 32);
insert into MEAL (mealid, mealname, mealprice)
values (173, 'Dumplings', 37);
insert into MEAL (mealid, mealname, mealprice)
values (970, 'water', 34);
insert into MEAL (mealid, mealname, mealprice)
values (643, 'beer', 88);
insert into MEAL (mealid, mealname, mealprice)
values (636, 'entrecote-skewer', 20);
insert into MEAL (mealid, mealname, mealprice)
values (364, 'chicken-skewer', 132);
insert into MEAL (mealid, mealname, mealprice)
values (243, 'PatatasBravas', 18);
insert into MEAL (mealid, mealname, mealprice)
values (997, 'Shakshuka', 128);
insert into MEAL (mealid, mealname, mealprice)
values (908, 'Poutine', 144);
insert into MEAL (mealid, mealname, mealprice)
values (369, 'BakedBeans', 120);
insert into MEAL (mealid, mealname, mealprice)
values (816, 'FishCurry', 75);
insert into MEAL (mealid, mealname, mealprice)
values (982, 'PolloAsado', 112);
insert into MEAL (mealid, mealname, mealprice)
values (381, 'Sukiyaki', 21);
insert into MEAL (mealid, mealname, mealprice)
values (412, 'TunaMelt', 39);
insert into MEAL (mealid, mealname, mealprice)
values (357, 'Kebab', 16);
insert into MEAL (mealid, mealname, mealprice)
values (232, 'Cornbread', 95);
insert into MEAL (mealid, mealname, mealprice)
values (397, 'Mole', 142);
insert into MEAL (mealid, mealname, mealprice)
values (780, 'ChowMein', 37);
insert into MEAL (mealid, mealname, mealprice)
values (116, 'Paella', 36);
insert into MEAL (mealid, mealname, mealprice)
values (450, 'EggRoll', 124);
insert into MEAL (mealid, mealname, mealprice)
values (262, 'Vichyssoise', 86);
insert into MEAL (mealid, mealname, mealprice)
values (375, 'Goulash', 114);
insert into MEAL (mealid, mealname, mealprice)
values (893, 'PekingDuck', 91);
insert into MEAL (mealid, mealname, mealprice)
values (463, 'Quesadilla', 107);
insert into MEAL (mealid, mealname, mealprice)
values (254, 'StuffedPeppers', 144);
insert into MEAL (mealid, mealname, mealprice)
values (699, 'LambChops', 91);
insert into MEAL (mealid, mealname, mealprice)
values (926, 'TarteTatin', 134);
insert into MEAL (mealid, mealname, mealprice)
values (691, 'Pasta', 92);
insert into MEAL (mealid, mealname, mealprice)
values (246, 'HushPuppies', 67);
insert into MEAL (mealid, mealname, mealprice)
values (740, 'Steak', 105);
insert into MEAL (mealid, mealname, mealprice)
values (471, 'Enchiladas', 94);
insert into MEAL (mealid, mealname, mealprice)
values (239, 'PulledPork', 99);
insert into MEAL (mealid, mealname, mealprice)
values (999, 'Ratatouille', 118);
insert into MEAL (mealid, mealname, mealprice)
values (761, 'Moussaka', 106);
insert into MEAL (mealid, mealname, mealprice)
values (520, 'Macaroni', 44);
insert into MEAL (mealid, mealname, mealprice)
values (600, 'CrabCakes', 69);
insert into MEAL (mealid, mealname, mealprice)
values (121, 'VeggieBurger', 33);
insert into MEAL (mealid, mealname, mealprice)
values (581, 'Tiramisu', 62);
insert into MEAL (mealid, mealname, mealprice)
values (284, 'Laksa', 25);
insert into MEAL (mealid, mealname, mealprice)
values (832, 'Spanakopita', 108);
insert into MEAL (mealid, mealname, mealprice)
values (741, 'Ceviche', 35);
insert into MEAL (mealid, mealname, mealprice)
values (347, 'BabaGanoush', 62);
insert into MEAL (mealid, mealname, mealprice)
values (183, 'RedBeans', 135);
insert into MEAL (mealid, mealname, mealprice)
values (155, 'MakiRoll', 54);
insert into MEAL (mealid, mealname, mealprice)
values (145, 'FishandChips', 48);
insert into MEAL (mealid, mealname, mealprice)
values (585, 'Empanadas', 36);
insert into MEAL (mealid, mealname, mealprice)
values (620, 'Bruschetta', 99);
insert into MEAL (mealid, mealname, mealprice)
values (442, 'PotRoast', 29);
insert into MEAL (mealid, mealname, mealprice)
values (967, 'ZucchiniBread', 72);
insert into MEAL (mealid, mealname, mealprice)
values (537, 'Pancakes', 101);
insert into MEAL (mealid, mealname, mealprice)
values (123, 'Lobster', 20);
insert into MEAL (mealid, mealname, mealprice)
values (885, 'GrilledCheese', 91);
insert into MEAL (mealid, mealname, mealprice)
values (263, 'NasiGoreng', 90);
insert into MEAL (mealid, mealname, mealprice)
values (853, 'TurkeySandwich', 56);
insert into MEAL (mealid, mealname, mealprice)
values (489, 'FriedRice', 57);
insert into MEAL (mealid, mealname, mealprice)
values (327, 'EggsBenedict', 117);
insert into MEAL (mealid, mealname, mealprice)
values (215, 'Tapas', 84);
insert into MEAL (mealid, mealname, mealprice)
values (795, 'Fajitas', 57);
insert into MEAL (mealid, mealname, mealprice)
values (542, 'ShepherdsPie', 105);
insert into MEAL (mealid, mealname, mealprice)
values (941, 'Gazpacho', 125);
insert into MEAL (mealid, mealname, mealprice)
values (478, 'Kimchi', 99);
insert into MEAL (mealid, mealname, mealprice)
values (653, 'HotDog', 103);
insert into MEAL (mealid, mealname, mealprice)
values (513, 'MashedPotatoes', 64);
insert into MEAL (mealid, mealname, mealprice)
values (843, 'Shawarma', 122);
insert into MEAL (mealid, mealname, mealprice)
values (287, 'Pizza', 76);
insert into MEAL (mealid, mealname, mealprice)
values (532, 'Ravioli', 68);
insert into MEAL (mealid, mealname, mealprice)
values (673, 'SloppyJoes', 143);
insert into MEAL (mealid, mealname, mealprice)
values (801, 'Quiche', 103);
insert into MEAL (mealid, mealname, mealprice)
values (481, 'BeefStew', 55);
insert into MEAL (mealid, mealname, mealprice)
values (409, 'Spaghetti', 76);
insert into MEAL (mealid, mealname, mealprice)
values (165, 'FishTacos', 17);
insert into MEAL (mealid, mealname, mealprice)
values (365, 'Carbonara', 38);
insert into MEAL (mealid, mealname, mealprice)
values (841, 'Roti', 131);
insert into MEAL (mealid, mealname, mealprice)
values (135, 'Tempura', 52);
insert into MEAL (mealid, mealname, mealprice)
values (339, 'ChickenWings', 97);
insert into MEAL (mealid, mealname, mealprice)
values (233, 'Nachos', 50);
insert into MEAL (mealid, mealname, mealprice)
values (230, 'TortillaSoup', 135);
insert into MEAL (mealid, mealname, mealprice)
values (370, 'SurfandTurf', 149);
insert into MEAL (mealid, mealname, mealprice)
values (659, 'ScotchEgg', 142);
insert into MEAL (mealid, mealname, mealprice)
values (719, 'Gumbo', 136);
insert into MEAL (mealid, mealname, mealprice)
values (823, 'Oysters', 31);
insert into MEAL (mealid, mealname, mealprice)
values (839, 'PadThai', 88);
insert into MEAL (mealid, mealname, mealprice)
values (448, 'Falafel', 63);
insert into MEAL (mealid, mealname, mealprice)
values (783, 'Gnocchi', 75);
insert into MEAL (mealid, mealname, mealprice)
values (639, 'CoqauVin', 98);
insert into MEAL (mealid, mealname, mealprice)
values (578, 'Bibimbap', 140);
insert into MEAL (mealid, mealname, mealprice)
values (289, 'TunaSalad', 15);
insert into MEAL (mealid, mealname, mealprice)
values (281, 'Jambalaya', 136);
insert into MEAL (mealid, mealname, mealprice)
values (577, 'Ramen', 73);
insert into MEAL (mealid, mealname, mealprice)
values (477, 'ChickenParm', 126);
insert into MEAL (mealid, mealname, mealprice)
values (698, 'JalapenoPoppers', 88);
insert into MEAL (mealid, mealname, mealprice)
values (616, 'Bangers', 73);
insert into MEAL (mealid, mealname, mealprice)
values (170, 'Biryani', 69);
insert into MEAL (mealid, mealname, mealprice)
values (680, 'Pho', 50);
insert into MEAL (mealid, mealname, mealprice)
values (633, 'Sushi', 128);
insert into MEAL (mealid, mealname, mealprice)
values (886, 'Pastrami', 22);
insert into MEAL (mealid, mealname, mealprice)
values (686, 'Lasagna', 112);
commit;
prompt 100 records committed...
insert into MEAL (mealid, mealname, mealprice)
values (502, 'Chili', 120);
insert into MEAL (mealid, mealname, mealprice)
values (879, 'StuffedCabbage', 118);
insert into MEAL (mealid, mealname, mealprice)
values (922, 'Frittata', 102);
insert into MEAL (mealid, mealname, mealprice)
values (443, 'Souvlaki', 54);
insert into MEAL (mealid, mealname, mealprice)
values (541, 'TeriyakiChicken', 106);
insert into MEAL (mealid, mealname, mealprice)
values (249, 'Pierogi', 93);
insert into MEAL (mealid, mealname, mealprice)
values (181, 'Chowder', 148);
insert into MEAL (mealid, mealname, mealprice)
values (786, 'Tagine', 98);
insert into MEAL (mealid, mealname, mealprice)
values (964, 'DimSum', 17);
insert into MEAL (mealid, mealname, mealprice)
values (645, 'ShrimpCocktail', 92);
insert into MEAL (mealid, mealname, mealprice)
values (584, 'TomYum', 129);
insert into MEAL (mealid, mealname, mealprice)
values (352, 'Chimichanga', 138);
insert into MEAL (mealid, mealname, mealprice)
values (905, 'Tacos', 55);
insert into MEAL (mealid, mealname, mealprice)
values (423, 'Onigiri', 29);
insert into MEAL (mealid, mealname, mealprice)
values (296, 'ChiliDog', 64);
insert into MEAL (mealid, mealname, mealprice)
values (777, 'Curry', 144);
insert into MEAL (mealid, mealname, mealprice)
values (603, 'HuevosRancheros', 49);
insert into MEAL (mealid, mealname, mealprice)
values (946, 'FrenchToast', 119);
insert into MEAL (mealid, mealname, mealprice)
values (415, 'Polenta', 21);
insert into MEAL (mealid, mealname, mealprice)
values (383, 'Omelette', 77);
insert into MEAL (mealid, mealname, mealprice)
values (571, 'Sandwich', 37);
insert into MEAL (mealid, mealname, mealprice)
values (379, 'WaldorfSalad', 46);
insert into MEAL (mealid, mealname, mealprice)
values (583, 'Gravlax', 50);
insert into MEAL (mealid, mealname, mealprice)
values (119, 'Calzone', 85);
insert into MEAL (mealid, mealname, mealprice)
values (661, 'WontonSoup', 23);
insert into MEAL (mealid, mealname, mealprice)
values (914, 'Vindaloo', 17);
insert into MEAL (mealid, mealname, mealprice)
values (587, 'Crepes', 67);
insert into MEAL (mealid, mealname, mealprice)
values (591, 'Satay', 137);
insert into MEAL (mealid, mealname, mealprice)
values (694, 'Arancini', 53);
insert into MEAL (mealid, mealname, mealprice)
values (193, 'Porchetta', 25);
insert into MEAL (mealid, mealname, mealprice)
values (146, 'Burrito', 28);
insert into MEAL (mealid, mealname, mealprice)
values (815, 'Cassoulet', 16);
insert into MEAL (mealid, mealname, mealprice)
values (247, 'Salmon', 31);
insert into MEAL (mealid, mealname, mealprice)
values (610, 'TandooriChicken', 113);
insert into MEAL (mealid, mealname, mealprice)
values (188, 'chicken', 129);
insert into MEAL (mealid, mealname, mealprice)
values (869, 'Schnitzel1', 70);
insert into MEAL (mealid, mealname, mealprice)
values (216, 'salad1', 38);
insert into MEAL (mealid, mealname, mealprice)
values (453, 'kebab-skewer1', 124);
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
commit;
prompt 37 records loaded
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
prompt Loading ORDERS...
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (59182, 188, 'Delivered', to_date('04-01-2024', 'dd-mm-yyyy'), 199640888);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65592, 90, 'Delivered', to_date('20-04-2024', 'dd-mm-yyyy'), 296255366);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (61398, 135, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 216541625);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (41599, 299, 'Delivered', to_date('28-02-2024', 'dd-mm-yyyy'), 296255366);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (80222, 259, 'Delivered', to_date('04-02-2024', 'dd-mm-yyyy'), 390110769);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (84259, 145, 'Delivered', to_date('06-04-2024', 'dd-mm-yyyy'), 789562188);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (56419, 269, 'Delivered', to_date('27-01-2024', 'dd-mm-yyyy'), 738961356);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (50051, 1, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 974693239);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (88351, 72, 'Delivered', to_date('22-02-2024', 'dd-mm-yyyy'), 966414435);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (88653, 179, 'Delivered', to_date('04-01-2024', 'dd-mm-yyyy'), 656442110);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (13604, 75, 'Delivered', to_date('13-03-2024', 'dd-mm-yyyy'), 464221141);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (52830, 135, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 739894646);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (90296, 149, 'Delivered', to_date('17-01-2024', 'dd-mm-yyyy'), 966414435);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (81313, 27, 'Delivered', to_date('26-04-2024', 'dd-mm-yyyy'), 586258847);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (12869, 179, 'Delivered', to_date('12-02-2024', 'dd-mm-yyyy'), 850094083);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (53802, 10, 'Delivered', to_date('06-02-2024', 'dd-mm-yyyy'), 620322646);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95864, 179, 'Delivered', to_date('24-01-2024', 'dd-mm-yyyy'), 861744214);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (26757, 140, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 605867286);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (27308, 7, 'Delivered', to_date('04-03-2024', 'dd-mm-yyyy'), 251002805);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70117, 59, 'Delivered', to_date('07-03-2024', 'dd-mm-yyyy'), 907287038);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (83038, 265, 'Delivered', to_date('03-05-2024', 'dd-mm-yyyy'), 689426993);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (77648, 159, 'Delivered', to_date('19-04-2024', 'dd-mm-yyyy'), 989065808);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (43344, 59, 'Delivered', to_date('27-02-2024', 'dd-mm-yyyy'), 275420456);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (55995, 375, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 709566924);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (91609, 9, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 157141811);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70838, 39, 'Delivered', to_date('18-01-2024', 'dd-mm-yyyy'), 836439971);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (62222, 239, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 390110769);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (26243, 10, 'Delivered', to_date('22-01-2024', 'dd-mm-yyyy'), 850094083);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (58566, 99, 'Delivered', to_date('26-01-2024', 'dd-mm-yyyy'), 894904744);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (91902, 69, 'Delivered', to_date('16-01-2024', 'dd-mm-yyyy'), 618573694);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (20340, 35, 'Delivered', to_date('28-02-2024', 'dd-mm-yyyy'), 224495473);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (55900, 10, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 771701713);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (21626, 115, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 654712365);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (17887, 159, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 445757640);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (43689, 9, 'Delivered', to_date('21-01-2024', 'dd-mm-yyyy'), 427332445);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (32407, 209, 'Delivered', to_date('09-05-2024', 'dd-mm-yyyy'), 166381326);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95080, 1, 'Received', to_date('12-05-2024', 'dd-mm-yyyy'), 589291628);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (59102, 119, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 942708002);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (51690, 5, 'Delivered', to_date('08-05-2024', 'dd-mm-yyyy'), 903486694);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (36670, 135, 'Delivered', to_date('25-04-2024', 'dd-mm-yyyy'), 282036733);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (88772, 344, 'Ready', to_date('11-05-2024', 'dd-mm-yyyy'), 458886237);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (76341, 385, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 649748137);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (59034, 25, 'Delivered', to_date('05-01-2024', 'dd-mm-yyyy'), 974693239);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (29434, 45, 'Delivered', to_date('08-01-2024', 'dd-mm-yyyy'), 660797697);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (85504, 39, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 977753609);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (94380, 45, 'Delivered', to_date('27-01-2024', 'dd-mm-yyyy'), 560391764);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (57470, 44, 'Delivered', to_date('01-01-2024', 'dd-mm-yyyy'), 805854680);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (30440, 35, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 328879351);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (25469, 179, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 935291735);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (99235, 38, 'Delivered', to_date('17-04-2024', 'dd-mm-yyyy'), 129121934);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70591, 199, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 324402203);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (44549, 49, 'Received', to_date('25-05-2024', 'dd-mm-yyyy'), 202988966);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (12999, 125, 'Delivered', to_date('03-02-2024', 'dd-mm-yyyy'), 388964714);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (73356, 195, 'Delivered', to_date('24-02-2024', 'dd-mm-yyyy'), 833739957);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (19134, 375, 'Delivered', to_date('01-01-2024', 'dd-mm-yyyy'), 935291735);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (77882, 139, 'Delivered', to_date('29-04-2024', 'dd-mm-yyyy'), 295158882);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (60888, 79, 'Delivered', to_date('05-01-2024', 'dd-mm-yyyy'), 746060762);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (89590, 43, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 237093998);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (34274, 35, 'Delivered', to_date('18-04-2024', 'dd-mm-yyyy'), 454954065);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (75923, 265, 'Delivered', to_date('28-03-2024', 'dd-mm-yyyy'), 349840942);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (54264, 71, 'Delivered', to_date('26-01-2024', 'dd-mm-yyyy'), 756920718);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (40297, 385, 'Delivered', to_date('02-05-2024', 'dd-mm-yyyy'), 446436968);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (11979, 139, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 704448570);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (82193, 1, 'Delivered', to_date('05-03-2024', 'dd-mm-yyyy'), 190711252);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (27027, 149, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 777678448);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (22459, 28, 'Delivered', to_date('11-02-2024', 'dd-mm-yyyy'), 144207533);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (68154, 89, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 115550235);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49445, 18, 'Delivered', to_date('24-03-2024', 'dd-mm-yyyy'), 805401712);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (66170, 519, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 777766742);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (21832, 125, 'Delivered', to_date('15-01-2024', 'dd-mm-yyyy'), 192646604);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (20942, 579, 'Delivered', to_date('05-04-2024', 'dd-mm-yyyy'), 983955606);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (90871, 8, 'Received', to_date('14-05-2024', 'dd-mm-yyyy'), 785335488);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70342, 35, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 514205703);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (50309, 179, 'Delivered', to_date('02-04-2024', 'dd-mm-yyyy'), 463878923);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (48817, 265, 'Delivered', to_date('09-05-2024', 'dd-mm-yyyy'), 151517503);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (25495, 115, 'Delivered', to_date('25-01-2024', 'dd-mm-yyyy'), 216541625);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (55724, 142, 'Delivered', to_date('09-05-2024', 'dd-mm-yyyy'), 924245604);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (46222, 76, 'Ready', to_date('18-05-2024', 'dd-mm-yyyy'), 535355728);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (73066, 10, 'Delivered', to_date('21-01-2024', 'dd-mm-yyyy'), 530559367);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (27478, 194, 'Delivered', to_date('14-01-2024', 'dd-mm-yyyy'), 897322670);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (35602, 28, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 361558168);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (25069, 94, 'Delivered', to_date('01-04-2024', 'dd-mm-yyyy'), 197619991);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (57715, 219, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 202423128);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (33488, 24, 'Delivered', to_date('21-03-2024', 'dd-mm-yyyy'), 563480832);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (33364, 10, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 242192420);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (12632, 199, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 735716196);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (64409, 24, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 849303235);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (28977, 7, 'Delivered', to_date('17-02-2024', 'dd-mm-yyyy'), 907287038);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (99743, 185, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 479411599);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (25737, 20, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 815123821);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (77517, 69, 'Delivered', to_date('04-05-2024', 'dd-mm-yyyy'), 603150426);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (67538, 618, 'Delivered', to_date('08-04-2024', 'dd-mm-yyyy'), 987656414);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49599, 49, 'Delivered', to_date('17-03-2024', 'dd-mm-yyyy'), 409771057);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (32626, 250, 'Delivered', to_date('02-04-2024', 'dd-mm-yyyy'), 423632765);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (81401, 39, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 529782749);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (55270, 229, 'Delivered', to_date('01-03-2024', 'dd-mm-yyyy'), 575427604);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (77945, 25, 'Delivered', to_date('29-03-2024', 'dd-mm-yyyy'), 761433673);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (24870, 169, 'Delivered', to_date('08-05-2024', 'dd-mm-yyyy'), 946312472);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (94029, 149, 'Delivered', to_date('27-03-2024', 'dd-mm-yyyy'), 974693239);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65447, 9, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 177644588);
commit;
prompt 100 records committed...
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (59409, 28, 'Sent', to_date('17-05-2024', 'dd-mm-yyyy'), 908589616);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (88324, 72, 'Delivered', to_date('19-05-2024', 'dd-mm-yyyy'), 497469605);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (61084, 78, 'Received', to_date('13-05-2024', 'dd-mm-yyyy'), 903277991);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (15420, 99, 'Delivered', to_date('18-01-2024', 'dd-mm-yyyy'), 322102919);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (68596, 35, 'Delivered', to_date('18-01-2024', 'dd-mm-yyyy'), 573755457);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (27300, 19, 'Delivered', to_date('15-03-2024', 'dd-mm-yyyy'), 360260555);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70313, 56, 'Delivered', to_date('02-01-2024', 'dd-mm-yyyy'), 427332445);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (48816, 35, 'Delivered', to_date('30-01-2024', 'dd-mm-yyyy'), 689426993);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (58886, 58, 'Delivered', to_date('12-01-2024', 'dd-mm-yyyy'), 654712365);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (73892, 70, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 733139526);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (34690, 109, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 927524225);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (54976, 209, 'Delivered', to_date('30-01-2024', 'dd-mm-yyyy'), 688095708);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (37145, 95, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 853517846);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (58849, 175, 'Delivered', to_date('19-04-2024', 'dd-mm-yyyy'), 423632765);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (59718, 69, 'Delivered', to_date('02-05-2024', 'dd-mm-yyyy'), 783806626);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (68695, 255, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 896757685);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49636, 8, 'Delivered', to_date('07-05-2024', 'dd-mm-yyyy'), 296255366);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (42600, 265, 'Delivered', to_date('15-04-2024', 'dd-mm-yyyy'), 649748137);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65660, 179, 'Delivered', to_date('14-01-2024', 'dd-mm-yyyy'), 282036733);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (26631, 39, 'Delivered', to_date('01-01-2024', 'dd-mm-yyyy'), 351022726);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (27738, 99, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 205272172);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (93938, 239, 'Delivered', to_date('20-03-2024', 'dd-mm-yyyy'), 504536643);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (13340, 399, 'Delivered', to_date('05-04-2024', 'dd-mm-yyyy'), 476782813);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (45695, 69, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 216541625);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (97641, 229, 'Received', to_date('21-05-2024', 'dd-mm-yyyy'), 487981995);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (37194, 875, 'Delivered', to_date('21-03-2024', 'dd-mm-yyyy'), 218763605);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (59889, 121, 'Delivered', to_date('29-01-2024', 'dd-mm-yyyy'), 909762395);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (99773, 85, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 899381603);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (24848, 16, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 681572378);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (99848, 145, 'Delivered', to_date('20-04-2024', 'dd-mm-yyyy'), 138000652);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (81934, 48, 'Delivered', to_date('18-03-2024', 'dd-mm-yyyy'), 895204813);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (37868, 45, 'Delivered', to_date('25-01-2024', 'dd-mm-yyyy'), 438477170);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (42104, 255, 'Delivered', to_date('11-02-2024', 'dd-mm-yyyy'), 738961356);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (36951, 109, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 275420456);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70413, 229, 'Delivered', to_date('22-04-2024', 'dd-mm-yyyy'), 944370934);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (20030, 375, 'Sent', to_date('15-05-2024', 'dd-mm-yyyy'), 826107453);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (87126, 121, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 366643056);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (19888, 20, 'Delivered', to_date('10-03-2024', 'dd-mm-yyyy'), 255733886);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (78934, 89, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 928549846);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (47475, 99, 'Delivered', to_date('23-04-2024', 'dd-mm-yyyy'), 544629310);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (98756, 159, 'Delivered', to_date('05-03-2024', 'dd-mm-yyyy'), 977753609);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (21392, 10, 'in-preparation', to_date('16-05-2024', 'dd-mm-yyyy'), 682288204);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (29875, 3, 'in-preparation', to_date('15-05-2024', 'dd-mm-yyyy'), 141067913);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (41047, 179, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 605867286);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (42371, 68, 'Ready', to_date('15-05-2024', 'dd-mm-yyyy'), 352004805);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (50999, 45, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 652286041);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (60140, 75, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 903486694);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (77761, 22, 'Delivered', to_date('29-02-2024', 'dd-mm-yyyy'), 656234359);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (46483, 20, 'Ready', to_date('14-05-2024', 'dd-mm-yyyy'), 252721669);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (61773, 76, 'Delivered', to_date('07-05-2024', 'dd-mm-yyyy'), 533475097);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (66321, 14, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 163717059);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (61805, 89, 'Delivered', to_date('24-04-2024', 'dd-mm-yyyy'), 395931910);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (76937, 365, 'Delivered', to_date('14-01-2024', 'dd-mm-yyyy'), 960671680);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (60239, 49, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 783806626);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (64517, 439, 'Delivered', to_date('20-03-2024', 'dd-mm-yyyy'), 915869687);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (84168, 94, 'Delivered', to_date('20-01-2024', 'dd-mm-yyyy'), 911729605);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (19516, 138, 'Delivered', to_date('13-01-2024', 'dd-mm-yyyy'), 847683496);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (84806, 69, 'Delivered', to_date('20-03-2024', 'dd-mm-yyyy'), 862513457);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (69001, 198, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 202988966);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (80621, 8, 'Received', to_date('17-05-2024', 'dd-mm-yyyy'), 907597444);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (86256, 109, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 496245735);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95732, 139, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 484733518);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (82772, 8, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 171880121);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (86660, 90, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 618573694);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (60728, 155, 'Delivered', to_date('06-01-2024', 'dd-mm-yyyy'), 362427181);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (19701, 106, 'Delivered', to_date('17-04-2024', 'dd-mm-yyyy'), 567225446);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (15279, 265, 'Delivered', to_date('04-01-2024', 'dd-mm-yyyy'), 190012393);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (99134, 99, 'Delivered', to_date('19-01-2024', 'dd-mm-yyyy'), 756920718);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (97579, 10, 'Delivered', to_date('25-03-2024', 'dd-mm-yyyy'), 977753609);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (36485, 135, 'Delivered', to_date('21-05-2024', 'dd-mm-yyyy'), 750919835);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (75930, 209, 'Delivered', to_date('13-02-2024', 'dd-mm-yyyy'), 993714527);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (87608, 139, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 328879351);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (36044, 99, 'Delivered', to_date('01-02-2024', 'dd-mm-yyyy'), 273626310);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (61886, 109, 'Delivered', to_date('19-03-2024', 'dd-mm-yyyy'), 500276225);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (80875, 109, 'Delivered', to_date('01-02-2024', 'dd-mm-yyyy'), 849466338);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (98527, 38, 'Delivered', to_date('08-03-2024', 'dd-mm-yyyy'), 620162965);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (76051, 519, 'Delivered', to_date('08-04-2024', 'dd-mm-yyyy'), 436759233);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (69995, 28, 'Delivered', to_date('06-03-2024', 'dd-mm-yyyy'), 826107453);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (43910, 3, 'Delivered', to_date('03-05-2024', 'dd-mm-yyyy'), 193177293);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (61893, 92, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 738200510);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (87739, 89, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 446436968);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (75609, 155, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 320214197);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (88995, 249, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 805897636);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (87961, 35, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 371061470);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (91903, 209, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 575427604);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (42080, 385, 'Delivered', to_date('18-02-2024', 'dd-mm-yyyy'), 862513457);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (55213, 10, 'Delivered', to_date('26-02-2024', 'dd-mm-yyyy'), 224495473);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (19231, 59, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 673202124);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (26630, 45, 'Delivered', to_date('15-02-2024', 'dd-mm-yyyy'), 427332445);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (90988, 5, 'Delivered', to_date('04-03-2024', 'dd-mm-yyyy'), 975723107);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (76133, 145, 'Delivered', to_date('01-02-2024', 'dd-mm-yyyy'), 427332445);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (47456, 135, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 200082966);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (48748, 149, 'Sent', to_date('11-05-2024', 'dd-mm-yyyy'), 179794254);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (78919, 18, 'Delivered', to_date('04-03-2024', 'dd-mm-yyyy'), 563480832);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (59943, 65, 'Delivered', to_date('19-02-2024', 'dd-mm-yyyy'), 805854680);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49835, 139, 'Delivered', to_date('01-04-2024', 'dd-mm-yyyy'), 242192420);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (63144, 219, 'Delivered', to_date('02-01-2024', 'dd-mm-yyyy'), 772545227);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (28836, 205, 'Delivered', to_date('20-04-2024', 'dd-mm-yyyy'), 507754009);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (18980, 30, 'Delivered', to_date('29-01-2024', 'dd-mm-yyyy'), 790353923);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (31887, 38, 'Delivered', to_date('25-04-2024', 'dd-mm-yyyy'), 747630593);
commit;
prompt 200 records committed...
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (39657, 115, 'in-preparation', to_date('19-05-2024', 'dd-mm-yyyy'), 179794254);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (81331, 519, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 218429826);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (19492, 18, 'Delivered', to_date('06-04-2024', 'dd-mm-yyyy'), 250944666);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (86739, 8, 'Delivered', to_date('10-01-2024', 'dd-mm-yyyy'), 576090664);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (32848, 189, 'Delivered', to_date('10-03-2024', 'dd-mm-yyyy'), 573755457);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (75486, 159, 'Delivered', to_date('13-02-2024', 'dd-mm-yyyy'), 756920718);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (55778, 23, 'Delivered', to_date('29-01-2024', 'dd-mm-yyyy'), 318322784);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (80531, 35, 'Delivered', to_date('23-05-2024', 'dd-mm-yyyy'), 420529630);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (86569, 75, 'Delivered', to_date('24-01-2024', 'dd-mm-yyyy'), 721140035);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (46819, 145, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 216541625);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (86234, 99, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 736264193);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95905, 85, 'Delivered', to_date('17-03-2024', 'dd-mm-yyyy'), 679380064);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49739, 9, 'Sent', to_date('16-05-2024', 'dd-mm-yyyy'), 838802596);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (18733, 235, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 750919835);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (46561, 58, 'Delivered', to_date('05-03-2024', 'dd-mm-yyyy'), 336195988);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (21059, 299, 'Delivered', to_date('27-03-2024', 'dd-mm-yyyy'), 867830048);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (63034, 119, 'Delivered', to_date('23-05-2024', 'dd-mm-yyyy'), 833739957);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (63840, 35, 'Delivered', to_date('26-04-2024', 'dd-mm-yyyy'), 750119869);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (33204, 8, 'Delivered', to_date('13-03-2024', 'dd-mm-yyyy'), 640331895);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (71880, 179, 'Delivered', to_date('21-03-2024', 'dd-mm-yyyy'), 688095708);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (98441, 5, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 251066882);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (33769, 179, 'in-preparation', to_date('19-05-2024', 'dd-mm-yyyy'), 654684525);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (72289, 389, 'Delivered', to_date('11-03-2024', 'dd-mm-yyyy'), 900468358);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (56866, 159, 'Delivered', to_date('03-05-2024', 'dd-mm-yyyy'), 903277991);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (66958, 239, 'Delivered', to_date('17-03-2024', 'dd-mm-yyyy'), 349840942);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (67193, 659, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 815123821);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (67124, 8, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 896151890);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (16791, 595, 'Delivered', to_date('29-04-2024', 'dd-mm-yyyy'), 341627864);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (76381, 145, 'Delivered', to_date('19-02-2024', 'dd-mm-yyyy'), 497469605);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (74675, 289, 'Delivered', to_date('27-03-2024', 'dd-mm-yyyy'), 203881975);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95091, 40, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 894904744);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (93280, 149, 'Delivered', to_date('03-02-2024', 'dd-mm-yyyy'), 798816085);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (87787, 9, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 581815622);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65615, 159, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 644923088);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (91425, 215, 'Delivered', to_date('17-04-2024', 'dd-mm-yyyy'), 272724345);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (80447, 20, 'Delivered', to_date('12-01-2024', 'dd-mm-yyyy'), 935291735);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (19322, 23, 'Delivered', to_date('18-01-2024', 'dd-mm-yyyy'), 362427181);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (93691, 169, 'Delivered', to_date('21-01-2024', 'dd-mm-yyyy'), 388964714);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (24062, 289, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 399318419);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (24895, 95, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 501237230);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (34808, 7, 'Delivered', to_date('14-03-2024', 'dd-mm-yyyy'), 640019960);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (41614, 5, 'Delivered', to_date('24-04-2024', 'dd-mm-yyyy'), 152909198);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (85929, 149, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 704448570);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (61558, 121, 'Delivered', to_date('01-05-2024', 'dd-mm-yyyy'), 620162965);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65762, 109, 'Delivered', to_date('07-04-2024', 'dd-mm-yyyy'), 153843514);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (21603, 229, 'Ready', to_date('23-05-2024', 'dd-mm-yyyy'), 654825535);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (97733, 6, 'Delivered', to_date('22-02-2024', 'dd-mm-yyyy'), 993714527);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95118, 105, 'Delivered', to_date('23-04-2024', 'dd-mm-yyyy'), 861744214);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (37671, 125, 'Delivered', to_date('19-03-2024', 'dd-mm-yyyy'), 216541625);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (56847, 106, 'Delivered', to_date('06-04-2024', 'dd-mm-yyyy'), 929328580);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (92098, 269, 'Delivered', to_date('01-04-2024', 'dd-mm-yyyy'), 898674199);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (47834, 198, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 458886237);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (71353, 8, 'Delivered', to_date('30-04-2024', 'dd-mm-yyyy'), 529665183);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (42565, 65, 'Delivered', to_date('15-04-2024', 'dd-mm-yyyy'), 203093493);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (72084, 155, 'Delivered', to_date('22-04-2024', 'dd-mm-yyyy'), 960671680);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (83491, 595, 'Delivered', to_date('06-04-2024', 'dd-mm-yyyy'), 484622079);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (41351, 165, 'Delivered', to_date('19-03-2024', 'dd-mm-yyyy'), 750919835);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (29727, 39, 'Delivered', to_date('02-05-2024', 'dd-mm-yyyy'), 990813819);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70495, 78, 'Delivered', to_date('22-03-2024', 'dd-mm-yyyy'), 167375351);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (61649, 398, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 588037827);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (28857, 54, 'Delivered', to_date('11-03-2024', 'dd-mm-yyyy'), 761433673);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (96704, 8, 'Delivered', to_date('21-04-2024', 'dd-mm-yyyy'), 544629310);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (58572, 239, 'Delivered', to_date('30-04-2024', 'dd-mm-yyyy'), 903486694);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (76355, 2, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 336195988);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (28892, 1, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 701436220);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (74134, 169, 'Delivered', to_date('08-02-2024', 'dd-mm-yyyy'), 789224520);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (74919, 6, 'Delivered', to_date('21-04-2024', 'dd-mm-yyyy'), 237093998);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (44590, 159, 'Delivered', to_date('04-02-2024', 'dd-mm-yyyy'), 323148897);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49231, 92, 'Ready', to_date('11-05-2024', 'dd-mm-yyyy'), 202890933);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (32723, 20, 'Delivered', to_date('07-05-2024', 'dd-mm-yyyy'), 805401712);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (78815, 29, 'Delivered', to_date('22-04-2024', 'dd-mm-yyyy'), 202938205);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65289, 289, 'Received', to_date('20-05-2024', 'dd-mm-yyyy'), 318322784);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (71930, 179, 'Delivered', to_date('27-02-2024', 'dd-mm-yyyy'), 563480832);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65915, 135, 'Delivered', to_date('13-01-2024', 'dd-mm-yyyy'), 202988966);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (32090, 48, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 871869784);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (91999, 299, 'Delivered', to_date('31-03-2024', 'dd-mm-yyyy'), 304261315);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (81587, 29, 'Delivered', to_date('17-05-2024', 'dd-mm-yyyy'), 463371951);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (54954, 159, 'Delivered', to_date('03-05-2024', 'dd-mm-yyyy'), 764421102);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (24835, 229, 'Delivered', to_date('12-02-2024', 'dd-mm-yyyy'), 974693239);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (62208, 119, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 604322566);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (31211, 327, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 395931910);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (37148, 359, 'Delivered', to_date('17-01-2024', 'dd-mm-yyyy'), 908589616);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (15782, 199, 'Delivered', to_date('26-05-2024', 'dd-mm-yyyy'), 987656414);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (48643, 75, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 530559367);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (83159, 72, 'Delivered', to_date('12-01-2024', 'dd-mm-yyyy'), 688095708);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (42625, 39, 'Delivered', to_date('05-02-2024', 'dd-mm-yyyy'), 529665183);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (24858, 45, 'Delivered', to_date('18-05-2024', 'dd-mm-yyyy'), 895204813);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (20029, 45, 'Delivered', to_date('24-04-2024', 'dd-mm-yyyy'), 833739957);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (62671, 399, 'Delivered', to_date('05-04-2024', 'dd-mm-yyyy'), 895204813);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (64860, 136, 'Delivered', to_date('08-02-2024', 'dd-mm-yyyy'), 221770313);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (37623, 10, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 867830048);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65475, 119, 'Delivered', to_date('27-02-2024', 'dd-mm-yyyy'), 272031711);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (17045, 119, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 353482730);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (52464, 125, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 597771718);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (59111, 11, 'Delivered', to_date('29-04-2024', 'dd-mm-yyyy'), 847683496);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (92215, 389, 'Delivered', to_date('19-01-2024', 'dd-mm-yyyy'), 903277991);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (62397, 259, 'Delivered', to_date('30-04-2024', 'dd-mm-yyyy'), 192646604);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (98632, 40, 'Delivered', to_date('31-01-2024', 'dd-mm-yyyy'), 164502431);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65668, 275, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 464221141);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (73079, 95, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 355899957);
commit;
prompt 300 records committed...
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (33286, 375, 'Delivered', to_date('21-02-2024', 'dd-mm-yyyy'), 682288204);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49082, 9, 'Delivered', to_date('28-01-2024', 'dd-mm-yyyy'), 922094598);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70069, 55, 'Delivered', to_date('30-03-2024', 'dd-mm-yyyy'), 701436220);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (75660, 119, 'Delivered', to_date('25-02-2024', 'dd-mm-yyyy'), 911729605);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (94928, 152, 'Delivered', to_date('16-01-2024', 'dd-mm-yyyy'), 750919835);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (82646, 56, 'Received', to_date('17-05-2024', 'dd-mm-yyyy'), 221244365);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (92979, 125, 'Delivered', to_date('11-03-2024', 'dd-mm-yyyy'), 897322670);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (38435, 125, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 900468358);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (33271, 132, 'Received', to_date('22-05-2024', 'dd-mm-yyyy'), 795843818);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (18689, 36, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 764421102);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (33802, 169, 'Received', to_date('21-05-2024', 'dd-mm-yyyy'), 705165132);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (81348, 75, 'Delivered', to_date('29-03-2024', 'dd-mm-yyyy'), 655844485);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (27108, 255, 'Delivered', to_date('23-04-2024', 'dd-mm-yyyy'), 563480832);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (16625, 229, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 709566924);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (78421, 198, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 251002805);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (27249, 299, 'Delivered', to_date('04-03-2024', 'dd-mm-yyyy'), 533475097);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (39709, 16, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 197619991);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (21699, 109, 'Received', to_date('14-05-2024', 'dd-mm-yyyy'), 138000652);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (81336, 36, 'Delivered', to_date('14-01-2024', 'dd-mm-yyyy'), 909762395);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (32789, 89, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 838318068);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (56387, 55, 'Delivered', to_date('30-01-2024', 'dd-mm-yyyy'), 312294196);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (44544, 44, 'Delivered', to_date('14-04-2024', 'dd-mm-yyyy'), 416941052);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (26352, 118, 'Delivered', to_date('13-03-2024', 'dd-mm-yyyy'), 446436968);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (71835, 299, 'Delivered', to_date('08-01-2024', 'dd-mm-yyyy'), 181724644);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (38809, 95, 'Delivered', to_date('12-04-2024', 'dd-mm-yyyy'), 750919835);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95330, 7, 'Delivered', to_date('26-01-2024', 'dd-mm-yyyy'), 257662071);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (47782, 179, 'Delivered', to_date('26-04-2024', 'dd-mm-yyyy'), 202423128);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (36681, 20, 'Delivered', to_date('24-03-2024', 'dd-mm-yyyy'), 681572378);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (89117, 45, 'Delivered', to_date('25-03-2024', 'dd-mm-yyyy'), 129466992);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (37794, 43, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 756920718);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (27419, 75, 'Delivered', to_date('08-05-2024', 'dd-mm-yyyy'), 590210023);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (22328, 289, 'Delivered', to_date('19-04-2024', 'dd-mm-yyyy'), 963819761);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (94695, 198, 'Delivered', to_date('09-05-2024', 'dd-mm-yyyy'), 705165132);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95100, 24, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 201884188);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49245, 35, 'Delivered', to_date('09-04-2024', 'dd-mm-yyyy'), 929328580);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (25789, 44, 'Delivered', to_date('01-01-2024', 'dd-mm-yyyy'), 507754009);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (13297, 159, 'Delivered', to_date('12-03-2024', 'dd-mm-yyyy'), 320214197);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95007, 24, 'Delivered', to_date('05-03-2024', 'dd-mm-yyyy'), 218429826);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (82691, 519, 'Delivered', to_date('04-05-2024', 'dd-mm-yyyy'), 181724644);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (92346, 129, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 449616736);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (24927, 78, 'Delivered', to_date('10-02-2024', 'dd-mm-yyyy'), 709566924);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (97433, 149, 'Received', to_date('11-05-2024', 'dd-mm-yyyy'), 312294196);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (43069, 156, 'Delivered', to_date('25-04-2024', 'dd-mm-yyyy'), 979954238);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (96276, 25, 'Sent', to_date('26-05-2024', 'dd-mm-yyyy'), 898190326);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (65757, 125, 'Delivered', to_date('05-02-2024', 'dd-mm-yyyy'), 296255366);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (91881, 399, 'Delivered', to_date('09-02-2024', 'dd-mm-yyyy'), 909589275);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (66680, 22, 'Delivered', to_date('26-03-2024', 'dd-mm-yyyy'), 898190326);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (54648, 138, 'Delivered', to_date('24-03-2024', 'dd-mm-yyyy'), 193177293);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (59350, 10, 'Delivered', to_date('02-02-2024', 'dd-mm-yyyy'), 603150426);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (30036, 39, 'Delivered', to_date('04-01-2024', 'dd-mm-yyyy'), 656442110);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (60302, 72, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 449860234);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (28357, 99, 'Delivered', to_date('07-04-2024', 'dd-mm-yyyy'), 221770313);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49352, 16, 'Delivered', to_date('09-01-2024', 'dd-mm-yyyy'), 216541625);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (58785, 129, 'Delivered', to_date('24-02-2024', 'dd-mm-yyyy'), 970287710);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (95918, 23, 'Delivered', to_date('07-02-2024', 'dd-mm-yyyy'), 760945270);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (20127, 39, 'Sent', to_date('25-05-2024', 'dd-mm-yyyy'), 654712365);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (82287, 79, 'Delivered', to_date('20-02-2024', 'dd-mm-yyyy'), 990813819);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (41176, 40, 'Delivered', to_date('02-03-2024', 'dd-mm-yyyy'), 353134007);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (43714, 45, 'Delivered', to_date('25-04-2024', 'dd-mm-yyyy'), 838802596);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (34742, 169, 'Delivered', to_date('22-04-2024', 'dd-mm-yyyy'), 826107453);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (66809, 42, 'Delivered', to_date('07-01-2024', 'dd-mm-yyyy'), 923324345);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (52809, 385, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 523316363);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (58643, 5, 'Delivered', to_date('14-04-2024', 'dd-mm-yyyy'), 463371951);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (44583, 20, 'Delivered', to_date('17-03-2024', 'dd-mm-yyyy'), 312294196);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (35836, 289, 'Delivered', to_date('12-04-2024', 'dd-mm-yyyy'), 205272172);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (96721, 125, 'Delivered', to_date('06-05-2024', 'dd-mm-yyyy'), 221244365);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (91377, 24, 'Delivered', to_date('29-03-2024', 'dd-mm-yyyy'), 185636514);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70179, 99, 'Delivered', to_date('18-04-2024', 'dd-mm-yyyy'), 805854680);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (15697, 89, 'Sent', to_date('23-05-2024', 'dd-mm-yyyy'), 273481859);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (57588, 15, 'Delivered', to_date('23-02-2024', 'dd-mm-yyyy'), 369053838);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (83376, 43, 'Delivered', to_date('24-02-2024', 'dd-mm-yyyy'), 656234359);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (74382, 118, 'Delivered', to_date('11-02-2024', 'dd-mm-yyyy'), 251021859);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (62055, 69, 'Delivered', to_date('17-04-2024', 'dd-mm-yyyy'), 318322784);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49420, 19, 'in-preparation', to_date('24-05-2024', 'dd-mm-yyyy'), 906393556);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (39128, 35, 'Ready', to_date('13-05-2024', 'dd-mm-yyyy'), 597936180);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (13231, 55, 'Delivered', to_date('16-02-2024', 'dd-mm-yyyy'), 704448570);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (66724, 209, 'Sent', to_date('17-05-2024', 'dd-mm-yyyy'), 462977437);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (88687, 229, 'Delivered', to_date('10-01-2024', 'dd-mm-yyyy'), 203881975);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (79722, 24, 'Delivered', to_date('13-03-2024', 'dd-mm-yyyy'), 886831669);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (53224, 10, 'Delivered', to_date('13-01-2024', 'dd-mm-yyyy'), 181724644);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (28486, 265, 'Delivered', to_date('06-01-2024', 'dd-mm-yyyy'), 799777319);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (91497, 45, 'Delivered', to_date('21-04-2024', 'dd-mm-yyyy'), 497469605);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (70816, 18, 'Delivered', to_date('11-04-2024', 'dd-mm-yyyy'), 732741572);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (98042, 35, 'Delivered', to_date('15-04-2024', 'dd-mm-yyyy'), 420529630);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (80923, 49, 'Delivered', to_date('13-04-2024', 'dd-mm-yyyy'), 832430127);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (60090, 155, 'Delivered', to_date('12-01-2024', 'dd-mm-yyyy'), 640331895);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (40275, 35, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 594264009);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (12250, 38, 'Delivered', to_date('19-01-2024', 'dd-mm-yyyy'), 761433673);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (37009, 35, 'Sent', to_date('17-05-2024', 'dd-mm-yyyy'), 987938231);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (79488, 6, 'Delivered', to_date('03-01-2024', 'dd-mm-yyyy'), 738200510);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (45203, 235, 'Delivered', to_date('16-03-2024', 'dd-mm-yyyy'), 455396724);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (84999, 156, 'Delivered', to_date('24-02-2024', 'dd-mm-yyyy'), 152909198);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (99066, 99, 'Delivered', to_date('02-01-2024', 'dd-mm-yyyy'), 703201506);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (34030, 145, 'Delivered', to_date('16-04-2024', 'dd-mm-yyyy'), 960671680);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (36975, 115, 'Delivered', to_date('25-05-2024', 'dd-mm-yyyy'), 235167090);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (54591, 99, 'Delivered', to_date('13-02-2024', 'dd-mm-yyyy'), 251066882);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (49361, 29, 'Delivered', to_date('04-05-2024', 'dd-mm-yyyy'), 257662071);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (42390, 259, 'Delivered', to_date('11-01-2024', 'dd-mm-yyyy'), 336195988);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (28440, 209, 'Delivered', to_date('04-02-2024', 'dd-mm-yyyy'), 272724345);
insert into ORDERS (orderid, orderprice, orderstatus, orderdate, custid)
values (14722, 25, 'Delivered', to_date('03-02-2024', 'dd-mm-yyyy'), 535781565);
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
values (143274912, 'Elle-Mac', 'Dishwasher', 16635, to_date('17-07-1987', 'dd-mm-yyyy'));
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
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint SYS_C008306;
prompt Enabling foreign key constraints for MEALORDER...
alter table MEALORDER enable constraint SYS_C008311;
alter table MEALORDER enable constraint SYS_C008312;
prompt Enabling foreign key constraints for WORKERORDER...
alter table WORKERORDER enable constraint SYS_C008322;
alter table WORKERORDER enable constraint SYS_C008323;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for MEAL...
alter table MEAL enable all triggers;
prompt Enabling triggers for PROVIDERS...
alter table PROVIDERS enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for INGREDIENTS...
alter table INGREDIENTS enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for MEALORDER...
alter table MEALORDER enable all triggers;
prompt Enabling triggers for WORKERS...
alter table WORKERS enable all triggers;
prompt Enabling triggers for WORKERORDER...
alter table WORKERORDER enable all triggers;
set feedback on
set define on
prompt Done.
