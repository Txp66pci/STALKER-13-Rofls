/sidoritem
	var/name = null
	var/itemtype = null
	var/cost = 0
	var/list/words = list()

//Автоматы

/sidoritem/ak74
    name = "АКм74/2"
    itemtype = /obj/item/weapon/gun/projectile/automatic/ak74
    cost = 14000
    words = list("Калаш" = 5, "калаш" = 5, "ак74" = 5, "АК74" = 5, "Автомат" = 5, "автомат" = 5, "Калашников" = 5, "калашников" = 5, "Kalashnikov" = 5, "Kalashnikov" = 10)

/sidoritem/aksu74
    name = "АКм74/2с"
    itemtype = /obj/item/weapon/gun/projectile/automatic/aksu74
    cost = 17000
    words = list("Укороченный" = 5, "укороченный" = 5, "Калаш" = 5, "калаш" = 5, "ак74" = 5, "АК74" = 5, "Автомат" = 5, "автомат" = 5, "Калашников" = 5, "калашников" = 5, "Kalashnikov" = 5, "Kalashnikov" = 10)

/sidoritem/mp5
    name = "Гадюка"
    itemtype = /obj/item/weapon/gun/projectile/automatic/mp5
    cost = 12000
    words = list("Гадюка" = 5, "МП10" = 5, "мп10" = 5, "гадюка" = 5, "mp10" = 5, "эмку" = 5, "эмочка" = 5, "mp10" = 10)

/sidoritem/groza
    name = "ОЦ14 Гроза"
    itemtype = /obj/item/weapon/gun/projectile/automatic/groza
    cost = 32000
    words = list("Гроза" = 5, "гроза" = 5, "thunderstorm" = 5, "Thunder" = 5, "thunder" = 5, "ОЦ14" = 5, "ОЦ14" = 10)

//Снайперские винтовки

/sidoritem/vintorez
    name = "Винтарь ВС"
    itemtype = /obj/item/weapon/gun/projectile/automatic/vintorez
    cost = 27000
    words = list("Винторез" = 5, "Винтарь" = 5, "винтарь" = 10)

/sidoritem/val
    name = "Снайперский ВЛА"
    itemtype = /obj/item/weapon/gun/projectile/automatic/val
    cost = 23000
    words = list("Вла" = 5, "Снайперский" = 5, "вла" = 5, "снайперский" = 5, "снайперский вла" = 5, "снайперский Вла" = 5, "Shaft" = 5, "Снайперский вла" = 10)

//Дробовики

/sidoritem/bm16
    name = "Двустволка"
    itemtype = /obj/item/weapon/gun/projectile/revolver/bm16
    cost = 12000
    words = list("Двустволка" = 5, "двустволка" = 5, "пушка" = 5, "Пушка" = 10)

/sidoritem/toz34
    name = "Тоз-34"
    itemtype = /obj/item/weapon/gun/projectile/revolver/bm16/toz34
    cost = 15000
    words = list("ТОЗ" = 5, "тоз" = 5, "34" = 10)

/sidoritem/chaser
    name = "Чейзер-13"
    itemtype = /obj/item/weapon/gun/projectile/shotgun/chaser
    cost = 20000
    words = list("Чейзер" = 5, "чейзер" = 5, "13" = 10)

//Пистолеты

/sidoritem/pm
    name = "ПМ"
    itemtype = /obj/item/weapon/gun/projectile/automatic/pistol/pm
    cost = 2500
    words = list("пм" = 5, "ПМ" = 5, "Пистолет Макарова" = 5, "пистолет Макарова" = 5, "Пистолет макарова" = 10)

/sidoritem/sip
    name = "Епа-т M200"
    itemtype = /obj/item/weapon/gun/projectile/automatic/pistol/sip
    cost = 7500
    words = list("Епа" = 5, "епа" = 5, "Епа-т М200" = 15, "Епа-т" = 5, "епа-т м200" = 15, "епа-т" = 10)

/sidoritem/cora
    name = "Кора 919"
    itemtype = /obj/item/weapon/gun/projectile/automatic/pistol/cora
    cost = 8000
    words = list("Кора" = 5, "лай" = 5, "Кору" = 5, "Лай" = 5, "Кора 919" = 5, "лай 919" = 5, "кора 919" = 5, "Лай 919" = 10)

