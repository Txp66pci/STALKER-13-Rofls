/datum/job/freedom
	title = "Свободовец"
	faction_s = "Свобода"
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	limit_per_player = 1
	description = "Свобода - это анархисты и смельчаки, которые объявляют себя борцами за свободный доступ в Зону и, следовательно, находятся в постоянном конфликте с армией, военными сталкерами и Долгом. Эти так называемые воины свободы верят в то, что они делятся всей информацией о Зоне с остальным миром и бросают вызов монополии государства на секреты и чудеса Зоны."
	enforces = "Работайте с другими членами фракции Свободы, чтобы патрулировать Зону, спасайте сталкеров от смерти и помогайте им встать на ноги, преодолевайте хватку угнетения со стороны различных воинствующих группировок, которые душат тех, кто находится в Зоне, и стреляйте в Долгарей на месте."
	forbids = "Противодействовать сталкерам, причиняя им вред или воруя у них, создавать конфликты с другими фракциями без разрешения руководства, убегать в одиночку, не сообщая другим о том, что вы делаете, и работать с Военными или Долгом."
	supervisors = "Лейтенант"
	selection_color = "#601919"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	outfit = /datum/outfit/freedomrookie
	real_rank = "Freedom"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 300

/datum/outfit/job/freedomrookie
	name = "Свободовец"

/datum/outfit/freedomrookie/pre_equip(mob/living/carbon/human/H)
	..()
	head = pick(
		/obj/item/grown/sunflower,
		/obj/item/clothing/head/ushanka)
	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/hooded/kombez/veter
	mask = pick(
		/obj/item/clothing/mask/cigarette/rollie/cannabis,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/mask/bandana/green)
	ears = null
	belt = /obj/item/kitchen/knife/bayonet
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/civilian
	suit_store = /obj/item/gun/ballistic/automatic/aksu74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/m545 = 2,/obj/item/reagent_containers/food/snacks/stalker/baton,/obj/item/storage/firstaid/ai2,/obj/item/clothing/accessory/patch/freedom)
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = pick(/obj/item/flashlight/flare,
		/obj/item/flashlight/lantern,
		/obj/item/flashlight/seclite,
		/obj/item/flashlight,
		/obj/item/flashlight/flare/torch,
		/obj/item/clothing/mask/cigarette/rollie/cannabis,
		/obj/item/lighter/greyscale,
	/obj/item/storage/box/matches)
	faction_s = "Свобода"

/datum/outfit/freedomrookie  // For select_equipment
	name = "Свободовец"
	suit = /obj/item/clothing/suit/hooded/kombez/veter
	ears = null
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/civilian
	suit_store = /obj/item/gun/ballistic/automatic/pistol/cora
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/sc45 = 2)
	faction_s = "Свобода"

/datum/outfit/freedomrookie/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/english, body = FALSE)

/datum/job/freedom_lieutenant
	title = "Лейтенант Свободы"
	faction_s = "Свобода"
	faction = "Station"
	total_positions = 4
	locked = 1
	spawn_positions = 4
	limit_per_player = 1
	description = "Свобода - это анархисты и смельчаки, которые объявляют себя борцами за свободный доступ в Зону и, следовательно, находятся в постоянном конфликте с армией, военными сталкерами и Долгом. Эти так называемые воины свободы верят в то, что они делятся всей информацией о Зоне с остальным миром и бросают вызов монополии государства на секреты и чудеса Зоны."
	enforces = "Организуйте солдат в команды, распределив обязанности, спасайте сталкеров от смерти и помогайте им встать на ноги, победите хватку угнетения со стороны различных воинствующих группировок, которые душат тех, кто находится в Зоне, и установите хорошие отношения с различными фракциями, такими как бандиты и одиночки."
	forbids = "Противодействовать сталкерам, причиняя им вред или воруя у них, создавать конфликты с другими фракциями без разрешения руководства, убегать в одиночку, не сообщая другим о том, что вы делаете, и работать с Военными или Долгом."
	supervisors = "Лейтенант"
	selection_color = "#601919"
	whitelist_only = 0
	outfit = /datum/outfit/job/freedom_lieutenant
	real_rank = "Lieutenant"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 900

/datum/outfit/job/freedom_lieutenant
	name = "Лейтенант Свободы"
	faction_s = "Свобода"

/datum/outfit/job/freedom_lieutenant/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/steel
	uniform = /obj/item/clothing/under/color/switer
	suit = /obj/item/clothing/suit/hooded/strazh
	mask = pick(
		/obj/item/clothing/mask/cigarette/rollie/cannabis,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/mask/bandana/green)
	ears = null
	belt = /obj/item/weapon/kitchen/knife/hunting
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/civilian
	suit_store = /obj/item/gun/ballistic/revolver/anaconda
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/stalker/baton,/obj/item/storage/firstaid/ai2,/obj/item/ammo_box/stalker/bmag44  = 1,/obj/item/restraints/handcuffs/cable/zipties,/obj/item/toy/figure/botanist,/obj/item/clothing/accessory/patch/freedom)
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = pick(
		/obj/item/flashlight/flare,
		/obj/item/lighter/greyscale,
		/obj/item/clothing/mask/cigarette/rollie/cannabis,
		/obj/item/storage/box/matches,)
	r_hand = pick(/obj/item/flashlight/lantern,
				/obj/item/flashlight/seclite,
				/obj/item/flashlight,
				/obj/item/flashlight/flare/torch)

/datum/outfit/job/freedom_lieutenant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/english, body = FALSE)
	H.grant_language(/datum/language/german, body = FALSE)
