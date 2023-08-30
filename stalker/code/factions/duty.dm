/*
Assistant
*/
/datum/job/duty
	title = "Долговец"
	faction_s = "Duty"
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	limit_per_player = 1
	description = "Долг - это военизированный клан сталкеров, действующий в Зоне, члены которого живут по кодексу. Их ряды состоят из бывших военных и сталкеров, которые хотят навести порядок в Зоне и не дать ей распространиться дальше. Им противостоят другие фракции, такие как Свобода, которые считают Зону чудом. Ее члены считают своей главной целью защиту внешнего мира от опасностей, связанных с Зоной."
	enforces = "Работайте со своими товарищами, чтобы нейтрализовать анархистов и мутантов, добывайте артефакты и отдавайте их экологам, стреляйте в Свободовцев, когда это возможно."
	forbids = "Противодействовать сталкерам, причиняя им вред или воруя у них, работа со Свободой, Ренегатами или Бандитами, и вступание в бой с нейтральной фракцией, не спрашивая вышестоящих."
	supervisors = "Лейтенант"
	selection_color = "#601919"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	outfit = /datum/outfit/job/dutysoldier
	real_rank = "Долг"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 300

/datum/outfit/job/dutysoldier  // For select_equipment
	name = "Долговец"
	faction_s = "Duty"
	head = null
	suit = /obj/item/clothing/suit/hooded/kombez/ps5m
	ears = null
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/tourist
	suit_store = /obj/item/gun/ballistic/automatic/aksu74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/stalker/b545 = 1,
							/obj/item/ammo_box/magazine/stalker/m545 = 2,)
	faction_s = "Долг"

/datum/outfit/job/dutysoldier/pre_equip(mob/living/carbon/human/H)
	..()
	head = pick(
		/obj/item/clothing/head/beret,
		/obj/item/clothing/head/ushanka,
		/obj/item/clothing/head/beret/black)
	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/hooded/kombez/ps5m
	mask = pick(
		/obj/item/clothing/mask/cigarette/cigar/havana,
		/obj/item/clothing/mask/bandana/black,
		/obj/item/clothing/mask/cigarette/marlboro)
	ears = null
	belt = /obj/item/kitchen/knife/bayonet
	gloves = /obj/item/clothing/gloves/color/black
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/duty
	suit_store = /obj/item/gun/ballistic/automatic/aksu74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/m545 = 2,/obj/item/reagent_containers/food/snacks/stalker/konserva/fish,/obj/item/storage/firstaid/ai2,/obj/item/clothing/accessory/patch/duty)
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = pick(/obj/item/flashlight/lantern,
		/obj/item/flashlight/seclite,
		/obj/item/flashlight,
		/obj/item/flashlight/flare/torch,
		/obj/item/flashlight/flare,
		/obj/item/lighter/greyscale,
		/obj/item/clothing/mask/cigarette/marlboro,
		/obj/item/storage/box/matches,
		/obj/item/restraints/handcuffs)

/datum/outfit/job/dutysoldier/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/russian, body = FALSE)

/datum/job/barman2
	title = "Бармен"
	faction_s = "Loners"
	locked = 1
//	flag = ASSISTANT
//	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	limit_per_player = 1
	supervisors = ""
	selection_color = "#601919"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	outfit = /datum/outfit/job/barman2
	real_rank = "Бармен"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 600

/datum/outfit/job/barman2
	name = "Бармен"
	faction_s = "Traders"

/datum/outfit/job/barman2/pre_equip(mob/living/carbon/human/H)
	..()
	head = null
	uniform = /obj/item/clothing/under/color/switer/dark
	suit = /obj/item/clothing/suit/jacket/sidor
	ears = null
	belt = /obj/item/gun/ballistic/automatic/pistol/cora
	id = /obj/item/stalker_pda
	shoes = /obj/item/clothing/shoes/sneakers/black
	back = null

/datum/job/duty_lieutenant
	title = "Лейтенант Долга"
	faction_s = "Duty"
	faction = "Station"
	total_positions = 4
	locked = 1
	spawn_positions = 4
	limit_per_player = 1
	description = "Долг - это военизированный клан сталкеров, действующий в Зоне, члены которого живут по кодексу. Их ряды состоят из бывших военных и сталкеров, которые хотят навести порядок в Зоне и не дать ей распространиться дальше. Им противостоят другие фракции, такие как Свобода, которые считают Зону чудом. Ее члены считают своей главной целью защиту внешнего мира от опасностей, связанных с Зоной."
	enforces = "Организуйте солдат в команды, распределив обязанности, спасайте сталкеров от смерти и помогайте им встать на ноги, добывайте артефакты и отдавайте их экологам, стреляйте в Свободовцев на месте, когда это возможно."
	forbids = "Противодействовать сталкерам, причиняя им вред или воруя у них, работа со Свободой, Ренегатами или Бандитами, и вступание в бой с нейтральной фракцией, без серьёзных обстоятельств."
	supervisors = "Майор"
	selection_color = "#601919"
	whitelist_only = 0
	outfit = /datum/outfit/job/duty_lieutenant
	real_rank = "Лейтенант"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 900

/datum/outfit/job/duty_lieutenant
	name = "Лейтенант Долга"
	faction_s = "Duty"

/datum/outfit/job/duty_lieutenant/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/steel
	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/psz9d
	mask = pick(
		/obj/item/clothing/mask/cigarette/cigar/havana,
		/obj/item/clothing/mask/bandana/black)
	ears = null
	belt = /obj/item/weapon/kitchen/knife/hunting
	gloves = /obj/item/clothing/gloves/color/black
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/duty
	suit_store = /obj/item/gun/ballistic/revolver/anaconda
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/stalker/baton,/obj/item/storage/firstaid/ai2,/obj/item/ammo_box/stalker/bmag44  = 1,/obj/item/restraints/handcuffs/cable/zipties,/obj/item/clothing/accessory/patch/duty)
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = pick(
		/obj/item/flashlight/flare,
		/obj/item/lighter/greyscale,
		/obj/item/clothing/mask/cigarette/marlboro
		/obj/item/storage/box/matches,
		/obj/item/restraints/handcuffs)
	r_hand = pick(/obj/item/flashlight/lantern,
				/obj/item/flashlight/seclite,
				/obj/item/flashlight,
				/obj/item/flashlight/flare/torch)

/datum/outfit/job/duty_lieutenant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/russian, body = FALSE)
	H.grant_language(/datum/language/german, body = FALSE)