/sidoritem/marta
    name = "Марта"
    itemtype = /obj/item/weapon/gun/projectile/automatic/pistol/marta
    cost = 10000
    words = list("Марта" = 5, "марта" = 5, "Марш" = 5, "марш" = 10)

/sidoritem/fort12
	name = "Фора-12 Мк2"
	itemtype = /obj/item/weapon/gun/projectile/automatic/pistol/fort12
	cost = 5000
	words = list("Форт" = 5, "форт" = 5, "Форт 12" = 5, "форт 12" = 5, "Форт12" = 5, "12 Мк2" = 5, "12 МК2" = 5, "12Мк2" = 5, "12МК2" = 5, "12Мк2" = 10)

/sidoritem/pb1s
	name = "ПБ1с"
	itemtype = /obj/item/weapon/gun/projectile/automatic/pistol/pb1s
	cost = 4000
	words = list("ПБ1с" = 5, "пб1с" = 5, "Пб1с" = 5, "ПБ1С" = 5, "пБ1с" = 5, "пб1С" = 10)

/sidoritem/usp_match
	name = "ЮСП"
	itemtype = /obj/item/weapon/gun/projectile/automatic/pistol/usp_match
	cost = 9000
	words = list("Usp" = 5, "Юсп" = 5, "ЮСП" = 5, "usp" = 10)

//Шлемы

/sidoritem/gasmask
	name = "Противогаз"
	itemtype = /obj/item/clothing/mask/gas/stalker
	cost = 3000
	words = list("Противогаз" = 5, "противогаз" = 5)

/sidoritem/tacticalhelmet
	name = "Тактический шлем"
	itemtype = /obj/item/clothing/head/tacticalhelmet
	cost = 7000
	words = list("Тактический шлем" = 5, "тактический шлем" = 5, "Тактический Шлем" = 10)

/sidoritem/spheram
	name = "Сфера M12"
	itemtype = /obj/item/clothing/head/spheram
	cost = 9000
	words = list("Сфера" = 5, "сфера" = 5, "Сферу" = 5, "сферу" = 5, "М12" = 5)

//Легка&#255; брон&#255;

/sidoritem/kozhanka
	name = "Кожаная Куртка"
	itemtype = /obj/item/clothing/suit/hooded/kozhanka
	cost = 6000
	words = list("Кожанка" = 5, "кожанка" = 5, "Кожа" = 5, "кожа" = 5, "Куртка" = 5, "куртка" = 5, "kozhanka" = 5, "kozhanka" = 5, "Кожаный" = 5, "кожаный" = 5, "jacket" = 5, "Jacket" = 5)

/sidoritem/kozhanka/white
	itemtype = /obj/item/clothing/suit/hooded/kozhanka/white
	words = list("Кожанка" = 5, "кожанка" = 5, "Белый" = 5, "белый" = 5, "кожа" = 5, "куртка" = 5, "Куртка" = 5, "Kozhanka" = 5, "kozhanka" = 5, "kozhanka" = 5, "Белая" = 5, "белая" = 5, "Кожаный" = 5, "кожаный" = 5, "Jacket" = 5, "jacket" = 5)

/sidoritem/kozhanka/banditka
	itemtype = /obj/item/clothing/suit/hooded/kozhanka/banditka
	words = list("Бандит" = 5, "бандит" = 5, "bandit" = 5, "кожа" = 5, "Кожа" = 5, "Куртка" = 5, "куртка" = 5, "Bandit" = 5, "Бандитский" = 5, "бандитский" = 5, "кожаный" = 5, "Кожаный" = 5, "Jacket" = 5, "jacket" = 5, "jacket" = 5)

/sidoritem/banditcoat
	name = "Плащ"
	itemtype = /obj/item/clothing/suit/hooded/kozhanka/banditka/coat
	cost = 10000
	words = list("Банжит" = 5, "бандит" = 5, "плащ" = 5, "Плащ" = 5)

/sidoritem/kombez
	name = "Заря"
	itemtype = /obj/item/clothing/suit/hooded/kombez
	cost = 22000
	words = list("Комбинезон" = 5, "комбинезон" = 5, "Сталкер" = 5, "сталкер" = 5, "Заря" = 5)
