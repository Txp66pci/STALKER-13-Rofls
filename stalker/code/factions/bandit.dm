/*
Assistant
*/
/datum/job/bandit
	title = "Бандит"
	faction_s = "Бандиты"
//	flag = ASSISTANT
//	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	limit_per_player = 1
	description = "Бандиты - это группа, состоящая в основном из бывших преступников, которые прибыли в Зону, чтобы скрыться от закона, торговать оружием или заработать деньги. Они являются силой хаоса в Зоне и, по сути, являются плохими людьми, которые делают плохие вещи хорошим людям."
	enforces = "Сформируйте группу и найдите людей, которых можно грабить и противостоять, сейте хаос между всеми остальными фракциями и эксплуатируйте их, работайте с другими, чтобы дестабилизировать порядок в Зоне."
	forbids = "Работать с Долгом, за исключением чрезвычайных обстоятельств, уходить в одиночку, когда рядом есть другие Бандиты, не будь мудаком, если это не связано с личными интересами, развязывать войны без разрешения босса."
	supervisors = "Пахан или Бармен бандитов"
	selection_color = "#000000"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	locked = 1
	outfit = /datum/outfit/job/bandit
	real_rank = "Bandit"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 300

/datum/job/banditboss
	title = "Пахан"
	faction_s = "Бандиты"
	faction = "Station"
	total_positions = 2
	locked = 1
	spawn_positions = 2
	limit_per_player = 1
	description = "Бандиты - это группа, состоящая в основном из бывших преступников, которые прибыли в Зону, чтобы скрыться от закона, торговать оружием или заработать деньги. Они являются силой хаоса в Зоне и, по сути, являются плохими людьми, которые делают плохие вещи хорошим людям."
	enforces = "Organize your fellow bandits and coordinate outbound groups and homebound groups, cause chaos between and exploit all the other factions, work with others to destabalize the order in the Zone."
	forbids = "Работайть с Долгом, за исключением чрезвычайных обстоятельств, ставить под угрозу всю свою фракцию из-за чего-то незначительного."
	supervisors = "Султан"
	selection_color = "#000000"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access(
	whitelist_only = 0
	outfit = /datum/outfit/job/banditboss
	real_rank = "Lieutenant"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 900

/datum/job/bandit_barman
	title = "Бармен бандитов"
	faction_s = "Бандиты"
	faction = "Station"
	total_positions = 1
	locked = 1
	spawn_positions = 1
	limit_per_player = 1
	description = "Bandits are a group of mostly ex-criminals who came in the Zone either to escape from the law, trade weapons or make money. They are a force of chaos within the Zone, and are essentially bad people who do bad things to good people."
	enforces = "Помогите организовать бандитов, если босса-бандита нет, и действуйте в качестве заместителя командующего, грабьте всех, кто не является бандитом, как можете, вооружайте своих товарищей-бандитов и предоставляйте им инструменты для дальнейшего антагонизма в Зоне."
	forbids = "Работайть с Долгом, за исключением чрезвычайных обстоятельств, ставить под угрозу всю свою фракцию из-за чего-то незначительного."
	supervisors = "Пахан"
	selection_color = "#000000"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()
	whitelist_only = 0
	outfit = /datum/outfit/job/bandit_barman
	real_rank = "Bartender"
	exp_type = EXP_TYPE_CREW
	exp_requirements = 900

/datum/outfit/job/bandit
	name = "Бандит"
	faction_s = "Бандиты"

/datum/outfit/job/bandit/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/hooded/kozhanka/banditka
	ears = null
	mask = pick(
		/obj/item/clothing/mask/cigarette/cigar/cohiba,
		/obj/item/clothing/mask/bandana/skull,
		/obj/item/clothing/mask/cigarette/rollie/cannabis,
		/obj/item/clothing/mask/bandana/black,
		/obj/item/clothing/mask/pig,
		/obj/item/clothing/mask/balaclava)
	id = /obj/item/stalker_pda
	belt = pick(
		/obj/item/kitchen/knife/tourist,
		/obj/item/kitchen/knife/butcher,
		/obj/item/crowbar/large)
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/stalker/konserva/shproti,/obj/item/storage/firstaid/ai2,/obj/item/flashlight/lantern,/obj/item/clothing/accessory/patch/bandits)
	r_pocket = pick(
		/obj/item/gun/ballistic/automatic/pistol/pm,
		/obj/item/gun/ballistic/automatic/pistol/pb1s)
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)

