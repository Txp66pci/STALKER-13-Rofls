#define PISTOL_AMOUNT 24
#define SMG_AMOUNT 18
#define RIFLE_AMOUNT 12
#define SPECIALTY_AMOUNT 6

GLOBAL_LIST_EMPTY(trash_tier_sidormatitems)
GLOBAL_LIST_EMPTY(low_tier_sidormatitems)
GLOBAL_LIST_EMPTY(medium_tier_sidormatitems)
GLOBAL_LIST_EMPTY(high_tier_sidormatitems)
GLOBAL_LIST_EMPTY(real_sidormat_items)
//rating_tier
var/list/rookie_sidormatitems = list()
var/list/experienced_sidormatitems = list()
var/list/veteran_sidormatitems = list()
var/list/expert_sidormatitems = list()
var/list/legend_sidormatitems = list()

GLOBAL_LIST_INIT(global_sidormat_list, list(
		///////////////////////////////  Оружие  /////////////////////////////////////////
	"Handguns" = list(
		///////////////////////////// **Pistols, SMGs** /////////////////////////////////////
		new /datum/data/stalker_equipment("ПМм",			"ПМм",				/obj/item/gun/ballistic/automatic/pistol/pm,				3000,	ROOKIE, initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("TT",				"TT",				/obj/item/gun/ballistic/automatic/pistol/tt,				3000,	ROOKIE, initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Форт-12",		"Форт-12",			/obj/item/gun/ballistic/automatic/pistol/fort12,			6500,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("ПБ1с",			"ПБ1с",				/obj/item/gun/ballistic/automatic/pistol/pb1s,				4500,	ROOKIE, initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("СИГ-Сауэр P220",	"СИГ-Сауэр P220",	/obj/item/gun/ballistic/automatic/pistol/sip,				12500,	EXPERIENCED, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("Кольт M1911",		"Кольт M1911",		/obj/item/gun/ballistic/automatic/pistol/cora,				9000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("Беретта 92ФС",	"Беретта 92ФС",		/obj/item/gun/ballistic/automatic/pistol/marta,				9000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("ЮСП-матч",		"ЮСП-матч",		/obj/item/gun/ballistic/automatic/pistol/usp_match, 		16000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("Кольт Анаконда",	"Кольт Анаконда",	/obj/item/gun/ballistic/revolver/anaconda,					25000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("Дигл",	"Дигл",		/obj/item/gun/ballistic/automatic/pistol/desert,			30000,	EXPERIENCED, initial_stock = SPECIALTY_AMOUNT),
		),


	"Submachine Guns" = list(
		new /datum/data/stalker_equipment("Беретта M38",	"Беретта M38",		/obj/item/gun/ballistic/automatic/berettam38,				10000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("Кипарис",		"Кипарис",			/obj/item/gun/ballistic/automatic/kiparis,					12000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("ППШ",			"ППШ",				/obj/item/gun/ballistic/automatic/ppsh,						15000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("МП-5",			"МП-5",				/obj/item/gun/ballistic/automatic/mp5,						18000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("МАК10 Инграм",	"МАК10 Инграм",		/obj/item/gun/ballistic/automatic/mac10,					24000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("ФН П90",			"ФН П90",			/obj/item/gun/ballistic/automatic/p90,						38000,	ROOKIE, initial_stock = SPECIALTY_AMOUNT, faction = "Mercenaries"),
		),


	"Automatic Weapons" = list(
		///////////////////////////// **ARs** /////////////////////////////////////
		new /datum/data/stalker_equipment("СКС",			"СКС",				/obj/item/gun/ballistic/rifle/semiautobolt/sks,				20000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("AK-74С",			"AK-74С",			/obj/item/gun/ballistic/automatic/aksu74 ,					24000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("AK-74",			"AK-74",			/obj/item/gun/ballistic/automatic/ak74,						30000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("AKM",			"AKM",				/obj/item/gun/ballistic/automatic/akm,						30400,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("АС-96",			"АС-96",			/obj/item/gun/ballistic/automatic/abakan,					40000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("ЛР-300",			"ЛР-300",			/obj/item/gun/ballistic/automatic/tpc301,					40000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("Л85",			"Л85",				/obj/item/gun/ballistic/automatic/il86,						40000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("Гроза ОЦ-14", 	"Гроза ОЦ-14",	/obj/item/gun/ballistic/automatic/groza,					35000,	VETERAN, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("АС \"Вал\"",		"АС \"Вал\"",		/obj/item/gun/ballistic/automatic/val,						50000,	VETERAN, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("СИГ СГ 550",		"СИГ СГ 550",		/obj/item/gun/ballistic/automatic/sigsg550,					50000,	VETERAN, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("ФН Ф2000",		"ФН Ф2000",			/obj/item/gun/ballistic/automatic/fnf2000,					65000,	EXPERT, initial_stock = SPECIALTY_AMOUNT),
		new /datum/data/stalker_equipment("ГП 37",			"ГП 37",			/obj/item/gun/ballistic/automatic/gp37,						75000,	EXPERT, initial_stock = SPECIALTY_AMOUNT),
		new /datum/data/stalker_equipment("ФН ФАЛ",			"ФН ФАЛ",			/obj/item/gun/ballistic/automatic/fnfal,					85000,	EXPERT, initial_stock = SPECIALTY_AMOUNT),
		new /datum/data/stalker_equipment("ФН ФАЛ деревянная рукоять","ФН ФАЛ деревянная рукоять",/obj/item/gun/ballistic/automatic/woodfnfal,				85000,	EXPERT, initial_stock = SPECIALTY_AMOUNT),
		new /datum/data/stalker_equipment("ФН Ф2000С",		"ФН Ф2000С",		/obj/item/gun/ballistic/automatic/fnf2000s,					100000,	EXPERT, initial_stock = SPECIALTY_AMOUNT, faction = "Mercenaries")
		//new /datum/data/stalker_equipment("ПKM",			"ПKM",				/obj/item/gun/ballistic/automatic/l6_saw/pkm,				600000,	EXPERT)
		),


	"Shotguns" = list(
		/////////////////////////////// **Дробовики** /////////////////////////////////////
		new /datum/data/stalker_equipment("Обрез",		"Обрез",			/obj/item/gun/ballistic/shotgun/bm16/sawnoff,				6000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("БМ-16",			"БМ-16",			/obj/item/gun/ballistic/shotgun/bm16,						10000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("ТОЗ-34",			"ТОЗ-34", 			/obj/item/gun/ballistic/shotgun/bm16/toz34,					15000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("Итака M37",		"Итака M37",		/obj/item/gun/ballistic/shotgun/ithaca,						20000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("Винчестер-1300","Винчестер-1300",/obj/item/gun/ballistic/shotgun/chaser,						30000,	EXPERIENCED, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("СПАС-12",		"СПАС-12",			/obj/item/gun/ballistic/shotgun/spsa,						50000,	VETERAN, initial_stock = RIFLE_AMOUNT)
		),


	"Rifles" = list(
		/////////////////////////////// **Винтовки** /////////////////////////////////////
		new /datum/data/stalker_equipment("Обрез Мосина",	"Обрез Мосина",	/obj/item/gun/ballistic/rifle/boltaction/mosinobrez,14000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("Винтовка Мосина",	"Винтовка Мосина",		/obj/item/gun/ballistic/rifle/boltaction/mosin,				15000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("Ли Энфильд",	"Ли Энфильд",		/obj/item/gun/ballistic/rifle/boltaction/enfield,			15000,	ROOKIE, initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("Винторез", 		"Винторез",			/obj/item/gun/ballistic/automatic/vintorez,					60000,	EXPERT, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("СВД", 	    	"СВД",			    /obj/item/gun/ballistic/semiauto/svd,					    75000,	EXPERT, initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("АВСМ",			"АВСМ",				/obj/item/gun/ballistic/awm,								80000,	ROOKIE, initial_stock = SPECIALTY_AMOUNT, faction = "Mercenaries")
		),


	"Melee Weapons" = list(
		/////////////////////////////// **Другое** /////////////////////////////////////
		new /datum/data/stalker_equipment("Кухонный нож",		"Кухонный нож",			/obj/item/kitchen/knife,												1500,	ROOKIE, initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Туристический нож",		"Туристический нож",			/obj/item/kitchen/knife/tourist,										4000,	ROOKIE, initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Байонет",			"Байонет",					/obj/item/kitchen/knife/bayonet,										7000,	ROOKIE, initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Мясницкий тессак",	"Мясницкий тессак",		/obj/item/kitchen/knife/butcher,										10000,	ROOKIE, initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Охотничий нож",		"Охотничий нож",			/obj/item/weapon/kitchen/knife/hunting,									15000,	ROOKIE, initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("M9 Байонет",			"M9 Байонет",				/obj/item/weapon/kitchen/knife/m9,										25000,	ROOKIE, initial_stock = SMG_AMOUNT)
		),


	"Ammo Boxes" = list(
		////////////////////////////////  Патроны  /////////////////////////////////////////
		new /datum/data/stalker_equipment("9x18mm",					"9x18mm",								/obj/item/ammo_box/stalker/b9x18,						2500,	ROOKIE,	initial_stock = PISTOL_AMOUNT, sale_price =300),
		new /datum/data/stalker_equipment("9x18mm ББ",				"9x18mm ББ",							/obj/item/ammo_box/stalker/b9x18P,						3500,	EXPERIENCED, initial_stock = PISTOL_AMOUNT, sale_price =350),
		new /datum/data/stalker_equipment("7.62x25mm",				"7.62x25mm",							/obj/item/ammo_box/stalker/b762x25,						2500,	ROOKIE,	initial_stock = PISTOL_AMOUNT, sale_price =400),
		new /datum/data/stalker_equipment("9x19mm",					"9x19mm",								/obj/item/ammo_box/stalker/b9x19,						3500,	ROOKIE,	initial_stock = PISTOL_AMOUNT,sale_price =450),
		new /datum/data/stalker_equipment("9x19mm ББ",				"9x19mm ББ",							/obj/item/ammo_box/stalker/b9x19P,						5750,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,sale_price =500),
		new /datum/data/stalker_equipment("5.7×28mm",				"5.7×28mm",								/obj/item/ammo_box/stalker/b5728,						16000,	ROOKIE,	initial_stock = PISTOL_AMOUNT,sale_price =550),
		new /datum/data/stalker_equipment(".45 ACP",				".45 ACP ",								/obj/item/ammo_box/stalker/bacp45,						8000,	ROOKIE,	initial_stock = PISTOL_AMOUNT,sale_price =550),
		new /datum/data/stalker_equipment(".45 ACP Экспансивный",		".45 ACP Экспансивный",					/obj/item/ammo_box/stalker/bacp45ap,					15000,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,sale_price =600),
		new /datum/data/stalker_equipment(".44 Магнум",				".44 Магнум",							/obj/item/ammo_box/stalker/bmag44,						14000,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,sale_price =650),
		new /datum/data/stalker_equipment(".44 Магнум FMJ",			".44 Магнум FMJ",						/obj/item/ammo_box/stalker/bmag44fmj,					15000,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,sale_price =700),
		new /datum/data/stalker_equipment("12x70 Дробь",			"12x70 Buckshot",						/obj/item/ammo_box/stalker/b12x70,						8000,	ROOKIE,			initial_stock = PISTOL_AMOUNT,sale_price =500),
		new /datum/data/stalker_equipment("12x70 Жакан",				"12x70 Жакан",							/obj/item/ammo_box/stalker/b12x70P,						9500,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,sale_price =550),
		new /datum/data/stalker_equipment("12x70 Дротик",				"12x70 Дротик",							/obj/item/ammo_box/stalker/b12x70D,						7000,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,sale_price =600),
		new /datum/data/stalker_equipment("5.45x39mm",				"5.45x39mm",							/obj/item/ammo_box/stalker/b545,						10000,	ROOKIE,			initial_stock = PISTOL_AMOUNT,sale_price =650),
		new /datum/data/stalker_equipment("5.45x39mm ББ",			"5.45x39mm ББ",							/obj/item/ammo_box/stalker/b545ap,						15000,	VETERAN,		initial_stock = PISTOL_AMOUNT,sale_price =700),
		new /datum/data/stalker_equipment("7.62x39mm",				"7.62x39mm",							/obj/item/ammo_box/stalker/b762x39,						10000,	ROOKIE,			initial_stock = PISTOL_AMOUNT,sale_price =650),
		new /datum/data/stalker_equipment("7.62x39mm ББ",			"7.62x39mm ББ",							/obj/item/ammo_box/stalker/b762x39ap,					15000,	VETERAN,		initial_stock = PISTOL_AMOUNT,sale_price =700),
		new /datum/data/stalker_equipment("5.56x45mm",				"5.56x45mm",							/obj/item/ammo_box/stalker/b55645,						12000,	ROOKIE,			initial_stock = PISTOL_AMOUNT,sale_price =680),
		new /datum/data/stalker_equipment("5.56x45mm AP",			"5.56x45mm ББ",							/obj/item/ammo_box/stalker/b55645ap,					20000,	VETERAN,		initial_stock = PISTOL_AMOUNT,sale_price =720),
		new /datum/data/stalker_equipment("7.62x51",				"7.62x51",								/obj/item/ammo_box/stalker/b762x51,						10000,	ROOKIE,			initial_stock = PISTOL_AMOUNT,sale_price =480),
		new /datum/data/stalker_equipment("7.62x54mmR",				"7.62x54mmR",							/obj/item/ammo_box/stalker/b762x54r,					12000,	ROOKIE,			initial_stock = PISTOL_AMOUNT,sale_price =480),
		new /datum/data/stalker_equipment("9x39",				"9x39",							/obj/item/ammo_box/stalker/b939,						30000,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,sale_price =700),
		new /datum/data/stalker_equipment(".338 Лапуа Магнум",		".338 Лапуа Магнум",					/obj/item/ammo_box/stalker/b338,						60000,	ROOKIE,			initial_stock = PISTOL_AMOUNT,sale_price =700,faction = "Mercenaries"),
		),


	"Ammo Magazines and Clips" = list(
		new /datum/data/stalker_equipment("Магазин ПМм; ПБ1с",						"Магазин ПМм; ПБ1с",			/obj/item/ammo_box/magazine/stalker/m9x18pm,			1000,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин TT",							"Магазин TT",					/obj/item/ammo_box/magazine/stalker/tt,					1000,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин Форт-12",						"Магазин Форт-12",				/obj/item/ammo_box/magazine/stalker/m9x18fort,			2000,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин Кипариса",						"Магазин Кипариса",				/obj/item/ammo_box/magazine/stalker/kiparis,			2400,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин MП-5",							"Магазин MП-5",				/obj/item/ammo_box/magazine/stalker/m9x19mp5,			3000,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин МАК10",							"Магазин МАК10",				/obj/item/ammo_box/magazine/stalker/mac10,				3500,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Дисковой магазин ППШ",								"Дисковой магазин ППШ",					/obj/item/ammo_box/magazine/stalker/ppsh,				7000,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин 5.7×28mm",						"Магазин 5.7×28mm",			/obj/item/ammo_box/magazine/smg57,						8000,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =550),
		new /datum/data/stalker_equipment("Магазин 5.45x39mm",						"Магазин 5.45x39mm",			/obj/item/ammo_box/magazine/stalker/m545,				5250,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин AKM (7.62x39)",					"Магазин AKM (7.62x39)",		/obj/item/ammo_box/magazine/stalker/akm,				5350,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price = 500),
		new /datum/data/stalker_equipment("Магазин 5.56x45mm",						"Магазин 5.56x45mm",			/obj/item/ammo_box/magazine/stalker/m556x45,			6500,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин AС \"Вал\"",					"Магазин AС \"Вал\"",			/obj/item/ammo_box/magazine/stalker/sp9x39val,			6000,	VETERAN,	initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин Гроза С14",					"TМагазин Гроза С14",			/obj/item/ammo_box/magazine/stalker/sp9x39groza,		6500,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин Винтореза",						"Магазин Винтореза",			/obj/item/ammo_box/magazine/stalker/sp9x39vint,			6000,	VETERAN,	initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин СВД",					     	"Магазин СВД",			        /obj/item/ammo_box/magazine/stalker/svd,			    7000,	VETERAN,	initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин ФН ФАЛ (7.62x51)",				"Магазин ФН ФАЛ (7.62x51)",	/obj/item/ammo_box/magazine/stalker/fnfal,				7200,	VETERAN,	initial_stock = PISTOL_AMOUNT*2,sale_price = 500),
		new /datum/data/stalker_equipment("Магазин Кольта M1911; СИГ-Сауэра П220",	"Магазин Кольта M1911; СИГ-Сауэра П220",/obj/item/ammo_box/magazine/stalker/sc45,			3400,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин Беретты 92ФС ",					"Магазин Беретты 92ФС",		/obj/item/ammo_box/magazine/stalker/m9x19marta,			3500,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин Беретты M38",					"Магазин Беретты M38",			/obj/item/ammo_box/magazine/stalker/berettam38,			3250,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин ЮСП-матч",						"Магазин ЮСП-матч",			/obj/item/ammo_box/magazine/stalker/usp45,				4500,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин Дигла",					"Магазин Дигла",		/obj/item/ammo_box/magazine/stalker/desert,				4000,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Магазин МАК10 Инграм",					"Магазин МАК10 Инграм",		/obj/item/ammo_box/magazine/stalker/mac10,				4500,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Ящик с лентой для ПКМ",						"Ящик с лентой для ПКМ",			/obj/item/ammo_box/magazine/stalker/pkm,				40000,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT*2,sale_price =500),
		new /datum/data/stalker_equipment("Клипса 7.62x51",							"Клипса 7.62x51",					/obj/item/ammo_box/stalker/cl762x51,					2000,	ROOKIE,		initial_stock = PISTOL_AMOUNT*2,sale_price =500)
		),


	"Suits" = list(
		new /datum/data/stalker_equipment("Кожаная Куртка",				"Кожаная Куртка",			/obj/item/clothing/suit/hooded/kozhanka,					5000,		ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Белая Кожаная Куртка",		"Белая Кожаная Куртка",		/obj/item/clothing/suit/hooded/kozhanka/white,				5000,		ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Укреплённая Кожаная Куртка",			"Укреплённая Кожаная Куртка",			/obj/item/clothing/suit/hooded/kozhanka/tancoat,			15000,		ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Куртка Чистого Неба",				"Куртка Чистого Неба",			/obj/item/clothing/suit/hooded/kozhanka/cs_hood,			15000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Clear Sky"),
		new	/datum/data/stalker_equipment("Бандитская Куртка",				"Бандитская Куртка",			/obj/item/clothing/suit/hooded/kozhanka/banditka,			6000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Bandits"),
		new	/datum/data/stalker_equipment("Куртка Ренегата",				"Куртка Ренегата",			/obj/item/clothing/suit/hooded/kozhanka/renegadecoat,		6000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Renegades"),
		new	/datum/data/stalker_equipment("Броня Военных",		"Броня Военных",	/obj/item/clothing/suit/army,								15000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "State Security Service"),
		new	/datum/data/stalker_equipment("Военный Бронежилет",		"Военный Бронежилет",		/obj/item/clothing/suit/mil,								15000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "State Security Service"),
		new /datum/data/stalker_equipment("Комбинезон «Заря»",				"Комбинезон «Заря",			/obj/item/clothing/suit/hooded/kombez,						33000,		ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("6Б2",						"6Б2",						/obj/item/clothing/suit/sixb2,								14000,		ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Бронежилет Защитник II",			"Бронежилет Защитник II",			/obj/item/clothing/suit/d2,									24000,		EXPERIENCED,initial_stock = PISTOL_AMOUNT,faction = "State Security Service"),
		new /datum/data/stalker_equipment("Комбенизон Наёмника",			"Комбенизон Наёмника",			/obj/item/clothing/suit/hooded/kombez/mercenary,			25000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Mercenaries"),
		new /datum/data/stalker_equipment("Костюм Наёмника Эколога",	"Костюм Наёмника Эколога",/obj/item/clothing/suit/hooded/kombez/eco_mercenary,		25000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Ecologist"),
		new /datum/data/stalker_equipment("Комбенизон Бандита",				"Комбенизон Бандита",			/obj/item/clothing/suit/hooded/kombez/kombez_bandit,		25000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Bandits"),
		new /datum/data/stalker_equipment("Комбенизон Ренегата",			"Комбенизон Ренегата",			/obj/item/clothing/suit/hooded/kombez/kombez_renegade,		25000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Renegades"),
		new /datum/data/stalker_equipment("Бронежилет Ренегата",              "Бронежилет Ренегата",            /obj/item/clothing/suit/hooded/kombez/kombezrenegadewornd2, 30000,      ROOKIE,     initial_stock = PISTOL_AMOUNT,faction = "Renegades"),
		new /datum/data/stalker_equipment("Черный Кожаный Плащ",			"Черный Кожаный Плащ",			/obj/item/clothing/suit/hooded/kozhanka/banditka/coat,		12500,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Bandits"),
		new /datum/data/stalker_equipment("Коричневый Кожаный Плащ",			"Коричневый Кожаный Плащ",			/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown,12500,		ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Маскхалат",				"Маскхалат",				/obj/item/clothing/suit/hooded/kozhanka/ghillie,			30000,		ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Берил-5M",					"Берил-5M",				/obj/item/clothing/suit/berill,								50000,		EXPERIENCED,initial_stock = PISTOL_AMOUNT,faction = "State Security Service"),
		new /datum/data/stalker_equipment("Защитник Свободы",		"Защитник Свободы",		/obj/item/clothing/suit/guardian_of_freedom,				50000,		EXPERIENCED,initial_stock = PISTOL_AMOUNT,faction = "Freedom"),
		new /datum/data/stalker_equipment("Ветер Свободы",	   	"Ветер Свободы",		/obj/item/clothing/suit/hooded/kombez/veter,				25000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Freedom"),
		new /datum/data/stalker_equipment("Страж Свободы",			"Страж Свободы",			/obj/item/clothing/suit/hooded/strazh,				40000,		EXPERIENCED,initial_stock = PISTOL_AMOUNT,faction = "Freedom"),
		new /datum/data/stalker_equipment("Броня Монолита",						"Броня Монолита",						/obj/item/clothing/suit/hooded/kombez/monolith,				25000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Monolith", sale_price = 8000),
		new /datum/data/stalker_equipment("Костюм Монолитовца Эколога",	"Костюм Монолитовца Эколога",	/obj/item/clothing/suit/hooded/sealed/monolith,				60000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Monolith"),
		new /datum/data/stalker_equipment("ПС5-М",						"ПС5-М",					/obj/item/clothing/suit/hooded/kombez/ps5m,					25000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Duty"),
		new /datum/data/stalker_equipment("Броня ЧН-3а",			"Броня ЧН-3а",			/obj/item/clothing/suit/hooded/cs_medium,					25000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Clear Sky"),
		new /datum/data/stalker_equipment("Тяжёлая Броня Наёмника",		"Тяжёлая Броня Наёмника",	/obj/item/clothing/suit/assaultmerc,						50000,		EXPERIENCED,initial_stock = PISTOL_AMOUNT,faction = "Mercenaries"),
		new /datum/data/stalker_equipment("Броня Наёмника Эколога",			"Броня Наёмника Эколога",		/obj/item/clothing/suit/hooded/sealed/merc,					60000,		ROOKIE,		initial_stock = PISTOL_AMOUNT,faction = "Mercenaries"),
		new /datum/data/stalker_equipment("Броня ЧН-1",			"Броня ЧН-1",			/obj/item/clothing/suit/cs_heavy,							60000,		VETERAN,	initial_stock = PISTOL_AMOUNT,faction = "Clear Sky"),
		new /datum/data/stalker_equipment("ПСЗ-9Д",						"ПСЗ-9Д",					/obj/item/clothing/suit/psz9d,								60000,		VETERAN,	initial_stock = PISTOL_AMOUNT,faction = "Duty"),
		new	/datum/data/stalker_equipment("ПСЗ-9M",						"ПСЗ-9M",					/obj/item/clothing/suit/hooded/sealed/psz9md,				75000,		VETERAN,	initial_stock = PISTOL_AMOUNT,faction = "Duty"),
		new	/datum/data/stalker_equipment("ССП-99 Эколог",			"ССП-99 Эколог",			/obj/item/clothing/suit/hooded/sealed/ecolog,				75000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "Ecologist"),
		new	/datum/data/stalker_equipment("ССП-99м Эколог",			"ССП-99м Эколог",		/obj/item/clothing/suit/hooded/sealed/ecologm,				100000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "Ecologist"),
		new	/datum/data/stalker_equipment("СЕВА",						"СЕВА",						/obj/item/clothing/suit/hooded/sealed/seva,					125000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "Ecologist"),
		new /datum/data/stalker_equipment("СКАТ-9M",					"СКАТ-9M",					/obj/item/clothing/suit/skat,								150000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "State Security Service"),
		new	/datum/data/stalker_equipment("Экзоскелет",				"Экзоскелет",				/obj/item/clothing/suit/hooded/sealed/exoskelet,			400000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "Loners"),
		new	/datum/data/stalker_equipment("Экзоскелет",				"Экзоскелет",				/obj/item/clothing/suit/hooded/sealed/exoskelet,			400000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "Clear Sky"),
		new	/datum/data/stalker_equipment("Экзоскелет",				"Экзоскелет",				/obj/item/clothing/suit/hooded/sealed/exoskelet,			400000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "State Security Service"),
		new	/datum/data/stalker_equipment("Экзоскелет Наёмника",			"Экзоскелет Наёмника",			/obj/item/clothing/suit/hooded/sealed/exoskelet/merc,		400000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "Mercenaries"),
		new	/datum/data/stalker_equipment("Экзоскелет Бандита",			"Экзоскелет Бандита",		/obj/item/clothing/suit/hooded/sealed/exoskelet/bandit,		400000,		ZONE_LEGEND,	initial_stock = PISTOL_AMOUNT,faction = "Bandits"),
		new	/datum/data/stalker_equipment("Экзоскелет Долга",			"Экзоскелет Долга",			/obj/item/clothing/suit/hooded/sealed/exoskelet/duty,		400000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "Duty"),
		new	/datum/data/stalker_equipment("Экзоскелет Свободы",		"Экзоскелет Свободы",		/obj/item/clothing/suit/hooded/sealed/exoskelet/freedom,	400000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "Freedom"),
		new	/datum/data/stalker_equipment("Экзоскелет Монолита",		"Экзоскелет Монолита",		/obj/item/clothing/suit/hooded/sealed/exoskelet/monolith,	400000,		EXPERT,	initial_stock = PISTOL_AMOUNT,faction = "Monolith")
	),


	// Headwear
	"Masks and Helmets" = list(
		new /datum/data/stalker_equipment("Респиратор",					"Респиратор",					/obj/item/clothing/mask/gas/stalker/respirator,					1500,	ROOKIE,initial_stock = PISTOL_AMOUNT,),
		new /datum/data/stalker_equipment("Противогаз",					"Противогаз",						/obj/item/clothing/mask/gas/stalker,							7500,	ROOKIE,initial_stock = PISTOL_AMOUNT,),
		new /datum/data/stalker_equipment("Противогаз Наёмника",			"Противогаз Наёмника",			/obj/item/clothing/mask/gas/stalker/mercenary,					7500,	ROOKIE,	initial_stock = PISTOL_AMOUNT,faction = "Mercenaries"),
		new /datum/data/stalker_equipment("ТШ-4M",						"ТШ-4M",						/obj/item/clothing/head/tsh,									3000,	ROOKIE,initial_stock = PISTOL_AMOUNT,),
		new /datum/data/stalker_equipment("Стальной Шлем",				"Стальной Шлем",					/obj/item/clothing/head/steel,									7500,	ROOKIE,initial_stock = PISTOL_AMOUNT,),
		new /datum/data/stalker_equipment("СШ-68",						"СШ-68",						/obj/item/clothing/head/ssh,									7600,	ROOKIE,initial_stock = PISTOL_AMOUNT,),
		new /datum/data/stalker_equipment("Лёгкий Тактический Шлем",		"Лёгкий Тактический Шлем",		/obj/item/clothing/head/hardhat/tactical/light,					12500,	EXPERIENCED,initial_stock = PISTOL_AMOUNT,),
		new /datum/data/stalker_equipment("Шлем Защитника Свободы",	"Шлем Защитника Свободы",	/obj/item/clothing/head/hardhat/tactical/guardian_of_freedom,	12500,	EXPERIENCED, initial_stock = PISTOL_AMOUNT,faction = "Freedom"),
		new /datum/data/stalker_equipment("Тактический Шлем",			"Тактический Шлем",				/obj/item/clothing/head/tacticalhelmet,							25000,	EXPERIENCED,initial_stock = PISTOL_AMOUNT,),
		new /datum/data/stalker_equipment("Штурмовой Шлем",	    		"Штурмовой Шлем",				/obj/item/clothing/head/assaultmerc,							30000,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,faction = "Mercenaries"),
		new /datum/data/stalker_equipment("Сфера-M12",			 		"Сфера-M12",					/obj/item/clothing/head/spheram,								30000,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,faction = "State Security Service"),
		new /datum/data/stalker_equipment("Шлем СКАТ-9M",				"Шлем СКАТ-9M",				/obj/item/clothing/head/skathelmet,								90000,	VETERAN, 		initial_stock = PISTOL_AMOUNT,faction = "State Security Service"),
		new /datum/data/stalker_equipment("Шлем МАСКА-1Щ",			"Шлем МАСКА-1Щ",			/obj/item/clothing/head/maska_1,								12500,	EXPERIENCED,	initial_stock = PISTOL_AMOUNT,faction = "Clear Sky"),
		new /datum/data/stalker_equipment("Баллистическая Маска Ренегата",    "Баллистическая Маска Ренегата",      /obj/item/clothing/mask/gas/stalker/renegademask,               3000,   EXPERIENCED,	initial_stock = PISTOL_AMOUNT,faction = "Renegades")
	),


	"Medicine" = list(
		///////////////////////////////	Медикаменты	/////////////////////////////////////////
		new /datum/data/stalker_equipment("Аптечка",						"Аптечка",						/obj/item/storage/firstaid/ai2,									750,	ROOKIE, initial_stock = PISTOL_AMOUNT, sale_price = 150),
		new /datum/data/stalker_equipment("Армейская Аптечка",				"Армейская Аптечка",				/obj/item/storage/firstaid/armymedkit,							2500,	EXPERIENCED, initial_stock = PISTOL_AMOUNT, sale_price = 600),
		new /datum/data/stalker_equipment("ИФАК",						"ИФАК",						/obj/item/storage/firstaid/ifak,								4000,	EXPERIENCED,initial_stock = PISTOL_AMOUNT,sale_price = 700),
		new /datum/data/stalker_equipment("Улучшенная Научная Аптечка",	"Улучшенная Научная Аптечка",	/obj/item/storage/firstaid/ecologists,							20000,	VETERAN,initial_stock = RIFLE_AMOUNT,faction = "Ecologist",sale_price = 3000),
		new /datum/data/stalker_equipment("Научная Аптечка",			"Научная Аптечка",		/obj/item/storage/firstaid/sciencemedkit,						7000,	EXPERIENCED,initial_stock = RIFLE_AMOUNT,faction = "Ecologist",sale_price = 1000),
		new /datum/data/stalker_equipment("Импровизированный Стимулятор",			"Импровизированный Стимулятор",			/obj/item/reagent_containers/pill/stalker/injector/improvisedstim,		6000,	EXPERIENCED,initial_stock = PISTOL_AMOUNT,sale_price = 2000),
		new /datum/data/stalker_equipment("Военный Стимулятор",					"Военный Стимулятор",				/obj/item/reagent_containers/pill/stalker/injector/armystim,			14000,	VETERAN,initial_stock = PISTOL_AMOUNT,sale_price = 5000),
		new /datum/data/stalker_equipment("Научный Стимулятор",			"Научный Стимулятор",			/obj/item/reagent_containers/pill/stalker/injector/scistim,				24000,	EXPERT,initial_stock = RIFLE_AMOUNT,faction = "Ecologist",sale_price = 10000),
		new /datum/data/stalker_equipment("Бинт",					"Бинт",					/obj/item/stack/medical/gauze/bint,								750,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Антирад",					"Антирад",					/obj/item/reagent_containers/pill/stalker/injector/antirad,		1000,	ROOKIE,initial_stock = PISTOL_AMOUNT*2,			sale_price = 1000),
		new /datum/data/stalker_equipment("Таблетки ЛСД",					"Таблетки ЛСД",				/obj/item/storage/pill_bottle/lsd,								10000,	EXPERIENCED,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Таблетки Счастья",				"Таблетки Счастья",			/obj/item/storage/pill_bottle/happiness,						5000,	EXPERIENCED,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Таблетки Эпинефрина",			"Таблетки Эпинефрина",		/obj/item/storage/pill_bottle/epinephrine,						5000,	ROOKIE,initial_stock = PISTOL_AMOUNT)
		),


	"Food" = list(
		/////////////////////////////////	Еда	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Консерва",				"Canned stew",				/obj/item/reagent_containers/food/snacks/stalker/konserva,				550,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Шпроты",				"Шпроты",				/obj/item/reagent_containers/food/snacks/stalker/konserva/shproti,		750,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Водка \"Казаки\"",			"Vodka \"Kazaki\"",			/obj/item/reagent_containers/food/drinks/bottle/vodka/kazaki,			1500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Энергетик \"NonStop\"",	"Энергетик \"NonStop\"",	/obj/item/reagent_containers/food/drinks/soda_cans/energetic,			500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Сникерс",					"Snickers",					/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/snikers,300,	EXPERIENCED,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Колбаса",						"Колбаса",					/obj/item/reagent_containers/food/snacks/stalker/kolbasa,				500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Хлеб",						"Хлеб",					/obj/item/reagent_containers/food/snacks/stalker/baton,					400,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("ИРП",						"ИРП",						/obj/item/storage/box/MRE,												2500,	EXPERIENCED,initial_stock = PISTOL_AMOUNT)
		),


	"Backpacks" = list(
		new /datum/data/stalker_equipment("Гражданский Рюкзак",					"Гражданский Рюкзак",			/obj/item/storage/backpack/satchel/stalker/civilian,				2500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Дешёвый Рюкзак",					"Дешёвый Рюкзак",			/obj/item/storage/backpack/stalker/civilian,						2500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Туристический Рюкзак",					"Туристический Рюкзак",				/obj/item/storage/backpack/stalker/tourist,							10000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Профессиональный Рюкзак",			"Профессиональный Рюкзак",	/obj/item/storage/backpack/stalker/professional,					20000,	EXPERIENCED,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Рюкзак",						"Рюкзак",				/obj/item/storage/backpack/stalker/rucksack,						35000,	VETERAN,initial_stock = PISTOL_AMOUNT),
		),


	"Rigs" = list(
		new /datum/data/stalker_equipment("Тактический ремень",					"Тактический ремень",			/obj/item/storage/belt/military/tactibelt	,						8000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Ремень для переноски",					"Ремень для переноски",			/obj/item/storage/belt/military/webbing,							14000,	EXPERIENCED,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Разгрузка",						"Разгрузка",					/obj/item/storage/belt/military/chestrig,							20000,	VETERAN,initial_stock = PISTOL_AMOUNT),
		),


	"Misc" = list(
		/////////////////////////////////	Другое	/////////////////////////////////////////////
		new /datum/data/stalker_equipment/stalker_pda("КПК",					"КПК",													/obj/item/stalker_pda,												4000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Радио",								"Радио",												/obj/item/radio,													7000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Ремнабор Для Брони",	"Ремнабор Для Брони",						/obj/item/repair_kit/clothing,										10000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("ремнабор Для Оружия",				"ремнабор Для Оружия",									/obj/item/repair_kit/gun,											4000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Гитара",								"Гитара",												/obj/item/instrument/guitar,										3000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Счётчик Гейгера",						"Счётчик Гейгера",										/obj/item/geiger_counter,											3000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Фонарик",							"Фонарик",											/obj/item/flashlight/seclite,										1000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Пояс Для Артефактов",					"Пояс Для Артефактов",									/obj/item/storage/belt/stalker/artifact_belt,						60000,	EXPERIENCED,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Маленький Пояс Для Артефактов",				"Маленький Пояс Для Артефактов",									/obj/item/storage/belt/stalker/artifact_belt/small,					25000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Спички",							"Спички",												/obj/item/storage/box/matches,										1000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Дешёвая Зажигалка",						"Дешёвая Зажигалка",										/obj/item/lighter/greyscale,										3000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Зажигалка Зиппо",						"Зажигалка Зиппо",										/obj/item/lighter,													5000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Сигареты \"Максим\"",				"Сигареты \"Максим\"",									/obj/item/storage/fancy/cigarettes/cigpack/maxim,					2500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Сигары",								"Сигары",												/obj/item/storage/fancy/cigarettes/cigars,							10000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Сигареты С Травкой",						"Сигареты С Травкой",											/obj/item/clothing/mask/cigarette/rollie/trippy,					1000,	ROOKIE,	initial_stock = PISTOL_AMOUNT*4,faction = "Freedom"),
		new /datum/data/stalker_equipment("100 РУБ",								"100 РУБ",												/obj/item/stack/spacecash/c100,										100,	ROOKIE, initial_stock = PISTOL_AMOUNT*5,sale_price =100),
		new /datum/data/stalker_equipment("500 РУБ",								"500 РУБ",												/obj/item/stack/spacecash/c500,										500,	ROOKIE, initial_stock = PISTOL_AMOUNT*5,sale_price =500),
		new /datum/data/stalker_equipment("1000 РУБ",							"1000 РУБ",												/obj/item/stack/spacecash/c1000,									1000,	ROOKIE, initial_stock = PISTOL_AMOUNT*5,sale_price =1000),
		new /datum/data/stalker_equipment("5000 РУБ",							"5000 РУБ",												/obj/item/stack/spacecash/c5000,									5000,	ROOKIE, initial_stock = PISTOL_AMOUNT*5,sale_price =5000),
//		new /datum/data/stalker_equipment("Болты",								"Болты",												/obj/item/stalker/bolts,											300,	ROOKIE),
		new /datum/data/stalker_equipment("Наручники",							"Наручники",											/obj/item/restraints/handcuffs/cable/zipties,						500,	ROOKIE, initial_stock = PISTOL_AMOUNT,faction = "Bandits"),
		new /datum/data/stalker_equipment("Наручники",							"Наручники",											/obj/item/restraints/handcuffs/cable/zipties,						500,	ROOKIE, initial_stock = PISTOL_AMOUNT,faction = "Renegades"),
		new /datum/data/stalker_equipment("Бинокль",							"Бинокль",											/obj/item/twohanded/binoculars,										2500,	EXPERIENCED,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Осколочная Граната",						"Осколочная Граната",											/obj/item/grenade/syndieminibomb/concussion/stalker/frag,			8500,	ROOKIE,initial_stock = PISTOL_AMOUNT*4),
		new /datum/data/stalker_equipment("Дымовая граната",						"Дымовая граната",										/obj/item/grenade/smokebomb/rgd,									1500,	ROOKIE,initial_stock = PISTOL_AMOUNT*4),
		new /datum/data/stalker_equipment("Светошумовая Граната",						"Светошумовая Граната",										/obj/item/grenade/flashbang,										10000,	EXPERIENCED,initial_stock = PISTOL_AMOUNT*4,faction = "Mercenaries"),
		new /datum/data/stalker_equipment("Кошелёк",								"Кошелёк",												/obj/item/storage/wallet,											500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Фальшфейер",								"Фальшфейер",												/obj/item/flashlight/flare,											2000,	ROOKIE,	initial_stock = PISTOL_AMOUNT,sale_price = 250),
		new /datum/data/stalker_equipment("ХИС",							"ХИС",											/obj/item/flashlight/glowstick,										2000,	ROOKIE,	initial_stock = PISTOL_AMOUNT,sale_price = 250),
		new /datum/data/stalker_equipment("Мыло",								"Мыло",													/obj/item/soap,														250,	ROOKIE,	initial_stock = PISTOL_AMOUNT,sale_price = 150),
		new /datum/data/stalker_equipment("Словарь По Русскому Языку",					"Словарь По Русскому Языку",									/obj/item/codespeak_manual/russian,									10000,	ROOKIE,	initial_stock = SPECIALTY_AMOUNT,faction = "Duty",sale_price = 8000),
		new /datum/data/stalker_equipment("Словарь По Английскому Языку",					"Словарь По Английскому Языку",									/obj/item/codespeak_manual/english,									10000,	ROOKIE,	initial_stock = SPECIALTY_AMOUNT,faction = "Clear Sky",sale_price = 8000),
		new /datum/data/stalker_equipment("Словарь По Немецкому Языку",					"Словарь По Немецкому Языку",									/obj/item/codespeak_manual/german,									10000,	ROOKIE,	initial_stock = SPECIALTY_AMOUNT,faction = "Ecologist",sale_price = 8000),
		new /datum/data/stalker_equipment("Клинер",						"Клинер",										/obj/item/reagent_containers/spray/cleaner,							250,	ROOKIE,	initial_stock = PISTOL_AMOUNT,sale_price = 150)
		),


	"Clothing" = list(
		new /datum/data/stalker_equipment("Свитер",								"Свитер",												/obj/item/clothing/under/color/switer,						1000,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Тёмный Свитер",							"Тёмный Свитер",											/obj/item/clothing/under/color/switer/dark,					1500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Тельняшка",							"Тельняшка",											/obj/item/clothing/under/color/switer/lolg,					1500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Спортивка",							"Спортивка",											/obj/item/clothing/under/color/switer/tracksuit,			1500,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Изношенные Берцы",				"Изношенные Берцы",									/obj/item/clothing/shoes/jackboots/warm,					800,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Перчатки Без Пальцев",					"Перчатки Без Пальцев",									/obj/item/clothing/gloves/fingerless,						600,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Перчатки",								"Перчатки",												/obj/item/clothing/gloves/color/black,						800,	ROOKIE,initial_stock = PISTOL_AMOUNT),
		new /datum/data/stalker_equipment("Балаклава",							"Балаклава",											/obj/item/clothing/mask/balaclava,							700,	ROOKIE,initial_stock = PISTOL_AMOUNT)
		),


	"Detectors" = list(
		/////////////////////////////////	Детекторы	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Отклик", 		"Отклик",						/obj/item/detector/blink,				8000,	ROOKIE,	sale_price =7000,initial_stock = SMG_AMOUNT),
		new /datum/data/stalker_equipment("Медведь",		"Медведь",						/obj/item/detector/bear,				17000,	EXPERIENCED,	sale_price =10000,initial_stock = RIFLE_AMOUNT),
		new /datum/data/stalker_equipment("Велес",		"Велес",					/obj/item/detector/veles,				66000,	ROOKIE,	sale_price =50000, faction = "Ecologist",initial_stock = SPECIALTY_AMOUNT),
		),


	"Attachments" = list(
		/////////////////////////////////	Аттачменты	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Универсальный Глушитель",	"Универсальный Глушитель",						/obj/item/attachment/suppressor,			4000,	ROOKIE,RIFLE_AMOUNT,sale_price =500,),
		new /datum/data/stalker_equipment("СУСАТ",					"СУСАТ",									/obj/item/attachment/scope/SUSAT,			10000,	EXPERIENCED,RIFLE_AMOUNT,sale_price =3000),
		new /datum/data/stalker_equipment("ПСУ-1",					"ПСУ-1",									/obj/item/attachment/scope/PS/U1,			15000,	EXPERIENCED,RIFLE_AMOUNT,sale_price =5000),
		new /datum/data/stalker_equipment("ПСО-1",					"ПСО-1",									/obj/item/attachment/scope/PS/O1,			30000,	EXPERIENCED,RIFLE_AMOUNT,sale_price =8000),
		new /datum/data/stalker_equipment("Прицел Для Дробовиков/Винтовок",	"Прицел Для Дробовиков/Винтовок",						/obj/item/attachment/scope/rifle,			10000,	ROOKIE,RIFLE_AMOUNT,sale_price =400)
		///////////////////////////////////////////////////////////////////////////////////////////
		),


	"Unbuyable" = list(
		new /datum/data/stalker_equipment("Canned soup",					"Canned soup",					/obj/item/reagent_containers/food/snacks/stalker/konserva/soup,				900,	ROOKIE),
		new /datum/data/stalker_equipment("Canned beans",					"Canned beans",					/obj/item/reagent_containers/food/snacks/stalker/konserva/bobi,				750,	ROOKIE),
		new /datum/data/stalker_equipment("Canned stew",					"Canned stew",					/obj/item/reagent_containers/food/snacks/stalker/konserva/govyadina2,		900,	ROOKIE),
		new /datum/data/stalker_equipment("Canned fish",					"Canned fish",					/obj/item/reagent_containers/food/snacks/stalker/konserva/fish,				750,	ROOKIE),
		new /datum/data/stalker_equipment("Cream cheese",					"Cream cheese",					/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/sirok,		400,	ROOKIE),
		new /datum/data/stalker_equipment("Chocolate bar",					"Chocolate bar",				/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/chocolate,	600,	ROOKIE),
		new /datum/data/stalker_equipment("Biscuits",						"Biscuits",						/obj/item/reagent_containers/food/snacks/stalker/konserva/galets,			400,	ROOKIE),
		new /datum/data/stalker_equipment("Cereal",						"Cereal",						/obj/item/reagent_containers/food/snacks/stalker/konserva/kasha,			550,	ROOKIE),
		new /datum/data/stalker_equipment("Canned meat",					"Canned meat",					/obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva1,		700,	ROOKIE),
		new /datum/data/stalker_equipment("Canned meat",					"Canned meat",					/obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva2,		700,	ROOKIE),
		new /datum/data/stalker_equipment("Canned meat with vegetables",	"Canned meat with vegetables",	/obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva3,		850,	ROOKIE),
		new /datum/data/stalker_equipment("Biscuits",						"Biscuits",						/obj/item/reagent_containers/food/snacks/stalker/konserva/galets,			400,	ROOKIE),
		/////////////////////////////////	Лут с мутантов	///////////////////////////////////////////


		new /datum/data/stalker_equipment("Dog Tail",					"Dog Tail",				/obj/item/stalker/loot/mutantparts/dog_tail,			1000,		ROOKIE, sale_price = 600),
		new /datum/data/stalker_equipment("Flesh Eye",					"Flesh Eye",			/obj/item/stalker/loot/mutantparts/flesh_eye,			1800,		ROOKIE, sale_price = 1050),
		new /datum/data/stalker_equipment("Boar Hoof",					"Boar Hoof",			/obj/item/stalker/loot/mutantparts/boar_leg,			6000,		ROOKIE, sale_price = 1800),
		new /datum/data/stalker_equipment("Snork Leg",					"Snork Leg",			/obj/item/stalker/loot/mutantparts/snork_leg,			7000,		ROOKIE, sale_price = 3000),
		new /datum/data/stalker_equipment("Bloodsucker Tendrils",		"Bloodsucker Tendrils",	/obj/item/stalker/loot/mutantparts/bloodsucker,			16000,		ROOKIE, sale_price = 8000),
		new /datum/data/stalker_equipment("Pseudodog Tail",				"Pseudodog Tail",		/obj/item/stalker/loot/mutantparts/pseudo_tail,			8000,		ROOKIE, sale_price = 7000),
		new /datum/data/stalker_equipment("Controller Brain",			"Controller Brain",	/obj/item/stalker/loot/mutantparts/controller_brain,		40000,		ROOKIE, sale_price = 20000),
		new /datum/data/stalker_equipment("Poltergeist Skin",			"Poltergeist Skin",	/obj/item/stalker/loot/mutantparts/poltergeist_skin,		80000,		ROOKIE, sale_price = 40000),


		/////////////////////////////////	Artifacts	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Jellyfish",			"Jellyfish",						/obj/item/artifact/meduza,					5000,	ROOKIE,	sale_price = 2500),
//		new /datum/data/stalker_equipment("Stone Flower",		"Stone Flower",						/obj/item/artifact/stoneflower,				10000,	ROOKIE,	sale_price = 3000),
//		new /datum/data/stalker_equipment("Night Star",			"Night Star",						/obj/item/artifact/nightstar,				30000,	ROOKIE,	sale_price = 13000),
		new /datum/data/stalker_equipment("Depleted Stone Flower",			"Depleted Stone Flower",					/obj/item/artifact/stoneflower_depleted,			5000,	ROOKIE,	sale_price = 1500),
		new /datum/data/stalker_equipment("Depleted Night Star",			"Depleted Night Star",						/obj/item/artifact/nightstar_depleted,				10000,	ROOKIE,	sale_price = 8000),
		new /datum/data/stalker_equipment("Soul",				"Soul",								/obj/item/artifact/soul,					80000,	ROOKIE,	sale_price = 25000),
		///////////////////////////////////////////////////////////////////////////////////////////
		new /datum/data/stalker_equipment("Flash",				"Flash",							/obj/item/artifact/flash,					6000,	ROOKIE,	sale_price = 2500),
		new /datum/data/stalker_equipment("Moonlight",			"Moonlight",						/obj/item/artifact/moonlight,				12000,	ROOKIE,	sale_price = 3500),
		new /datum/data/stalker_equipment("Shell",				"Shell",							/obj/item/artifact/pustishka,				40000,	ROOKIE,	sale_price = 8000),
		new /datum/data/stalker_equipment("Battery",			"Battery",							/obj/item/artifact/battery,					70000,	ROOKIE,	sale_price = 24000),
		///////////////////////////////////////////////////////////////////////////////////////////
		new /datum/data/stalker_equipment("Droplet",			"Droplet",							/obj/item/artifact/droplet,					7000,	ROOKIE,	sale_price = 5000),
		new /datum/data/stalker_equipment("Fireball",			"Fireball",							/obj/item/artifact/fireball,				15000,	ROOKIE,	sale_price = 7500),
		new /datum/data/stalker_equipment("Crystal",			"Crystal",							/obj/item/artifact/crystal,					60000,	ROOKIE,	sale_price = 15000),
		new /datum/data/stalker_equipment("\improper Mama's Beads",		"\improper Mama's Beads",	/obj/item/artifact/maminibusi,				80000,	ROOKIE,	sale_price = 35000),
		///////////////////////////////////////////////////////////////////////////////////////////
		new /datum/data/stalker_equipment("Stone Blood",		"Stone Blood",						/obj/item/artifact/stone_blood,				4000,	ROOKIE,	sale_price = 2500),
		new /datum/data/stalker_equipment("Bubble",				"Bubble",							/obj/item/artifact/bubble,					12000,	ROOKIE,	sale_price = 15000),
		new /datum/data/stalker_equipment("Mica",				"Mica",								/obj/item/artifact/mica,					30000,	ROOKIE,	sale_price = 20000),
		new /datum/data/stalker_equipment("Firefly",			"Firefly",							/obj/item/artifact/firefly,					90000,	ROOKIE,	sale_price = 40000),


  	/////////////////////////////////	Trash	//////////////////////////////////////////////
		new /datum/data/stalker_equipment("Konserva",			"Консерва",							/obj/item/trash/konserva,						400,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консерва",							/obj/item/trash/konserva/MREkonserva1,			200,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консерва",							/obj/item/trash/konserva/MREkonserva2,			200,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консерва",							/obj/item/trash/konserva/MREkonserva3,			200,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консерва",							/obj/item/trash/konserva/bobi,					400,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консерва",							/obj/item/trash/konserva/fish,					500,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консерва",							/obj/item/trash/konserva/govyadina,				400,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консерва",							/obj/item/trash/konserva/shproti,				600,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консерва",							/obj/item/trash/konserva/soup,					500,	ROOKIE),
		new /datum/data/stalker_equipment("Used Zipties",		"Used Zipties",						/obj/item/restraints/handcuffs/cable/zipties/used,250,	ROOKIE),
		///////////////////////////////////////////////////////////////////////////////////////////
		new /datum/data/stalker_equipment("50 RU",				"50 RU",							/obj/item/stack/spacecash/c50,				50,		ROOKIE,	sale_price = 50),
		new /datum/data/stalker_equipment("100 RU",				"100 RU",							/obj/item/stack/spacecash/c100,				100,	ROOKIE,	sale_price = 100),
		new /datum/data/stalker_equipment("500 RU",				"500 RU",							/obj/item/stack/spacecash/c500,				500,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("1000 RU",			"1000 RU",							/obj/item/stack/spacecash/c1000,			1000,	ROOKIE,	sale_price = 1000),
		new /datum/data/stalker_equipment("5000 RU",			"5000 RU",							/obj/item/stack/spacecash/c5000,			5000,	ROOKIE,	sale_price = 5000),


		/////////////////////////////////	Medkit components	//////////////////////////////////////////////////
		new /datum/data/stalker_equipment("Ointment",					"Ointment",						/obj/item/stack/medical/ointment,									25,		ROOKIE,	sale_price = 25),
		new /datum/data/stalker_equipment("Bruise Pack",				"Bruise Pack",					/obj/item/stack/medical/bruise_pack,								25,		ROOKIE,	sale_price = 25),
		new /datum/data/stalker_equipment("Charcoal Pill",				"Charcoal Pill",				/obj/item/reagent_containers/pill/charcoal,							125,	ROOKIE,	sale_price = 125),
		new /datum/data/stalker_equipment("Epipen",						"Epipen",						/obj/item/reagent_containers/pill/stalker/injector/epinephrine,		125,	ROOKIE,	sale_price = 125),
		new /datum/data/stalker_equipment("Brute Patch",				"Brute Patch",					/obj/item/reagent_containers/pill/patch/styptic,					250,	ROOKIE,	sale_price = 250),
		new /datum/data/stalker_equipment("Burn Patch",					"Burn Patch",					/obj/item/reagent_containers/pill/patch/silver_sulf,				250,	ROOKIE,	sale_price = 250),
		new /datum/data/stalker_equipment("Combat Patch",				"Combat Patch",					/obj/item/reagent_containers/pill/patch/synthflesh,					250,	ROOKIE,	sale_price = 250),
		new /datum/data/stalker_equipment("Brute Injector",				"Brute Injector",				/obj/item/reagent_containers/pill/stalker/injector/brute,			250,	ROOKIE,	sale_price = 250),
		new /datum/data/stalker_equipment("Burn Injector",				"Burn Injector",				/obj/item/reagent_containers/pill/stalker/injector/burn,			250,	ROOKIE,	sale_price = 250),
		new /datum/data/stalker_equipment("Blood Injector",				"Blood Injector",				/obj/item/reagent_containers/pill/stalker/injector/blood,			250,	ROOKIE,	sale_price = 150),
		new /datum/data/stalker_equipment("Painkillers Injector",		"Painkillers Injector",			/obj/item/reagent_containers/pill/stalker/injector/painkiller,		250,	ROOKIE,	sale_price = 150),
		new /datum/data/stalker_equipment("Antitoxin Injector",			"Antitoxin Injector",			/obj/item/reagent_containers/pill/stalker/injector/toxin,			250,	ROOKIE,	sale_price = 150),
		new /datum/data/stalker_equipment("Oxygen Injector",			"Oxygen Injector",				/obj/item/reagent_containers/pill/stalker/injector/oxygen,			250,	ROOKIE,	sale_price = 150),
		new /datum/data/stalker_equipment("Antirad Injector",			"Antirad Injector",				/obj/item/reagent_containers/pill/stalker/injector/antirad,			250,	ROOKIE,	sale_price = 150),


		/////////////////////////////////Rare Firearms	//////////////////////////////////////////////////
		new /datum/data/stalker_equipment("Arisaka",					"Arisaka",						/obj/item/gun/ballistic/rifle/boltaction/arisaka,			7550,	ROOKIE,	sale_price = 22000),
		new /datum/data/stalker_equipment("Karabiner",					"Karabiner",					/obj/item/gun/ballistic/rifle/boltaction/karabiner,			7550,	ROOKIE,	sale_price = 22000),
		new /datum/data/stalker_equipment("Springfield",				"Springfield",					/obj/item/gun/ballistic/rifle/boltaction/springfield,		7550,	ROOKIE,	sale_price = 22000),
		new /datum/data/stalker_equipment("Sten MK II",					"Sten MK II",					/obj/item/gun/ballistic/automatic/sten,						7550,	ROOKIE,	sale_price = 22000),
		new /datum/data/stalker_equipment("Sterling Submachine Gun",	"Sterling Submachine Gun",		/obj/item/gun/ballistic/automatic/sterling,					7550,	ROOKIE,	sale_price = 22000),
		new /datum/data/stalker_equipment("M3A1 Grease Gun",			"M3A1 Grease Gun",				/obj/item/gun/ballistic/automatic/m3a1,						7550,	ROOKIE,	sale_price = 22000),
		new /datum/data/stalker_equipment("Reising Model 55",			"Reising Model 55",				/obj/item/gun/ballistic/automatic/reising,					7550,	ROOKIE,	sale_price = 35000),
		new /datum/data/stalker_equipment("MP-40",						"MP-40",						/obj/item/gun/ballistic/automatic/mp40,						7550,	ROOKIE,	sale_price = 35000),
		new /datum/data/stalker_equipment("MP 3008",					"MP 3008",						/obj/item/gun/ballistic/automatic/mp3008,					7550,	ROOKIE,	sale_price = 35000),
		new /datum/data/stalker_equipment("PPS-43",						"PPS-43",						/obj/item/gun/ballistic/automatic/pps43,					7550,	ROOKIE,	sale_price = 35000),
		new /datum/data/stalker_equipment("PP-19 Bizon",				"PP-19 Bizon",					/obj/item/gun/ballistic/automatic/bizon,					7550,	ROOKIE,	sale_price = 40000),
		new /datum/data/stalker_equipment("Smith & Wesson M76",			"Smith & Wesson M76",			/obj/item/gun/ballistic/automatic/m76,						7550,	ROOKIE,	sale_price = 40000),
		new /datum/data/stalker_equipment("Skorpion",					"Skorpion",						/obj/item/gun/ballistic/automatic/skorpion,					7550,	ROOKIE,	sale_price = 20000),
		new /datum/data/stalker_equipment("SKS",						"SKS",							/obj/item/gun/ballistic/rifle/semiautobolt/sks,				7550,	ROOKIE,	sale_price = 25000),
		new /datum/data/stalker_equipment("FN FAL",						"FN FAL",						/obj/item/gun/ballistic/automatic/fnfal,					7550,	ROOKIE,	sale_price = 50000),
		new /datum/data/stalker_equipment("FN FAL",						"FN FAL",						/obj/item/gun/ballistic/automatic/woodfnfal,				7550,	ROOKIE,	sale_price = 50000),
		new /datum/data/stalker_equipment("FAMAS",						"FAMAS",						/obj/item/gun/ballistic/automatic/famas,					7550,	ROOKIE,	sale_price = 40000),
		new /datum/data/stalker_equipment("Steyr AUG",					"Steyr AUG",					/obj/item/gun/ballistic/automatic/aug,						7550,	ROOKIE,	sale_price = 40000),
		new /datum/data/stalker_equipment("vz. 58",						"vz. 58",						/obj/item/gun/ballistic/automatic/vz58,						7550,	ROOKIE,	sale_price = 40000),
		new /datum/data/stalker_equipment("M16A1",						"M16A1",						/obj/item/gun/ballistic/automatic/m16,						7550,	ROOKIE,	sale_price = 30000),
		new /datum/data/stalker_equipment("M14 Carbine",				"M14 Carbine",					/obj/item/gun/ballistic/automatic/m14,						7550,	ROOKIE,	sale_price = 55000),
		new /datum/data/stalker_equipment("M16A4",						"M16A4",						/obj/item/gun/ballistic/automatic/m16a4,					7550,	ROOKIE,	sale_price = 50000),
		new /datum/data/stalker_equipment("M4 Carbine",					"M4 Carbine",					/obj/item/gun/ballistic/automatic/m4,						7550,	ROOKIE,	sale_price = 30000),
		new /datum/data/stalker_equipment("ArmaLite AR-15",				"ArmaLite AR-15",				/obj/item/gun/ballistic/automatic/ar15,						7550,	ROOKIE,	sale_price = 30000),
		new /datum/data/stalker_equipment("FN SCAR-H",					"FN SCAR-H",					/obj/item/gun/ballistic/automatic/scarh,					7550,	ROOKIE,	sale_price = 60000),
		new /datum/data/stalker_equipment("AK74",						"AK74",							/obj/item/gun/ballistic/automatic/ak74/black,				7550,	ROOKIE,	sale_price = 38000),
		new /datum/data/stalker_equipment("AK74",						"AK74",							/obj/item/gun/ballistic/automatic/ak74/camo,				7550,	ROOKIE,	sale_price = 38000),
		new /datum/data/stalker_equipment("AK74",						"AK74",							/obj/item/gun/ballistic/automatic/ak74/blackout,			7550,	ROOKIE,	sale_price = 38000),
		new /datum/data/stalker_equipment("Luger P08",					"Luger P08",					/obj/item/gun/ballistic/automatic/pistol/luger,				7550,	ROOKIE,	sale_price = 25000),
		new /datum/data/stalker_equipment("Walther P38",				"Walther P38",					/obj/item/gun/ballistic/automatic/pistol/walther,			7550,	ROOKIE,	sale_price = 20000),
		new /datum/data/stalker_equipment("Stetchkin APS",				"Stetchkin APS",				/obj/item/gun/ballistic/automatic/pistol/aps,				7550,	ROOKIE,	sale_price = 20000),
		new /datum/data/stalker_equipment("OTs- Pernach",				"OTs- Pernach",					/obj/item/gun/ballistic/automatic/pistol/pernach,			7550,	ROOKIE,	sale_price = 20000),
		new /datum/data/stalker_equipment("Mauser C96",					"Mauser C96",					/obj/item/gun/ballistic/automatic/pistol/mauser,			7550,	ROOKIE,	sale_price = 12000),
		new /datum/data/stalker_equipment("Glock 17",					"Glock 17",						/obj/item/gun/ballistic/automatic/pistol/glock,				7550,	ROOKIE,	sale_price = 18000),
		new /datum/data/stalker_equipment("TT-30",						"TT-30",						/obj/item/gun/ballistic/automatic/pistol/tt30,				7550,	ROOKIE,	sale_price = 12000),
		new /datum/data/stalker_equipment("Five Seven",					"Five Seven",					/obj/item/gun/ballistic/automatic/pistol/fiveseven,			7550,	ROOKIE,	sale_price = 20000),
		new /datum/data/stalker_equipment(".500 Bull",					".500 Bull",					/obj/item/gun/ballistic/revolver/c500revolver,				7550,	ROOKIE,	sale_price = 100000),
		new /datum/data/stalker_equipment("Walther PP",					"Walther PP",					/obj/item/gun/ballistic/automatic/pistol/waltherpp,			7550,	ROOKIE,	sale_price = 15000),
		new /datum/data/stalker_equipment("CZ 83",						"CZ 83",						/obj/item/gun/ballistic/automatic/pistol/cz83,				7550,	ROOKIE,	sale_price = 12000),
		new /datum/data/stalker_equipment("Silver Baretta",				"Silver Baretta",				/obj/item/gun/ballistic/automatic/pistol/silvermarta,		7550,	ROOKIE,	sale_price = 50000),
		/////////////////////////////////Rare Firearm Ammo	//////////////////////////////////////////////////
		new /datum/data/stalker_equipment("aps pistol magazine (9x18mm)",				"aps pistol magazine (9x18mm)",			/obj/item/ammo_box/magazine/stalker/m9x18aps,			250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("bizon magazine (9x18mm)",					"bizon magazine (9x18mm)",				/obj/item/ammo_box/magazine/stalker/m9x18bizon,			250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("luger pistol magazine (9x19mm)",				"luger pistol magazine (9x19mm)",		/obj/item/ammo_box/magazine/stalker/m9x19luger,			250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("walther P38 pistol magazine (9x19mm)",		"walther P38 pistol magazine (9x19mm)",	/obj/item/ammo_box/magazine/stalker/m9x19waltherp38,	250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("glock pistol magazine (9x19mm)",				"glock pistol magazine (9x19mm)",		/obj/item/ammo_box/magazine/stalker/m9x19glock,			250,	ROOKIE,	sale_price = 150),
		new /datum/data/stalker_equipment("five seven pistol magazine (5.7×28mm)",		"five seven pistol magazine (5.7×28mm)",/obj/item/ammo_box/magazine/stalker/m57x28fiveseven,	250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("walther PP pistol magazine (9x19mm)",		"walther PP pistol magazine (9x19mm)",	/obj/item/ammo_box/magazine/stalker/m9x19waltherpp,		250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("CZ 83 pistol magazine (9x18mm)",				"CZ 83 pistol magazine (9x18mm)",		/obj/item/ammo_box/magazine/stalker/m9x18cz83,			250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("reising magazine (.45)",						"reising magazine (.45)",				/obj/item/ammo_box/magazine/stalker/reising,			250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("mat 49 magazine (9x19mm)",					"mat 49 magazine (9x19mm)",				/obj/item/ammo_box/magazine/stalker/m9x19mat49,			250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("M14 magazine (7.62x51)",						"M14 magazine (7.62x51)",				/obj/item/ammo_box/magazine/stalker/m14,				250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("SCAR magazine (7.62x51)",					"SCAR magazine (7.62x51)",				/obj/item/ammo_box/magazine/stalker/scarh,				250,	ROOKIE,	sale_price = 500),
//		new /datum/data/stalker_equipment("SKS magazine (7.62x51)",						"SKS magazine (7.62x51)",				/obj/item/ammo_box/magazine/stalker/sks,				250,	ROOKIE,	sale_price = 500), //SKS IS INTERNAL MAG :megatroll:
		new /datum/data/stalker_equipment("vz. 58 magazine (7.62x39)",					"vz. 58 magazine (7.62x39)",			/obj/item/ammo_box/magazine/stalker/vz58,				250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("PPS43 magazine (7.62x25)",					"PPS43 magazine (7.62x25)",				/obj/item/ammo_box/magazine/stalker/pps43,				250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("MP-40 magazine (9x19mm)",					"MP-40 magazine (9x19mm)",				/obj/item/ammo_box/magazine/stalker/mp40,				250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("sten MK II magazine (9x19mm)",				"sten MK II magazine (9x19mm)",			/obj/item/ammo_box/magazine/stalker/sten,				250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("sterling magazine (9x19mm)",					"sterling magazine (9x19mm)",			/obj/item/ammo_box/magazine/stalker/sterling,			250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("M3A1 grease gun magazine (9x19mm)",			"M3A1 grease gun magazine (9x19mm)",	/obj/item/ammo_box/magazine/stalker/m3a1,				250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("S&W M76 magazine (9x19mm)",					"S&W M76 magazine (9x19mm)",			/obj/item/ammo_box/magazine/stalker/m9x19m76,			250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("skorpion magazine (9x19mm)",					"skorpion magazine (9x19mm)",			/obj/item/ammo_box/magazine/stalker/m9x19skorpion,		250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("mauser pistol magazine (7.62x25mm)",			"mauser pistol magazine (7.62x25mm)",	/obj/item/ammo_box/magazine/stalker/mauser,				250,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("extended mauser pistol magazine (7.62x25mm)","extended mauser pistol magazine (7.62x25mm)",/obj/item/ammo_box/magazine/stalker/mauser/ext,	250,	ROOKIE,	sale_price = 500),
		)
	))

/obj/machinery/stalker
	obj_integrity = 1000000
	icon = 'stalker/icons/decor.dmi'

/obj/machinery/stalker/sidormat
	name = "СЫЧЕМАТ"
	desc = "Вендор Для Сталкеров."
	icon_state = "radio"
	density = 1
	anchored = 1
	var/itemloc = null
	var/itemloc2 = null
	var/balance = 0
	var/rating = 0
	var/switches = BUY_STUFF
	var/real_assorment = list()
	var/list/special_factions = list("Loners", "Bandits", "Duty", "Freedom", "Mercenaries", "Monolith", "Clear Sky", "Ecologist", "Renegades", "State Security Service")
	var/path_ending = null
	//Faction Locker
	var/obj/item/assembly/control/door_device = null

/datum/data/stalker_equipment
	//var/name = "generic"
	var/name_ru = "generic"
	var/equipment_path = null
	var/cost = 0
	var/rating = 0
	var/faction = "Everyone"
	var/amount = 5
	var/initial_stock = 5
	var/restock_amount = 1
	var/restock_time = 10 MINUTES
	var/min_restock_time = 15 MINUTES
	var/max_restock_time = 30 MINUTES
	var/sale_price = 0
	var/assortment_level = 0

/datum/data/stalker_equipment/New(name, name_ru, path, cost, rating, faction = "Everyone", amount = 5, initial_stock = 5, restock_amount = 1, restock_time = 10 MINUTES, min_restock_time = 15 MINUTES, max_restock_time = 30 MINUTES, sale_price = 0, assortment_level = 0)
	src.name = name
	src.name_ru = name_ru
	src.equipment_path = path
	src.cost = cost
	src.rating = rating
	src.faction = faction
	src.amount = initial_stock
	src.restock_amount = initial_stock/4
	src.restock_time = rand(min_restock_time, max_restock_time)
	addtimer(CALLBACK(src, .proc/Restock), src.restock_time)
	if(sale_price)
		src.sale_price = sale_price
	else
		src.sale_price = cost/2
	src.assortment_level = assortment_level

	switch(cost)
		if(0 to TRASH_TIER_COST)
			GLOB.trash_tier_sidormatitems += src

		if(0 to LOW_TIER_COST)
			GLOB.low_tier_sidormatitems += src

		if(0 to MEDIUM_TIER_COST)
			GLOB.medium_tier_sidormatitems += src

		if(LOW_TIER_COST to HIGH_TIER_COST)
			GLOB.high_tier_sidormatitems += src

	GLOB.real_sidormat_items += src

	switch(rating)//causes runtimes but whatever. It works 100%. Probably.
		if(0 to ROOKIE)
			rookie_sidormatitems += src
		if(0 to EXPERIENCED)
			experienced_sidormatitems += src
		if(0 to VETERAN)
			veteran_sidormatitems += src
		if(0 to EXPERT)
			expert_sidormatitems += src
		if(0 to ZONE_LEGEND)
			legend_sidormatitems += src

/datum/data/stalker_equipment/proc/GetCost()
	return src.sale_price

/datum/data/stalker_equipment/proc/Restock()
	for(var/L in GLOB.global_sidormat_list)
		if(L == "Unbuyable")
			return
	if(amount == 0)
		amount += initial_stock
	else
		amount += restock_amount
	addtimer(CALLBACK(src, .proc/Restock), restock_time)
	return

/datum/data/stalker_equipment/stalker_pda/GetCost(var/obj/item/stalker_pda/KPK)
	var/cost_ = src.sale_price
	if(KPK.owner && (KPK.owner.stat == DEAD))
		var/rank_ = CLAMP(KPK.profile.fields["rating"], ROOKIE, ZONE_LEGEND)
		cost_ += GetCostBasedOnReputation(KPK.profile.fields["reputation"])
		cost_ += rank_*2
	return cost_

/proc/GetCostBasedOnReputation(var/rep_)
	switch(rep_)
		if(AMAZING to INFINITY)
			return ((NEUTRAL - rep_) * 20)
		if(VERYGOOD to AMAZING)
			return ((NEUTRAL - rep_) * 10)
		if(GOOD to VERYGOOD)
			return ((NEUTRAL - rep_) * 5)
		if(BAD to GOOD)
			return 0
		if(VERYBAD to BAD)
			return ((NEUTRAL - rep_) * 5)
		if(DISGUSTING to VERYBAD)
			return ((NEUTRAL - rep_) * 10)
		if(-INFINITY to DISGUSTING)
			return ((NEUTRAL - rep_) * 20)

/obj/machinery/stalker/sidormat/New()
	itemloc = locate(x - 1, y, z)
	itemloc2 = locate(x + 1, y, z)

	sleep(10)

	if(path_ending && !door_device)
		door_device = new /obj/item/assembly/control(src)
		door_device.id = path_ending

/obj/machinery/stalker/sidormat/attack_hand(mob/user)
	balance = 0
	if(..())
		return

	if(!ishuman(user))
		say("Ты не человек.")
		return

	var/mob/living/carbon/human/H = user

	ui_interact(H)


/obj/machinery/stalker/sidormat/ui_interact(mob/living/carbon/human/H)

	if(!istype(H.wear_id, /obj/item/stalker_pda))
		say("Наденьте ваш КПК.")
		return

	//find_record("sid", H.sid, data_core.stalkers)
	var/obj/item/stalker_pda/KPK = H.wear_id
	var/datum/data/record/sk = KPK.profile

	if(!sk || !KPK.owner)
		say("Активируйте ваш КПК.")
		return

	if(KPK.owner != H)
		say("Нет доступа.")
		return

	H.set_machine(src)
	balance = sk.fields["money"]
	rating = sk.fields["rating"]

	var/dat
	if(H.client.prefs.chat_toggles & CHAT_LANGUAGE)

	///////////////////////////////////////////////////////////АНГЛИЙСКИЙ СИДОРОМАТ///////////////////////////////////////////////////////////////////////

		dat +="<div class='statusDisplay'>"
		dat += "Balance: [num2text(balance, 8)] RU<br>"
		dat += "<br><br>INSTRUCTION: Put loot for sale on the <b>left</b> table.<br>" // Забирать деньги и купленные вещи - на <b>правом</b>.
		if(switches & BUY_STUFF)
			dat +="<A href='?src=\ref[src];choice=take'><b>Sell loot</b></A><br>"
		if(door_device && sk.fields["degree"])
			dat +="<A href='?src=\ref[src];basement_toggle=1'><b>Toggle basement door</b></A><br>"
		dat += "</div>"
		dat += "<div class='lenta_scroll'>"
		dat += "<BR><table border='0' width='400'>" //<b>Item list:</b>
		for(var/L in GLOB.global_sidormat_list)
			if(L == "Unbuyable" && !(switches & SELL_UNBUYABLE))
				continue
			dat += "<tr><td><center><big><b>[L]</b></big></center></td><td></td><td></td></tr>"
			for(var/datum/data/stalker_equipment/prize in GLOB.global_sidormat_list[L])
				if((sk.fields["faction_s"] == prize.faction && ((sk.fields["faction_s"] in special_factions) || (switches & SHOW_FACTION_EQUIPMENT))) || prize.faction == "Everyone")
					if(rating >= prize.rating)
						if(prize.amount > 0)
							if(get_assortment_level(H) >= prize.assortment_level)
								dat += "<tr><td><img src='data:image/jpeg;base64,[GetIconForProduct(prize)]'/></td><td>[prize.name_ru]</td><td>Price: [prize.cost]</td><td>Amount: [prize.amount]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

		dat += "</table>"
		dat += "</div>"

	else

		///////////////////////////////////////////////////////////РУССКИЙ СИДОРОМАТ///////////////////////////////////////////////////////////////////////

		dat +="<div class='statusDisplay'>"
		dat += "On account: [num2text(balance, 8)] RU<br>"
		dat += "<br><br>INSTRUCTION: Place loot on <b> Left </b> Table.<br>" //Забирать деньги и купленные вещи - на <b>правом</b>.
		if(switches & BUY_STUFF)
			dat +="<A href='?src=\ref[src];choice=take'><b>Sell Loot</b></A><br>"
		if(door_device && sk.fields["degree"])
			dat +="<A href='?src=\ref[src];basement_toggle=1'><b>Open/Close Vault</b></A><br>"
		dat += "</div>"
		dat += "<div class='lenta_scroll'>"
		dat += "<BR><table border='0' width='400'>" //<b>Список предметов:</b>
		for(var/L in GLOB.global_sidormat_list)
			if(L == "Unbuyable" && !(switches & SELL_UNBUYABLE))
				continue
			dat += "<tr><td></td><td><center><b>[L]</b></center></td><td></td><td></td></tr>"
			for(var/datum/data/stalker_equipment/prize in GLOB.global_sidormat_list[L])
				if((sk.fields["faction_s"] == prize.faction && ((sk.fields["faction_s"] in special_factions) || (switches & SHOW_FACTION_EQUIPMENT))) || prize.faction == "Everyone")
					if(rating >= prize.rating)
						if(get_assortment_level(H) >= prize.assortment_level)
							dat += "<tr><td><img src='data:image/jpeg;base64,[GetIconForProduct(prize)]'/></td><td>[prize.name_ru]</td><td>Price: [prize.cost]</td><td>Amount: [prize.amount]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"
		dat += "</table>"
		dat += "</div>"

	var/datum/browser/popup = new(H, "miningvendor", "SIDORMAT 3000", 450, 700)
	popup.set_content(dat)
	popup.open()
	return

/proc/get_assortment_level(var/mob/living/carbon/human/owner)
	var/datum/data/record/sk = find_record("sid", owner.sid, GLOB.data_core.stalkers)
	var/assortment_level = 0


	for(var/obj/machinery/stalker/sidorpoint/cp in GLOB.cps)
		if(cp.controlled_by == sk.fields["faction_s"] && cp.control_percent == 100)
			assortment_level++

	return assortment_level

/obj/machinery/stalker/sidormat/Topic(href, href_list)
	if(..())
		return

	var/mob/living/carbon/human/H = usr

	if(!istype(H.wear_id, /obj/item/stalker_pda))
		say("Put on your PDA.")
		updateUsrDialog()
		return

	var/datum/data/record/sk = find_record("sid", H.sid, GLOB.data_core.stalkers)
	var/obj/item/stalker_pda/KPK = H.wear_id


	if(!sk)
		say("Активируйте ваш КПК.")
		updateUsrDialog()
		return

	if(!KPK.owner || (KPK.owner != H))
		say("Нет доступа.")
		updateUsrDialog()
		return

	if(href_list["choice"])
		if(href_list["choice"] == "take")
			SellItems()

	if(href_list["purchase"])
		var/datum/data/stalker_equipment/prize = locate(href_list["purchase"])

		if (!prize)
			updateUsrDialog()
			return

		if(prize.amount <= 0)
			say("[prize.name] Товар закончился.")
			updateUsrDialog()
			return

		if(prize.cost > sk.fields["money"])
			say("У вас недостаточно денег для покупки [prize.name].")
			updateUsrDialog()
			return

		sk.fields["money"] -= prize.cost
		balance = sk.fields["money"]
		//PoolOrNew(prize.equipment_path, itemloc2)
		say("Успешно купленно [prize.name] За [prize.cost].")
		prize.amount -= 1
		new prize.equipment_path(itemloc2)

	if(href_list["basement_toggle"])
		door_device.pulsed()

	//updateUsrDialog()
	return


/obj/machinery/stalker/sidormat/proc/SellItems()
	var/mob/living/carbon/human/H = usr
	if(!istype(H.wear_id, /obj/item/stalker_pda))
		say("Наденьте ваш КПК.")
		return

	var/datum/data/record/sk = find_record("sid", H.sid, GLOB.data_core.stalkers)
	var/obj/item/stalker_pda/KPK = H.wear_id

	if(!sk)
		say("Активируйте ваш КПК.")
		return

	if(KPK.sid != H.sid)
		say("Нет доступа.")
		return

	var/list/atom/movable/ontable = GetItemsOnTable()
	var/total_cost = GetOnTableCost(ontable)

	if(total_cost < 100)
		say("Хабар не был продан.")

	for(var/atom/movable/I in ontable)
		if(I.loc != itemloc)
			continue

		sk.fields["money"] += GetCost(I)
		balance = sk.fields["money"]

		say("[I] продан за [GetCost(I)].")

		qdel(I)

		CHECK_TICK

	if(total_cost)
		say("<b>Хабыр был успешно продан за [total_cost].</b>")

	updateUsrDialog()
	return

/obj/machinery/stalker/sidormat/proc/GetItemsOnTable()
	var/list/ontable = list()
	for(var/atom/movable/AM in itemloc)
		if(GetCost(AM) <= 0)
			continue

		if(istype(AM, /obj/item/clothing))
			var/obj/item/clothing/C = AM
			if((C.durability / initial(C.durability)) * 100 < 80)
				say("[AM] слишком сломан для продажи.")
				continue

		if(istype(AM, /obj/item/storage/backpack) && AM.contents.len)
			say("Опустошите [AM] перед продажей.")
			continue

		if(istype(AM, /obj/item/ammo_box))
			var/obj/item/ammo_box/AB = AM
			if(AB.stored_ammo.len < AB.max_ammo)
				say("Заполните [AB] перед продажей.")
				continue

		//if(istype(AM, /obj/item/reagent_containers))
		//	say("[AM] can't be sold!")
		//	continue

		ontable += AM

	return ontable

/obj/machinery/stalker/sidormat/proc/GetOnTableCost(var/list/ontable)
	//var/list/ontable = GetItemsOnTable()
	var/total_cost = 0

	for(var/atom/movable/item_on_table in ontable)
		var/cost = GetCost(item_on_table)
		if(cost)
			total_cost += cost
	return total_cost

/obj/machinery/stalker/sidormat/proc/GetCost(var/obj/item/I)
	for(var/datum/data/stalker_equipment/se in GLOB.real_sidormat_items)
		if(I.type == se.equipment_path)
			return se.GetCost(I)
	return 0

/obj/machinery/stalker/sidormat/ex_act(severity, target)
	return

/obj/machinery/stalker/sidormat/proc/GetIconForProduct(datum/data/stalker_equipment/P)
	if(GLOB.sidor_cache[P.equipment_path])
		return GLOB.sidor_cache[P.equipment_path]

	var/product = new P.equipment_path()
	GLOB.sidor_cache[P.equipment_path] = icon2base64(getFlatIcon(product, no_anim = TRUE))
	qdel(product)
	return GLOB.sidor_cache[P.equipment_path]
