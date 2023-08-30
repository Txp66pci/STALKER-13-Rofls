

///////////////////////////// Pistols //////////////////////////////////////////
/obj/item/gun/ballistic/automatic/pistol
	modifications = list("barrel_pistol" = 0, "frame_pistol" = 0, "grip_pistol" = 0)

/obj/item/gun/ballistic/automatic/pistol/pm   // Макаров
	name = "ПМм"
	desc = "Это советское наследие является самым распространенным пистолетом в Зоне и одним из лучших компактных пистолетов самообороны. Он небольшой, высоконадежный, прост в использовании и обслуживании. Он также страдает от нескольких недостатков, в том числе от малой дальности, низкой точности стрельбы и плохой останавливающей способности, а также проигрывает современным пистолетам в своем классе по весу и размеру магазина."
	icon_state = "pm"
	w_class = 2
	fire_sound = 'stalker/sound/weapons/pm_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18pm
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	durability = 60
	spread = 10
	recoil = 0.2
	damagelose = 0.2
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/tt   // ТТ
	name = "ТТ-33"
	desc = "Старый советский пистолет, сделанный под аналогичные старые советские боеприпасы. Чрезвычайно распространён из-за большого количества этих пистолетов, оставленных в армейских заначниках СССР в окрестностях Припяти. Не очень мощный, но пули достаточно хорошо пробивают броню."
	icon_state = "tt"
	w_class = 2
	fire_sound = 'stalker/sound/weapons/tt33_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/tt
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	fire_delay = 0.5
	durability = 50
	spread = 8
	recoil = 0.15
	damagelose = 0.1
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/sip  // Sig-Sauer
	name = "SIG Sauer P220"
	desc = "Единственная оставшаяся серийная модель всемирно известного пистолета, это оружие заслужило репутацию благодаря своей превосходной эргономике и точности, и, хотя его магазин относительно небольшой, он выигрывает от мощных боеприпасов и механизма, который функционирует как швейцарские часы. Некоторые считают, что П220 является лучшим серийным пистолетом калибра.45 ACP, и у него, безусловно, есть последователи среди опытных сталкеров и наемников."
	icon_state = "sip"
	w_class = 2
	fire_sound = 'stalker/sound/weapons/sig220_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sc45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	durability = 85
	spread = 6
	recoil = 0.4
	damagelose = 0.2
	draw_sound = 'stalker/sound/weapons/draw/sig220_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/cora  // Colt1911A
	name = "Кольт M1911"
	desc = "Усовершенствованная версия классического автоматического пистолета, с честью прошедшая все крупные вооруженные конфликты 20 века и уверенно вошедшая в новое тысячелетие. Выпускается десятками, если не сотнями производителей вооружений по всему миру как в стандартной, так и в модифицированной конфигурациях. Единственный недостаток оружия, его посредственная емкость магазина, в значительной степени компенсируется сильными боеприпасами, которые оно использует."
	icon_state = "cora"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/colt1911_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sc45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 8
	recoil = 0.5
	durability = 100
	damagelose = 0.15
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/marta  // Beretta92FS
	name = "Beretta 92FS"
	desc = "Беретта M9 пользуется репутацией относительно надежного, хотя и несколько громоздкого оружия, во всем мире. На вооружении вооруженных сил и полиции за океаном, а также различных военных и правоохранительных организаций по всему миру. Пистолет одинаково популярен среди представителей преступного мира, благодаря своей мощной емкости патрона и магазина. Беретты, найденные в Зоне, обычно стары, вероятно, из вышедшего на пенсию запаса."
	icon_state = "marta"
	item_state = "marta"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/marta_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19marta
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 7
	recoil = 0.25
	damagelose = 0.2
	durability = 75
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/fort12  // Фора12
	name = "Фора-12"
	desc = "Пистолет украинского производства, преимущественно используемый правоохранительными органами. Обеспечивает более высокую точность, лучшую эргономику и имеет больший магазин, чем ПМ. Эти пистолеты попадают в Зону в большом количестве благодаря продаже бракованного оружия, которое страдает от технических просчетов в ранних моделях дизайна. Несмотря на это, пистолет пользуется спросом у сталкеров благодаря хорошим боевым характеристикам."
	icon_state = "fort12"
	fire_sound = 'stalker/sound/weapons/fort_shot.ogg'
	w_class = 2
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18fort
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	spread = 8
	recoil = 0.25
	durability = 50
	damagelose = 0.2
	draw_sound = 'stalker/sound/weapons/draw/fort_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/fort12/unique  // Фора12 - расширенный магазин
	desc = "Экспериментальный прототип пистолета «Форт». В единственном экземпляре."
	unique = 1
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18fort_u

/obj/item/gun/ballistic/automatic/pistol/pb1s  //ПБ1С
	name = "ПБ1с"
	desc = "Этот пистолет был разработан во второй половине 20 века на базе ПМ для использования спецподразделениями и разведывательными подразделениями. Передняя часть ствола пистолета прикрыта встроенным глушителем, а затворный механизм короткий, что предотвращает расположение внутри него пружины обратного хода, поэтому он расположен в рукоятке оружия. Морально устаревшее, оружие по-прежнему эффективно в умелых руках."
	icon_state = "pb1s"
	w_class = 2
	fire_sound = 'stalker/sound/weapons/pb_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18pm
	force = 10
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	spread = 10
	recoil = 0.25
	durability = 50
	damagelose = 0.2
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/usp_match  // USP Match
	name = "H&K USP Match"
	desc = "Безупречная надежность и долговечность в сочетании с превосходной точностью являются главными примечательными особенностями этого оружия. К его незначительным недостаткам можно отнести значительные размеры, относительно высокий центр тяжести и массивный затвор, которые затрудняют его сокрытие, но не перевешивают положительные черты оружия. Оружие особенно популярно среди ветеранов Зоны."
	icon_state = "usp-match"
	w_class = 2
	mag_type = /obj/item/ammo_box/magazine/stalker/usp45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 8
	recoil = 0.35
	durability = 60
	damagelose = 0.25
	draw_sound = 'stalker/sound/weapons/draw/usp_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/desert  // Desert Eagle
	name = "Desert Eagle"
	desc = "Чрезвычайно мощное оружие, показанное во многих голливудских фильмах и популяризированное преступниками. Поистине машина для убийства в ближнм бою."
	icon_state = "desert"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/desert_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/desert
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	spread = 8
	recoil = 0.65
	durability = 50
	damagelose = 0.15
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/usp_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/revolver/anaconda // Colt Anaconda .44
	name = "Кольт Анаконда .44"
	desc = "Чувствуешь себя удачливо, гопник?"
	icon_state = "anaconda"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/desert_shot.ogg'
	fire_delay = 1.5
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/anaconda
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	spread = 6
	recoil = 1
	durability = 500
	damagelose = 0.1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/usp_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/obrez_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/obrez_open.ogg'

