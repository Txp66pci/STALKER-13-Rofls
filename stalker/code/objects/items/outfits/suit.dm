/obj/item/clothing
	var/durability = -1

/obj/item/clothing/suit
	var/obj/item/storage/internal_slot/internal_slot = null

/obj/item/clothing/examine(mob/user)
	..()
	var/msg = ""
	var/list/arm = src.armor.getList()

	var/melee = arm["melee"]
	var/bullet = arm["bullet"]
	var/bomb = arm["bomb"]
	var/fire = arm["fire"]
	var/rad = arm["rad"]
	var/psy = arm["psy"]

	msg += "<span class='info'><b>Defense:</b>\n"
	msg += "Melee: [melee] | Bullet: [bullet] | Explosion: [bomb]\n"
	msg += "Fire: [fire] | Rad: [rad] | Psy: [psy]\n"
	msg += "</span>"
	to_chat(user, msg)

/obj/item/clothing/head/examine(mob/user)
	..()
	if(durability)
		var/percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			to_chat(user, "<span class='notice'>Прочность: [percentage]%</span>")
		else
			to_chat(user, "<span class='warning'>Прочность: [percentage]%</span>")

/obj/item/clothing/mask/examine(mob/user)
	..()
	if(durability)
		var/percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			to_chat(user, "<span class='notice'>Прочность: [percentage]%</span>")
		else
			to_chat(user, "<span class='warning'>Прочность: [percentage]%</span>")

/obj/item/clothing/suit/examine(mob/user)
	..()
	if(durability)
		var/percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			to_chat(user, "<span class='notice'>Прочность: [percentage]%</span>")
		else
			to_chat(user, "<span class='warning'>Прочность: [percentage]%</span>")

/obj/item/clothing/update_icon()
	..()
	overlays.Cut()

	if(unique)
		overlays += image('stalker/icons/projectile_overlays32x32.dmi', "unique", layer = FLOAT_LAYER)

/obj/item/clothing/New()
	..()
	update_icon()

/obj/item/clothing/proc/RefreshPockets()
	if(ispath(pocket_storage_component_path))
		LoadComponent(pocket_storage_component_path)

//obj/item/clothing/suit/MouseDrop(atom/over_object)
//	if(!usr || (loc != usr))
//		return
//	src.throwing = 0
//	if (loc == usr)
//		if(!usr.is_holding(src))
//			return
//
//	pickup(usr)
//	add_fingerprint(usr)
//	if(!usr.put_in_active_hand(src))
//		dropped(usr)
//	return

//obj/item/clothing/suit/attack_hand(mob/user)
//	..()
//	if(!ishuman(user))
//		return ..()
//
//	var/mob/living/carbon/human/H = user
//
//	if(!pocket_storage_component_path || H.wear_suit != src)
//		return ..()
//
//	pocket_storage_component_path.show_to(user)

/////////////////////////////////////////////////////////////////////NIGHT VISION HELMETS, INTERIOR STORAGE, ETC./////////////////////////////////////////////////

/obj/item/clothing
	var/obj/item/nightvision/nvg
	//var/datum/action/item_action/nightvision/nva
/*
/obj/item/clothing/New()
	. = ..()
	if(nvg)
		nva = new(src)

/obj/item/clothing/proc/AttachNvg()
	if(nvg)
		nva = new(src)
*/

/obj/item/clothing/proc/AttachNVG(var/type = /obj/item/nightvision)
	nvg = new type(src)
	src.actions_types += new/datum/action/item_action/nightvision(src)

/obj/item/nightvision
	var/active = 0
	var/colour_matrix = /datum/client_colour/nvg	//NIGHTVISION_MATRIX_I
	actions_types = list(/datum/action/item_action/nightvision)

/datum/action/item_action/nightvision
	name = "Включить ПНВ"

/obj/item/nightvision/advanced
	colour_matrix = /datum/client_colour/nvg2		//NIGHTVISION_MATRIX_II

/obj/item/clothing/proc/toggle_nightvision()
	var/mob/living/carbon/human/user = usr

	if (user.wear_mask != src && user.head != src)
		to_chat(usr, "Вы включаете ПНВ в [src] надеясь что-то разглядеть в темноте, но из этого ничего не выходит. Стоит ли его носить? ")
		playsound(usr, 'stalker/sound/nv_start.ogg', 50, 1, -1)
		//if (prob(5))
		//	to_chat(usr, "<b>Таким образом, приводя устройство в состояние бесполезной тряпки!</b>")
		//	playsound(usr, 'stalker/sound/nv_off.ogg', 50, 1, -1)
		//	qdel(src)
		return

	if(!nvg)
		return

	nvg.active = !nvg.active
	update_nightvision()
	//user.seek_screen_colour()
	user.update_sight()

/obj/item/clothing/proc/update_nightvision()
	if(nvg)
		var/mob/living/carbon/human/user = usr
		if(!nvg.active)
			playsound(usr, 'stalker/sound/nv_off.ogg', 50, 1, -1)
			to_chat(usr, "Вы отключили оптический датчик [src].")
			user.remove_client_colour(nvg.colour_matrix)
			user.see_override_nva = 0
		else
			playsound(usr, 'stalker/sound/nv_start.ogg', 50, 1, -1)
			to_chat(usr, "Вы включили оптический датчик [src].")
			user.add_client_colour(nvg.colour_matrix)
			user.see_override_nva = 4
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/dropped(mob/user)
	..()
	if(nvg)
		if (nvg.active)
			toggle_nightvision()

