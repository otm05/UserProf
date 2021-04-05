create database if not exists userreq;
use userreq;
--drop database userreq;

--Table ROLES
create table roles
(
idrole varchar(20) primary key not null,
libelle nvarchar(20)
);

--Table USER
create table user
(
userID varchar(20),
nom varchar(20),
prenom varchar(20),
adresse varchar(30),
ville varchar(20),
genre varchar(20),
constraint Const_Genre check (genre in ('M','F','A')),
dateNaissaince varchar(20),
telephone varchar(20),
email varchar(20),
_password varchar(20),
photo varchar(20),
idrole varchar(20),
compteEtat varchar(20),
constraint Const_EtatCompte check (compteEtat in ('A','D')),
secretQuestion varchar(20),
secretReponse varchar(20),
constraint pk1_usmail primary key(userID,email)
);
alter table user add foreign key (idrole) references roles(idrole);

--Table REQUEST_USERS
create table request
(
userID varchar(20),
codeReq varchar(20),
dateReq varchar(20),
motifReq varchar(20),
reponseReq varchar(20),
etatReq varchar(20),
typeReq varchar(20),
constraint pk1_userID primary key(userID,codeReq)
);
alter table request add foreign key (userID) references user(userID);

