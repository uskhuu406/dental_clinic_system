# Database Normalization

**Сэдэв: Шүдний эмнэлгийн удирдлагын систем**

Өгөгдлийн давхардлыг багасгаж, нэмэх, засах, устгах үед
үүсэх асуудлаас сэргийлэхийн тулд мэдээллийг
1NF → 2NF → 3NF болгон зохион байгуулсан.

Доорх нь цаг захиалгын мэдээллийг нормчлох жишээ юм.
Цэвэрлэгээ, ломбо гэсэн өгөгдлийг тайлбарын жишээ болгон ашигласан.

## 1NF — Нэг нүдэнд нэг утга

Өвчтөн, эмч, цаг захиалга, үйлчилгээний мэдээллийг
нэг хүснэгтэд хадгалсан гэж үзье.

Нэг захиалгын олон үйлчилгээг нэг нүдэнд бичсэн:

| tsag_zahialga_id | uilchilgee_id | uilchilgee_ner    | une          |
| ---------------- | ------------- | ----------------- | ------------ |
| 1                | 1, 2          | Цэвэрлэгээ, Ломбо | 50000, 80000 |

Энэ нь нэг нүдэнд олон утгатай тул 1NF хангахгүй.
Үйлчилгээ бүрийг тусдаа мөр болгосон:

| tsag_zahialga_id | uilchilgee_id | uilchilgee_ner | une   |
| ---------------- | ------------- | -------------- | ----- |
| 1                | 1             | Цэвэрлэгээ     | 50000 |
| 1                | 2             | Ломбо          | 80000 |

Нормчлолыг тайлбарлахад ашигласан хүснэгтийн баганууд:

```text
TsagZahialgaMedeelel
--------------------
tsag_zahialga_id
uilchilgee_id
uvchtun_id
uvchtun_ner
uvchtun_utas
ajiltan_id
ajiltan_ner
ognoo
tsag
tuluv
uilchilgee_ner
tailbar
une
hugatsaa
```

Нэг захиалгад ижил үйлчилгээг нэг удаа сонгоно гэж үзсэн.
Тиймээс дараах нийлмэл түлхүүрийг сонгосон:

```text
PK (tsag_zahialga_id, uilchilgee_id)
```

Зөвхөн захиалгын ID нь мөрийг ялгаж чадахгүй.
Учир нь нэг захиалгад олон үйлчилгээ байна.

Зөвхөн үйлчилгээний ID нь мөн мөрийг ялгаж чадахгүй.
Учир нь нэг үйлчилгээг олон захиалгад сонгож болно.

Харин хоёр ID-ийн хослол давтагдахгүй.

**Нэг нүдэнд нэг утгатай болсон тул 1NF хангана.**

## 2NF — Түлхүүрийн нэг хэсгээс хамаарах хамаарлыг арилгах

2NF нь 1NF хангасан бөгөөд түлхүүр биш баганууд
аль нэг боломжит нийлмэл түлхүүрийн зөвхөн нэг хэсгээс
хамаарахгүй байхыг шаарддаг.

Манай жишээнд:

```text
tsag_zahialga_id →
uvchtun_id, uvchtun_ner, uvchtun_utas,
ajiltan_id, ajiltan_ner, ognoo, tsag, tuluv

uilchilgee_id →
uilchilgee_ner, tailbar, une, hugatsaa
```

Захиалгын мэдээлэл нь зөвхөн `tsag_zahialga_id`-аас,
үйлчилгээний мэдээлэл нь зөвхөн `uilchilgee_id`-аас хамаарч байна.

Энэ нь нийлмэл түлхүүрийн нэг хэсгээс хамаарч байгаа
тул Partial Dependency буюу хэсэгчилсэн хамаарал юм.

Иймээс гурван хүснэгтэд салгасан:

```text
tsag_zahialga
------------
tsag_zahialga_id PK
uvchtun_id
uvchtun_ner
uvchtun_utas
ajiltan_id
ajiltan_ner
ognoo
tsag
tuluv
```

```text
uilchilgee
----------
uilchilgee_id PK
uilchilgee_ner
tailbar
une
hugatsaa
```

```text
tsag_zahialga_uilchilgee
----------------------
tsag_zahialga_id FK
uilchilgee_id FK

PK (tsag_zahialga_id, uilchilgee_id)
```

Холбогч хүснэгт нь тухайн захиалгад ямар үйлчилгээнүүд
сонгосныг хадгална.

**Хэсэгчилсэн хамаарлыг арилгасан тул 2NF хангана.**

## 3NF — Дам хамаарлыг арилгах

Манай жишээнд 3NF болгохын тулд түлхүүр биш
багануудаар дамжсан хамаарлыг арилгана.

`tsag_zahialga` хүснэгтэд:

```text
tsag_zahialga_id → uvchtun_id → uvchtun_ner, uvchtun_utas

tsag_zahialga_id → ajiltan_id → ajiltan_ner
```

Өвчтөний нэр, утас нь өвчтөний ID-аас хамаарна.
Ажилтны нэр нь ажилтны ID-аас хамаарна.

Эдгээр нь захиалгын ID-аас өөр ID-аар дамжин
хамаарч байгаа тул Transitive Dependency буюу дам хамаарал юм.

Тиймээс өвчтөн, ажилтны мэдээллийг тусад нь салгасан.
Мөн шаардлагад заасан бусад багануудыг нэмсэн.