/obj/item/clothing/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/nightvision))
		toggle_nightvision()
	else
		..()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/suit/hooded/kozhanka
	name = "Кожаная куртка"
	desc = "Обычная одежда начинающего сталкера. Это не спасет вас от пуль или аномалий, но все же лучше, чем быть голым."
	icon_state = "kozhanka"
	item_state = "det_suit"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	hoodtype = /obj/item/clothing/head/hooded/stalker/kozhanka
	durability = 75
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker
	name = "Капюшон"
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	durability = -1
	flags_inv = HIDEEARS|HIDEHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/hooded/stalker/kozhanka
	icon_state = "winterhood_kozhanka"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/white
	icon_state = "kozhanka_wh"
	item_state = "labcoat"
	hoodtype = /obj/item/clothing/head/hooded/stalker/kozhanka_wh

/obj/item/clothing/head/hooded/stalker/kozhanka_wh
	armor = list("melee" = 10, "bullet" = 0, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	icon_state = "winterhood_kozhanka_wh"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/dolg
	icon_state = "kozhanka_dolg"
	item_state = "labcoat"
	hoodtype = /obj/item/clothing/head/hooded/stalker/kozhanka_dolg

/obj/item/clothing/head/hooded/stalker/kozhanka_dolg
	armor = list("melee" = 10, "bullet" = 0, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	icon_state = "winterhood_dolg"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/banditka
	name = "Бандитская куртка"
	desc = "Традиционная бандитская одежда - кожаная куртка с вшитыми доспехами. Защита, которую он обеспечивает, совершенно недостаточна для суровых условий Зоны."
	icon_state = "banditka"
	item_state = "ro_suit"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 5, "bomb" = 15, "bio" = 5, "rad" = 20, "fire" = 5, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/banditka
	durability = 75

/obj/item/clothing/head/hooded/stalker/banditka
	armor = list("melee" = 15, "bullet" = 0, "laser" = 15, "energy" = 5, "bomb" = 0, "bio" = 5, "rad" = 20, "fire" = 5, "psy" = 0)
	icon_state = "winterhood_banditka"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/banditka/unique
	name = "Кольчужная куртка"
	desc = "Обычный слабый бандитский бронежилет, но в подкладку вшита кольчуга. Это может сделать практически каждый, но терпения хватит далеко не у всех."
	//icon_state = "banditka_unique"
	armor = list("melee" = 15, "bullet" = 28, "laser" = 15, "energy" = 5, "bomb" = 15, "bio" = 5, "rad" = 20, "fire" = 5, "psy" = 0)
	unique = 1

/obj/item/clothing/suit/hooded/kozhanka/unique
	name = "Аномальная кожанка"
	desc = "This jacket was removed from the corpse of one of the stalkers who died in the 'jelly' anomaly. After lying in an anomaly for a long time, the jacket has acquired the ability to speed up the wearer's metabolism."
	icon_state = "kozhanka_unique"
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 20, "bio" = 20, "rad" = 30, "fire" = 10, "psy" = 0)
	unique = 0

/obj/item/clothing/suit/hooded/kozhanka/renegadecoat
	name = "Куртка Ренегата"
	desc = "A tan trenchcoat with light armor plates and shoulder pads strapped onto it."
	icon_state = "renegadecoat"
	item_state = "renegadecoat_t"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 5, "bomb" = 15, "bio" = 5, "rad" = 20, "fire" = 5, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/renegade
	durability = 75

/obj/item/clothing/head/hooded/stalker/renegade
	armor = list("melee" = 15, "bullet" = 0, "laser" = 15, "energy" = 5, "bomb" = 0, "bio" = 5, "rad" = 20, "fire" = 5, "psy" = 0)
	icon_state = "winterhood_renegade"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/tancoat
	name = "Кожаный плащ"
	desc = "Коричневый плащ с легкими бронепластинами и натянутыми на его наплечниках."
	icon_state = "tancoat"
	item_state = "tancoat_t"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor = list("melee" = 20, "bullet" = 20, "laser" = 15, "energy" = 30, "bomb" = 0, "bio" = 10, "rad" = 30, "fire" = 30, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	hoodtype = /obj/item/clothing/head/hooded/stalker/tancoat
	durability = 75
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/tancoat
	icon_state = "winterhood_tancoat"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/kozhanka
	name = "Туристическая куртка."
	desc = "Обычная одежда начинающего сталкера. Это не спасет вас от пуль или аномалий, но это все же лучше, чем ничего."
	icon_state = "kozhanka"
	item_state = "det_suit"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor = list(melee = 10, bullet = 10, laser = 10,burn = 10, bomb = 10, bio = 10, rad = 10, electro = 10, psy = 0)
	durability = 75
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/kozhanka/tourist/jacket
	name = "Кожаная куртка"
	desc = "Обычное одеяние вновь прибывших. Это не спасет вас от пуль или аномалий, но это все же лучше, чем ничего. Это куртка сделанна из толстой кожи."
	icon_state = "tourist1"
	item_state = "det_suit"

/obj/item/clothing/suit/kozhanka/tourist/coat
	name = "Зеленое зимнее пальто"
	desc = "Обычное одеяние вновь прибывших. Это не спасет вас от пуль или аномалий, но это все же лучше, чем ничего. Это толстое зимнее пальто."
	icon_state = "tourist2"
	item_state = "det_suit"

/obj/item/clothing/suit/kozhanka/tourist/gorka
	name = "Куртка горка"
	desc = "Обычное одеяние вновь прибывших. Это не спасет вас от пуль или аномалий, но это все же лучше, чем ничего. Это толстое зимнее пальто."
	icon_state = "tourist3"
	item_state = "det_suit"

/obj/item/clothing/suit/hooded/kombez
	name = "Комбенизон Заря"
	desc = "Это сталкерская самоделка, представляет собой комбинацию брони из двухслойной прорезиненной ткани с подкладкой из оргстекла и встроенного бронежилета. Несмотря на то, что бронежилет не способен защитить владельца даже от пистолетных пуль, костюм пользуется большой популярностью благодаря невысокой стоимости и потенциалу модификации. Поставляется со встроенными контейнерами артефактов."
	icon_state = "kombez"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 35, "bullet" = 25, "laser" = 50, "energy" = 50, "bomb" = 30, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/kombez
	durability = 200
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/kombez
	armor = list("melee" = 35, "bullet" = 	0, "laser" = 50, "energy" = 50, "bomb" = 0, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_kombez"
	flags_inv = HIDEEARS|HIDEHAIR

//strelok
/obj/item/clothing/suit/hooded/strelok
	name = "Модифицированная Заря"
	desc = "Сильно модифицированный костюм Заря, обеспечивающий отличную защиту, лучшую прочность и капюшон с подкладкой."
	icon_state = "kombez"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	strip_delay = 120
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 65, "bullet" = 65, "laser" = 50, "energy" = 50, "bomb" = 30, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/strelok
	durability = 400
	unique = 1

/obj/item/clothing/head/hooded/stalker/strelok
	armor = list("melee" = 65, "bullet" = 	0, "laser" = 50, "energy" = 50, "bomb" = 0, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_kombez"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/cs_hood
	name = "Куртка Чистого Неба"
	desc = "Плащ с камуфляжем Чистого Неба с легкими броневыми пластинами и наплечниками."
	icon_state = "cs_hood"
	item_state = "cs_hood_t"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	hoodtype = /obj/item/clothing/head/hooded/stalker/cs_hood
	durability = 75
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/cs_hood
	icon_state = "winterhood_cs"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/cs_medium
	name = "Броня ЧН-3a"
	desc = "Этот бронежилет предназначался для проведения поисковых операций в районах низкой аномальной активности. Более качественные материалы обеспечивают большую долговечность."
	icon_state = "cs_medium"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 35, "bullet" = 25, "laser" = 50, "energy" = 50, "bomb" = 30, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/cs_medium
	durability = 250
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/cs_medium
	armor = list("melee" = 35, "bullet" = 	0, "laser" = 50, "energy" = 50, "bomb" = 0, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_cs_medium"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/cs_heavy
	name = "Броня ЧН-1"
	desc = "Стандартная экипировка, используемая штурмовыми отрядами Чистого Неба. Этот бронежилет способен остановить пистолетную пулю."
	icon_state = "cs_heavy"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 35, "bullet" = 35, "laser" = 50, "energy" = 50, "bomb" = 30, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	durability = 200
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

	/*
	Not sprited suits based off sunrise in here
	Currently: none
	*/


/obj/item/clothing/suit/jacket/sidor
	name = "Старая куртка"
	desc = "Кошерный жилет из кожи химеры. "
	icon_state = "sidor_vest"
	item_state = "det_suit"
	resistance_flags = FIRE_PROOF
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	allowed = list(/obj/item/flashlight,/obj/item/tank/internals/emergency_oxygen,/obj/item/toy,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/gun/ballistic/automatic/pistol,/obj/item/gun/ballistic/revolver,/obj/item/gun/ballistic/revolver/detective,/obj/item/kitchen/knife/tourist)

/obj/item/clothing/suit/hooded/kozhanka/banditka/coat
	name = "Кожаный плащ"
	desc = "Обычный черный кожаный плащ. Не имеет специального назначения, кроме как согревать владельца ночью или защищать от укуса слепой собаки. Хотя плащ не особенно удобен, он часто используется Бандитами в Зоне - либо потому, что позволяет им прятаться в темноте, либо просто из-за своего \"крутого\" внешнего вида."
	icon_state = "banditcoat"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("melee" = 20, "bullet" = 15, "laser" = 15, "energy" = 30, "bomb" = 0, "bio" = 10, "rad" = 30, "fire" = 30, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/bandit
	durability = 150

/obj/item/clothing/head/hooded/stalker/bandit
	armor = list("melee" = 15, "bullet" = 0, "laser" = 15, "energy" = 30, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 30, "psy" = 0)
	icon_state = "winterhood_banditcoat"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown
	icon_state = "banditcoatbrown"
	desc = "A regular brown leather trench coat. Has no special purpose other than to keep the wearer warm at night or protect from a blind dog bite. Although the trench coat is not particularly comfortable, it is often used by Bandits in the Zone - either because it allows them to hide in the dark or simply due to its \"cool\" appearance."
	hoodtype = /obj/item/clothing/head/hooded/stalker/banditbrown

/obj/item/clothing/head/hooded/stalker/banditbrown
	armor = list("melee" = 20, "bullet" = 0, "laser" = 15, "energy" = 30, "bomb" = 0, "bio" = 10, "rad" = 30, "fire" = 30, "psy" = 0)
	icon_state = "winterhood_banditcoatbrown"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/sealed
	name = "Тест"
	desc = "Герметичный костюм с дыхательной системой замкнутого цикла."
	icon_state = "kombez"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 90, "bullet" = 25, "laser" = 50, "energy" = 50, "bomb" = 30, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed
	durability = 200
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)
/*
/obj/item/clothing/head/hooded/stalker/sealed
	modifications = list("visor_suit" = 0)
*/

/obj/item/clothing/suit/hooded/sealed/ToggleHood()
	if(!suittoggled)
		if(ishuman(src.loc))
			var/mob/living/carbon/human/H = src.loc
			if(H.wear_suit != src)
				to_chat(H, "<span class='warning'>Вы должны носить [src] чтобы натянуть капюшон!</span>")
				return
			if(H.head || H.wear_mask)
				to_chat(H, "<span class='warning'>Вы уже носите что-то на голове!</span>")
				return
			else if(H.equip_to_slot_if_possible(hood,SLOT_HEAD,0,0,1))
				suittoggled = TRUE
				src.icon_state = "[initial(icon_state)]_t"
				H.update_inv_wear_suit()
				for(var/X in actions)
					var/datum/action/A = X
					A.UpdateButtonIcon()
	else
		RemoveHood()

/obj/item/clothing/suit/hooded/sealed/New()
	..()
	//spawn(10)
	//	if(hood)
	//		modifications += hood.modifications
	//if(hood.nvg)
	//	if(hood.nvg.colour_matrix == NIGHTVISION_MATRIX_I)
	//		modifications += "visor"
	//	else if(hood.nvg.colour_matrix == NIGHTVISION_MATRIX_II)
	//		modifications += "visor"

/obj/item/clothing/suit/hooded/sealed/ecolog
	name = "ССП-99"
	desc = "Костюм химической защиты ССП-99, специально разработанный для условий Зоны. Его используют научные экспедиции и экосталкеры, которые с ними сотрудничают. Он имеет встроенную систему фильтрации воздуха и кондиционирования воздуха. Он устойчив к теплу и электричеству, обеспечивает хорошую защиту от радиации и биологических аномалий. Устойчив к химически агрессивным средам. Он не предназначен для боя, поэтому не обеспечивает ни пулевой, ни противоосколочной защиты."
	icon_state = "ecolog"
	item_state = "syndicate-orange"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 15, "bullet" = 15, "laser" = 90, "energy" = 90, "bomb" = 40, "bio" = 90, "rad" = 95, "fire" = 90, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/ecolog
	resistance_flags = FIRE_PROOF
	durability = 200
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 1, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/ecolog
	name = "Шлем ССП-99"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 90, "energy" = 90, "bomb" = 40, "bio" = 90, "rad" = 95, "fire" = 90, "psy" = 20)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "ecolog_helmet"

/obj/item/clothing/head/hooded/stalker/sealed/ecolog/Initialize()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/suit/hooded/sealed/ecologm
	name = "ССП-99M"
	desc = "Высококачественный модифицированный костюм ССП-99. Он обеспечивает повышенную защиту корпуса от пулевых и осколочных повреждений. Он предназначен для охранников, работающих с научными экспедициями. Он обеспечивает хорошую защиту от радиации и биологических аномалий. Он устойчив к химически агрессивным средам и другим опасным для организма воздействиям."
	icon_state = "ecologg"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 40, "bullet" = 30, "laser" = 90, "energy" = 90, "bomb" = 60, "bio" = 90, "rad" = 90, "fire" = 90, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/ecologm
	resistance_flags = FIRE_PROOF
	durability = 250
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 1, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/ecologm
	name = "Шлем ССП-99М"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 90, "energy" = 90, "bomb" = 60, "bio" = 90, "rad" = 90, "fire" = 90, "psy" = 25)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "ecologg_helmet"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/hooded/stalker/sealed/ecologm/Initialize()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/suit/hooded/sealed/seva
	name = "СЕВА"
	desc = "Этот костюм, предназначенный для проведения исследований в Зоне, сочетает в себе дыхательный модуль замкнутого цикла и внешнее изолирующее покрытие, что обеспечивает отличную защиту от аномалий. Из-за плохой защиты от физического воздействия костюм не является хорошей защитой от пулевых и осколочных повреждений. Он поставляется со встроенным контейнером для транспортировки артефактов."
	icon_state = "seva"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 60, "bullet" = 60, "laser" = 80, "energy" = 80, "bomb" = 50, "bio" = 70, "rad" = 80, "fire" = 80, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/seva
	resistance_flags = FIRE_PROOF
	durability = 200
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 1, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/seva
	name = "Шлем СЕВА"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 80, "energy" = 80, "bomb" = 50, "bio" = 70, "rad" = 80, "fire" = 80, "psy" = 15)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "seva_helmet"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/hooded/stalker/sealed/seva/Initialize()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/suit/hooded/sealed/seva/orange
	icon_state = "sevao"
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/seva/orange

/obj/item/clothing/head/hooded/stalker/sealed/seva/orange
	icon_state = "sevao_helmet"

/obj/item/clothing/suit/hooded/sealed/psz9md
	name = "ПСЗ-9МД"
	desc = "Замечательный защитный костюм для Зоны. Сталкеры ценят его, потому что он сочетает в себе отличные аномальные и пуленепробиваемые качества. Она включает в себя скафандр ПСЗ-9Д, дыхательную систему замкнутого цикла и интегрированную систему подавления аномального поля. Он обеспечивает качественную защиту от пуль и осколков."
	icon_state = "psz9md"
	item_state = "syndicate-black-red"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80, "energy" = 75, "bomb" = 50, "bio" = 50, "rad" = 75, "fire" = 75, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/psz9md
	resistance_flags = FIRE_PROOF
	durability = 150
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 1, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/psz9md
	name = "Шлем ПСЗ-9МД"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80, "energy" = 65, "bomb" = 50, "bio" = 50, "rad" = 70, "fire" = 65, "psy" = 20)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "psz9md_helmet"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/hooded/stalker/sealed/psz9md/Initialize()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/suit/hooded/sealed/sin
	name = "Куртка Греха"
	desc = "Странный запечатанный костюм, который носят члены Греха."
	icon_state = "sin"
	item_state = "syndicate-black-red"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80, "energy" = 75, "bomb" = 50, "bio" = 50, "rad" = 75, "fire" = 75, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/sin
	resistance_flags = FIRE_PROOF
	durability = 150
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 1, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/sin
	name = "Маска костюма Греха"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80, "energy" = 65, "bomb" = 50, "bio" = 50, "rad" = 70, "fire" = 65, "psy" = 20)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "sin_helmet"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/hooded/stalker/sealed/psz9md/Initialize()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/suit/hooded/sealed/exoskelet
	name = "Экзоскелет"
	desc = "Экспериментальный образец военного экзоскелета. Никогда не производился серийно из-за чрезвычайной стоимости и некоторых конструктивных недостатков. Несмотря на это, он пользуется спросом благодаря способности брать на себя вес всего переносимого, и поэтому небольшие партии изготавливаются в подземных сооружениях за пределами Украины. Поставляется со встроенным контейнером артефактов."
	icon_state = "exoskelet"
	item_state = "syndicate-black"
	slowdown = 0.15
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 75, "bullet" = 75, "laser" = 50, "energy" = 30, "bomb" = 80, "bio" = 50, "rad" = 85, "fire" = 50, "psy" = 40)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/exoskelet
	durability = 200
	resistance_flags = UNACIDABLE | FIRE_PROOF