/obj/item/gun/ballistic/revolver/c500revolver // .500 Bull
	name = "Smith & Wesson Model 500"
	desc = "Пятизарядный револьвер барабанного типа, разработанный оружейной компанией Smith & Wesson в 2003 году под патрон S&W Magnum калибра .500. Предназначен для охоты на крупную дичь, например на медведя гризли."
	icon_state = "c500revolver"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/desert_shot.ogg'
	fire_delay = 2
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/c500revolver
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	spread = 6
	recoil = 6
	durability = 500
	damagelose = 0
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/usp_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/obrez_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/obrez_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/luger  // Luger P08 pistol
	name = "Luger P08"
	desc = "Пистолеты Luger P08 представляют собой полуавтоматический пистолеты с тумблерной фиксацией отдачи. Он широко использовался в других странах в качестве военного пистолета и полицейскими силами с начала 20-го века."
	icon_state = "luger"
	item_state = "marta-silenced"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/luger_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19luger
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 7
	recoil = 0.25
	damagelose = 0.2
	durability = 75
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/groza_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/luger_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/walther  // Walther P38
	name = "Walther P38"
	desc = "Вальтер П38 — полуавтоматический пистолет использовавшийся в качестве служебного пистолета вермахта в начале Второй мировой войны. Был передовым полуавтоматическим пистолетом, в котором были представлены технические особенности, которые до сих пор используются в современных коммерческих и военных полуавтоматических пистолетах, таких как Беррета92ФС. Этот пистолет видел лучшие дни."
	icon_state = "waltherp38"
	item_state = "marta-silenced"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/pistol_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19waltherp38
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 7
	recoil = 0.25
	damagelose = 0.2
	durability = 75
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/berettam38_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/val_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/aps  // Stechkin APS
	name = "Стечкин"
	desc = "Автоматический пистолет АПС или стечкин был разработан Советским Союзом и принят на вооружение в 1951 году для использования артиллерийскими и минометными расчетами, танковыми экипажами и авиационным персоналом, где громоздкая штурмовая винтовка считалась ненужной. Позже его предпочли спецназовцы, которым требовалось более эффективное оружие, чем ПМ. Он участвовал в ряде войн, таких как война во Вьетнаме, война на Донбассе и гражданская война в Сирии... и в настоящее время проживает в Зоне."
	icon_state = "aps"
	item_state = "cora"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/pm_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18aps
	force = 10
	automatic = 1
	burst_size = 5
	fire_delay = 1.7
	can_suppress = 1
	can_unsuppress = 1
	spread = 12
	recoil = 5
	damagelose = 0.2
	durability = 75
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/pernach  // OTs-33 Pernach
	name = "ОЦ-33 Пернач"
	desc = "Пернач — пистолет с селективным огнем со свободным затвором, предназначенный для замены АПС Стечкина в различных специальных подразделениях ОМОНа в российской полиции, Министерстве внутренних дел России и других военизированных формированиях."
	icon_state = "pernach"
	item_state = "cora"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/pm_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18aps
	force = 10
	automatic = 1
	burst_size = 5
	fire_delay = 1.5
	can_suppress = 1
	can_unsuppress = 1
	spread = 4
	recoil = 3.5
	damagelose = 0.2
	durability = 75
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/mauser  // Mauser C96
	name = "Маузер C96"
	desc = "Маузер C96 — полуавтоматический пистолет, который первоначально выпускался немецким производителем оружия Mauser с 1896 по 1937 год. Отличительными характеристиками C96 являются коробчатый магазин перед спусковым крючком, длинный ствол и рукоятка, по форме напоминающая рукоятку метлы. Похоже, он находится в чудесном состоянии."
	icon_state = "mauser"
	item_state = "mauser"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/mauser_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/mauser
	force = 10
	vary_fire_sound = 1
	can_suppress = 1
	can_unsuppress = 1
	burst_size = 3
	fire_delay = 1
	spread = 10
	recoil = 3
	damagelose = 0.2
	durability = 75
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mauser_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mauser_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/glock  // Glock 17
	name = "Glock 17"
	desc = "Глок 17 — оригинальная модель Парабеллума калибра 9×19 мм со стандартным магазином на 17 патронов, представленная в 1982 году. Это полуавтоматический пистолет с полимерной рамкой и короткой отдачей и запираемым затвором, разработанный и произведенный австрийским производителем Glock Ges.m.b.H. Этот, похоже, видел лучшие дни."
	icon_state = "glock"
	item_state = "marta"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/pistol_shot2.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19glock
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	durability = 85
	spread = 6
	recoil = 0.4
	damagelose = 0.2
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/tpc301_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/tt30   // TT-30
	name = "ТТ-30"
	desc = "Старый советский пистолет, сделанный под аналогичные старые советские боеприпасы. Чрезвычайно распространён из-за большого количества этих пистолетов, оставленных в армейских заначниках СССР в окрестностях Припяти. Не очень мощный, но пули достаточно хорошо пробивают броню."
	icon_state = "tt30"
	item_state = "sip"
	w_class = 2
	fire_sound = 'stalker/sound/weapons/tt33_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/tt
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	fire_delay = 0.5
	durability = 50
	spread = 8
	recoil = 0.15
	damagelose = 0.1
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/fiveseven // Five Seven
	name = "FN Five Seven"
	desc = "Пистолет Five Seven был разработан компанией ФН (Бельгия) в качестве дополнительного оружия для пистолета-пулемета P90. P90 и 5-7 используют одни и те же боеприпасы, патрон 5,7x28 мм."
	icon_state = "fiveseven"
	fire_sound = 'stalker/sound/weapons/fort_shot.ogg'
	w_class = 2
	mag_type = /obj/item/ammo_box/magazine/stalker/m57x28fiveseven
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	spread = 7
	recoil = 0.50
	durability = 100
	damagelose = 0.2
	draw_sound = 'stalker/sound/weapons/draw/fort_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/waltherpp  // Walther PP
	name = "Walther PP"
	desc = "Вальтер ПП (Polizeipistole, или полицейский пистолет) — полуавтоматический пистолет, который был разработан компанией Carl Walther GmbH и был одним из первых успешных полуавтоматических пистолетов двойного действия. Конструкция вдохновила на создание других пистолетов, в том числе советского Макарова. Этот выглядит так, как будто он в хорошей форме!"
	icon_state = "waltherpp"
	item_state = "marta"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/pistol_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19waltherpp
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 7
	recoil = 0.25
	damagelose = 0.2
	durability = 75
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/berettam38_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/val_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/cz83  // CZ 83
	name = "Cz 82"
	desc = "Cz 82 появился благодаря принятию на вооружение армии и правоохранительных служб Чехословакии, в 1982 году,"
	icon_state = "cz83"
	item_state = "marta"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/pistol_shot2.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18cz83
	force = 10
	durability = 85
	spread = 3
	recoil = 0.4
	damagelose = 0.2
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/tpc301_open.ogg'

/obj/item/gun/ballistic/automatic/pistol/silvermarta  // Silver Beretta92FS
	name = "Серебрянная Beretta 92FS"
	desc = "Пистолеты БереттаМ9 пользуются во всем мире репутацией относительно надежного, хотя и несколько громоздкого оружия. Состоит на вооружении вооруженных сил и полиции за океаном, а также различных военных и правоохранительных организаций по всему миру. Пистолет одинаково популярен среди представителей преступного мира, благодаря своей мощной емкости патрона и магазина. Беретты, найденные в Зоне, обычно стары, вероятно, из старых запасов."
	icon_state = "martasilver"
	item_state = "marta"
	w_class = 3
	fire_sound = 'stalker/sound/weapons/marta_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19marta
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 7
	recoil = 0.25
	damagelose = 0.2
	durability = 75
	draw_sound = 'stalker/sound/weapons/draw/pm_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/pm_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/pm_open.ogg'


///////////////////////////// ARs,SMGs //////////////////////////////////////////

/obj/item/gun/ballistic
	var/image/mag_overlay 			= null
	var/image/mag_overlay_inhands 	= null
	var/image/silencer_overlay 		= null
	var/image/scope_overlay 		= null
	var/image/colored_overlay 		= null
	var/colored 					= null

/obj/item/gun/ballistic/New()
	..()
	if(!istype(src, /obj/item/gun/ballistic/automatic/pistol))
		mag_overlay = image('stalker/icons/projectile_overlays32x32.dmi', "[initial(icon_state)]-mag", layer = FLOAT_LAYER)

	if(can_suppress)
		silencer_overlay = image('stalker/icons/projectile_overlays48x48.dmi', "[initial(icon_state)]-silencer", layer = FLOAT_LAYER)

	if(can_scope)
		scope_overlay = image('stalker/icons/projectile_overlays32x32.dmi', "[initial(icon_state)]-scope", layer = FLOAT_LAYER)

	if(colored)
		colored_overlay = image('stalker/icons/projectile_overlays32x32.dmi', "[initial(icon_state)]-[colored]", layer = FLOAT_LAYER)
		overlays += colored_overlay

	update_icon()

