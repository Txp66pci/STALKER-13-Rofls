/*
Assistant
*/
/datum/job/tourist
	title = "Турист"
	faction_s = "Туристы"
//	flag = ASSISTANT
//	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	description = "Туристы - это люди со всего мира, которые приехали в Зону с целями, варьирующимися от наивного любопытства, до грандиозных поисков богатства и побега от прошлого со скелетами в шкафу. Туристы являются аутсайдерами Зоны, и их легко недооценить, однако по-настоящему здравые воспользуются истинным потенциалом и бесфракционной природой своего положения и превратят его в нечто большее, чем они сами."
	enforces = "Сделайте несколько снимков или запишите свое путешествие на магнитофон, пообщайтесь с различными фракциями в этом районе, расслабьтесь и наслаждайтесь временем, пока вы еще можете."
	forbids = "Беспорядочно, бессловесно нападать на других, умирать ужасной медленной смертью и быть сварливым и унылым - в конце концов, вы в отпуске!"
	supervisors = "no one"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	outfit = /datum/outfit/job/tourist

/datum/job/stalker
	title = "Сталкер"
	faction_s = "Одиночки"
//	flag = ASSISTANT
//	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	description = "Одиночки - это те, кто не является частью какой-либо фракции и населяют Зону как кочевые, независимые сталкеры. Несмотря на то, что они сами по себе не являются полноценной фракцией, они часто заботятся друг о друге и дружат друг с другом, чтобы сосуществовать в Зоне."
	enforces = "Исследуйте Зону в поисках артефактов, выживайте и сражайтесь с мутантами и необычайными угрозами, а также совершайте открытия за пределами своего воображения."
	forbids = "Причинять вред или воровать у других одиночек самостоятельно или в результате присоединения к другим фракциям."
	supervisors = "Старые сталкеры (на ваше усмотрение)"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	outfit = /datum/outfit/job/stalker

/datum/job/oldstalker
	title = "Старый Сталкер"
	faction_s = "Одиночки"
	faction = "Station"
	locked = 1
	total_positions = -1
	spawn_positions = -1
	limit_per_player = 1
	description = "Одиночки - это те, кто не является частью какой-либо фракции и населяют Зону как кочевые, независимые сталкеры. Несмотря на то, что они сами по себе не являются полноценной фракцией, они часто заботятся друг о друге и дружат друг с другом, чтобы сосуществовать в Зоне."
	enforces = "Исследуйте Зону в поисках артефактов, выживайте и сражайтесь с мутантами и необычайными угрозами, а также совершайте открытия за пределами своего воображения."
	forbids = "Причинять вред или воровать у других одиночек самостоятельно или в результате присоединения к другим фракциям."
	supervisors = "Старые сталкеры (на ваше усмотрение)"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	outfit = /datum/outfit/job/oldstalker
	real_rank = "Специальный"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 900

/*/datum/job/assistant/get_access()
	if((config.jobs_have_maint_access & ASSISTANTS_HAVE_MAINT_ACCESS) || !config.jobs_have_minimal_access) //Config has assistant maint access set
		. = ..()
		. |= list(access_maint_tunnels)
	else
		return ..()*/


/datum/outfit/job/stalker
	name = "Одиночка"
	faction_s = "Одиночки"

/datum/outfit/job/stalker/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = UNIFORMPICK
	suit = pick(/obj/item/clothing/suit/hooded/kozhanka,/obj/item/clothing/suit/hooded/kozhanka/white)
	head = pick(
		/obj/item/clothing/head/beanie/orange,
		/obj/item/clothing/head/flatcap,
		/obj/item/clothing/head/beanie/black)
	mask = pick(
		/obj/item/clothing/mask/bandana/black,
		/obj/item/clothing/mask/cigarette/cigar,
		/obj/item/clothing/mask/cigarette/marlborogold,
		/obj/item/clothing/mask/cigarette/rollie/cannabis)
	ears = null
	id = /obj/item/stalker_pda
	belt = /obj/item/gun/ballistic/automatic/pistol/tt
	gloves = pick(
		/obj/item/clothing/gloves/color/brown,
		/obj/item/clothing/gloves/color/black,
		/obj/item/clothing/gloves/fingerless)
	shoes = pick(
		/obj/item/clothing/shoes/jackboots/warm,
		/obj/item/clothing/shoes/winterboots,
		/obj/item/clothing/shoes/workboots/mining,
		/obj/item/clothing/shoes/workboots)
	backpack = pick(
		/obj/item/storage/backpack/explorer,
		/obj/item/storage/backpack/satchel/explorer,
		/obj/item/storage/backpack/stalker/civilian)
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/tt,/obj/item/ammo_box/magazine/stalker/tt,/obj/item/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/storage/firstaid/ai2,/obj/item/clothing/accessory/patch/loner)
	r_pocket = pick(
		/obj/item/kitchen/knife/tourist,
		/obj/item/hatchet)
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_hand = pick(/obj/item/flashlight/lantern,
				/obj/item/flashlight/seclite,
				/obj/item/flashlight,
				/obj/item/flashlight/flare/torch,
				/obj/item/flashlight/flare)

