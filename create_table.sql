create table bag (
bagid int(20) auto_increment,
name varchar(20) unique not null,
primary key(bagid)
);

create table client (
cid int(10) auto_increment,
fname varchar(20),
lname varchar(20), 
phone int(10),
gender char(1),
dob date,
start date, 
pday int(2), 
bagid int(10) not null,
street varchar(20),
city varchar(20), 
state char(3), 
zip int(5), 
apt int(5), 
primary key (cid),
foreign key (bagid) references bag(bagid),
-- foreign key (pid) references pickup(pid),
unique(fname, lname, phone)
);

create table family (
cid int(10) not null,
fname varchar(20), 
lname varchar(20), 
dob date, 
gender char(1),
-- ADDED cid AS A PRIMARY KEY BECAUSE family IS A WEAK ENTITY TYPE
primary key (fname, lname, cid),
foreign key (cid) references client(cid)
);

create table user (
username varchar(20),
fname varchar(20), 
lname varchar(20), 
password varchar(20),
email varchar(40),
type tinyint(1),
primary key (username)
);

create table pickup (
pid int(10) auto_increment,
pdate date,
cid int(20) not null,
bagid int(20) not null,
primary key (pid),
foreign key (cid) references client(cid),
foreign key (bagid) references bag(bagid)
);


create table source(
sourceid int(10) auto_increment,
name varchar(20) unique not null, 
primary key(sourceid)
);

create table product (
prodid int(10) auto_increment,
name varchar(20) unique not null,
cost int(6),
sourceid int(10) not null,
primary key (prodid),
foreign key (sourceid) references source(sourceid)
);

create table dropoff(
did int(10) auto_increment,
ddate date,
qty int(6),
sourceid int(10) not null,
prodid int(10) not null,
foreign key (sourceid) references source (sourceid),
foreign key (prodid) references product (prodid),
primary key(did)
);

create table contents(
bagid int(10),
prodid int(10),
qty int(6),
prevqty int(6),
primary key(bagid, prodid),
foreign key (bagid) references bag(bagid),
foreign key (prodid) references product(prodid)
);

create table aidsrc(
aid int(10) auto_increment,
name varchar(20) unique not null,
fedstate tinyint(1),
primary key (aid)
);

create table finaid(
cid int(10), 
aid int(10),
primary key(cid, aid),
foreign key (cid) references client(cid),
foreign key (aid) references aidsrc(aid)
);


-- insert into Client values
-- (null,'Ahmed', 'Evan', 12341253, 'm', '1991-07-26', '1991-07-26', 2, 2, '123 Example St.', 'NoWhere', 'AK', 11311, 123);

