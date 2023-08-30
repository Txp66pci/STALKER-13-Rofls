/obj/item/gun/ballistic/shotgun
	modifications = list("barrel_shotgun" = 0, "frame_shotgun" = 0, "grip_shotgun" = 0)

/obj/item/gun/ballistic/shotgun/bm16  // Горизонталка
	name = "БМ-16"
	desc = "Оригинальное ружьё БМ16. Тяжелая и опасная двухствольная ружьё, она эффективна и на больших дистанциях."
	icon_state = "bm16"
	item_state = "bm16"
	w_class = 4
	force = 15
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/shot/stalker/bm16
	recoil = 1
	durability = 150
	sawn_desc = "Much more compact and lighter than the new double-barreled gun, but effective only in close combat."
	randomspread = 0
	spread = 12
	damagelose = 0.3
	distro = 25
	can_scope = 1
	slowdown = 0.15
	weapon_weight = WEAPON_MEDIUM
	semi_auto = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	fire_sound = 'stalker/sound/weapons/bm16_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/obrez_load.ogg'
	eject_sound = 'stalker/sound/weapons/unload/obrez_open.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'

/obj/item/gun/ballistic/shotgun/bm16/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		//playsound(user, load_sound, 50, 1)
		chamber_round()

/obj/item/gun/ballistic/shotgun/bm16/attack_self(mob/living/user)
	var/num_unloaded = 0
	while (get_ammo() > 0)
		var/obj/item/ammo_casing/CB
		CB = magazine.get_round(0)
		chambered = null
		CB.loc = get_turf(src.loc)
		CB.update_icon()
		num_unloaded++
	if (num_unloaded)
		playsound(user, eject_sound, 50, 1)
		user << "<span class='notice'>Вы открыли \the [src] и разрядили [num_unloaded] гильзу\s.</span>"
	else
		user << "<span class='warning'>[src] is empty!</span>"

/obj/item/gun/ballistic/shotgun/bm16/toz34  //  Вертикалка
	name = "ТОЗ-34"
	desc = "Это чрезвычайно распространенное охотничье ружье может обеспечить лучшую защиту от мутантов, чем пистолет, благодаря своей точности и останавливающей силе. Используется в основном новичками на окраинах Зоны."
	icon_state = "toz34"
	item_state = "toz34"
	recoil = 0.6
	force = 15
	durability = 150
	spread = 6
	slowdown = 0.15
	damagelose = 0.15
	distro = 10
	can_scope = 1
	weapon_weight = WEAPON_MEDIUM

/obj/item/gun/ballistic/shotgun
	modifications = list("barrel_shotgun" = 0, "frame_shotgun" = 0, "grip_shotgun" = 0)

/obj/item/gun/ballistic/shotgun/ithaca  //  Ithaca M37
	name = "Ithaca M37"
	desc = " Помповое ружье, производимое в больших количествах для гражданского, военного и полицейского рынков. В нем используется новое комбинированное отверстие для выброса/заряжания в нижней части пистолета, которое оставляет боковые стороны закрытыми для элементов. Поскольку гильзы заряжаются и выбрасываются со дна, эксплуатация орудия одинаково удобна как для правых, так и для левых стрелков. Это делает пистолет популярным среди стрелков-левшей. Модель 37 считается одним из самых прочных и надежных дробовиков из когда-либо созданных."
	icon_state = "ithacam37"
	item_state = "ithacam37"
	durability = 100
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/shot/stalker/ithaca
	recoil = 1
	w_class = 4
	slowdown = 0.15
	randomspread = 0
	spread = 12
	force = 15
	damagelose = 0.3
	distro = 25
	can_scope = 0
	weapon_weight = WEAPON_MEDIUM
	//fire_sound = 'stalker/sound/weapons/winchester1300_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/chaser_load.ogg'
	rack_sound = 'stalker/sound/weapons/pump/ithacam37_pump.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'