/obj/item/clothing/head/hooded/stalker/sealed/exoskelet
	name = "Шлем экзоскелета"
	armor = list("melee" = 75, "bullet" = 75, "laser" = 50, "energy" = 30, "bomb" = 80, "bio" = 100, "rad" = 100, "fire" = 50, "psy" = 30)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = UNACIDABLE | FIRE_PROOF
	icon_state = "exoskelet_helmet"
/obj/item/clothing/head/hooded/stalker/sealed/exoskelet/New()
	..()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)

/obj/item/clothing/suit/hooded/sealed/exoskelet/duty
	name = "Экзоскелет Долга"
	desc = "Экспериментальный образец военного экзоскелета. Никогда не производился серийно из-за чрезвычайной стоимости и некоторых конструктивных недостатков. Несмотря на это, он пользуется спросом благодаря способности брать на себя вес всего переносимого, и поэтому небольшие партии изготавливаются в подземных сооружениях за пределами Украины. Поставляется со встроенным контейнером артефактов."
	icon_state = "exoskeletd"
	item_state = "syndicate-black"
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/exoskelet/duty

/obj/item/clothing/head/hooded/stalker/sealed/exoskelet/duty
	name = "Шлем экзоскелета Долга"
	icon_state = "exoskeletd_helmet"