/datum/outfit/stalker  // For select_equipment
	name = "Одиночка"
	uniform = /obj/item/clothing/under/color/switer
	suit = /obj/item/clothing/suit/hooded/kozhanka
	ears = null
	id = /obj/item/stalker_pda
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/stack/spacecash/c5000 = 1, /obj/item/storage/box/matches = 1)
	back = /obj/item/storage/backpack/stalker/civilian
	r_pocket = /obj/item/reagent_containers/food/snacks/stalker/kolbasa
	faction_s = "Одиночки"

/datum/outfit/job/oldstalker
	name = "Старый Сталкер"

/datum/outfit/job/oldstalker/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/hooded/kombez
	ears = null
	mask = pick(
		/obj/item/clothing/mask/cigarette/cigar,
		/obj/item/clothing/mask/gas/stalker,
		/obj/item/clothing/mask/cigarette/marlborogold,
		/obj/item/clothing/mask/cigarette/rollie/cannabis)
	head = pick(/obj/item/clothing/head/ssh,
				/obj/item/clothing/head/steel,
				/obj/item/clothing/head/tsh)
	belt = /obj/item/gun/ballistic/automatic/pistol/usp_match
	id = /obj/item/stalker_pda
	gloves = pick(
		/obj/item/clothing/gloves/color/brown,
		/obj/item/clothing/gloves/color/black,
		/obj/item/clothing/gloves/fingerless)
	shoes = pick(
		/obj/item/clothing/shoes/jackboots/warm,
		/obj/item/clothing/shoes/winterboots,
		/obj/item/clothing/shoes/workboots/mining,
		/obj/item/clothing/shoes/workboots)
	backpack = pick(
		/obj/item/storage/backpack/explorer,
		/obj/item/storage/backpack/satchel/explorer,
		/obj/item/storage/backpack/stalker/professional)
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/usp45,/obj/item/ammo_box/magazine/stalker/usp45,/obj/item/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/stack/medical/gauze/bint,/obj/item/flashlight/flare = 3,/obj/item/clothing/accessory/patch/loner)
	suit_store = pick(/obj/item/gun/ballistic/automatic/ak74/blackout,
				/obj/item/gun/ballistic/automatic/ak74/black,
				/obj/item/gun/ballistic/automatic/ak74/camo,
				/obj/item/gun/ballistic/automatic/ak74,
				/obj/item/gun/ballistic/automatic/ak74/unfurnished)
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = /obj/item/twohanded/binoculars
	r_hand = /obj/item/weapon/kitchen/knife/hunting
	l_hand = pick(/obj/item/flashlight/lantern,
				/obj/item/flashlight/seclite,
				/obj/item/flashlight,
				/obj/item/flashlight/flare/torch,
				/obj/item/flashlight/flare)

/datum/outfit/job/oldstalker/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/russian, body = FALSE)

/datum/outfit/stalkervolk  // For select_equipment
	name = "Старый Сталкер"
	uniform = /obj/item/clothing/under/color/switer
	suit = /obj/item/clothing/suit/hooded/kombez
	ears = null
	id = /obj/item/stalker_pda
	belt = /obj/item/weapon/kitchen/knife/hunting
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/stalker/b545 = 1, /obj/item/ammo_box/magazine/stalker/m545 = 2, /obj/item/storage/firstaid/ai2 = 1, /obj/item/stack/spacecash/c5000 = 1, /obj/item/flashlight/seclite = 1,/obj/item/storage/firstaid/ai2)
	suit_store = /obj/item/gun/ballistic/automatic/ak74
	back = /obj/item/storage/backpack/stalker/tourist
	r_pocket = /obj/item/reagent_containers/food/snacks/stalker/konserva
	faction_s = "Одиночки"

/datum/outfit/job/tourist
	name = "Турист"