/datum/outfit/job/banditboss
	name = "Пахан"
	faction_s = "Бандиты"

/datum/outfit/job/banditboss/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/hooded/kozhanka/banditka/unique
	ears = null
	mask = pick(
		/obj/item/clothing/mask/cigarette/cigar/cohiba,
		/obj/item/clothing/mask/cigarette/cigar/havana,
		/obj/item/clothing/mask/cigarette/rollie/cannabis,
		/obj/item/clothing/mask/balaclava)
	id = /obj/item/stalker_pda
	belt = pick(
		/obj/item/kitchen/knife/butcher,
		/obj/item/crowbar/large)
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/stalker/konserva/shproti,/obj/item/storage/firstaid/ai2,/obj/item/ammo_box/magazine/stalker/sc45 = 2,/obj/item/clothing/accessory/patch/bandits)
	r_pocket = /obj/item/gun/ballistic/automatic/pistol/sip
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)

/datum/outfit/job/banditboss/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/russian, body = FALSE)

/datum/outfit/job/bandit_barman
	name = "Бармен бандитов"
	faction_s = "Бандиты"

/datum/outfit/job/bandit_barman/pre_equip(mob/living/carbon/human/H)
	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/hooded/kozhanka/banditka
	ears = null
	id = /obj/item/stalker_pda
	belt = /obj/item/gun/ballistic/shotgun/bm16/sawnoff
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots/warm
	head = /obj/item/clothing/head/bowler
	back = /obj/item/storage/backpack/stalker/tourist
	backpack_contents = list(/obj/item/stack/spacecash/c5000 = 40,
						/obj/item/ammo_box/stalker/b12x70 = 2,
						/obj/item/flashlight/seclite = 1,
						/obj/item/storage/firstaid/ai2,
						/obj/item/clothing/accessory/patch/bandits)
	l_pocket = pick(/obj/item/storage/wallet,
				/obj/item/storage/wallet/brown,
				/obj/item/storage/wallet/alt)
	r_pocket = pick(/obj/item/reagent_containers/food/drinks/bottle/vodka/stolichnaya,
				/obj/item/reagent_containers/food/drinks/bottle/vodka/kazaki,
				/obj/item/reagent_containers/food/drinks/bottle/vodka/blacklabelvodka,
				/obj/item/reagent_containers/food/drinks/bottle/vodka,
				/obj/item/reagent_containers/food/drinks/bottle/vodka/badminka,
				/obj/item/reagent_containers/food/drinks/bottle/vodka/bluegoose,
				/obj/item/reagent_containers/food/drinks/bottle/vodka/stalkervodka)

/datum/outfit/job/bandit_barman/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_language(/datum/language/russian, body = FALSE)

/datum/outfit/bandit  // For select_equipment
	name = "Бандит"
	faction_s = "Бандиты"

	suit = /obj/item/clothing/suit/hooded/kozhanka/banditka
	ears = null
	id = /obj/item/stalker_pda
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots/warm
	mask = /obj/item/clothing/mask/balaclava
	back = /obj/item/storage/backpack/stalker/tourist
	backpack_contents = list(/obj/item/stack/spacecash/c1000 = 1, /obj/item/ammo_box/magazine/stalker/m9x18pm =  2)
	r_pocket = /obj/item/gun/ballistic/automatic/pistol/pm