```text
Uvchtun
--------
uvchtun_id PK
ovog
ner
utas
tursun_ognoo
huis
hayag
email
harshil
burtgesen_ognoo
```

Эхний жишээний `uvchtun_ner`, `uvchtun_utas` нь
энэ хүснэгтэд `ner`, `utas` нэртэй болсон.

```text
Ajiltan
--------
ajiltan_id PK
ovog
ner
utas
email
alban_tushaal
mergejil
ajild_orson_ognoo
```

Эхний жишээний `ajiltan_ner` нь энэ хүснэгтэд
`ner` нэртэй болсон.

Цаг захиалгын хүснэгтэд өвчтөн, ажилтны ID болон
захиалгын мэдээлэл үлдсэн:

```text
tsag_zahialga
------------
tsag_zahialga_id PK
uvchtun_id FK
ajiltan_id FK
ognoo
tsag
tuluv
```

`uilchilgee`, `tsag_zahialga_uilchilgee` хүснэгтүүд
2NF дээрх бүтэцтэйгээ үлдэнэ.

Энэ загварт албан тушаал нь мэргэжлийг,
үйлчилгээний нэр нь үнийг дангаараа тодорхойлно
гэсэн нэмэлт дүрэм тавиагүй.

**Тодорхойлсон хамаарлуудын хүрээнд дам хамаарлыг
арилгасан тул дээрх бүтэц 3NF хангана.**

## Бусад хүснэгт

Системийн шаардлагаас дараах дөрвөн хүснэгтийг нэмсэн.
Эдгээр нь дээрх захиалгын хүснэгтийг салгаснаас үүсээгүй.

### emchilgee

```text
emchilgee_id PK
tsag_zahialga_id FK
uilchilgee_id FK
emchilgeenii_ognoo
onosh
temdeglel
```

Хамаарал:

```text
emchilgee_id →
tsag_zahialga_id, uilchilgee_id,
emchilgeenii_ognoo, onosh, temdeglel
```

`(tsag_zahialga_id, uilchilgee_id)` нь холбогч хүснэгтийг
заасан нийлмэл FK байна.

Нэг захиалгын нэг үйлчилгээнд олон эмчилгээний бүртгэл
байж болох тул энэ хослолыг UNIQUE гэж үзээгүй.

Өвчтөн болон эмчийн мэдээллийг захиалгаар дамжуулан
авна. Эмчилгээний хүснэгтэд давтан хадгалахгүй.

### tulbur

```text
tulbur_id PK
emchilgee_id FK
tulburiin_dun
tulburiin_turul
tulburiin_ognoo
tuluv
```

Хамаарал:

```text
tulbur_id →
emchilgee_id, tulburiin_dun,
tulburiin_turul, tulburiin_ognoo, tuluv
```

Нэг эмчилгээнд олон төлбөр бүртгэж болох тул
`emchilgee_id` нь төлбөрийн нэг мөрийг дангаараа ялгахгүй.

Өвчтөний мэдээллийг эмчилгээ болон захиалгаар
дамжуулан авна.

### irts

```text
irts_id PK
ajiltan_id FK
ognoo
irsen_tsag
garsan_tsag
```

Хамаарал:

```text
irts_id →
ajiltan_id, ognoo, irsen_tsag, garsan_tsag
```

Ажилтны нэр болон бусад мэдээллийг энд давтан хадгалахгүй.
`ajiltan_id`-аар ажилтны хүснэгттэй холбоно.

Одоогийн бүтэц нэг ажилтанд нэг өдөр олон ирцийн
бүртгэл оруулах боломжтой.

### baraa_material

```text
baraa_id PK
baraa_ner
turul
uldegdel
negj
dood_hemjee
```

Хамаарал:

```text
baraa_id →
baraa_ner, turul, uldegdel, negj, dood_hemjee
```

Энэ загварт барааны төрөл нь нэгж эсвэл доод хэмжээг
заавал тодорхойлно гэсэн дүрэм байхгүй.
Эдгээрийг бараа бүрээр бүртгэнэ.

Дээрх дөрвөн хүснэгтэд утгуудыг нэг нүдэнд нэгээр хадгална.
Тодорхойлсон түлхүүр болон хамаарлын хүрээнд хэсэгчилсэн,
дам хамаарал байхгүй тул 3NF хангана.

Зөвхөн ID түлхүүртэй байх нь дангаараа 3NF-ийн баталгаа
биш. Бусад баганын хооронд хамаарал байгаа эсэхийг мөн шалгана.

## Эцсийн хүснэгтүүд

1. `Uvchtun`
2. `Ajiltan`
3. `tsag_zahialga`
4. `uilchilgee`
5. `tsag_zahialga_uilchilgee`
6. `emchilgee`
7. `tulbur`
8. `irts`
9. `baraa_material`

## Дүгнэлт

- **1NF:** Нэг нүдэнд нэг утга хадгалсан.
- **2NF:** Нийлмэл түлхүүрийн нэг хэсгээс хамаарах мэдээллийг салгасан.
- **3NF:** Түлхүүр биш баганаар дамжин хамаарах мэдээллийг салгасан.

Ингэснээр өвчтөн, ажилтан, үйлчилгээний мэдээллийг
захиалга бүрд давтан хадгалах шаардлагагүй болсон.
