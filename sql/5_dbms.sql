
INSERT INTO uilchilgee(
    uilchilgee_ner,
    tailbar,
    une,
    hugatsaa
)
VALUES(
    'ss_test',
    'turshilt',
    10000,
    10
);

UPDATE uilchilgee
SET une = 12000
WHERE uilchilgee_ner = 'ss_test';

SELECT * FROM uilchilgee
WHERE uilchilgee_ner = 'ss_test';


DESCRIBE Uvchtun;


START TRANSACTION;

UPDATE uilchilgee
SET une = 88888
WHERE uilchilgee_id = 1;

SELECT uilchilgee_id, uilchilgee_ner, une
FROM uilchilgee
WHERE uilchilgee_id = 1;

ROLLBACK;

SELECT uilchilgee_id, uilchilgee_ner, une
FROM uilchilgee
WHERE uilchilgee_id = 1;

START TRANSACTION;

SAVEPOINT before_change;

UPDATE uilchilgee
SET une = 999999
WHERE uilchilgee_id = 1;

ROLLBACK TO SAVEPOINT before_change;

SELECT uilchilgee_id, uilchilgee_ner, une
FROM uilchilgee
WHERE uilchilgee_id = 1;

COMMIT;

SHOW GRANTS FOR CURRENT_USER;

SELECT
    CONNECTION_ID(),
    USER(),
    DATABASE();

SHOW PROCESSLIST;


INSERT INTO tsag_zahialga(
    uvchtun_id,
    ajiltan_id,
    ognoo,
    tsag,
    tuluv
)
VALUES(
    9999,
    1,
    '2026-09-25',
    '10:00:00',
    'zahialsan'
);



CREATE OR REPLACE VIEW uvchtun_tsag AS
SELECT
    Uvchtun.ner,
    tsag_zahialga.ognoo,
    tsag_zahialga.tsag
FROM Uvchtun
JOIN tsag_zahialga
ON Uvchtun.uvchtun_id = tsag_zahialga.uvchtun_id;

SELECT * FROM uvchtun_tsag;



CHECK TABLE Uvchtun;

ANALYZE TABLE Uvchtun;




SELECT uilchilgee_id, uilchilgee_ner, une
FROM uilchilgee
WHERE uilchilgee_id = 1;

START TRANSACTION;

UPDATE uilchilgee
SET une = 90000
WHERE uilchilgee_id = 1;

ROLLBACK;

SELECT uilchilgee_id, uilchilgee_ner, une
FROM uilchilgee
WHERE uilchilgee_id = 1;


START TRANSACTION;

SAVEPOINT before_change;

UPDATE uilchilgee
SET une = 999999
WHERE uilchilgee_id = 1;

ROLLBACK TO SAVEPOINT before_change;

SELECT uilchilgee_id, uilchilgee_ner, une
FROM uilchilgee
WHERE uilchilgee_id = 1;

COMMIT;
