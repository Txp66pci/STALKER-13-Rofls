/*
Assistant
*/
/datum/job/army
	title = "Солдат"
	faction_s = "Военные"
//	flag = ASSISTANT
//	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	limit_per_player = 1
	description = "Вооружённые силы Украины, часто называемые военными или армией, являются украинскими солдатами, которые были отправлены в Зону украинским правительством для поддержания безопасности вдоль границ Зоны, чтобы предотвратить несанкционированные вторжения сталкеров и, как следствие, распространение артефактов во внешний мир без государственного надзора."
	enforces = "Защищайте военный контрольно-пропускной пункт, будьте в курсе приказов начальства и выполняйте их с точностью, 'общайтесь' с теми, кто находится в Зоне, чтобы они знали, что военные присутствуют."
	forbids = "Покидать базу самостоятельно, не подчиняться приказам, отданным вышестоящим, и начинайть войны с другими фракциями, прежде чем зачистить их с начальством."
	supervisors = "Лейтенант"
	selection_color = "#2E8B57"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	locked = 1
	outfit = /datum/outfit/job/army
	real_rank = "Военный"
	exp_requirements = 300

/datum/job/army_spetsnaz
	title = "Спецназ"
	faction = "Station"
	faction_s = "Военные"
	limit_per_player = 1
	total_positions = 2
	spawn_positions = 2
	description = "Вооружённые силы Украины, часто называемые военными или армией, являются украинскими солдатами, которые были отправлены в Зону украинским правительством для поддержания безопасности вдоль границ Зоны, чтобы предотвратить несанкционированные вторжения сталкеров и, как следствие, распространение артефактов во внешний мир без государственного надзора."
	enforces = "Защищайте военный контрольно-пропускной пункт, будьте в курсе приказов начальства и выполняйте их с точностью, беря на себя руководство, когда командира нет."
	forbids = "Покидать базу самостоятельно, не подчиняться приказам, отданным вышестоящим, и начинайть войны с другими фракциями, прежде чем зачистить их с начальством."
	supervisors = "Лейтенант"
	selection_color = "#2E8B57"
	whitelist_only = 0
	locked = 1
	outfit = /datum/outfit/job/army_spetsnaz
	real_rank = "Специальный"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 600

/datum/outfit/job/army_spetsnaz
	name = "Спецназ"
	faction_s = "Военные"

/datum/outfit/job/army_spetsnaz/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/skathelmet
	uniform = /obj/item/clothing/under/color/switer/lolg
	suit = /obj/item/clothing/suit/skat
	ears = null
	belt = /obj/item/weapon/kitchen/knife/m9
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	suit_store = /obj/item/gun/ballistic/automatic/ak74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/m545 = 2,/obj/item/reagent_containers/food/snacks/stalker/konserva/fish,/obj/item/storage/firstaid/ifak,/obj/item/flashlight/seclite,/obj/item/clothing/accessory/patch/military)
	r_pocket = /obj/item/radio
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	faction_s = "Военные"

/datum/outfit/job/army_spetsnaz/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/russian, body = FALSE)
	H.grant_language(/datum/language/german, body = FALSE)

/datum/outfit/job/army
	faction_s = "Военные"

/datum/outfit/job/army/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/steel
	uniform = /obj/item/clothing/under/color/switer/lolg
	suit = /obj/item/clothing/suit/army
	ears = null
	belt = /obj/item/weapon/kitchen/knife/m9
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	suit_store = /obj/item/gun/ballistic/automatic/aksu74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/m545 = 2,/obj/item/reagent_containers/food/snacks/stalker/konserva/fish,/obj/item/storage/firstaid/ifak,/obj/item/flashlight/seclite,/obj/item/clothing/accessory/patch/military)
	r_pocket = /obj/item/radio
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	faction_s = "Военные"

/datum/job/militarycommander
	title = "Лейтенант"
	faction_s = "Военные"
	outfit = /datum/outfit/job/militarycommander
	faction = "Station"
	limit_per_player = 1
	total_positions = 2
	locked = 1
	spawn_positions = 2
	description = "Вооружённые силы Украины, часто называемые военными или армией, являются украинскими солдатами, которые были отправлены в Зону украинским правительством для поддержания безопасности вдоль границ Зоны, чтобы предотвратить несанкционированные вторжения сталкеров и, как следствие, распространение артефактов во внешний мир без государственного надзора."
	enforces = "Защищайте военный контрольно-пропускной пункт по умолчанию, создавайте и проводите ротацию отрядов для патрулирования и отряды, направляющиеся домой, для защиты базы."
	forbids = "Покидайть базу самостоятельно по любой причине, приказывать военнослужащим покидать базу в одиночестве, и избегать общения со своими солдатами."
	supervisors = "Высшее командование"
	selection_color = "#2E8B57"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	real_rank = "Лейтенант"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 900

/datum/outfit/job/militarycommander
	name = "Командир"
	faction_s = "Военные"

/datum/outfit/job/militarycommander/pre_equip(mob/living/carbon/human/H)
	head = /obj/item/clothing/head/beret/black
	uniform = /obj/item/clothing/under/color/switer/lolg
	suit = /obj/item/clothing/suit/army
	ears = null
	belt = /obj/item/weapon/kitchen/knife/hunting
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	suit_store = /obj/item/gun/ballistic/automatic/pistol/desert
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/desert = 2,/obj/item/reagent_containers/food/snacks/stalker/konserva/fish,/obj/item/storage/firstaid/ifak,/obj/item/flashlight/seclite,/obj/item/clothing/accessory/patch/military)
	r_pocket = /obj/item/radio
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	faction_s = "Военные"

/datum/outfit/job/militarycommander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/russian, body = FALSE)
	H.grant_language(/datum/language/german, body = FALSE)

/datum/outfit/army  // For select_equipment
	name = "Солдат"

	head = null
	ears = null
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/tourist
	//back2 = /obj/item/gun/ballistic/automatic/aksu74
	suit_store = /obj/item/gun/ballistic/automatic/aksu74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/stalker/b545 = 1,
							/obj/item/ammo_box/magazine/stalker/m545 = 2,
							/obj/item/storage/firstaid/ifak = 1)
	l_pocket = /obj/item/storage/wallet/stalker
	r_pocket = /obj/item/radio
	faction_s = "Военные"

/datum/outfit/army/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = /obj/item/clothing/under/color/switer/lolg
	suit = /obj/item/clothing/suit/army
	l_pocket = pick(/obj/item/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/reagent_containers/food/snacks/stalker/baton)
	r_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)

/datum/outfit/armycommander // For select_equipment
	name = "Лейтенант"

	head = /obj/item/clothing/head/beret_ua
	uniform = /obj/item/clothing/under/color/switer/dark
	suit = /obj/item/clothing/suit/army
	ears = null
	belt = /obj/item/gun/ballistic/automatic/pistol/fort12
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/tourist
	//back2 = /obj/item/gun/ballistic/automatic/ak74
	suit_store = /obj/item/gun/ballistic/automatic/ak74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/stalker/b545ap = 1,
							/obj/item/ammo_box/magazine/stalker/m545 = 2,
							/obj/item/storage/firstaid/ifak = 1,
							/obj/item/reagent_containers/food/drinks/bottle/vodka/kazaki = 1)
	r_pocket = /obj/item/radio
	l_pocket = /obj/item/storage/wallet/stalker
	faction_s = "Военные"