/obj/item/clothing/suit/hooded/sealed/exoskelet/freedom
	name = "Экзоскелет Свободы"
	desc = "Экспериментальный образец военного экзоскелета. Никогда не производился серийно из-за чрезвычайной стоимости и некоторых конструктивных недостатков. Несмотря на это, он пользуется спросом благодаря способности брать на себя вес всего переносимого, и поэтому небольшие партии изготавливаются в подземных сооружениях за пределами Украины. Поставляется со встроенным контейнером артефактов."
	icon_state = "exoskeletf"
	item_state = "syndicate-black"
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/exoskelet/freedom

/obj/item/clothing/head/hooded/stalker/sealed/exoskelet/freedom
	name = "Шлем экзоскелета Свободы"
	icon_state = "exoskeletf_helmet"

/obj/item/clothing/suit/hooded/sealed/exoskelet/merc
	name = "Экзоскелет Наёмников"
	desc = "Экспериментальный образец военного экзоскелета. Никогда не производился серийно из-за чрезвычайной стоимости и некоторых конструктивных недостатков. Несмотря на это, он пользуется спросом благодаря способности брать на себя вес всего переносимого, и поэтому небольшие партии изготавливаются в подземных сооружениях за пределами Украины. Поставляется со встроенным контейнером артефактов."
	icon_state = "exoskeletm"
	item_state = "syndicate-black"
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/exoskelet/merc

