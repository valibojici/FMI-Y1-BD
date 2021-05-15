CREATE TABLE artist(
	id number(4),
	nume varchar2(40) not null,
	tara varchar(20) not null,
	constraint pk_artist primary key(id)
);


CREATE TABLE utilizator(
	id number(4),
	nume varchar2(20) not null,
	prenume varchar2(20) not null,
	email varchar2(40) not null,
	date_nastere date not null,
	constraint pk_utilizator primary key(id)
);

CREATE TABLE album(
	id number(4),
	denumire varchar2(40) not null,
	id_artist number(4) not null,
	nr_cantece number(2) not null,
	constraint pk_album primary key(id),
	constraint fk_id_artist_album foreign key(id_artist) references artist(id)
);

CREATE TABLE cantec(
	id number(4),
	denumire varchar2(40) not null,
	id_artist number(4) not null,
	id_album number(4),
	durata number(4) not null,
	gen  varchar2(20) not null,
	constraint pk_cantec primary key(id),
	constraint fk_id_artist_cantec foreign key(id_artist) references artist(id),
	constraint fk_id_album_cantec foreign key(id_album) references album(id)	
);

CREATE TABLE podcast(
	id number(4),
	denumire varchar2(100) not null,
	id_artist number(4) not null,
	durata number(6) not null,
	categorie  varchar2(20) not null,
	descriere varchar2(1000),
	constraint pk_podcast primary key(id),
	constraint fk_id_artist_podcast foreign key(id_artist) references artist(id)
);

CREATE TABLE playlist(
	id number(4),
	denumire varchar2(20) not null, 
	id_utilizator number(4),
	nr_cantece number(3),
	data_creata date,
	constraint pk_playlist primary key(id),
	constraint fk_id_utilizator_playlist foreign key(id_utilizator) references utilizator(id)
);

CREATE TABLE utilizator_playlist(
	id_utilizator number(4),
	id_playlist number(4),
	data date not null,
	constraint pk_utilizator_playlist primary key (id_utilizator, id_playlist)
);

CREATE TABLE utilizator_album(
	id_utilizator number(4),
	id_album number(4),
	constraint pk_utilizator_album primary key (id_utilizator, id_album)
);

CREATE TABLE utilizator_artist(
	id_utilizator number(4),
	id_artist number(4),
	constraint pk_utilizator_artist primary key (id_utilizator, id_artist)
);

CREATE TABLE utilizator_cantec(
	id_utilizator number(4),
	id_cantec number(4),
	data date,
	apreciere number(1) DEFAULT NULL,
	nr_ascultari number(3) NOT NULL,
	constraint pk_utilizator_cantec primary key(id_utilizator, id_cantec)
);

CREATE TABLE utilizator_podcast(
	id_utilizator number(4),
	id_podcast number(4),
	apreciere number(1) DEFAULT NULL,
	constraint pk_utilizator_podcast primary key(id_utilizator, id_podcast)
);

CREATE TABLE playlist_cantec(
	id_playlist number(4),
	id_cantec number(4),
	constraint pk_playlist_cantec primary key(id_playlist, id_cantec)
);
