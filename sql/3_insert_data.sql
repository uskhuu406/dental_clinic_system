use dental_clinic;

insert into Uvchtun(
    ovog,
    ner,
    utas,
    tursun_ognoo,
    huis,
    hayag,
    email,
    harshil
)
VALUES(
    'bat',
    'galaa',
    '88429033',
    '2003-02-04',
    'er',
    'ulaanbaatar',
    'galaa@gmail.com',
    'baihgui'
);

select *from Uvchtun;

insert into Ajiltan(
    ovog,
    ner,
    utas,
    email,
    alban_tushaal,
    mergejil,
    ajild_orson_ognoo
)
VALUES(
    'bold',
    'solongo',
    '99722462',
    'solongo@gmail.com',
    'emch',
    'shudnii emch',
    '2025-01-13'
);

select *from Ajiltan;

insert into uilchilgee(
    uilchilgee_ner,
    tailbar,
    une,
    hugatsaa
)
VALUES(
    'tseverlegee',
    'shud tseverleh uilchilgee',
    50000,
    30
);

select *from uilchilgee;

insert into tsag_zahialga(
    uvchtun_id,
    ajiltan_id,
    ognoo,
    tsag,
    tuluv
)
VALUES(
    1,
    1,
    '2026-09-16',
    '14:00:00',
    'duussan'
);

select *from tsag_zahialga;

insert into tsag_zahialga_uilchilgee(
    tsag_zahialga_id,
    uilchilgee_id
)
VALUES(
    1,
    1
);

select *from tsag_zahialga_uilchilgee;

insert into emchilgee(
    tsag_zahialga_id,
    uilchilgee_id,
    emchilgeenii_ognoo,
    onosh,
    temdeglel
)
VALUES(
    1,
    1,
    '2026-09-16',
    'shudnii chuluutai',
    'shudnii chuluu tseverlesen'
);

select *from emchilgee;

insert into tulbur(
    emchilgee_id,
    tulburiin_dun,
    tulburiin_turul,
    tulburiin_ognoo,
    tuluv
)
VALUES(
    1,
    50000,
    'card',
    '2026-09-16',
    'tulugdsun'
);

select *from tulbur;

insert into irts(
    ajiltan_id,
    ognoo,
    irsen_tsag,
    garsan_tsag
)
VALUES(
    1,
    '2026-09-16',
    '09:00:00',
    '18:00:00'
);

select *from irts;

insert into baraa_material(
    baraa_ner,
    turul,
    uldegdel,
    negj,
    dood_hemjee
)
VALUES(
    'emnelegiin beelii',
    'heregleenii material',
    50,
    'hairtsag',
    10
);

select *from baraa_material;