/obj/item/clothing/head/hooded/stalker/sealed/exoskelet/merc
	name = "Шлем экзоскелета Наёмников"
	icon_state = "exoskeletm_helmet"

/obj/item/clothing/suit/hooded/sealed/exoskelet/bandit
	name = "Экзоскелет Бандитов"
	desc = "Экспериментальный образец военного экзоскелета. Никогда не производился серийно из-за чрезвычайной стоимости и некоторых конструктивных недостатков. Несмотря на это, он пользуется спросом благодаря способности брать на себя вес всего переносимого, и поэтому небольшие партии изготавливаются в подземных сооружениях за пределами Украины. Поставляется со встроенным контейнером артефактов."
	icon_state = "exoskeletm"
	item_state = "syndicate-black"
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/exoskelet/bandit

/obj/item/clothing/head/hooded/stalker/sealed/exoskelet/bandit
	name = "Шлем экзоскелета Бандитов"
	icon_state = "exoskeletm_helmet"

/obj/item/clothing/suit/hooded/sealed/exoskelet/monolith
	name = "Экзоскелет монолита"
	desc = "Экспериментальный образец военного экзоскелета. Никогда не производился серийно из-за чрезвычайной стоимости и некоторых конструктивных недостатков. Несмотря на это, он пользуется спросом благодаря способности брать на себя вес всего переносимого, и поэтому небольшие партии изготавливаются в подземных сооружениях за пределами Украины. Поставляется со встроенным контейнером артефактов."
	icon_state = "exoskeletmo"
	item_state = "syndicate-black"
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/exoskelet/monolith

/obj/item/clothing/head/hooded/stalker/sealed/exoskelet/monolith
	name = "Шлем экзоскелета Монолита"
	icon_state = "exoskeletmo_helmet"