//Средн&#255;&#255; брон&#255;

/sidoritem/ecolog
	name = "ССП-99"
	itemtype = /obj/item/clothing/suit/hooded/sealed/ecolog
	cost = 85000
	words = list("Эколог" = 5, "эколог" = 5, "Зелёный" = 5, "зелёный" = 5, "ССП" = 5, "SPP-99" = 5, "99" = 5, "Ecologist" = 5, "ecologist" = 10)

/sidoritem/ecologm
	name = "ССП-99M"
	itemtype = /obj/item/clothing/suit/hooded/sealed/ecologm
	cost = 100000
	words = list("Эколог" = 5, "эколог" = 5, "Оранжевый" = 5, "оранжевый" = 5, "улучшенный" = 5, "Улучшенный" = 5, "ССП" = 5, "ССП-99М" = 15, "99М" = 5, "Improved" = 5, "Improved" = 5, "Ecologist" = 5, "ecologist" = 10)

/sidoritem/seva
	name = "СЕВА"
	itemtype = /obj/item/clothing/suit/hooded/sealed/seva
	cost = 80000
	words = list("СЕВА" = 5, "Сева" = 5, "сева" = 5, "seva" = 5)

/sidoritem/berill
	name = "Берил 5М"
	itemtype = /obj/item/clothing/suit/berill
	cost = 40000
	words = list("Берил" = 5, "берил" = 5, "Beryl" = 5, "beryl" = 5)

/sidoritem/army
	name = "Броня Военных"
	itemtype = /obj/item/clothing/suit/army
	cost = 8000
	words = list("Военный" = 5, "военный" = 5, "бронежилет" = 5, "Бронежилет" = 5)
/
/sidoritem/psz9d
	name = "ПСЗ 9Д"
	itemtype = /obj/item/clothing/suit/hooded/kombez/psz9d
	cost = 60000
	words = list("ПСЗ" = 5, "9Д" = 5, "ПСЗ9Д" = 5, "псз" = 5, "9д" = 5, "псз9д" = 10)
/
/sidoritem/mercenary
	name = "Комбенизон Наёмника"
	itemtype = /obj/item/clothing/suit/hooded/kombez/mercenary
	cost = 19000
	words = list("Suit" = 5, "suit" = 5, "Mercenary" = 5, "mercenary" = 5, "armor" = 5, "Armor" = 5)
/
/sidoritem/strazh
	name = "Страж Свободы"
	itemtype = /obj/item/clothing/suit/hooded/kozhanka/strazh
	cost = 68000
	words = list("Страж" = 5, "страж" = 5, "Свободы" = 5, "свободы" = 5, "Стража" = 5, "стража" = 5)
/
//Т&#255;жела&#255; брон&#255;

/sidoritem/exoskelet
	name = "Экзоскелет"
	itemtype = /obj/item/clothing/suit/hooded/sealed/exoskelet
	cost = 120000
	words = list("Экзоскелет" = 5, "экзоскелет" = 5, "Экза" = 5, "экза" = 5)

/sidoritem/psz9md
	name = "ПСЗ-9МД"
	itemtype = /obj/item/clothing/suit/hooded/sealed/psz9md
	cost = 80000
	words = list("ПСЗ" = 5, "9МД" = 5, "ПСЗ9МД" = 5, "ПСЗ" = 5, "9мд" = 5, "псз9мд" = 5, "seva" = 5, "Seva" = 5, "долг" = 5, "Долг" = 5)

//Медикаменты

/sidoritem/firstaid/stalker
	name = "Аптечка"
	itemtype = /obj/item/weapon/reagent_containers/pill/stalker/aptechka/civilian
	cost = 500
	words = list("Аптечка" = 5, "аптечка" = 5, "аптека" = 5, "Аптека" = 5)

/sidoritem/firstaid/army
	name = "Армейская аптечка"
	itemtype = /obj/item/weapon/reagent_containers/pill/stalker/aptechka/army
	cost = 1000
	words = list("Аптечка" = 5, "аптечка" = 5, "армейская" = 5, "Армейская" = 5, "Аптечка" = 5, "Military" = 5, "Военная" = 5, "военная" = 5, "аптечка" = 5, "first aid kit" = 5)

