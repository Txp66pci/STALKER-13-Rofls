/datum/job/ecologist
<<<<<<< HEAD
	title = "Ecologist"
=======
	title = "Эколог"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Ecologist"
	faction = "Station"
	total_positions = -1
	locked = 1
	spawn_positions = -1
	limit_per_player = 1
<<<<<<< HEAD
	description = "Ecologists are a group focusing on researching the Zone, in order to properly harness its potential for the good of mankind. They are largely pacifist when it comes to human conflict, and rely on other factions to offer protection when it comes to embarking on missions into the zone. Your job is to research the wonders of these strange lands and to report your discoveries, and coordinate with those around you to make it all happen."
	enforces = "Stay aware of zone hostilities, stay pleasant and neutral to Zone politics, keep yourself safe and sound in mind, keep lab secure and useable, and write your reports so they can be peer reviewed."
	forbids = "Engage in hostilities outside of self defense, break standard nation laws, undermine security for sake of research, and bum around without doing any work."
	supervisors = "Chief Ecologist"
=======
	description = "Экологов - это группа, занимающаяся исследованием Зоны, чтобы должным образом использовать ее потенциал на благо человечества. Они в значительной степени пацифисты, когда дело доходит до человеческих конфликтов, и полагаются на другие фракции, чтобы предложить защиту, когда дело доходит до выполнения миссий в зоне. Ваша задача состоит в том, чтобы исследовать чудеса этих странных земель и сообщать о своих открытиях, а также координировать свои действия с окружающими, чтобы все это произошло."
	enforces = "Будьте в дали от боевых действий в зоне, оставайтесь нейтральными по отношению к политике зоны, держите себя в целости и сохранности, держите лабораторию пригодной для использования, а также пишите свои отчеты, чтобы их можно было рецензировать."
	forbids = "Участвовать в боевых действиях вне самообороны, нарушать стандартные национальные законы, подрывать безопасность ради исследований и бездельничать, не выполняя никакой работы."
	supervisors = "Главный научный сотрудник"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	selection_color = "#601919"
	whitelist_only = 0
	outfit = /datum/outfit/job/ecologist
	real_rank = "Ecologist"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 600

/datum/outfit/job/ecologist
<<<<<<< HEAD
	name = "Ecologist"
=======
	name = "Эколог"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Ecologist"

/datum/outfit/job/ecologist/pre_equip(mob/living/carbon/human/H)
	..()
	head = null
	uniform = /obj/item/clothing/under/lawyer/blacksuit
	suit = /obj/item/clothing/suit/hooded/sealed/ecolog
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/black
	id = /obj/item/stalker_pda
	belt = /obj/item/storage/belt/stalker/artifact_belt/small
	back = /obj/item/storage/backpack/stalker/tourist
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = /obj/item/radio/off
	suit_store = null
	backpack_contents = list(/obj/item/detector/blink = 1,
							/obj/item/geiger_counter = 1,
							/obj/item/storage/firstaid/ecologists = 1,
							/obj/item/weapon/kitchen/knife/hunting = 1,
							/obj/item/gun/ballistic/automatic/pistol/fort12 = 1,
							/obj/item/ammo_box/magazine/stalker/m9x18fort = 2,
							/obj/item/clothing/accessory/patch/ecologists = 1)
	r_hand = pick(/obj/item/flashlight/seclite,
				/obj/item/flashlight,
				/obj/item/flashlight/flare/torch,
				/obj/item/flashlight/flare)

	faction_s = "Ecologist"

/datum/outfit/ecologist  // For select_equipment
	name = "Ecologist"
	head = null
	uniform = /obj/item/clothing/under/lawyer/blacksuit
	suit = /obj/item/clothing/suit/toggle/labcoat/ecologist_blue
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/black
	id = /obj/item/stalker_pda
	belt = /obj/item/storage/belt/stalker/artifact_belt/small
	back = /obj/item/storage/backpack/stalker/tourist
	l_pocket = /obj/item/storage/wallet/stalker
	r_pocket = /obj/item/radio/off
	suit_store = null
	backpack_contents = list(/obj/item/detector/blink = 1,
							/obj/item/geiger_counter = 1,
							/obj/item/storage/firstaid/ecologists = 1,
							/obj/item/weapon/kitchen/knife/hunting = 1,
							/obj/item/gun/ballistic/automatic/pistol/fort12 = 1,
							/obj/item/ammo_box/magazine/stalker/m9x18fort = 2,
							/obj/item/clothing/accessory/patch/ecologists = 1)
	faction_s = "Ecologist"

/datum/outfit/ecologist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/english, body = FALSE)
	H.grant_language(/datum/language/german, body = FALSE)

/datum/job/ecologistguard
<<<<<<< HEAD
	title = "Ecologist Guard"
=======
	title = "Охранник Экологов"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Ecologist"
	faction = "Station"
	total_positions = -1
	locked = 1
	spawn_positions = -1
	limit_per_player = 1
	description = "Ecologists are a group focusing on researching the Zone, in order to properly harness its potential for the good of mankind. They are largely pacifist when it comes to human conflict, and rely on other factions to offer protection when it comes to embarking on missions into the zone. Your job is to research the wonders of these strange lands and to report your discoveries, and coordinate with those around you to make it all happen."
	enforces = "Stay aware of zone hostilities, stay pleasant and neutral to Zone politics, keep yourself safe and sound in mind, keep lab secure and protect the Ecologists from all threats."
	forbids = "Engage in hostilities outside of self defense, break standard nation laws, undermine security for sake of research, and bum around without doing any work."
	supervisors = "Chief Ecologist"
	selection_color = "#601919"
	whitelist_only = 0
	outfit = /datum/outfit/job/ecologistguard
	real_rank = "Ecologist"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 300