/obj/item/gun/ballistic/update_icon()
	..()
	//overlays.Cut()

	if(colored)
		overlays += colored_overlay

	if(magazine && mag_overlay)
		overlays += mag_overlay

	if(suppressed && silencer_overlay)
		overlays += silencer_overlay

	if(zoomable && scope_overlay)
		overlays += scope_overlay

	if(unique)
		overlays += image('stalker/icons/projectile_overlays32x32.dmi', "unique", layer = FLOAT_LAYER)

	if(istype(src, /obj/item/gun/ballistic/automatic/pistol))
		icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	else
		item_state = "[initial(item_state)][magazine ? "" : "-e"]"	//Пока не разберусь с оверлеями на мобах, будет так

	return
/*
/obj/item/gun/ballistic/automatic/worn_overlays(var/isinhands = TRUE)
	. = list()
	if(!isinhands)
		if(magazine )
			overlays += mag_overlay

		if(suppressed )
			overlays += silencer_overlay
        . += image(icon = 'icons/effects/effects.dmi', icon_state = "[shield_state]")
*/

/obj/item/gun/ballistic/automatic
	modifications = list("barrel_automatic" = 0, "frame_automatic" = 0, "grip_automatic" = 0, "compensator_automatic" = 0)

/obj/item/gun/ballistic/automatic/sten  // Sten MK II
	name = "STEN МК II"
	desc = "Стэн — семейство британских пистолетов-пулемётов под патрон 9×19 мм, которые широко использовались британскими войсками и войсками стран Содружества во время Второй мировой войны и Корейской войны. Они имели простую конструкцию и очень низкую стоимость производства, что делало их эффективным оружием повстанцев, и они продолжают использоваться по сей день нерегулярными вооруженными силами."
	icon_state = "sten"
	item_state = "sterling"
	fire_sound = 'stalker/sound/weapons/mac10_shoot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sten
	can_suppress = 1
	burst_size = 4
	fire_delay = 1.8
	slot_flags = ITEM_SLOT_BACK
	durability = 80
	w_class = 3
	spread = 10
	recoil = 1.4
	damagelose = 0.05
	can_scope = 0
	automatic = 1
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'


/obj/item/gun/ballistic/automatic/sterling  // Sterling Submachine Gun
	name = "ПП Sterling"
	desc = "Пистолет-пулемёт Стерлинг — британский пистолет-пулемёт. Он был испытан британской армией в 1944-1945 годах в качестве замены Стена, но не начал заменять его до 1953 года."
	icon_state = "sterling"
	item_state = "sterling"
	fire_sound = 'stalker/sound/weapons/mac10_shoot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sterling
	can_suppress = 1
	burst_size = 4
	fire_delay = 1.8
	slot_flags = ITEM_SLOT_BACK
	durability = 80
	w_class = 3
	spread = 8
	recoil = 1.7
	damagelose = 0.05
	can_scope = 0
	automatic = 1
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'

/obj/item/gun/ballistic/automatic/m3a1  // M3A1 Grease Gun
	name = "M3A1 Grease Gun"
	desc = "M3 — американский пистолет-пулемёт 45-го калибра, принятый на вооружение армии США 12 декабря 1942 года как пистолет-пулемёт США. 45, М3. M3 выпускался под тот же патрон.45 ACP, которым стрелял пистолет-пулемет Томпсона, но был дешевле в производстве и легче, хотя, вопреки распространенному мнению, был менее точным."
	icon_state = "m3a1"
	item_state = "greasegun"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m3a1
	fire_sound = 'stalker/sound/weapons/abakan_shoot.ogg'
	can_suppress = 0
	burst_size = 5
	fire_delay = 2.5
	pin = /obj/item/firing_pin
	durability = 200
	w_class = 4
	spread = 4
	recoil = 1
	damagelose = 0.2
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/abakan_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/abakan_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/abakan_open.ogg'

/obj/item/gun/ballistic/automatic/reising  // Reising Model 55
	name = "Reising Модель 55"
	desc = "Пистолет-пулемет.45 Reising был разработан и запатентован Юджином Райзингом в 1940 году. Во время Второй мировой войны было заказано более 100 000 Reisings, которые первоначально использовались военно-морским флотом США, корпусом морской пехоты и береговой охраной США, хотя некоторые из них были отправлены канадским, советским и другим союзным силам для борьбы с державами Оси. Теперь это, очевидно, здесь, в Зоне."
	icon_state = "reising"
	item_state = "mat49"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/reising
	fire_sound = 'stalker/sound/weapons/abakan_shoot.ogg'
	can_suppress = 0
	burst_size = 5
	fire_delay = 2.5
	pin = /obj/item/firing_pin
	durability = 200
	w_class = 4
	spread = 4
	recoil = 1
	damagelose = 0.2
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/abakan_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/abakan_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/abakan_open.ogg'

/obj/item/gun/ballistic/automatic/m76  // Smith & Wesson M76
	name = "Smith & Wesson M76"
	desc = "Пистолет-пулемет Smith & Wesson M76 выпускался компанией Smith & Wesson с 1967 по 1974 год. Он использовался в таких конфликтах, как война во Вьетнаме."
	icon_state = "m76"
	item_state = "mat49"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19m76
	fire_sound = 'stalker/sound/weapons/abakan_shoot.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 2
	pin = /obj/item/firing_pin
	durability = 200
	w_class = 4
	spread = 4
	recoil = 1
	damagelose = 0.2
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/abakan_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/abakan_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/abakan_open.ogg'

/obj/item/gun/ballistic/automatic/mp40  // MP-40
	name = "MP-40"
	desc = "Пистолет-пулемёт под патрон 9×19мм Парабеллум. Он был разработан в нацистской Германии и широко использовался державами Оси во время Второй мировой войны."
	icon_state = "mp40"
	item_state = "mp40"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/mp40
	fire_sound = 'stalker/sound/weapons/tpc301_shoot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1.4
	pin = /obj/item/firing_pin
	durability = 80
	w_class = 4
	spread = 6.5
	recoil = 1
	damagelose = 0.2
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/tpc301_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/tpc301_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/tpc301_open.ogg'

/obj/item/gun/ballistic/automatic/mp3008  // MP 3008
	name = "MP-3008"
	desc = "Последний немецкий пистолет-пулемёт, выпущенный в конце Второй мировой войны в начале 1945 года. После войны он был распространен по всему миру для прокси-конфликтов."
	icon_state = "mp3008"
	item_state = "mat49"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/mp40
	fire_sound = 'stalker/sound/weapons/tpc301_shoot.ogg'
	can_suppress = 1
	burst_size = 4
	fire_delay = 2
	pin = /obj/item/firing_pin
	durability = 80
	w_class = 4
	spread = 8.5
	recoil = 1
	damagelose = 0.2
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/tpc301_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/tpc301_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/tpc301_open.ogg'

/obj/item/gun/ballistic/automatic/pps43  // PPS-43
	name = "ППШ-43"
	desc = "Советский пистолет-пулемёт под патрон 7,62×25 мм Токарева, разработанный Алексеем Судаевым в качестве недорогого средства индивидуальной обороны для разведывательных подразделений, экипажей транспортных средств и вспомогательного персонала. Он был очень экономичным и простым в изготовлении благодаря своей эффективной и простой, в основном конструкции из листового металла. Он производился с 1942 по 1946 год, и они дали выпуск примерно в два миллиона."
	icon_state = "pps43"
	item_state = "pps"
	fire_sound = 'stalker/sound/weapons/ppsh_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/pps43
	can_suppress = 0
	slowdown = 0.15
	burst_size = 5
	fire_delay = 1.5
	slot_flags = ITEM_SLOT_BACK
	durability = 50
	w_class = 4
	spread = 4
	recoil = 0.35
	damagelose = 0.25
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'

