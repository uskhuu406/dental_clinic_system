use dental_clinic;

SELECT
    tsag_zahialga.tsag_zahialga_id,
    Uvchtun.ner,
    Uvchtun.utas,
    tsag_zahialga.ognoo,
    tsag_zahialga.tsag
FROM tsag_zahialga
JOIN Uvchtun
ON tsag_zahialga.uvchtun_id = Uvchtun.uvchtun_id;

SELECT
    tsag_zahialga.tsag_zahialga_id,
    Ajiltan.ner,
    Ajiltan.mergejil,
    tsag_zahialga.ognoo,
    tsag_zahialga.tsag
FROM tsag_zahialga
JOIN Ajiltan
ON tsag_zahialga.ajiltan_id = Ajiltan.ajiltan_id;

SELECT
    tsag_zahialga.tsag_zahialga_id,
    uilchilgee.uilchilgee_ner,
    uilchilgee.une,
    tsag_zahialga.ognoo,
    tsag_zahialga.tsag
FROM tsag_zahialga
JOIN tsag_zahialga_uilchilgee
ON tsag_zahialga.tsag_zahialga_id = tsag_zahialga_uilchilgee.tsag_zahialga_id
JOIN uilchilgee
ON tsag_zahialga_uilchilgee.uilchilgee_id = uilchilgee.uilchilgee_id;

SELECT
    emchilgee.emchilgee_id,
    uilchilgee.uilchilgee_ner,
    emchilgee.emchilgeenii_ognoo,
    emchilgee.onosh,
    emchilgee.temdeglel
FROM emchilgee
JOIN uilchilgee
ON emchilgee.uilchilgee_id = uilchilgee.uilchilgee_id;

SELECT
tulbur.tulbur_id,
emchilgee.emchilgeenii_ognoo,
emchilgee.onosh,
tulburiin_dun,
tulburiin_turul
from  emchilgee
join tulbur
on emchilgee.emchilgee_id=tulbur.emchilgee_id;


select
Uvchtun.ovog,
Uvchtun.ner,
Ajiltan.ovog,
Ajiltan.ner,
Ajiltan.alban_tushaal,
Ajiltan.mergejil,
Uvchtun.utas
from tsag_zahialga
join Ajiltan
on Ajiltan.ajiltan_id=tsag_zahialga.ajiltan_id
join Uvchtun
on Uvchtun.uvchtun_id=tsag_zahialga.uvchtun_id;