/obj/item/clothing/suit/army
	name = "Армейская Броня"
	desc = "Стандартные армейские бронежилеты выдаются всем военнослужащим, охраняющим периметр Зоны. Обеспечивает хорошую защиту от пуль и оружия ближнего боя, абсолютно непригоден для вылазок вглубь Зоны, так как почти не имеет защиты от воздействия аномальных полей."
	icon_state = "army_armor1"
	item_state = "armor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	resistance_flags = UNACIDABLE
	armor = list("melee" = 30, "bullet" = 40, "laser" = 10, "energy" = 25, "bomb" = 10, "bio" = 0, "rad" = 20, "fire" = 25, "psy" = 0)

	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)

	durability = 125
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/mil
	name = "Военный жилет"
	desc = "Плохая защитная экипировка, учреждённая правительственными бюрократами на аутсорсинг тому, кто предложит самую низкую цену. Как правило, выдается вертолетчикам, водителям танков, личному составу тылового звена, военнослужащим срочной службы. Обеспечивает адекватную защиту от мелких мутантов. Хотя его общая боевая защита лучше, чем у кожаных курток, обычно встречающихся у новичков других фракций, на самом деле это мало о чем говорит."
	icon_state = "milbodyarmor"
	item_state = "milbodyarmor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	resistance_flags = UNACIDABLE
	armor = list(melee = 30, bullet = 40, laser = 10,burn = 25, bomb = 10, bio = 0, rad = 15, electro = 25, psy = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 125
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/ballistic
	name = "Бронежилет"
	desc = "Баллистический жилет, обычно используемый фракцией Наёмников. Его конструкция основана на жилете, используемом спецназовцами западных армий. Благодаря специальной обработке ткани, броня обладает усиленной устойчивостью при физическом движении ее пластин. Его защитные свойства немного лучше, чем у военных бронежилетов ПСЗ-7."
	icon_state = "bodyarmor"
	item_state = "bodyarmor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	armor = list(melee = 20, bullet = 45, laser = 10,burn = 15, bomb = 10, bio = 0, rad = 10, electro = 15, psy = 0)
	durability = 150

/obj/item/clothing/suit/civ
	name = "Бронежилет"
	desc = "Устаревший бронежилет, который обеспечит небольшую баллистическую защиту и плохо защищает от мутантов и аномалий."
	icon_state = "flakjacket"
	item_state = "flakjacket"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	armor = list(melee = 20, bullet = 30, laser = 10,burn = 10, bomb = 35, bio = 0, rad = 0, electro = 0, psy = 0)
	durability = 150
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/toggle/flight
	name = "Лётный жилет"
	desc = "Региональная летная куртка. Имеет дополнительную подкладку для дополнительного тепла, а также эластичный слой из хлопкового волокна. Вы должны задаться вопросом, как именно он попал сюда, в зону, кроме как с предыдущей катастрофы."
	icon_state = "flightvest"
	item_state = "flightvest"
	blood_overlay_type = "armor"
	togglename = "buttons"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	armor = list(melee = 45, bullet = 30, laser = 10,burn = 10, bomb = 20, bio = 0, rad = 0, electro = 0, psy = 0)
	durability = 150
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/sixb2
	name = "6Б2"
	desc = "Бронежилет 6Б2 был разработан по заказу Министерства обороны СССР в 1980 году, после чего поставлялся в Советскую Армию. Жилет использовался во всех родах войск Советской Армии во время Афганской войны 1979-1989 годов, и до сих пор остается на вооружении в некоторых постсоветских государствах. Бронежилет имеет среднюю площадь защиты, имеет регулировку высоты в плечевом отделе, застегивается на пользователе с помощью липучек."
	icon_state = "6b2"
	item_state = "6b2"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN
	cold_protection = CHEST|GROIN
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	resistance_flags = UNACIDABLE
	armor = list("melee" = 50, "bullet" = 55, "laser" = 45, "energy" = 30, "bomb" = 60, "bio" = 20, "rad" = 20, "fire" = 20, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 190
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0)

/obj/item/clothing/suit/d2
	name = "Дефендер II"
	desc = "Опыт Первой чеченской войны показал, что личный состав нуждается в прочной защите, которая включает в себя как передние, так и задние пластины, а также защиту шеи и паха, потому что даже одно осколочное ранение может привести к летальному исходу. Для этой проблемы. Компания «Форт Технолоджи» выпустила жилет Защитник 2, который стал стандартным элементом экипировки в различных подразделениях ФСБ, ФСО и Росгвардии. Он обеспечивает пользователям оптимальное защитное покрытие и включает в себя съемные протекторы шеи и паховые накладки. Этот конкретный поставляется с паховой подкладкой."
	icon_state = "d2"
	item_state = "d2"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN
	cold_protection = CHEST|GROIN
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	resistance_flags = UNACIDABLE
	armor = list("melee" = 85, "bullet" = 80, "laser" = 45, "energy" = 60, "bomb" = 80, "bio" = 30, "rad" = 30, "fire" = 20, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 150
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)



/*
/obj/item/clothing/suit/army/army2
	icon_state = "army_armor2"
*/
/obj/item/clothing/suit/army/New()
	..()
	icon_state = "army_armor[rand(1, 2)]"

/obj/item/clothing/suit/berill
	name = "Берил-5M"
	desc = "Этот предмет включает в себя военные бронежилеты серии ПС5 с бериллиевым напылением, модифицированные для использования в Зоне. Предназначен для штурмовых действий в высокорадиоактивных районах, малоэффективен в районах с высокой аномальной активностью. Костюм пробивается к сталкерам через военных, которые обменивают его на добычу. Не поставляется контейнером для артефактов."
	icon_state = "berill_5m"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 40, "bullet" = 60, "laser" = 30, "energy" = 30, "bomb" = 40, "bio" = 30, "rad" = 30, "fire" = 30, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 150
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/guardian_of_freedom
	name = "Защитник Свободы"
	desc = "Военный костюм «Берилл-5М», «одолженный» у военных и модифицированный для фракции свободы. Предназначен для штурмовых действий в высокорадиоактивных районах, малоэффективен в районах с высокой аномальной активностью. Костюм пробивается к сталкерам через военных, которые обменивают его на добычу. Не поставляется с контейнером артефактов."
	icon_state = "guardian_of_freedom"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 40, "bullet" = 60, "laser" = 30, "energy" = 30, "bomb" = 40, "bio" = 35, "rad" = 40, "fire" = 35, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 150
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/hooded/kombez/monolith
	name = "Броня Монолита"
	desc = "Сталкерский костюм, который носит Монолит. Производитель неизвестен. Его защитные свойства немного хуже, чем у военного бронежилета ПСЗ-9А. Его структура похожа на популярный у нейтральных сталкеров костюм, который сочетает в себе бронежилет и костюм радиационной защиты. Он обеспечивает хорошую защиту от выстрелов. Его уровень защиты от аномалий низкий из-за отсутствия системы фильтрации воздуха."
	icon_state = "monolit"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 35, "bullet" = 35, "laser" = 50, "energy" = 30, "bomb" = 40, "bio" = 30, "rad" = 30, "fire" = 30, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/monolith
	durability = 150

/obj/item/clothing/head/hooded/stalker/monolith
	armor = list("melee" = 35, "bullet" = 0, "laser" = 50, "energy" = 50, "bomb" = 0, "bio" = 50, "rad" = 30, "fire" = 50, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_monolit"

/obj/item/clothing/suit/hooded/sealed/monolith
	name = "Научная броня Монолита"
	desc = "Эта броня, предназначенная для проведения исследований в Зоне, сочетает в себе дыхательный модуль замкнутого цикла и внешнее изолирующее покрытие, что обеспечивает отличную защиту от аномалий. Из-за плохой защиты от физического воздействия костюм не является хорошей защитой от пулевых и осколочных повреждений. Он поставляется со встроенным контейнером для транспортировки артефактов."
	icon_state = "monolith_scientific"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 45, "bio" = 65, "rad" = 75, "fire" = 60, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/monolith
	resistance_flags = FIRE_PROOF
	durability = 200
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/monolith
	name = "Шлем Монолитовца Эколога"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 45, "bio" = 65, "rad" = 75, "fire" = 60, "psy" = 0)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "monolith_scientific_helmet"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/hooded/sealed/merc
	name = "Научная броня наёмников"
	desc = "Эта броня, предназначенная для проведения исследований в Зоне, сочетает в себе дыхательный модуль замкнутого цикла и внешнее изолирующее покрытие, что обеспечивает отличную защиту от аномалий. Из-за плохой защиты от физического воздействия костюм не является хорошей защитой от пулевых и осколочных повреждений. Он поставляется со встроенным контейнером для транспортировки артефактов."
	icon_state = "mercace"
	item_state = "mercace"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 45, "bio" = 65, "rad" = 75, "fire" = 60, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/merc
	resistance_flags = FIRE_PROOF
	durability = 200
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/merc
	name = "Шлем Наёмника Эколога"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 45, "bio" = 65, "rad" = 75, "fire" = 60, "psy" = 0)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "mercace_helmet"
	resistance_flags = FIRE_PROOF