/obj/item/gun/ballistic/automatic/bizon  // PP-19 Bizon
	name = "ПП-19 Бизон"
	desc = "«Бизон» был разработан по заказу МВД России и в первую очередь предназначен для подразделений по борьбе с терроризмом и правоохранительных органов, нуждающихся в быстром и точном ведении огня на близких дистанциях. «Бизон» выдается вооруженным подразделениям оперативного реагирования Федеральной службы безопасности и Министерства юстиции России."
	icon_state = "bizon"
	item_state = "vz58"
	fire_sound = 'stalker/sound/weapons/ppsh_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18bizon
	can_suppress = 0
	slowdown = 0.15
	burst_size = 3
	fire_delay = 0.8
	slot_flags = ITEM_SLOT_BACK
	durability = 50
	w_class = 4
	spread = 4
	recoil = 0.35
	damagelose = 0.25
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'

/obj/item/gun/ballistic/automatic/skorpion  // Skorpion
	name = "Skorpion Vz. 61"
	desc = "Чехословацкий пистолет-пулемет, разработанный в 1959 году Мирославом Рыбой. Несмотря на то, что оно было разработано для использования в силах безопасности, оружие также было принято на вооружение чехословацкой армии в качестве личного оружия для армейского персонала более низкого ранга, водителей транспортных средств, персонала бронетехники и спецназа."
	icon_state = "skorpion"
	item_state = "arg"
	fire_sound = 'stalker/sound/weapons/fort_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19skorpion
	can_suppress = 0
	burst_size = 3
	fire_delay = 1
	slot_flags = ITEM_SLOT_BELT
	durability = 80
	w_class = 3
	spread = 7
	recoil = 0.15
	damagelose = 0.25
	can_scope = 0
	automatic = 1
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'

/obj/item/gun/ballistic/automatic/mat49  // MAT-49
	name = "MAT-49"
	desc = "MAT-49 был пистолетом-пулеметом, который был разработан французским оружейным заводом для использования французской армией и впервые был произведен в 1949 году."
	icon_state = "mat49"
	item_state = "mat49"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19mat49
	fire_sound = 'stalker/sound/weapons/abakan_shoot.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/firing_pin
	durability = 200
	w_class = 4
	spread = 4
	recoil = 1
	damagelose = 0.2
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/abakan_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/abakan_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/abakan_open.ogg'

/obj/item/gun/ballistic/automatic/mac10  // MAC10
	name = "MAC10 ingram"
	desc = "Американский пистолет-пулемет, разработанный в 70-х годах прошлого века, отличался высокой скорострельностью и надежностью. Патрон 9х19."
	icon_state = "mac10"
	item_state = "mac10"
	fire_sound = 'stalker/sound/weapons/mac10_shoot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/mac10
	can_suppress = 1
	burst_size = 4
	fire_delay = 0.8
	slot_flags = ITEM_SLOT_BELT
	durability = 80
	w_class = 3
	spread = 25
	recoil = 0.8
	damagelose = 0.25
	can_scope = 0
	automatic = 1
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'

/obj/item/gun/ballistic/rifle/semiautobolt/sks // SKS
	name = "СКС"
	desc = "СКС — советский полуавтоматический карабин под патрон 7,62х39 мм, разработанный в 1943 году Сергеем Гавриловичем Симоновым. СКС-45 производился в Тульском арсенале с 1949 по 1958 год и в Ижевском арсенале всего в 1953 и 1954 годах, в результате чего общее количество карабинов в Советском Союзе составило около 2,7 миллиона штук. В начале 1950-х годов Советы сняли карабин СКС с фронтовой службы и заменили его АК-47; однако СКС по-прежнему оставался на вооружении в течение десятилетий."
	icon_state = "sks"
	item_state = "sks"
	fire_sound = 'stalker/sound/weapons/sks_shot.ogg'
	durability = 200
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/semiautobolt/sks
	can_suppress = 0
	slowdown = 0.15
	fire_delay = 1.2
	durability = 150
	force = 15
	recoil = 0.5
	w_class = 4
	burst_size = 1
	randomspread = 0
	spread = 2
	damagelose = 0.1
	can_scope = 1
	load_sound = 'stalker/sound/weapons/load/bolt_load.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'

/obj/item/gun/ballistic/automatic/ak74  // AK-74
	name = "AK 74"
	desc = "Это оружие, разработанное в 1974 году, ознаменовало принятие на вооружение странами Варшавского договора малокалиберных и малоимпульсных снарядов. Потомок самой популярной штурмовой винтовки в мире, АК-74 имеет еще больший дульный тормоз, что приводит к уменьшению уже управляемой отдачи. Это способствует лучшей точности и кучности, особенно при стрельбе быстрыми одиночными выстрелами или очередями. Как и прежде, винтовка очень проста и надежна."
	icon_state = "ak74"
	item_state = "ak74"
	colored = 0//"normal"
	slot_flags = ITEM_SLOT_BACK//|SLOT_BELT
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'stalker/sound/weapons/ak74_shot.ogg'
	can_suppress = 1
	can_unsuppress = 1
	slowdown = 0.15
	burst_size = 3
	fire_delay = 1.6
	pin = /obj/item/firing_pin
	durability = 120
	w_class = 4
	spread = 6
	recoil = 0.5
	damagelose = 0.25
	can_scope = 1
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/ak74_draw.ogg'
// Work in Progress
/*	var/overlay_state
	var/overlay_list = list(
		"classic",
		"camo",
		"black",
		"blackout"
		)

/obj/item/gun/ballistic/automatic/ak74/Initialize()
	. = ..()
	if(!overlay_state)
		overlay_state = pick(overlay_list)
	update_icon()

	*/

/obj/item/gun/ballistic/automatic/ak74/camo
	name = "AK 74"
	desc = "Это оружие, разработанное в 1974 году, ознаменовало принятие на вооружение странами Варшавского договора малокалиберных и малоимпульсных снарядов. Потомок самой популярной штурмовой винтовки в мире, АК-74 имеет еще больший дульный тормоз, что приводит к уменьшению уже управляемой отдачи. Это способствует лучшей точности и кучности, особенно при стрельбе быстрыми одиночными выстрелами или очередями. Как и прежде, винтовка очень проста и надежна. This one has camo paint."
	icon_state = "ak74_camo"
	item_state = "ak74_camo"


/obj/item/gun/ballistic/automatic/ak74/black
	name = "AK 74"
	desc = "Это оружие, разработанное в 1974 году, ознаменовало принятие на вооружение странами Варшавского договора малокалиберных и малоимпульсных снарядов. Потомок самой популярной штурмовой винтовки в мире, АК-74 имеет еще больший дульный тормоз, что приводит к уменьшению уже управляемой отдачи. Это способствует лучшей точности и кучности, особенно при стрельбе быстрыми одиночными выстрелами или очередями. Как и прежде, винтовка очень проста и надежна. Металлические части черные."
	icon_state = "ak74_black"
	item_state = "ak74_black"



/obj/item/gun/ballistic/automatic/ak74/blackout
	name = "AK 74"
	desc = "Это оружие, разработанное в 1974 году, ознаменовало принятие на вооружение странами Варшавского договора малокалиберных и малоимпульсных снарядов. Потомок самой популярной штурмовой винтовки в мире, АК-74 имеет еще больший дульный тормоз, что приводит к уменьшению уже управляемой отдачи. Это способствует лучшей точности и кучности, особенно при стрельбе быстрыми одиночными выстрелами или очередями. Как и прежде, винтовка очень проста и надежна. Вся пушка черная."
	icon_state = "ak74_blackout"
	item_state = "ak74_blackout"


/obj/item/gun/ballistic/automatic/ak74/unfurnished
	name = "AK 74"
	desc = "Это оружие, разработанное в 1974 году, ознаменовало принятие на вооружение странами Варшавского договора малокалиберных и малоимпульсных снарядов. Потомок самой популярной штурмовой винтовки в мире, АК-74 имеет еще больший дульный тормоз, что приводит к уменьшению уже управляемой отдачи. Это способствует лучшей точности и кучности, особенно при стрельбе быстрыми одиночными выстрелами или очередями. Как и прежде, винтовка очень проста и надежна. Этот лишен деревяннго стока."
	icon_state = "ak74_furnitureless"
	item_state = "ak74_furnitureless"


