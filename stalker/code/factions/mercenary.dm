/datum/job/mercenary
<<<<<<< HEAD
<<<<<<< HEAD
	title = "Mercenary"
=======
	title = "Наёмник"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Наёмники"
=======
	title = "Наёмник"
	faction_s = "Наёмники"
>>>>>>> parent of 53b6bb81 (Revert "Фракционки")
//	flag = ASSISTANT
//	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	limit_per_player = 1
	description = "Наемники - это опытные бойцы из всех слоев общества, которые предлагают свои услуги в качестве наемных солдат. Возможно, это бывшие военные, бывшие спецназовцы или, возможно, подпольные бойцы, такие как элитные отряды сопротивления / партизанские отряды, частная военная компания или печально известные террористы разных стран, которые предлагают свои услуги тому, кто больше заплатит. Поскольку у наемников нет установленного этического кодекса, который они должны соблюдать, чувство морали каждой группы наемников может сильно отличаться от другого."
	enforces = "Поддерживайте хорошие отношения с большинством фракций, чтобы вы могли брать у них контракты, пусть все, за кем вы идете, знают что «это просто бизнес» и что вы работаете исключительно за плату, делайте что-то для других только тогда, когда они соглашаются перечислить вам деньги."
	forbids = "Беспорядочно ходить вокруг, пытаясь убить или ограбить сталкеров или других членов фракции, не подчинятся приказам командира наемников и уходить самостоятельно, не общаясь со своими товарищами-наемниками."
	supervisors = "Mercenary Commander"
	selection_color = "#2e708b"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	locked = 1
	outfit = /datum/outfit/job/mercenary
	real_rank = "Специальный"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 300

/datum/outfit/job/mercenary
<<<<<<< HEAD
<<<<<<< HEAD
	name = "Mercenary"
=======
	name = "Наёмник"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Наёмники"
=======
	name = "Наёмник"
	faction_s = "Наёмники"
>>>>>>> parent of 53b6bb81 (Revert "Фракционки")

/datum/outfit/job/mercenary/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/hooded/kombez/mercenary
	mask = /obj/item/clothing/mask/gas/stalker/mercenary
	gloves = /obj/item/clothing/gloves/fingerless
	suit_store = /obj/item/gun/ballistic/automatic/mp5
	belt = pick(
		/obj/item/kitchen/knife/bayonet,
		/obj/item/melee/classic_baton)
	backpack_contents = list(
		/obj/item/ammo_box/magazine/stalker/m9x19mp5 = 2,
		/obj/item/storage/firstaid/ifak = 1,
		/obj/item/flashlight/seclite = 1,
		/obj/item/restraints/handcuffs/cable/zipties,
		/obj/item/clothing/accessory/patch/mercenaries)
	id = /obj/item/stalker_pda
	shoes = /obj/item/clothing/shoes/jackboots/warm
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = pick(
	/obj/item/restraints/handcuffs,
	/obj/item/camera,
	/obj/item/reagent_containers/food/drinks/flask/russian,
	/obj/item/dice/d6,
	/obj/item/clipboard,
	/obj/item/storage/fancy/cigarettes/cigpack_java,
	/obj/item/lighter/greyscale,
	/obj/item/toy/cards/deck)

/datum/outfit/mercenary  // For select_equipment
	name = "Наёмник"

	head = null
	mask = /obj/item/clothing/mask/gas/stalker/mercenary
	suit = /obj/item/clothing/suit/hooded/kombez/mercenary
	ears = null
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/civilian
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/sc45 = 2,
							/obj/item/storage/firstaid/ifak = 1,
							/obj/item/gun/ballistic/automatic/pistol/sip = 1,
							/obj/item/flashlight/seclite = 1)
	l_pocket = /obj/item/storage/wallet/stalker
	faction_s = "Наёмники"

/datum/outfit/job/mercenary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/german, body = FALSE)

/datum/job/mercenarycommander
<<<<<<< HEAD
<<<<<<< HEAD
	title = "Mercenary Commander"
=======
	title = "Командир Наёмников"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Наёмники"
=======
	title = "Командир Наёмников"
	faction_s = "Наёмники"
>>>>>>> parent of 53b6bb81 (Revert "Фракционки")
	faction = "Station"
	total_positions = 4
	locked = 1
	spawn_positions = 4
	limit_per_player = 1
	description = "Наемники - это опытные бойцы из всех слоев общества, которые предлагают свои услуги в качестве наемных солдат. Возможно, это бывшие военные, бывшие спецназовцы или, возможно, подпольные бойцы, такие как элитные отряды сопротивления / партизанские отряды, частная военная компания или печально известные террористы разных стран, которые предлагают свои услуги тому, кто больше заплатит. Поскольку у наемников нет установленного этического кодекса, который они должны соблюдать, чувство морали каждой группы наемников может сильно отличаться от другого."
	enforces = "Координируйте и организуйте наемников и убедитесь, что у них есть поддержка, необходимая для выполнения задач, пусть все, за кем вы идете, знают что «это просто бизнес» и что вы работаете исключительно за плату, делайте что-то для других только тогда, когда они соглашаются перечислить вам деньги."
	forbids = "Беспорядочно ходить вокруг, пытаясь убить или ограбить сталкеров или других членов фракции, подвергать опасности фракцию из за мелочи и уходить самостоятельно, не общаясь со своими товарищами-наемниками."
	supervisors = "Таинственный подрядчик"
	selection_color = "#2e708b"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	limit_per_player = 4
	outfit = /datum/outfit/job/mercenarycommander
	real_rank = "Лейтенант"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 900

/datum/outfit/job/mercenarycommander
<<<<<<< HEAD
<<<<<<< HEAD
	name = "Mercenary Commander"
=======
	name = "Командир Наёмников"
>>>>>>> aa9469d57c9c456b9bb6cc4a0d2454b37a232555
	faction_s = "Наёмники"
=======
	name = "Командир Наёмников"
	faction_s = "Наёмники"
>>>>>>> parent of 53b6bb81 (Revert "Фракционки")

/datum/outfit/job/mercenarycommander/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = UNIFORMPICK
	head = /obj/item/clothing/head/assaultmerc
	suit = /obj/item/clothing/suit/assaultmerc
	gloves = /obj/item/clothing/gloves/fingerless
	suit_store = /obj/item/gun/ballistic/automatic/tpc301
	backpack_contents = list(
		/obj/item/storage/firstaid/ifak = 1,
		/obj/item/ammo_box/magazine/stalker/m556x45 = 2,
		/obj/item/flashlight/seclite = 1,
		/obj/item/restraints/handcuffs/cable/zipties,
		/obj/item/clothing/accessory/patch/mercenaries)
	id = /obj/item/stalker_pda
	shoes = /obj/item/clothing/shoes/jackboots/warm
	l_hand = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = pick(
	/obj/item/restraints/handcuffs,
	/obj/item/camera,
	/obj/item/reagent_containers/food/drinks/flask/commie,
	/obj/item/dice/d6,
	/obj/item/clipboard,
	/obj/item/storage/fancy/cigarettes/cigpack_java,
	/obj/item/lighter/greyscale,
	/obj/item/toy/cards/deck)

/datum/outfit/job/mercenarycommander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/german, body = FALSE)
	H.grant_language(/datum/language/english, body = FALSE)