/sidoritem/firstaid/science
	name = "Научная аптечка"
	itemtype = /obj/item/weapon/reagent_containers/pill/stalker/aptechka/scientific
	cost = 2000
	words = list("Аптечка" = 5, "аптечка" = 5, "Научная" = 5, "научная" = 5, "Научная" = 5, "научная" = 5, "Аптечка" = 5, "аптечка" = 5)

/sidoritem/bint
	name = "Бинт"
	itemtype = /obj/item/stack/medical/gauze/bint
	cost = 100
	words = list("Бинт" = 5, "бинт" = 5)

/sidoritem/antirad
	name = "Антирад"
	itemtype = /obj/item/weapon/reagent_containers/hypospray/medipen/stalker/antirad
	cost = 700
	words = list("Антирад" = 5, "антирад" = 5)

//Еда

/sidoritem/dogtail
	name = "Хвост собаки"
	itemtype = /obj/item/weapon/stalker/loot/mutantparts/dog_tail
	cost = 1000

/sidoritem/flesheye
	name = "Глаз плоти"
	itemtype = /obj/item/weapon/stalker/loot/mutantparts/flesh_eye
	cost = 2000

/sidoritem/boarleg
	name = "Копыто кабана"
	itemtype = /obj/item/weapon/stalker/loot/mutantparts/boar_leg
	cost = 4000

/sidoritem/konserva
	name = "Консерва"
	itemtype = /obj/item/weapon/reagent_containers/food/snacks/stalker/konserva
	cost = 200
	words = list("Консерва" = 5, "консерва" = 5, "Консервированный" = 5, "консервированный" = 5, "Консервированная еда" = 5, "консервированная" = 5, "Завтрак" = 5, "завтрак" = 5, "Турист" = 5, "турист" = 5, "Банка" = 5, "банка" = 5)

/sidoritem/konserva/shproti
	itemtype = /obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/shproti
	words = list("Банку" = 5, "банку" = 5, "Шпроты" = 5, "шпроты" = 5, "Sprats" = 5, "sprats" = 5, "Рига" = 5, "рига" = 5, "Riga" = 5, "Riga" = 5, "Банка" = 5, "банка" = 5)

/sidoritem/konserva/soup
	name = "Суп"
	itemtype = /obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/soup
	words = list("Банка" = 5, "банка" = 5, "Консервированный" = 5, "консервированный" = 5, "Суп" = 5, "суп" = 5, "Банка" = 5, "банка" = 5)

/sidoritem/konserva/bobi
	itemtype = /obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/bobi
	words = list("Банка" = 5, "банка" = 5, "Консервированные" = 5, "консервированные" = 5, "бобы" = 5, "Ббобы" = 5, "Bobi" = 5, "BOBI" = 5)

/sidoritem/konserva/govyadina
	itemtype = /obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/govyadina2
	words = list("Банка" = 5, "банка" = 5, "Консервированная" = 5, "консервированная" = 5, "говядины" = 5, "Говядины" = 5, "Bank" = 5, "bank" = 5)

/sidoritem/kolbasa
	name = "Колбаса"
	itemtype = /obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa
	cost = 100
	words = list("Палка" = 5, "палка" = 5, "Колбаса" = 5, "колбаса" = 5, "Sausage" = 5, "sausage" = 10)

/sidoritem/hleb
	name = "Хлеб"
	itemtype = /obj/item/weapon/reagent_containers/food/snacks/stalker/baton
	cost = 100
	words = list("Батон" = 5, "Батон" = 5, "Батона" = 5, "батона" = 5, "Хлеб" = 5, "хлеб" = 5, "Хлеба" = 5, "хлеба" = 5)

/sidoritem/vodka
	name = "Казаки"
	itemtype = /obj/item/weapon/reagent_containers/food/drinks/bottle/vodka/kazaki
	cost = 300
	words = list("Бутылка" = 5, "бутылка" = 5, "Водка" = 5, "водка" = 5, "Водочки" = 5, "водочки" = 5, "Козаки" = 5, "козаки" = 5, "Vodka" = 5, "vodka" = 10)