/obj/item/gun/ballistic/automatic/aksu74  // АКС74У
	name = "AKС 74У"
	desc = "Несмотря на сходство с пистолетами-пулеметами по габаритам, весу и тактическому назначению, это оружие классифицируется как штурмовая винтовка из-за того, что его внутренний механизм идентичен механизму АК-74. Оружие отличается мобильностью в ближнем бою и высокой бронепробиваемостью, при этом его недостатками являются малая эффективная дальность, несмотря на относительно большую дальность полета пули, склонность к перегреву и высокая склонность к рикошету."
	icon_state = "aksu74"
	item_state = "aksu74"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'stalker/sound/weapons/ak74u_shot.ogg'
	can_suppress = 1
	slowdown = 0.15
	burst_size = 3
	fire_delay = 1.5
	pin = /obj/item/firing_pin
	durability = 100
	w_class = 4
	spread = 9
	recoil = 0.7
	damagelose = 0.5
	can_scope = 1
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/ak74u_draw.ogg'

/obj/item/gun/ballistic/automatic/strelok_ak  // АКС74У
	name = "Скорострельный АК 74С"
	desc = "Похоже, эта пушка претерпела невероятные изменения. Он имеет меньшую отдачу, более высокую скорострельность и лучшую долговечность."
	icon = 'stalker/icons/weapons.dmi'
	icon_state = "ak74-green"
	item_state = "ak74-green"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'stalker/sound/weapons/ak74u_shot.ogg'
	can_suppress = 1
	slowdown = 0.15
	burst_size = 5
	fire_delay = 1
	pin = /obj/item/firing_pin
	durability = 200
	w_class = 4
	spread = 9
	recoil = 0.3
	damagelose = 0.5
	can_scope = 1
	automatic = 1
	unique = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/ak74u_draw.ogg'

/obj/item/gun/ballistic/automatic/fnfal  // FN FAL
	name = "FN FAL"
	desc = "Во время холодной войны ФАЛ был принят многими странами Организации Североатлантического договора, за исключением Соединенных Штатов. Это одна из наиболее широко используемых винтовок в истории, используемая более чем в 90 странах. Из-за его распространенности и широкого использования среди военных многих стран НАТО и первого мира во время холодной войны он получил титул «Правая рука свободного мира». Этот настроен на двойной выстрел."
	icon_state = "fnfal"
	item_state = "fnfal"
	colored = 0//"normal"
	slot_flags = ITEM_SLOT_BACK//|SLOT_BELT
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/fnfal
	fire_sound = 'stalker/sound/weapons/berettam38_shot.ogg'
	can_suppress = 1
	can_unsuppress = 1
	slowdown = 0.15
	burst_size = 2
	fire_delay = 1.6
	pin = /obj/item/firing_pin
	durability = 120
	w_class = 4
	spread = 4
	recoil = 1
	damagelose = 0.25
	can_scope = 1
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/ak74_draw.ogg'

/obj/item/gun/ballistic/automatic/woodfnfal  // FN FAL with wooden furniture
	name = "FN FAL"
	desc = "Во время холодной войны ФАЛ был принят многими странами Организации Североатлантического договора, за исключением Соединенных Штатов. Это одна из наиболее широко используемых винтовок в истории, используемая более чем в 90 странах. Из-за его распространенности и широкого использования среди военных многих стран НАТО и первого мира во время холодной войны он получил титул «Правая рука свободного мира». Этот настроен на двойное нажатие. Эта версия имеет древесину в корпусе."
	icon_state = "fnfalwood"
	item_state = "fnfalwood"
	colored = 0//"normal"
	slot_flags = ITEM_SLOT_BACK//|SLOT_BELT
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/fnfal
	fire_sound = 'stalker/sound/weapons/berettam38_shot.ogg'
	can_suppress = 1
	can_unsuppress = 1
	slowdown = 0.15
	burst_size = 5
	fire_delay = 1.6
	pin = /obj/item/firing_pin
	durability = 120
	w_class = 4
	spread = 4
	recoil = 1
	damagelose = 0.25
	can_scope = 1
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/ak74_draw.ogg'

/obj/item/gun/ballistic/automatic/famas  // FAMAS
	name = "FAMAS"
	desc = "FAMAS — штурмовая винтовка булл-пап, разработанная и изготовленная во Франции компанией MAS в 1978 году, через год после австрийской АУГ Стейр. ФАМАС известен своей высокой скорострельностью 1,100 выстрелов в минуту и участвовал во многих конфликтах на протяжении всего времени."
	icon_state = "famas"
	item_state = "famas"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'stalker/sound/weapons/il86_shoot.ogg'
	can_suppress = 1
	slowdown = 0.15
	burst_size = 3
	fire_delay = 1.8
	pin = /obj/item/firing_pin
	durability = 75
	w_class = 4
	spread = 4
	recoil = 0.4
	damagelose = 0.1
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/l85_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/groza_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/groza_open.ogg'

/obj/item/gun/ballistic/automatic/aug // Steyr AUG
	name = "Steyr AUG"
	desc = "Австрийская штурмовая винтовка буллпап под патрон 5,56×45 мм НАТО, разработанная в 1960-х годах компанией Steyr-Daimler-Puch, а в настоящее время производимая компанией Steyr Mannlicher GmbH & Co KG. представляет собой оружие булл-пап с селективным огнем и обычным газопоршневым действием, которое стреляет с закрытого затвора. Он разработан как модульная система вооружения, которая может быть быстро сконфигурирована как винтовка, карабин, снайперская винтовка, пистолет-пулемет и даже автоматическое оружие отделения с открытым затвором."
	icon_state = "aug"
	item_state = "aug"
	slot_flags = ITEM_SLOT_BACK
	fire_sound = 'stalker/sound/weapons/sigsg550_shoot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	can_suppress = 0
	slowdown = 0.15
	durability = 125
	burst_size = 4
	fire_delay = 1.3
	w_class = 4
	spread = 3
	recoil = 0.3
	damagelose = 0.2
	zoomable = TRUE
	zoom_amt = 5
	zoom_out_amt = 5
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/fnf2000_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/fnf2000_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/fnf2000_open.ogg'

/obj/item/gun/ballistic/automatic/akm // AKM
	name = "AKM"
	desc = "АКМ — автомат калибра 7,62×39 мм, разработанный Михаилом Калашниковым. Это распространенный модернизированный вариант автомата АК-47, разработанного в 1940-х годах. Принятый на вооружение Советской Армии в 1959 году, АКМ является распространенным вариантом всей серии огнестрельного оружия АК и нашел широкое применение в большинстве государств-членов бывшего Варшавского договора и его африканских и азиатских союзников, а также широко экспортируется и производится во многих других странах."
	icon_state = "akm"
	item_state = "akm"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/akm
	fire_sound = 'stalker/sound/weapons/akm_shot.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1.7
	durability = 150
	w_class = 4
	spread = 12
	slowdown = 0.15
	recoil = 0.9
	damagelose = 0.25
	can_scope = 1
	draw_sound = 'stalker/sound/weapons/draw/ak74u_draw.ogg'

/obj/item/gun/ballistic/automatic/vz58 // vz. 58
	name = "Vz. 58"
	desc = "Vz. 58 — 7,62×39-мм автомат, разработанный и изготовленный в Чехословакии и принятый на вооружение в конце 1950-х годов как 7,62-мм пистолет-пулемёт образца 1958 года."
	icon_state = "vz58"
	item_state = "vz58"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/vz58
	fire_sound = 'stalker/sound/weapons/vz58_shot.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1.5
	durability = 150
	w_class = 4
	spread = 12
	slowdown = 0.10
	recoil = 0.9
	damagelose = 0.25
	can_scope = 0
	draw_sound = 'stalker/sound/weapons/draw/ak74u_draw.ogg'