/datum/outfit/job/tourist/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/color/switer/tourist/sweater,
		/obj/item/clothing/under/color/switer/tourist/jacket_green,
		/obj/item/clothing/under/color/switer/tourist/jacket_brown,
		/obj/item/clothing/under/color/switer/tourist/suspenders,
		/obj/item/clothing/under/color/switer/tourist/mall_cop,
		/obj/item/clothing/under/color/switer/tourist/gorka)
	suit = pick(
		/obj/item/clothing/suit/kozhanka/tourist/jacket,
		/obj/item/clothing/suit/kozhanka/tourist/coat,
		/obj/item/clothing/suit/kozhanka/tourist/gorka)
	ears = null
	head = pick(
		/obj/item/clothing/head/fedora/curator,
		/obj/item/clothing/head/bowler,
		/obj/item/clothing/head/ushanka,
		/obj/item/clothing/head/beanie/black,
		/obj/item/clothing/head/fedora)
	glasses = pick(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/glasses/orange,
		/obj/item/clothing/glasses/sunglasses/big)
	id = /obj/item/stalker_pda
	belt = pick(
		/obj/item/kitchen/knife/tourist,
		/obj/item/kitchen/knife,
		/obj/item/storage/belt/fannypack/black,
		/obj/item/switchblade)
	gloves = pick(
		/obj/item/clothing/gloves/color/brown,
		/obj/item/clothing/gloves/color/black,
		/obj/item/clothing/gloves/fingerless)
	shoes = SHOESPICK_TOURIST
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/stack/medical/gauze/bint,/obj/item/reagent_containers/food/snacks/stalker/konserva,/obj/item/reagent_containers/food/snacks/stalker/baton)
	back = pick(
		/obj/item/storage/backpack/stalker/tourist,
		/obj/item/storage/backpack/satchel/stalker/civilian,
		/obj/item/storage/backpack/satchel/leather)
	l_pocket = pick(
				/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_hand = pick(
		/obj/item/camera,
		/obj/item/taperecorder,
		/obj/item/clothing/accessory/pocketprotector/full ,
		/obj/item/clipboard, /obj/item/twohanded/binoculars,
		/obj/item/flashlight/pen, /obj/item/hand_labeler,
		/obj/item/modular_computer/tablet/preset/cheap,
		/obj/item/megaphone,
		/obj/item/instrument/saxophone,
		/obj/item/lighter,
		/obj/item/soap/deluxe,
		/obj/item/storage/bag/trash,
		/obj/item/toy/eightball,
		/obj/item/melee/flyswatter)

/datum/outfit/job/tourist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/english, body = FALSE)
	H.grant_language(/datum/language/german, body = FALSE)

/datum/outfit/tourist  // For select_equipment
	name = "Турист"
	uniform = /obj/item/clothing/under/color/switer/tourist/suspenders
	suit = /obj/item/clothing/suit/kozhanka/tourist/gorka
	ears = null
	id = /obj/item/stalker_pda
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/color/brown
	shoes = /obj/item/clothing/shoes/sandal
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/stack/medical/gauze/bint,/obj/item/reagent_containers/food/snacks/stalker/konserva,/obj/item/reagent_containers/food/snacks/stalker/baton)
	back = /obj/item/storage/backpack/stalker/tourist
	r_pocket = /obj/item/gun/ballistic/revolver/nagant
	faction_s = "Туристы"

/datum/job/trader
	title = "Торговец"
	faction_s = "Одиночки"
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
	outfit = /datum/outfit/job/trader

/datum/outfit/job/trader
	name = "Торговец"
	faction_s = "Одиночки"

/datum/outfit/job/trader/pre_equip(mob/living/carbon/human/H)
	..()
	head = null
	uniform = /obj/item/clothing/under/color/switer/dark
	suit = /obj/item/clothing/suit/jacket/sidor
	ears = null
	belt = /obj/item/gun/ballistic/automatic/pistol/cora
	id = /obj/item/stalker_pda
	shoes = /obj/item/clothing/shoes/sneakers/black
	back = null
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = pick(/obj/item/flashlight/lantern,
				/obj/item/flashlight/seclite,
				/obj/item/flashlight,
				/obj/item/flashlight/flare/torch,
				/obj/item/flashlight/flare)

/datum/job/barman
	title = "Бармен"
	faction_s = "Одиночки"
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
	outfit = /datum/outfit/job/barman
	real_rank = "Бармен"

/datum/outfit/job/barman
	name = "Бармен"
	faction_s = "Одиночки"

/datum/outfit/job/barman/pre_equip(mob/living/carbon/human/H)
	..()
	head = null
	uniform = /obj/item/clothing/under/color/switer/dark
	suit = /obj/item/clothing/suit/jacket/sidor
	ears = null
	belt = /obj/item/gun/ballistic/automatic/pistol/cora
	id = /obj/item/stalker_pda
	shoes = /obj/item/clothing/shoes/sneakers/black
	back = null
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_hand = pick(/obj/item/flashlight/lantern,
				/obj/item/flashlight/seclite,
				/obj/item/flashlight,
				/obj/item/flashlight/flare/torch,
				/obj/item/flashlight/flare)