/sidoritem/energetic
	name = "NonStop"
	itemtype = /obj/item/weapon/reagent_containers/food/drinks/soda_cans/energetic
	cost = 200
	words = list("Энергетик" = 5, "энергетик" = 5, "энергия" = 5, "NonStop" = 5, "nonstop" = 5)

//Оружие ближнего бо&#255;

/sidoritem/knife
	name = "Нож"
	itemtype = /obj/item/weapon/kitchen/knife/tourist
	cost = 600
	words = list("Нож" = 5, "нож" = 10)

//Амуници&#255;

/sidoritem/b545
	name = "П545"
	itemtype = /obj/item/ammo_box/stalker/b545
	cost = 2000
	words = list("Коробка" = 5, "Коробка" = 5, "cartridges" = 5, "Cartridges" = 5, "Cartridge" = 5, "cartridge" = 5, "Kalasha" = 5, "Kalasha" = 5, "Pÿgrater" = 20, "pÿgrater" = 20, "Pÿgraters" = 20, "pÿgraters" = 20, "5.45x39" = 5, "5.45x39" = 5)

/sidoritem/b545ap
	name = "П545ap"
	itemtype = /obj/item/ammo_box/stalker/b545ap
	cost = 3000
	words = list("Коробка" = 5, "коробка" = 5, "Armor-piercing" = 5, "armor-piercing" = 5, "Armor-piercing" = 5, "armor-piercing" = 5, "cartridges" = 5, "Cartridge" = 5, "cartridge" = 5, "cartridge" = 5, "Kalasha" = 5, "Kalasha" = 5, "Pÿgrater" = 20, "pÿgrater" = 20, "Pÿgraters" = 20, "pÿgraters" = 20, "5.45x39" = 5, "5.45x39" = 5)

/sidoritem/m545
	name = "М545"
	itemtype = /obj/item/ammo_box/magazine/stalker/m545
	cost = 800
	words = list("Магазин" = 5, "Магазин" = 5, "Kalasha" = 5, "kalashu" = 5, "5.45x39" = 5, "5.45x39" = 5)

/sidoritem/b9x18
	name = "П9x18"
	itemtype = /obj/item/ammo_box/stalker/b9x18
	cost = 1000
	words = list("Коробка" = 5, "коробка" = 5, "cartridges" = 5, "Cartridges" = 5, "cartridge" = 5, "cartridge" = 5, "9x18" = 5, "9x18" = 5)

/sidoritem/b9x18P
	name = "П9x18P"
	itemtype = /obj/item/ammo_box/stalker/b9x18P
	cost = 1500
	words = list("Коробка" = 5, "коробка" = 5, "Armor-piercing" = 5, "armor-piercing" = 5, "armor-piercing" = 5, "cartridges" = 5, "Cartridges" = 5, "Cartridge" = 5, "cartridge" = 5, "cartridge" = 5, "9x18" = 5, "9x18" = 5)

/sidoritem/m9x18
	name = "М9x18"
	itemtype = /obj/item/ammo_box/magazine/stalker/m9x18pm
	cost = 200
	words = list("Магазин" = 5, "Магазин" = 5, "PMU" = 5, "pmu" = 5, "PMA" = 5, "pma" = 5, "PB1s" = 5, "pb1s" = 5, "PB1S" = 5, "9x18" = 5, "9x18" = 5)

/sidoritem/f9x18
	name = "М9x18"
	itemtype = /obj/item/ammo_box/magazine/stalker/m9x18fort
	cost = 300
	words = list("Магазин" = 5, "Магазин" = 5, "Fore" = 5, "Fore" = 5, "handicap" = 5, "handicap" = 5, "handicaps" = 5, "handicaps" = 5, "9x18f" = 5, "9x18f" = 5)

/sidoritem/b12x70
	name = "П12x70"
	itemtype = /obj/item/ammo_box/stalker/b12x70
	cost = 400
	words = list("Коробка" = 5, "коробка" = 5, "cartridges" = 5, "Cartridges" = 5, "Cartridge" = 5, "cartridge" = 5, "Shotgun" = 5, "shotgun" = 5, "12x70" = 5, "12x70" = 5)

