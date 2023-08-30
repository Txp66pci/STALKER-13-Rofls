/datum/job/monolith
<<<<<<< HEAD
<<<<<<< HEAD
	title = "Monolith"
=======
	title = "Монолитовец"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Монолит"
=======
	title = "Монолитовец"
	faction_s = "Монолит"
>>>>>>> parent of 53b6bb81 (Revert "Фракционки")
	faction = "Station"
	total_positions = 5//6 total, prior to the introduction of Radar.
	spawn_positions = 5
	limit_per_player = 1
	locked = 1
	supervisors = "Проповедник Монолита"
	enforces = "Благодарим Тебя за то, что раскрыл слугам Твоим козни врагов наших! Озари сиянием Твоим души тех, кто отдал жизнь во исполнение воли Твоей! В бой, защитники Монолита! В бой! Отомстим за павших братьев наших, да будет благословенно вечное их единение с Монолитом!"
	forbids = "Допускать дальнейшее существование всех, кто выступает против священного монолита. (Любая другая фракция, кроме вашей собственной)"
	selection_color = "#601919"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	limit_per_player = 2
	outfit = /datum/outfit/job/monolith// /datum/outfit/job/duty
	real_rank = "Монолитовец"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 300

/datum/outfit/job/monolith
<<<<<<< HEAD
<<<<<<< HEAD
	name = "Monolith"
=======
	name = "Монолитовец"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Монолит"
=======
	name = "Монолитовец"
	faction_s = "Монолит"
>>>>>>> parent of 53b6bb81 (Revert "Фракционки")

/datum/outfit/job/monolith/pre_equip(mob/living/carbon/human/H)
	..()
	head = null
	uniform = UNIFORMPICK
	mask = /obj/item/clothing/mask/gas/stalker
	suit = /obj/item/clothing/suit/hooded/kombez/monolith
	ears = null
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	suit_store = /obj/item/gun/ballistic/automatic/abakan
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/flashlight/seclite = 1, /obj/item/ammo_box/magazine/stalker/m545 = 2, /obj/item/clothing/accessory/patch/monolith = 1, /obj/item/grenade/syndieminibomb/concussion/stalker/frag = 2)
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)

/datum/outfit/job/monolith/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	H.add_trait(TRAIT_BLOWOUT_IMMUNE, TRAIT_GENERIC)
	H.grant_language(/datum/language/german, body = FALSE)
	H.grant_language(/datum/language/english, body = FALSE)
	H.grant_language(/datum/language/russian, body = FALSE)

/datum/outfit/monolith  // For select_equipment
	name = "Монолитовец"

	head = null
	suit = /obj/item/clothing/suit/hooded/kombez/monolith
	ears = null
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/civilian
	suit_store = /obj/item/gun/ballistic/automatic/berettam38
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/berettam38 = 1,
							/obj/item/flashlight/seclite = 1)
	faction_s = "Монолит"

/datum/outfit/monolith/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = UNIFORMPICK
	ears = null
	l_pocket = pick(/obj/item/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/reagent_containers/food/snacks/stalker/baton,/obj/item/storage/firstaid/ai2)
	r_pocket = pick(/obj/item/flashlight/lantern,
				/obj/item/flashlight/seclite,
				/obj/item/flashlight,
				/obj/item/flashlight/flare/torch,
				/obj/item/flashlight/flare)
/datum/job/monolith_hegumen
<<<<<<< HEAD
<<<<<<< HEAD
	title = "Monolith Preacher"
=======
	title = "Проповедник Монолита"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Монолит"
=======
	title = "Проповедник Монолита"
	faction_s = "Монолит"
>>>>>>> parent of 53b6bb81 (Revert "Фракционки")
	faction = "Station"
	total_positions = 1//6 total, prior to the introduction of Radar.
	spawn_positions = 1
	limit_per_player = 1
	locked = 1
	supervisors = "Монолит"
	selection_color = "#601919"
	whitelist_only = 0
	limit_per_player = 1
	outfit = /datum/outfit/job/monolith_hegumen
	real_rank = "Лейтенант"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 900

/datum/outfit/job/monolith_hegumen
<<<<<<< HEAD
<<<<<<< HEAD
	name = "Проповедник Монолита"
=======
	name = "Проповедник Монолита"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Монолит"
=======
	name = "Проповедник Монолита"
	faction_s = "Монолит"
>>>>>>> parent of 53b6bb81 (Revert "Фракционки")

/datum/outfit/job/monolith_hegumen/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/steel
	uniform = UNIFORMPICK
	mask = /obj/item/clothing/mask/gas/stalker
	suit = /obj/item/clothing/suit/hooded/kombez/monolith
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	suit_store = /obj/item/gun/ballistic/automatic/groza
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/sp9x39groza = 2, /obj/item/flashlight/seclite = 1, /obj/item/clothing/accessory/patch/monolith = 1, /obj/item/grenade/syndieminibomb/concussion/stalker/frag = 2)
	shoes = /obj/item/clothing/shoes/jackboots/warm
	r_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	l_pocket = pick(/obj/item/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/reagent_containers/food/snacks/stalker/baton)

/datum/outfit/job/monolith_hegumen/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	H.add_trait(TRAIT_BLOWOUT_IMMUNE, ROUNDSTART_TRAIT)
	H.grant_language(/datum/language/german, body = FALSE)
	H.grant_language(/datum/language/english, body = FALSE)
	H.grant_language(/datum/language/russian, body = FALSE)