/obj/item/gun/ballistic/shotgun/chaser  //  Winchester 1300
	name = "Чейзер-13"
	desc = "Западный гладкоствольный дробовик, который чрезвычайно популярен во всем мире благодаря своей удивительной надежности и более высокой скорости перезарядки. Особенно ценится за свою функциональность охотниками Зоны. Все его детали покрыты антикоррозийным составом."
	icon_state = "chaser"
	item_state = "chaser"
	durability = 100
	slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/shot/chaser
	recoil = 0.8
	w_class = 4
	slowdown = 0.15
	randomspread = 0
	spread = 10
	force = 15
	damagelose = 0.3
	distro = 16
	weapon_weight = WEAPON_MEDIUM
	//fire_sound = 'stalker/sound/weapons/winchester1300_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/chaser_load.ogg'
	rack_sound = 'stalker/sound/weapons/pump/chaser_pump.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'

/obj/item/gun/ballistic/shotgun/bm16/sawnoff
	name = "Обрез БМ-16"
	desc = "Обрез охотничьего ружья с двумя расположенными бок о бок стволами, что делает его легче и компактнее, чем полноценный дробовик. Одно из самых популярных видов оружия среди бандитов благодаря сочетанию легкости маскировки и чрезвычайной эффективности в ближнем бою."
	sawn_off = TRUE
	weapon_weight = WEAPON_LIGHT
	item_state = "gun"
	slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_BACK
	w_class = 3
	durability = 75
	force = 15
	spread = 20
	recoil = 2.5
	damagelose = 0.45
	distro = 35

/obj/item/gun/ballistic/shotgun/bm16/sawnoff/New()
	..()
	update_icon()

/obj/item/gun/ballistic/shotgun/spsa
	name = "SPAS-12"
	desc = "Это гладкоствольное автоматическое ружье специального назначения было разработано во второй половине 20-го века и поставляется с помповым и самовзводным режимами стрельбы. Используется в качестве универсального оружия полицией и штурмовыми отрядами. Отличается надежностью и тактической гибкостью. Несмотря на большой вес, сложный механизм и немалую стоимость, он пользуется спросом в Зоне благодаря своей эффективности против мутантов."
	icon_state = "spsa"	//Нужно добавить
	item_state = "spsa" //Нужно добавить
	durability = 150
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/shot/spsa
	recoil = 0.8
	w_class = 4
	slowdown = 0.15
	randomspread = 0
	spread = 8
	force = 15
	damagelose = 0.35
	distro = 12
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'stalker/sound/weapons/spsa_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/spsa_load.ogg'
	rack_sound = 'stalker/sound/weapons/pump/spsa_pump.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'

///////////////////////////// Bolt-actions //////////////////////////////////////////

/obj/item/gun/ballistic/rifle/boltaction/enfield
	name = "Lee Enfield"
	desc = "Тяжелая и универсальная винтовка, переделанная под мощный патрон 7,62x51 мм. Поговаривают что один сталкер получил в её честь погоняло"
	icon_state = "enfield"
	item_state = "enfield"
	durability = 200
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/enfield
	recoil = 1
	w_class = 4
	slowdown = 0.15
	randomspread = 1
	spread = 3
	force = 15
	damagelose = 0.1
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'stalker/sound/weapons/enfield_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/bolt_load.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'
	can_scope = 1

/obj/item/gun/ballistic/rifle/boltaction/mosin
	name = "Винтовка Мосина"
	desc = "Тяжелая и универсальная винтовка, прослужившая Советскому Союзу более века, под патрон 7,62×54 мм."
	icon_state = "mosin"
	item_state = "mosin"
	durability = 200
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/mosin
	recoil = 1
	w_class = 4
	slowdown = 0.15
	randomspread = 1
	spread = 4
	force = 15
	damagelose = 0.1
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'stalker/sound/weapons/enfield_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/bolt_load.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'
	can_scope = 1

obj/item/gun/ballistic/rifle/boltaction/mosinobrez
	name = "Обрез Мосинки"
	desc = "Возможно, одна из худших инженерных идей, когда-либо приходивших кому-то в голову. Если вам удастся убить кого-то этим (кроме себя), то вы есть робаст."
	icon_state = "mosin-obrez"
	item_state = "mosin-obrez"
	durability = 160
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/mosin
	recoil = 6
	w_class = 2
	randomspread = 3
	spread = 10
	force = 10
	damagelose = 0.3
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'stalker/sound/weapons/enfield_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/bolt_load.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'
	can_scope = 0