/sidoritem/b12x70P
	name = "П12x70P"
	itemtype = /obj/item/ammo_box/stalker/b12x70P
	cost = 500
	words = list("Коробка" = 5, "коробка" = 5, "Armor-piercing" = 5, "armor-piercing" = 5, "Armor-piercing" = 5, "armor-piercing" = 5, "cartridges" = 5, "Cartridges" = 5, "Cartridge" = 5, "cartridge" = 5, "Shotgun" = 5, "shotgun" = 5, "12x70" = 5, "12x70" = 5)

/sidoritem/b12x70D
	name = "П12x70D"
	itemtype = /obj/item/ammo_box/stalker/b12x70D
	cost = 800
	words = list("Коробка" = 5, "коробка" = 5, "Dart" = 5, "dart" = 5, "Dart" = 5, "dart" = 5, "cartridges" = 5, "Cartridges" = 5, "Cartridge" = 5, "cartridge" = 5, "Shotgun" = 5, "shotgun" = 5, "12x70" = 5, "12x70" = 5)

/sidoritem/b9x19
	name = "П9x19"
	itemtype = /obj/item/ammo_box/stalker/b9x19
	cost = 1200
	words = list("Коробка" = 5, "коробка" = 5, "cartridges" = 5, "Cartridges" = 5, "Cartridge" = 5, "cartridge" = 5, "March" = 5, "Martha" = 5, "Marty" = 5, "Viper" = 5, "Viper" = 5, "Viper" = 5, "Vipers" = 5, "vipers" = 5, "mp5" = 5, "MP5" = 5, "9x19" = 5, "9x19" = 5)

/sidoritem/b9x19P
	name = "П9x19P"
	itemtype = /obj/item/ammo_box/stalker/b9x19P
	cost = 1700
	words = list("Коробка" = 5, "коробка" = 5, "Armor-piercing" = 5, "armor-piercing" = 5, "Armor-piercing" = 5, "armor-piercing", "cartridges" = 5, "Cartridge" = 5, "Cartridge" = 5, "cartridge" = 5, "Marte" = 5, "March" = 5, "March" = 5, "March" = 5, "18x19" = 5, "18x19" = 5)

/sidoritem/p9x19
	name = "М9x19"
	itemtype = /obj/item/ammo_box/magazine/stalker/m9x19marta
	cost = 200
	words = list("Магазин" = 5, "Магазин" = 5, "Marte" = 5, "March" = 5, "March" = 5, "March" = 5, "9x19" = 5, "9x19" = 5)

/sidoritem/m9x19g
	name = "М9x19g"
	itemtype = /obj/item/ammo_box/magazine/stalker/m9x19mp5
	cost = 500
	words = list("Магазин" = 5, "Магазин" = 5, "Viper" = 5, "viper" = 5, "Vipers" = 5, "vipers" = 5, "mp5" = 5, "MP5" = 5, "9x19" = 5, "9x19" = 5)

/sidoritem/sc45
	name = "М45"
	itemtype = /obj/item/ammo_box/magazine/stalker/sc45
	cost = 300
	words = list("Магазин" = 5, "Магазин" = 5, "Kore" = 5, "kore" = 5, "Kory" = 5, "kory" = 5, "Sipu" = 5, "sipu" = 5, "Sipa" = 5, "sipa" = 5, "45" = 5)

/sidoritem/sp9x39vint
	name = "М9x39винт"
	itemtype = /obj/item/ammo_box/magazine/stalker/sp9x39vint
	cost = 700
	words = list("Магазин" = 5, "Магазин" = 5, "Vintorez" = 5, "screw cutter" = 5, "Vintorez" = 5, "vintorez" = 5, "9x39" = 5, "9x39" = 5)

/sidoritem/sp9x39val
	name = "М9x39вал"
	itemtype = /obj/item/ammo_box/magazine/stalker/sp9x39val
	cost = 1200
	words = list("Магазин" = 5, "Магазин" = 5, "Valu" = 5, "shaft" = 5, "Shaft" = 5, "shaft" = 5, "Vla" = 5, "vla" = 5, "9x39" = 5, "9x39" = 5)