/obj/item/gun/ballistic/automatic/m16  //M16A1
	name = "M16A1"
	desc = "К концу 1960-х годов винтовка M16 представляла собой полноценное боевое оружие с рядом существенных преимуществ. По сравнению с главным противником М16 на мировой арене – автоматом Калашникова (АКМ), М16 обладал большей кучностью стрельбы одиночными выстрелами, был более комфортным и простым в обращении. С другой стороны, M16 требовал гораздо более тщательного обслуживания и лучшего боекомплекта."
	icon_state = "m16"
	item_state = "m16"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'stalker/sound/weapons/tpc301_shoot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1.7
	durability = 70
	slowdown = 0.15
	w_class = 4
	spread = 5
	recoil = 0.6
	damagelose = 0.2
	can_scope = 0
	draw_sound = 'stalker/sound/weapons/draw/tpc301_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/tpc301_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/tpc301_open.ogg'

/obj/item/gun/ballistic/automatic/m16a4 //M16A4
	name = "M16A4"
	desc = "К концу 1960-х годов винтовка M16 представляла собой полноценное боевое оружие с рядом существенных преимуществ. По сравнению с главным противником М16 на мировой арене – автоматом Калашникова (АКМ), М16 обладал большей кучностью стрельбы одиночными выстрелами, был более комфортным и простым в обращении. С другой стороны, M16 требовал гораздо более тщательного обслуживания и лучшего боекомплекта."
	icon_state = "m16a4"
	item_state = "m16a4"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'stalker/sound/weapons/tpc301_shoot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1.7
	durability = 70
	slowdown = 0.15
	w_class = 4
	spread = 5
	recoil = 0.6
	damagelose = 0.2
	can_scope = 0
	draw_sound = 'stalker/sound/weapons/draw/tpc301_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/tpc301_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/tpc301_open.ogg'

/obj/item/gun/ballistic/automatic/m14  // M14 Carbine
	name = "M14"
	desc = "Карабин M14 был спроектирован и разработан американскими военными во время Второй мировой войны и получил широкое распространение по всему миру. Теперь он в Зоне!"
	icon_state = "m14"
	item_state = "m14"
	fire_sound = 'stalker/sound/weapons/berettam38_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m14
	can_suppress = 0
	slot_flags = ITEM_SLOT_BACK
	durability = 75
	w_class = 4
	spread = 2
	slowdown = 0.15
	recoil = 0.3
	damagelose = 0.15
	can_scope = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/berettam38_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/berettam38_open.ogg'

/obj/item/gun/ballistic/automatic/m4  // M4 Carbine
	name = "Карабин M4"
	desc = "Карабин M4 представляет собой карабин калибра 5,56×45 мм НАТО с воздушным охлаждением, газовым приводом, прямым ударом, магазинным питанием. Он имеет ствол диаметром 14,5 дюйма (370 мм) и телескопический приклад. По сути, это более легкий и короткий вариант штурмовой винтовки M16A2."
	icon_state = "m4"
	item_state = "m4"
	fire_sound = 'stalker/sound/weapons/berettam38_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	can_suppress = 1
	slot_flags = ITEM_SLOT_BACK
	durability = 75
	w_class = 4
	spread = 2
	recoil = 0.3
	slowdown = 0.15
	damagelose = 0.15
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/berettam38_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/berettam38_open.ogg'

/obj/item/gun/ballistic/automatic/ar15 // ArmaLite AR-15
	name = "AR-15"
	desc = "ArmaLite AR-15 была разработана как легкая винтовка и для стрельбы новым высокоскоростным, легким, малокалиберным патроном, позволяющим пехотинцам нести больше боеприпасов."
	icon_state = "ar15"
	item_state = "m16"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'stalker/sound/weapons/tpc301_shoot.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1.7
	durability = 70
	slowdown = 0.15
	w_class = 4
	spread = 5
	recoil = 0.6
	damagelose = 0.2
	can_scope = 0
	draw_sound = 'stalker/sound/weapons/draw/tpc301_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/tpc301_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/tpc301_open.ogg'

/obj/item/gun/ballistic/automatic/scarh // FN SCAR-H
	name = "FN SCAR-H"
	icon_state = "scarh"
	item_state = "scarh"
	desc = "Автоматическая винтовка бельгийской разработки под патрон 7,62x51 мм."
	fire_sound = 'stalker/sound/weapons/berettam38_shot.ogg'
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/scarh
	slowdown = 0.15
	force = 15
	can_suppress = 1
	burst_size = 3
	fire_delay = 2.2
	durability = 70
	slowdown = 0.15
	w_class = 4
	spread = 5
	recoil = 0.6
	damagelose = 0.2
	can_scope = 0
	slot_flags = ITEM_SLOT_BACK

/obj/item/gun/ballistic/automatic/makeshiftak  // Makeshift AK
	name = "Импровизированный АК"
	desc = "А калашнаков из мусорных деталей. Очень ненадежно."
	icon_state = "makeshiftak"
	item_state = "ak74"
	slot_flags = ITEM_SLOT_BACK//|SLOT_BELT
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'stalker/sound/weapons/ak74_shot.ogg'
	slowdown = 0.15
	burst_size = 3
	fire_delay = 1.8
	pin = /obj/item/firing_pin
	durability = 40
	w_class = 4
	spread = 18
	recoil = 3
	randomspread = 6
	damagelose = 0.25
	can_scope = 0
	automatic = 1
	draw_sound = 'stalker/sound/weapons/draw/ak74_draw.ogg'

/obj/item/gun/ballistic/automatic/mp5  // MP5
	name = "MP-5"
	desc = "Этот пистолет-пулемет завоевал популярность во всем мире благодаря своей надежности, простоте использования и точности. В течение последних нескольких десятилетий MP5 состоял на вооружении специальных вооруженных сил и полицейских подразделений по всему миру. Неудивительно, что, наводнив мировые черные рынки, он в конце концов добрался до Зоны."
	icon_state = "mp5"
	item_state = "arg"
	fire_sound = 'stalker/sound/weapons/mp5_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19mp5
	can_suppress = 1
	burst_size = 3
	fire_delay = 1.25
	slot_flags = ITEM_SLOT_BELT
	durability = 100
	w_class = 3
	spread = 7
	recoil = 0.2
	damagelose = 0.4
	can_scope = 1
	automatic = 1
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'


/obj/item/gun/ballistic/automatic/kiparis  // Кипарис
	name = "Кипарис"
	desc = "Маленький легкий пистолет-пулемет, стреляющий пулей малой мощности, был разработан Министерством обороны СССР в 1972 году. Не был принят на вооружение армией, но нашел применение и популярность среди различных современных российских правительственных вооруженных сил и полиции."
	icon_state = "kiparis"
	item_state = "arg"
	fire_sound = 'stalker/sound/weapons/fort_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/kiparis
	can_suppress = 1
	burst_size = 2
	fire_delay = 1
	slot_flags = ITEM_SLOT_BELT
	durability = 80
	w_class = 3
	spread = 8
	recoil = 0.15
	damagelose = 0.25
	can_scope = 0
	automatic = 1
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'

/obj/item/gun/ballistic/automatic/ppsh  // ППШ
	name = "ППШ"
	desc = "ППШ широко применялся в боевых действиях во время Второй мировой и Корейской войн. Это было одно из основных стрелковых орудий Советских Вооруженных Сил во время Великой Отечественной войны. Было изготовлено около шести миллионов ППШ-41. В виде китайского Type 50 он все еще использовался Вьетконгом вплоть до 1970 года. Согласно изданию «Энциклопедии оружия Второй мировой войны» 2002 года, ППШ все еще использовался в иррегулярных вооруженных силах."
	icon_state = "ppsh"
	item_state = "arg"
	fire_sound = 'stalker/sound/weapons/ppsh_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/ppsh
	can_suppress = 0
	burst_size = 5
	fire_delay = 1.2
	slot_flags = ITEM_SLOT_BELT
	durability = 50
	w_class = 4
	spread = 9
	recoil = 0.25
	damagelose = 0.5
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'

