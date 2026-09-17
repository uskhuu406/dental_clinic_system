
USE dental_clinic;

CREATE TABLE Uvchtun(
    uvchtun_id int AUTO_INCREMENT primary key,
    ovog varchar(50) not null,
    ner varchar(50) not null,
    utas varchar(20) not null,
    tursun_ognoo date not null,
    huis varchar(10),
    hayag varchar(200),
    email varchar(100),
    harshil TEXT,
    burtgesen_ognoo date default (CURRENT_DATE)
);


CREATE TABLE Ajiltan(
    ajiltan_id int AUTO_INCREMENT primary key,
    ovog varchar(50) not null,
    ner varchar(50) not null,
    utas varchar(20) not null,
    email varchar(100),
    alban_tushaal varchar(50) not null,
    mergejil varchar(100),
    ajild_orson_ognoo date not null
);

CREATE TABLE uilchilgee(
    uilchilgee_id int AUTO_INCREMENT primary key,
    uilchilgee_ner varchar(100) not null,
    tailbar TEXT,
    une DECIMAL(10,2) not null check(une>=0),
    hugatsaa int not null ceck (hugatsaa>0)
);

CREATE TABLE tsag_zahialga(
    tsag_zahialga_id int AUTO_INCREMENT primary key,
    uvchtun_id int not null,
    ajiltan_id int not null,
    ognoo date not null,
    tsag time not null,
    tuluv varchar(30) not null default 'zahialsan',
    foreign key (uvchtun_id) REFERENCES Uvchtun(uvchtun_id),
    foreign key (ajiltan_id) REFERENCES Ajiltan(ajiltan_id)
);

CREATE TABLE tsag_zahialga_uilchilgee(
    tsag_zahialga_id int not null,
    uilchilgee_id int not null,
    primary key (tsag_zahialga_id, uilchilgee_id),
    foreign key (tsag_zahialga_id) REFERENCES tsag_zahialga(tsag_zahialga_id),
    foreign key (uilchilgee_id) REFERENCES uilchilgee(uilchilgee_id)
);

CREATE TABLE emchilgee(
    emchilgee_id int AUTO_INCREMENT primary key,
    tsag_zahialga_id int not null,
    uilchilgee_id int not null,
    emchilgeenii_ognoo date not null,
    onosh varchar(200),
    temdeglel TEXT,
    foreign key (tsag_zahialga_id, uilchilgee_id)
    REFERENCES tsag_zahialga_uilchilgee(tsag_zahialga_id, uilchilgee_id)
);

CREATE TABLE tulbur(
    tulbur_id int AUTO_INCREMENT primary key,
    emchilgee_id int not null,
    tulburiin_dun DECIMAL(10,2) not null check (tulburiin_dun>0),
    tulburiin_turul varchar(30) not null,
    tulburiin_ognoo date not null,
    tuluv varchar(30) not null,
    foreign key (emchilgee_id) REFERENCES emchilgee(emchilgee_id)
);

CREATE TABLE irts(
    irts_id int AUTO_INCREMENT primary key,
    ajiltan_id int not null,
    ognoo date not null,
    irsen_tsag time,
    garsan_tsag time,
    foreign key (ajiltan_id) REFERENCES Ajiltan(ajiltan_id)
);

CREATE TABLE baraa_material(
    baraa_id int AUTO_INCREMENT primary key,
    baraa_ner varchar(100) not null,
    turul varchar(50),
    uldegdel int not null check (uldegdel>=0),
    negj varchar(30) not null,
    dood_hemjee int not null check (dood_hemjee>=0)
);




show TABLEs;

show CREATE TABLE uilchilgee;

SELECT * FROM emchilgee;
SELECT * FROM tulbur;