/sidoritem/sp9x39groza
	name = "М9x39гроза"
	itemtype = /obj/item/ammo_box/magazine/stalker/sp9x39groza
	cost = 1200
	words = list("Магазин" = 5, "Магазин" = 5, "Groze" = 5, "groze" = 5, "thunderstorms" = 5, "Thunderstorms" = 5, "thunder" = 5, "thunder" = 5, "Thunder" = 5, "thunder" = 5, "9x39" = 5, "9x39" = 5)



//Артефакты

/sidoritem/meduza
	name = "Медуза"
	itemtype = /obj/item/weapon/artifact/meduza
	cost = 2000

/sidoritem/stoneflower
	name = "Каменный цветок"
	itemtype = /obj/item/weapon/artifact/stoneflower
	cost = 5000

/sidoritem/nighstar
	name = "Ночная звезда"
	itemtype = /obj/item/weapon/artifact/nightstar
	cost = 8000

/sidoritem/maminibusi
	name = "Мамины бусы"
	itemtype = /obj/item/weapon/artifact/maminibusi
	cost = 30000

/sidoritem/flash
	name = "Вспышка"
	itemtype = /obj/item/weapon/artifact/flash
	cost = 3000

/sidoritem/moonlight
	name = "Ночная звезда"
	itemtype = /obj/item/weapon/artifact/moonlight
	cost = 5000

/sidoritem/pushtishka
	name = "Пустышка"
	itemtype = /obj/item/weapon/artifact/pustishka
	cost = 30000

/sidoritem/battery
	name = "Батарея"
	itemtype = /obj/item/weapon/artifact/battery
	cost = 30000

/sidoritem/droplet
	name = "Капля"
	itemtype = /obj/item/weapon/artifact/droplet
	cost = 2500

/sidoritem/fireball
	name = "Огненный шар"
	itemtype = /obj/item/weapon/artifact/fireball
	cost = 6000

/sidoritem/crystal
	name = "Кристал"
	itemtype = /obj/item/weapon/artifact/crystal
	cost = 40000

//Разное

/sidoritem/guitar
	name = "Гитара"
	itemtype = /obj/item/device/instrument/guitar
	cost = 3000
	words = list("Гитара" = 5, "гитара" = 5, "Guitar" = 5, "guitar" = 5)

/sidoritem/geiger
	name = "Счетчик Гейгера"
	itemtype = /obj/item/device/geiger_counter
	cost = 500
	words = list("Счетчик" = 5, "счетчик" = 5, "Гейгер" = 5, "гейгер" = 5)

/sidoritem/shovel
	name = "Лопата"
	itemtype = /obj/item/weapon/shovel
	cost = 1500
	words = list("Лопата" = 5, "лопата" = 5, "Shovel" = 5, "shovel" = 5)

/sidoritem/flashlight
	name = "Фонарик"
	itemtype = /obj/item/device/flashlight/seclite
	cost = 500
	words = list("фонарик" = 5, "Фонарик" = 5, "Flashlight" = 5, "flashlight" = 5)

/sidoritem/artifactbelt
	name = "Пояс для артефактов"
	itemtype = /obj/item/weapon/storage/belt/stalker
	cost = 500
	words = list("Пояс" = 5, "пояс" = 5, "Артефакт" = 5, "артефакт" = 5)

/sidoritem/radio
	name = "Радио"
	itemtype = /obj/item/device/radio
	cost = 600
	words = list("радио" = 5, "Радио" = 10)

/sidoritem/mathes
	name = "Спички"
	itemtype = /obj/item/weapon/storage/box/matches
	cost = 50
	words = list("Спички" = 5, "спички" = 5, "Matches" = 5, "matches" = 5)

/sidoritem/cigars
	name = "Сигареты"
	itemtype = /obj/item/weapon/storage/fancy/cigarettes/cigpack/maxim
	cost = 200
	words = list("Сигареты" = 5, "сигареты" = 5, "Cigarettes" = 5, "cigarettes" = 5)

/sidoritem/cigarsup
	name = "Сигары"
	itemtype = /obj/item/weapon/storage/fancy/cigarettes/cigars
	cost = 5000
	words = list("Сигары" = 5, "сигары" = 5, "Cigars" = 5, "cigars" = 5)