/obj/item/gun/ballistic/automatic/berettam38  // Моделло 38
	name = "Beretta M38"
	desc = "Modello 38 или Модель 38 и его варианты были серией официальных пистолетов-пулемётов Королевской итальянской армии, представленных в 1938 году и использовавшихся во время Второй мировой войны."
	icon_state = "berettam38"
	item_state = "berettam38"
	fire_sound = 'stalker/sound/weapons/berettam38_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/berettam38
	can_suppress = 0
	burst_size = 3
	fire_delay = 1.7
	slot_flags = ITEM_SLOT_BELT
	durability = 75
	w_class = 4
	spread = 6
	recoil = 0.3
	damagelose = 0.45
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/berettam38_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/berettam38_open.ogg'

/obj/item/gun/ballistic/automatic/p90
	name = "FN P90"
	desc = "Невероятно странный, хотя и эффективный, пистолет-пулемет. Под патрон FN 5,7×28 мм."
	icon_state = "p90"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/smg57
	fire_delay = 0.8
	can_suppress = 1
	burst_size = 3
	automatic = 1
	can_scope = 1
	tac_reloads = TRUE//tacticool
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/mp5_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/mp5_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/mp5_open.ogg'
/*	mag_display = TRUE



/obj/item/gun/ballistic/automatic/p90/Initialize()
	. = ..()
	update_icon()*/

/obj/item/gun/ballistic/automatic/tpc301  // Эмка
	name = "LR-300"
	desc = "Новый шаг в развитии этого знаменитого оружейного семейства. Изменения коснулись верхней половины стальной конструкции, включающей ствол, газовую трубку и затвор в сборе, что позволило уменьшить вес оружия, улучшить эргономику и газовую систему. Оружие отличается высокой точностью, хотя его склонность к загрязнению делает его плохим выбором для сложных условий Зоны."
	icon_state = "tpc301"
	item_state = "tpc301"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'stalker/sound/weapons/tpc301_shoot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1.4
	pin = /obj/item/firing_pin
	durability = 80
	w_class = 4
	spread = 4
	recoil = 0.4
	damagelose = 0.2
	can_scope = 1
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/tpc301_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/tpc301_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/tpc301_open.ogg'

/obj/item/gun/ballistic/automatic/abakan  // Абакан
	name = "АН-94"
	desc = "Современная штурмовая винтовка, разработанная в качестве замены устаревшего АК-74. Основным отличием является его высокоскоростной режим стрельбы очередями на 2 патрона, который позволяет стрелять двумя пулями в одно и то же место по цели на расстоянии до 100 метров. Это значительно повышает вероятность поражения цели по сравнению со старым режимом стрельбы снарядом, что значительно улучшает потенциал поражения, останавливающую силу и бронебойность."
	icon_state = "abakan"
	item_state = "abakan"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'stalker/sound/weapons/abakan_shoot.ogg'
	can_suppress = 1
	slowdown = 0.15
	burst_size = 2
	fire_delay = 1.5
	pin = /obj/item/firing_pin
	durability = 200
	w_class = 4
	spread = 4
	recoil = 0.4
	damagelose = 0.2
	can_scope = 1
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/abakan_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/abakan_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/abakan_open.ogg'

/obj/item/gun/ballistic/automatic/il86  // ИЛ86
	name = "ИЛ-85"
	desc = "Значительное количество недостатков этой винтовки привело к тому, что большая часть этого оружия была модернизирована, а списанный запас попал в Зону через черный рынок. Основными преимуществами винтовки являются встроенный 4-кратный прицел, высокая точность одиночного выстрела и надежная технология модернизации. При стрельбе из оружия очередями его точность значительно снижается и основные внутренние механизмы винтовки становятся несколько ненадежными."
	icon_state = "il86"
	item_state = "il86"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'stalker/sound/weapons/il86_shoot.ogg'
	can_suppress = 1
	slowdown = 0.15
	zoomable = TRUE
	zoom_amt = 9
	zoom_out_amt = 12
	burst_size = 3
	fire_delay = 1.8
	pin = /obj/item/firing_pin
	durability = 75
	w_class = 4
	spread = 4
	recoil = 0.4
	damagelose = 0.1
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/l85_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/groza_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/groza_open.ogg'

/obj/item/gun/ballistic/automatic/sigsg550
	name = "SIG SG 550"
	desc = "Относительно новая штурмовая винтовка, которая быстро нашла поклонников по всему миру, несмотря на отсутствие «трендового» дизайна. Оружие этой серии является одним из лучших в своем классе, славится своей надежностью, точностью и простотой использования. Несмотря на то, что эту штурмовую винтовку относительно трудно достать в Зоне, ее часто заказывают опытные сталкеры за значительные деньги."
	icon_state = "sigsg550"
	item_state = "sigsg550"
	slot_flags = ITEM_SLOT_BACK
	fire_sound = 'stalker/sound/weapons/sigsg550_shoot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	can_suppress = 0
	slowdown = 0.15
	durability = 125
	burst_size = 3
	fire_delay = 1.3
	w_class = 4
	spread = 3
	recoil = 0.3
	damagelose = 0.2
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/fnf2000_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/fnf2000_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/fnf2000_open.ogg'

/obj/item/gun/ballistic/automatic/gp37  // GP37
	name = "ГП-37"
	desc = "Новое дополнение к семейству штурмовых винтовок западного производства, существенно отличающееся от предыдущих моделей серии, построенных на автоматическом фундаменте с полуоткрытым затворным узлом, это оружие больше похоже на американские автоматические газовые штурмовые винтовки с короткоходной газопоршневой системой. Эти изменения гарантируют, что винтовка является первоклассным образцом современного оружия – легким, надежным и эргономичным."
	icon_state = "gp37"
	item_state = "gp37"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'stalker/sound/weapons/il86_shoot.ogg'
	can_suppress = 1
	slowdown = 0.15
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	burst_size = 3
	fire_delay = 1.25
	pin = /obj/item/firing_pin
	durability = 150
	w_class = 4
	spread = 3
	recoil = 0.35
	damagelose = 0.1
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/l85_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/groza_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/groza_open.ogg'

/obj/item/gun/ballistic/automatic/fnf2000  // fnf2000
	name = "FN-F2000"
	desc = "Это футуристически выглядящее оружие с компоновкой булл-пап на самом деле представляет собой серийную модульную систему, включающую в себя винтовочный гранатометный комплекс с компьютеризированной системой управления огнем и 40-мм гранатомётом. Несмотря на громоздкий внешний вид, оружие отличается высокой эргономичностью, простотой в эксплуатации и хорошими техническими характеристиками. У этого нет встроенного компьютеризированного прицела, но он очень точен и мощен."
	icon_state = "fnf2000"
	item_state = "fnf2000"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'stalker/sound/weapons/fnf2000_shoot.ogg'
	can_suppress = 0
	slowdown = 0.15
	burst_size = 3
	fire_delay = 1.4
	pin = /obj/item/firing_pin
	durability = 250
	w_class = 4
	spread = 3
	recoil = 0.35
	damagelose = 0.15
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/fnf2000_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/fnf2000_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/fnf2000_open.ogg'

/obj/item/gun/ballistic/automatic/fnf2000s  // fnf2000
	name = "FN-F2000-OTBS"
	desc = "Это футуристически выглядящее оружие с компоновкой булл-пап на самом деле представляет собой серийную модульную систему, включающую в себя винтовочный гранатометный комплекс с компьютеризированной системой управления огнем и 40-мм гранатомётом. Несмотря на громоздкий внешний вид, оружие отличается высокой эргономичностью, простотой в эксплуатации и хорошими техническими характеристиками. У этого нет встроенного компьютеризированного прицела, но он очень точен и мощен."
	icon_state = "fnf2000s"
	item_state = "fnf2000s"
	slot_flags = ITEM_SLOT_BACK
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'stalker/sound/weapons/fnf2000_shoot.ogg'
	can_suppress = 0
	slowdown = 0.15
	burst_size = 3
	fire_delay = 1.4
	zoomable = TRUE
	zoom_amt = 12
	zoom_out_amt = 15
	pin = /obj/item/firing_pin
	durability = 250
	w_class = 4
	spread = 1
	recoil = 0.35
	damagelose = 0.15
	can_scope = 0
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/fnf2000_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/fnf2000_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/fnf2000_open.ogg'