/obj/item/gun/ballistic/rifle/boltaction/arisaka
	name = "Arisaka"
	desc = "Универсальная служебная винтовка с продольно-скользящим затвором, которая использовалась Японской империей преимущественно во время Второй китайско-японской войны и Второй мировой войны."
	icon_state = "arisaka"
	item_state = "rifle"
	durability = 200
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/mosin
	recoil = 1
	w_class = 4
	randomspread = 1
	spread = 4
	slowdown = 0.15
	force = 15
	damagelose = 0.1
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'stalker/sound/weapons/enfield_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/bolt_load.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'
	can_scope = 1

/obj/item/gun/ballistic/rifle/boltaction/karabiner
	name = "Карабинер 98K"
	desc = "Универсальная служебная винтовка с продольно-скользящим затвором, которая использовалась Германией преимущественно во время Второй мировой войны."
	icon_state = "karabiner"
	item_state = "rifle"
	durability = 200
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/mosin
	recoil = 1
	w_class = 4
	randomspread = 1
	spread = 4
	slowdown = 0.15
	force = 15
	damagelose = 0.1
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'stalker/sound/weapons/enfield_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/bolt_load.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'
	can_scope = 1

/obj/item/gun/ballistic/rifle/boltaction/springfield
	name = "M1903 Спрингфилд"
	desc = "M1903 Спрингфилд, официально винтовка Соединенных Штатов, калибр.30-06, модель 1903 года, представляет собой американскую многозарядную винтовку с магазинным питанием и продольно-скользящим затвором, используемую в основном в первой половине 20-го века. M1903 была впервые использована в бою во время филиппино-американской войны, и она была официально принята Соединенными Штатами в качестве стандартной пехотной винтовки 19 июня 1903 года, где она использовалась в Первой мировой войне, и была заменена более скорострельной полуавтоматической восьмизарядной винтовкой M1 Гаранд, начиная с 1936 года."
	icon_state = "springfield"
	item_state = "rifle"
	durability = 200
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/mosin
	recoil = 1
	w_class = 4
	randomspread = 1
	spread = 4
	slowdown = 0.15
	force = 15
	damagelose = 0.1
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'stalker/sound/weapons/enfield_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/bolt_load.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'
	can_scope = 1

/obj/item/gun/ballistic/rifle/boltaction/makeshiftbolt
	name = "Самодельная винтовка с продольно-скользящим затвором"
	desc = "Слепленная винтовка с продольно-скользящим затвором, сделанная из хлама. Может быть, это была не такая уж хорошая идея..."
	icon_state = "makeshiftbolt"
	item_state = "rifle"
	durability = 200
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/mosin
	recoil = 3
	w_class = 4
	randomspread = 6
	spread = 9
	slowdown = 0.15
	force = 15
	damagelose = 0.1
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'stalker/sound/weapons/enfield_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/bolt_load.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'
	can_scope = 1


///
// AWP - Alternative to SVD.
// Here because why not.
///

/obj/item/gun/ballistic/awm
	name = "AWM"
	desc = "Тяжелая и универсальная винтовка, переделанная под массивный патрон.338 Лапуа. Одно из самых грозных видов оружия в зоне."
	icon_state = "awp"//temp??? shut cho bitchass up figass
	item_state = "awp"
	durability = 50//Heavily increases chance of jamming or explosion of round in chamber. Required due to power of rifle.
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/awp
	recoil = 3
	w_class = 4
	randomspread = 0
	spread = 0
	force = 15
	damagelose = 0
	weapon_weight = WEAPON_HEAVY
	bolt_type = BOLT_TYPE_LOCKING//Lets try this.
	semi_auto = FALSE
	casing_ejector = FALSE
	bolt_wording = "bolt"
	fire_sound = 'stalker/sound/weapons/awp_shot.ogg'
	load_sound = 'stalker/sound/weapons/load/awp_reload.ogg'
	draw_sound = 'stalker/sound/weapons/draw/shotgun_draw.ogg'
	zoomable = TRUE
	zoom_amt = 8
	zoom_out_amt = 10