/obj/item/clothing/suit/skat
	name = "СКАТ-M9"
	desc = "Этот бронезащитный военный костюм Скат-9М предназначен для штурмовых действий в районах аномальной активности. Он включает в себя тяжелый военный бронекостюм ПСЗ-12П, интегрированный компенсационный костюм и шлем СФЕРА-12M. Он обеспечивает идеальную защиту от пуль и осколков и не снижает мобильность солдата. Имеет сбалансированную систему защиты от аномалий."
	icon_state = "skat"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	resistance_flags = UNACIDABLE
	armor = list("melee" = 60, "bullet" = 70, "laser" = 60, "energy" = 50, "bomb" = 70, "bio" = 35, "rad" = 35, "fire" = 50, "psy" = 0)
	durability = 200
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/hooded/kombez/ps5m
	name = "ПС5-М"
	desc = "Этот современный вариант брони Долга лучше подходит для новобранцев-сталкеров, которые привыкли к легким костюмам. В отличие от серии ПСЗ, этот костюм обеспечивает хорошую защиту от аномалий, а также способен остановить пистолетную пулю. Костюм не может иметь контейне для артефактов, но вместо этого может быть улучшен с помощью системы боевого обеспечения."
	icon_state = "ps5m"
	item_state = "syndicate-black-red"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 30, "bullet" = 35, "laser" = 50, "energy" = 35, "bomb" = 30, "bio" = 30, "rad" = 30, "fire" = 35, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/ps5m
	durability = 200