/obj/item/gun/ballistic/automatic/l6_saw/pkm
	name = "ПКМ"
	desc = "Данный пулемет с ленточным питанием представляет собой переносную модификацию со сложной двухступенчатой системой подачи. Несмотря на свой вес и низкую точность, это оружие нашло поклонников в Зоне. Используется в основном для борьбы с превосходящими по численности силами противника во время конфликтов фракций и зачистки логов мутантов"
	icon_state = "PKMclosed200"
	item_state = "l6closedmag"
	w_class = 5
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/stalker/pkm
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'stalker/sound/weapons/pkm_shot.ogg'
	can_suppress = 0
	slowdown = 0.40
	can_scope = 0
	automatic = 1
	burst_size = 5
	fire_delay = 1.8
	spread = 6
	recoil = 1
	damagelose = 0.25
	pin = /obj/item/firing_pin
	durability = 500

/obj/item/gun/ballistic/automatic/l6_saw/pkm/update_icon()
	icon_state = "PKM[cover_open ? "open" : "closed"][magazine ? 200 : "-empty"]"

/obj/item/gun/ballistic/automatic/l6_saw/pkm/shottie
   name = "ПТВ M-777"
   desc = "Личное оружие Петровича. Хуярит шо пизда."
   mag_type = /obj/item/ammo_box/magazine/stalker/pkm/shottie

///////////////////////////// Sniper Rifles //////////////////////////////////////////
/obj/item/gun/ballistic/automatic/val  // Вал
	name = "АС Вал"
	desc = "Модифицированный вариант бесшумной снайперской винтовки «Винторез», штурмовая винтовка проектировалась как оружие спецназа. Основное предназначение винтовки - эффективный огонь по врагам с использованием современных средств индивидуальной защиты без раскрытия местоположения стрелка. Благодаря встроенному глушителю и патрону калибра 9х39 мм с тяжелой дозвуковой пулей шум оружия и дульная вспышка были сведены к минимуму."
	icon_state = "val"
	item_state = "val"
	fire_sound = 'stalker/sound/weapons/vintorez_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39val
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	slowdown = 0.15
	durability = 150
	slot_flags = ITEM_SLOT_BACK
	force = 15
	burst_size = 3
	fire_delay = 1.2
	pin = /obj/item/firing_pin
	w_class = 4
	spread = 3
	recoil = 0.3
	damagelose = 0.1
	can_scope = 1
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/val_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/val_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/val_open.ogg'

/obj/item/gun/ballistic/automatic/vintorez  // ВСС Винторез
	name = "ВСС Винторез"
	desc = "Специальная военная снайперская винтовка, специально разработанная для бесшумного снайпинга без вспышки во время специальных операций, где раннее обнаружение стрелка может иметь решающее значение. «Винторез» обладает высокой бронебойностью и останавливающей силой, а также оснащен встроенным снайперским и оптическим прицелом. Высоко оценен многими сталкерами, несмотря на свой маленький магазин."
	icon_state = "vintorez"
	item_state = "vintorez"
	fire_sound = 'stalker/sound/weapons/vintorez_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39vint
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	slowdown = 0.15
	zoomable = TRUE
	zoom_amt = 7
	zoom_out_amt = 10
	burst_size = 3
	fire_delay = 1.2
	durability = 150
	slot_flags = ITEM_SLOT_BACK
	force = 15
	pin = /obj/item/firing_pin
	w_class = 4
	randomspread = 0//As below.
	spread = 0//For reason to use it over the SVD and Enfield.
	recoil = 0.1//This too. Ten round mag, so it's not that big of a deal.
	damagelose = 0
	can_scope = 0
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/val_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/val_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/val_open.ogg'

/obj/item/gun/ballistic/semiauto/svd  // SVD
	name = "СВД"
	desc = "«Снайперская винтовка Драгунова», сокращенно СВД, представляет собой снайперскую винтовку, разработанную и принятую на вооружение в 1963 году. Поставляется с полноценным встроенным прицелом для дальнобойных прицелов и, в отличие от своего двоюродного брата меньшего калибра (ВСС), не способен стрелять очередями из-за вышеупомянутого более высокого калибра."
	icon_state = "svd"
	item_state = "svd"
	fire_sound = 'stalker/sound/weapons/abakan_shoot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/svd
	can_suppress = 0
	can_unsuppress = 0
	slowdown = 0.15
	zoomable = TRUE
	zoom_amt = 9
	zoom_out_amt = 11
	fire_delay = 35
	durability = 180
	slot_flags = ITEM_SLOT_BACK
	force = 15
	pin = /obj/item/firing_pin
	w_class = 4
	spread = 1
	recoil = 0.5
	damagelose = 0
	can_scope = 0
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/val_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/val_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/val_open.ogg'

/obj/item/gun/ballistic/automatic/groza  // ОЦ-14 Гроза
	name = "ОЦ-14 Гроза"
	desc = "Этот автомат, совмещенный с гранатометом, который аналогичен серии АКМ, был специально разработан для подразделений быстрого реагирования. Основными отличиями являются боеприпасы калибра 9х39 мм, компоновка буллпап и широкие возможности конфигурации. Это оружие высоко ценится военными сталкерами из-за его способности убивать врагов, одетых в бронежилеты за импровизированным укрытием на расстоянии во время городского боя."
	icon_state = "groza"
	item_state = "groza"
	fire_sound = 'stalker/sound/weapons/groza_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39groza
	can_suppress = 0
	slowdown = 0.15
	durability = 125
	slot_flags = ITEM_SLOT_BACK
	fire_delay = 1
	force = 15
	burst_size = 3
	pin = /obj/item/firing_pin
	w_class = 4
	spread = 5
	recoil = 0.4
	damagelose = 0.35
	can_scope = 0
	automatic = 1
	zoomable = TRUE
	zoom_amt = 4
	zoom_out_amt = 4
	weapon_weight = WEAPON_MEDIUM
	draw_sound = 'stalker/sound/weapons/draw/groza_draw.ogg'
	load_sound = 'stalker/sound/weapons/load/groza_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/groza_open.ogg'

///////////////////////////// ETC //////////////////////////////////////////

/obj/item/gun/ballistic/semiauto/gaussrifle  // Gauss Rifle
	name = "Винтовка Гаусса"
	desc = "Изделие 62, более известная как винтовка Гаусса, представляет собой экспериментальное, очень мощное гибридное энергетическое оружие, первоначально разработанное членами печально известной Группы, которая действовала в Зоне до ее создания. Теперь изготовленное неизвестной силой, оружие приводится в действие частями артефакта Вспышка и, безусловно, является самым смертоносным оружием в распоряжении слуг Монолита."
	icon_state = "gaussrifle"
	item_state = "gaussrifle"
	colored = 0//"normal"
	slot_flags = ITEM_SLOT_BACK//|SLOT_BELT
	force = 15
	mag_type = /obj/item/ammo_box/magazine/stalker/gaussbattery
	fire_sound = 'stalker/sound/weapons/gauss_shoot.ogg'
	can_suppress = 0
	can_unsuppress = 0
	slowdown = 0.15
	fire_delay = 80
	pin = /obj/item/firing_pin
	durability = 120
	w_class = 4
	spread = 0
	recoil = 0
	randomspread = 0
	damagelose = 0
	distro = 15
	zoomable = TRUE
	zoom_amt = 8
	zoom_out_amt = 10
	weapon_weight = WEAPON_MEDIUM
	empty_alarm = TRUE
	casing_ejector = FALSE
	magazine_wording = "battery"
	draw_sound = 'stalker/sound/weapons/draw/ak74_draw.ogg'
	load_sound = 'stalker/sound/weapons/gauss_reload.ogg'
	eject_sound = 'stalker/sound/weapons/unload/abakan_open.ogg'