/datum/outfit/job/ecologistguard
<<<<<<< HEAD
	name = "Ecologist Guard"
=======
	name = "Охранник Экологов"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Ecologist"

/datum/outfit/job/ecologistguard/pre_equip(mob/living/carbon/human/H)
	..()
	head = null
	uniform = /obj/item/clothing/under/color/switer/tourist/sweater
	suit = /obj/item/clothing/suit/hooded/kombez/eco_mercenary
	shoes = /obj/item/clothing/shoes/jackboots/warm
	mask = /obj/item/clothing/mask/gas/stalker/mercenary
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	belt = /obj/item/storage/belt/stalker/artifact_belt/small
	back = /obj/item/storage/backpack/stalker/tourist
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = /obj/item/radio/off
	suit_store = /obj/item/gun/ballistic/automatic/mp5
	backpack_contents = list(/obj/item/storage/firstaid/ecologists = 1,
							/obj/item/weapon/kitchen/knife/hunting = 1,
							/obj/item/ammo_box/magazine/stalker/m9x19mp5 = 2,
							/obj/item/clothing/accessory/patch/ecologists = 1)
	faction_s = "Ecologist"
	r_hand = pick(/obj/item/flashlight/lantern,
				/obj/item/flashlight/seclite,
				/obj/item/flashlight,
				/obj/item/flashlight/flare/torch,
				/obj/item/flashlight/flare)

/datum/outfit/ecologist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/english, body = FALSE)
	H.grant_language(/datum/language/german, body = FALSE)

/datum/outfit/ecologistguard  // For select_equipment
	name = "Ecologist Guard"
	head = null
	uniform = /obj/item/clothing/under/color/switer/tourist/sweater
	suit = /obj/item/clothing/suit/hooded/kombez/eco_mercenary
	shoes = /obj/item/clothing/shoes/jackboots/warm
	mask = /obj/item/clothing/mask/gas/stalker/mercenary
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	belt = /obj/item/storage/belt/stalker/artifact_belt/small
	back = /obj/item/storage/backpack/stalker/tourist
	l_pocket = /obj/item/storage/wallet
	r_pocket = /obj/item/radio/off
	suit_store = /obj/item/gun/ballistic/automatic/mp5
	backpack_contents = list(/obj/item/storage/firstaid/ecologists = 1,
							/obj/item/weapon/kitchen/knife/hunting = 1,
							/obj/item/ammo_box/magazine/stalker/m9x19mp5 = 2,
							/obj/item/clothing/accessory/patch/ecologists = 1)
	faction_s = "Ecologist"
	r_hand = /obj/item/flashlight/seclite

/datum/job/chief_ecologist
	title = "Chief Ecologist"
	faction = "Station"
	faction_s = "Ecologist"
	total_positions = 2
	locked = 1
	spawn_positions = 1
	limit_per_player = 1
	selection_color = "#601919"
	whitelist_only = 0
	limit_per_player = 1
	outfit = /datum/outfit/job/chief_ecologist
	real_rank = "Lieutenant"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 900

/datum/job/chief_ecologist
	title = "Chief Ecologist"
	faction_s = "Ecologist"

/datum/outfit/job/chief_ecologist/pre_equip(mob/living/carbon/human/H)
	..()
	head = null
	uniform = /obj/item/clothing/under/lawyer/blacksuit
	suit = /obj/item/clothing/suit/hooded/sealed/ecologm
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/black
	id = /obj/item/stalker_pda
	belt = /obj/item/storage/belt/stalker/artifact_belt
	back = /obj/item/storage/backpack/stalker/tourist
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = /obj/item/radio/off
	suit_store = null
	backpack_contents = list(/obj/item/detector/blink = 1,
							/obj/item/geiger_counter = 1,
							/obj/item/storage/firstaid/ecologists = 1,
							/obj/item/weapon/kitchen/knife/hunting = 1,
							/obj/item/gun/ballistic/automatic/pistol/fort12 = 1,
							/obj/item/ammo_box/magazine/stalker/m9x18fort = 2,
							/obj/item/clothing/accessory/patch/ecologists = 1)
	faction_s = "Ecologist"

/datum/outfit/job/chief_ecologist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/english, body = FALSE)
	H.grant_language(/datum/language/german, body = FALSE)


/datum/outfit/job/chief_ecologist // For select_equipment
	name = "Chief Ecologist"
	head = null
	uniform = /obj/item/clothing/under/lawyer/blacksuit
	suit = /obj/item/clothing/suit/hooded/sealed/ecologm
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/black
	id = /obj/item/stalker_pda
	belt = /obj/item/storage/belt/stalker/artifact_belt
	back = /obj/item/storage/backpack/stalker/tourist
	l_pocket = /obj/item/storage/wallet/stalker
	r_pocket = /obj/item/radio/off
	suit_store = null
	backpack_contents = list(/obj/item/detector/blink = 1,
							/obj/item/geiger_counter = 1,
							/obj/item/storage/firstaid/ecologists = 1,
							/obj/item/weapon/kitchen/knife/hunting = 1,
							/obj/item/gun/ballistic/automatic/pistol/fort12 = 1,
							/obj/item/ammo_box/magazine/stalker/m9x18fort = 2,
							/obj/item/clothing/accessory/patch/ecologists = 1)
	faction_s = "Ecologist"