/obj/item/clothing/head/hooded/stalker/ps5m
	armor = list("melee" = 30, "bullet" = 0, "laser" = 50, "energy" = 35, "bomb" = 0, "bio" = 30, "rad" = 30, "fire" = 35, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_psz9d"

/obj/item/clothing/suit/psz9d
	name = "ПСЗ-9Д"
	desc = "Произведено одним из оборонных научно-исследовательских институтов Киева по заказу фракции Duty. Он такой же простой и надежный, как и стандартная модель ПСЗ-9, но за счет новых материалов обеспечивает хорошую защиту от различных вредных воздействий, в том числе от повреждений огнестрельным оружием. Жилет все еще нуждается в некоторой доработке, потому что у него нет системы защиты органов дыхания."
	icon_state = "psz9d"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	resistance_flags = UNACIDABLE
	armor = list("melee" = 75, "bullet" = 65, "laser" = 50, "energy" = 40, "bomb" = 80, "bio" = 35, "rad" = 45, "fire" = 40, "psy" = 0)
	durability = 200
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/hooded/kombez/mercenary
	name = "Броня Наёмников"
	desc = "Сталкерский костюм от фракции Наёмников. Его конструкция основана на костюме, используемом спецназом западных армий. Благодаря специальной обработке ткани, броня обладает усиленной устойчивостью при физическом движении ее пластин. Его защитные свойства немного лучше, чем у военных бронекостюмов ПСЗ-7."
	icon_state = "mercenary"
	item_state = "syndicate-black"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 20, "bullet" = 45, "laser" = 10, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/mercenary
	durability = 150

/obj/item/clothing/head/hooded/stalker/mercenary
	armor = list("melee" = 20, "bullet" = 0, "laser" = 10, "energy" = 15, "bomb" = 50, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_mercenary"

/obj/item/clothing/suit/hooded/kombez/eco_mercenary
	name = "Научная броня наёмников"
	desc = "Сталкерский костюм от фракции Наёмников с нарукавной повязкой эколога. Его конструкция основана на костюме, используемом спецназом западных армий. Благодаря специальной обработке ткани, броня обладает усиленной устойчивостью при физическом движении ее пластин. Его защитные свойства немного лучше, чем у военных бронекостюмов ПСЗ-7."
	icon_state = "eco_mercenary"
	item_state = "syndicate-black"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 20, "bullet" = 45, "laser" = 10, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/eco_mercenary
	durability = 150

/obj/item/clothing/head/hooded/stalker/eco_mercenary
	armor = list("melee" = 20, "bullet" = 0, "laser" = 10, "energy" = 15, "bomb" = 50, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_eco_merc"

/obj/item/clothing/suit/hooded/kombez/veter
	name = "Комбинезон Ветер Свободы"
	desc = "Производимый ремесленниками группировки «Свобода» облегчённый комбинезон сталкера. Лёгкий армейский бронежилет плюс накладные усиливающие кевларовые пластины. Способен защитить от слабого оружия. Ткань комбинезона обработана специальным составом, повышающим сопротивление аномальной активности."
	icon_state = "veter"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 25, "bullet" = 25, "laser" = 50, "energy" = 65, "bomb" = 30, "bio" = 50, "rad" = 40, "fire" = 65, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/veter
	durability = 200

/obj/item/clothing/head/hooded/stalker/veter
	armor = list("melee" = 25, "bullet" = 0, "laser" = 50, "energy" = 45, "bomb" = 0, "bio" = 20, "rad" = 40, "fire" = 45, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_strazh"

/obj/item/clothing/suit/hooded/strazh
	name = "Страж Свободы"
	desc = "Комбинезон сталкера с усиленным бронежилетом, производимый ремесленниками группировки «Свобода», — удачное сочетание броневой и аномальной защит. Встроенный бронежилет из бронепластин и уложенного в несколько слоёв кевлара способен остановить пистолетную пулю. Для защиты от малых аномальных воздействий ткань костюма пропитана составом Суверен. Оснащён контейнером для артефактов.."
	icon_state = "wind_of_freedom"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 50, "bullet" = 50, "laser" = 30, "energy" = 50, "bomb" = 40, "bio" = 50, "rad" = 40, "fire" = 50, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	hoodtype = /obj/item/clothing/head/hooded/stalker/strazh
	durability = 150
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/strazh
	armor = list("melee" = 25, "bullet" = 0, "laser" = 50, "energy" = 45, "bomb" = 0, "bio" = 20, "rad" = 40, "fire" = 45, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_wind_of_freedom"

/obj/item/clothing/suit/assaultmerc
	name = "Тяжёлая броня Наёмников"
	desc = "Тяжелая броня, используемая наемниками, которая включает в себя многослойный баллистический жилет с протекторами воротника и предплечья, а также пару неопреновопластиковых наручей и поножей для защиты от местных укусов. Вы не уверены, что такой костюм хорошо защитит от аномалий, но для условий зоны лучшей боевой брони найти сложно. "
	icon_state = "assaultmerc"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 50, "bullet" = 65, "laser" = 40, "energy" = 20, "bomb" = 80, "bio" = 20, "rad" = 25, "fire" = 20, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 250
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/hooded/kombez/kombez_bandit
	name = "Броня Бандитов"
	desc = "Костюм сталкера, который носят бандиты. Его конструкция основана на костюме, используемом спецназом западных армий. Благодаря особой обработке ткани, доспехи обладают усиленной устойчивостью при физическом движении своих пластин. Его защитные свойства немного лучше, чем у военных бронекостюмов ПСЗ-7."
	icon_state = "combez_bandit"
	item_state = "syndicate-orange"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 20, "bullet" = 45, "laser" = 10, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/kombez_bandit
	durability = 150

/obj/item/clothing/head/hooded/stalker/kombez_bandit
	armor = list("melee" = 20, "bullet" = 0, "laser" = 10, "energy" = 15, "bomb" = 50, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_combez_bandit"

/obj/item/clothing/suit/hooded/kombez/kombez_renegade
	name = "Броня Ренегатов"
	desc = "Костюм сталкера, который носят Ренегаты. Его конструкция основана на костюме, используемом спецназом западных армий. Благодаря особой обработке ткани, доспехи обладают усиленной устойчивостью при физическом движении своих пластин. Его защитные свойства немного лучше, чем у военных бронекостюмов ПСЗ-7."
	icon_state = "combez_renegade"
	item_state = "syndicate-orange"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 35, "bullet" = 35, "laser" = 10, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/kombez_renegade
	durability = 150

/obj/item/clothing/head/hooded/stalker/kombez_renegade
	armor = list("melee" = 20, "bullet" = 0, "laser" = 10, "energy" = 15, "bomb" = 50, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_combez_renegade"


/obj/item/clothing/suit/hooded/kombez/mercenary/leader
	name = "Броня лидера Наёмников"
	desc = "Обычный доспех наемника с наброшенным поверх него плащом, в очень потрепанном состоянии. Вы удивляетесь, почему никто раньше не думал надевать плащ поверх легких доспехов... Неужели этому что-то мешает?"
	icon_state = "mercleader"
	item_state = "syndicate-black"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 20, "bullet" = 45, "laser" = 10, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	durability = 150

/obj/item/clothing/suit/hooded/kozhanka/ghillie
	name = "Маскхалат"
	desc = "Маскхалат — это тип камуфляжной одежды, напоминающий фоновую среду, такую как листва, снег или песок. Такие костюмы редко используются в Зоне из-за их общей громоздкости и невероятной неудобности, но они особенно ценятся снайперами из-за их способности спрятать вас среди травы."
	icon_state = "ghillie"
	item_state = "ghillie"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)

	resistance_flags = UNACIDABLE
	hoodtype = /obj/item/clothing/head/hooded/stalker/ghillie
	durability = 75
	//МОДИФИКАЦИИ//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/ghillie
	armor = list("melee" = 10, "bullet" = 0, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	icon_state = "ghillie"

/obj/item/clothing/suit/hooded/kombez/kombezrenegadewornd2
	name = "Бронежилет Ренегатов"
	desc = "Переработанный вариант старого костюма. Тем не менее, это не дает никаких гарантий."
	icon_state = "combez_renegade_worn_d2"
	item_state = "combez_renegade_worn_d2"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 20, "bullet" = 45, "laser" = 10, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/banditbrown
	durability = 150
