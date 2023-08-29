var/id_ = 0

/obj/structure/stalker/modification_table
	name = "Стол модификаций"
	desc = "Стол, который позволяет вам вкладывать деньги и время в улучшение вашего снаряжения."
	icon = 'stalker/icons/weapon_mods.dmi'
	icon_state = "modification_table"
	layer = 2.8
	var/datum/browser/popup = null
	var/obj/item/modificated = null
	var/balance = 0
	density = 1
	anchored = 1
	var/list/modifications_list = list(
	/////////////////////////////////////////////////////////////////////////////////////
		"Подкладки" = list(
		//LINNING I
			new /datum/data/modification/clothing/suit/lining/rubberoid(),
			new /datum/data/modification/clothing/suit/lining/thinsulate(),
		//LINNING II
			new /datum/data/modification/clothing/suit/lining/nitrile(),
			new /datum/data/modification/clothing/suit/lining/fiberglass()
		),
		"Материал" = list(
		//MATERIAL I
			new /datum/data/modification/clothing/suit/material/kevlar(),
			new /datum/data/modification/clothing/suit/material/lead(),
			new /datum/data/modification/clothing/suit/material/alloy(),

			new /datum/data/modification/clothing/head/material/kevlar(),
		//MATERIAL II
			new /datum/data/modification/clothing/suit/material/composite(),
			new /datum/data/modification/clothing/suit/material/wolfram(),
			new /datum/data/modification/clothing/suit/material/alloy_advanced(),

			new /datum/data/modification/clothing/head/material/composite()
		),
		"Набивка" = list(
		//PADDING I
			new /datum/data/modification/clothing/suit/padding/steelfiber(),
			new /datum/data/modification/clothing/suit/padding/neylon(),

			new /datum/data/modification/clothing/head/padding/psionic(),
			new /datum/data/modification/clothing/head/padding/filter(),
		//PADDING II
			new /datum/data/modification/clothing/suit/padding/twaron(),
			new /datum/data/modification/clothing/suit/padding/teflon(),

			new /datum/data/modification/clothing/head/padding/psionic_advanced(),
			new /datum/data/modification/clothing/head/padding/filter_advanced()
		),
		"Визор" = list(
		//NIGHTVISION I + II
			new /datum/data/modification/clothing/suit/nightvision/basic(),	//Костюм с замкнутой системой дыхания - ночное виденье
			new /datum/data/modification/clothing/suit/nightvision/advanced(),
			new /datum/data/modification/clothing/head/nightvision/basic(),	//Шлем - ночное виденье
			new /datum/data/modification/clothing/head/nightvision/advanced(),
			new /datum/data/modification/clothing/mask/nightvision/basic(),	//Противогаз
			new /datum/data/modification/clothing/mask/nightvision/advanced()
		),
		//"Accessory Slot" = list(
		//ACCESSORY SLOT I
		//new /datum/data/modification/clothing/suit/accessory/webbing(),
		//new /datum/data/modification/clothing/suit/accessory/container(),
		//new /datum/data/modification/clothing/suit/accessory/guncase(),
		//ACCESSORY SLOT II
		//new /datum/data/modification/clothing/suit/accessory/webbing/advanced(),
		//new /datum/data/modification/clothing/suit/accessory/container/advanced(),
		//ACESSORY SLOT III
		//new /datum/data/modification/clothing/suit/accessory/webbing/modern(),
		//new /datum/data/modification/clothing/suit/accessory/container/modern()
		//)//NEED REWORK
	)
	/////////////////////////////////////////////////////////////////////////////////////

/datum/data/modification
	name = "модификация"
	var/cost = 5000
	var/desc = "Это модификация"
	var/list/add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	var/id = null
	var/tier = 1
	var/modificated_type = null
/*
/datum/data/modification/New()
	if(!id)
		id_++
		id = num2text(id_)
*/
/datum/data/modification/proc/AffectEquipment(var/obj/item/I)
	I.modifications[id]++
	I.unique = 1
	I.update_icon()
	return 1

/datum/data/modification/proc/SpecialCheck(var/obj/item/I)
	return 1

/datum/data/modification/clothing
	name = "Модификация одежды"
	desc = "You shouldn't see this."

/datum/data/modification/clothing/AffectEquipment(var/obj/item/I)
	//I.armor = getArmor(arglist(I.armor))
	add_armor = getArmor(arglist(add_armor))
	I.armor = I.armor.attachArmor(add_armor)
	//I.modifications += src.id
	return ..(I)
////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////МОДИФИКАЦИИ ШЛЕМОВ (и масок)///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/data/modification/clothing/head
	name = "Модификации шлема"
	desc = "это модификация шлема."
	modificated_type = /obj/item/clothing/head

/datum/data/modification/clothing/head/material
	name = "Модификации материала"
	id = "material_head"

/datum/data/modification/clothing/head/padding
	name = "Модификации вкладок"
	id = "padding_head"

/////////////////////////////////////MATERIAL - I TIER//////////////////////////////////////////////////////
/datum/data/modification/clothing/head/material/kevlar
	name = "Кевларовая набивка"
	cost = 18000
	desc = "Кевларовое покрытие шлема защищает от пуль."
	add_armor = list("melee" = 0, "bullet" = 10, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 1

/////////////////////////////////////MATERIAL - II TIER/////////////////////////////////////////////////////
/datum/data/modification/clothing/head/material/composite
	name = "Керамическая набивка"
	cost = 18000
	desc = "Керамическая броня обеспечивает отличную защиту от пуль и взрывов."
	add_armor = list("melee" = 0, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 2

/////////////////////////////////////PADDING - I TIER///////////////////////////////////////////////////////
/datum/data/modification/clothing/head/padding/psionic
	name = "Модуль псионической защиты"
	cost = 15000
	desc = "Модуль псионической защиты защищает от псионических волн."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 15)
	tier = 1

/datum/data/modification/clothing/head/padding/filter
	name = "Фильтрующий модуль"
	cost = 15000
	desc = "Filter installation protects user from radiation."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 15, "fire" = 0, "psy" = 0)
	tier = 1

/////////////////////////////////////PADDING - II TIER///////////////////////////////////////////////////////
/datum/data/modification/clothing/head/padding/psionic_advanced
	name = "Усовершенствованный модуль псионической защиты"
	cost = 30000
	desc = "Advanced psionic protection module protects head from psionic waves."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 25)
	tier = 2

/datum/data/modification/clothing/head/padding/filter_advanced
	name = "Улучшенный модуль фильтрации"
	cost = 25000
	desc = "Installation of advanced filter, protects user not only from radiation, but acidic atmosphere and high temperature."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 5, "energy" = 0, "bomb" = 0, "bio" = 5, "rad" = 20, "fire" = 0, "psy" = 0)
	tier = 2

/////////////////////////////////////NIGHTVISION////////////////////////////////////////////////////////

/datum/data/modification/clothing/head/nightvision
	name = "ПНВ"

/datum/data/modification/clothing/head/nightvision/AffectEquipment(var/obj/item/clothing/head/Gear)
	return ..(Gear)

/datum/data/modification/clothing/head/nightvision/basic
	name = "ПНВ (I поколения)"
	cost = 12000
	desc = "Установка прибора ночного видения 1-го поколения."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	id = "visor_head"
	tier = 1

/datum/data/modification/clothing/head/nightvision/basic/AffectEquipment(var/obj/item/clothing/head/Gear)
	if(!Gear.nvg)
		//Gear.nvg = new /obj/item/nightvision(Gear)
		Gear.AttachNVG()
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_I
	return ..(Gear)

/datum/data/modification/clothing/head/nightvision/advanced
	name = "ПНВ (II поколения)"
	cost = 25000
	desc = "Установка прибора ночного видения 2-го поколения."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	id = "visor_head"
	tier = 2

/datum/data/modification/clothing/head/nightvision/advanced/AffectEquipment(var/obj/item/clothing/head/Gear)
	if(!Gear.nvg)
		//Gear.nvg = new /obj/item/nightvision(Gear)
		Gear.AttachNVG()
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_II
	return ..(Gear)

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////МОДИФИКАЦИИ МАСОК///////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/data/modification/clothing/mask
	name = "Модификации шлема"
	desc = "Это модификация маски."
	modificated_type = /obj/item/clothing/mask/gas/stalker

/datum/data/modification/clothing/mask/nightvision
	name = "ПНВ"

/datum/data/modification/clothing/mask/nightvision/AffectEquipment(var/obj/item/clothing/mask/Gear)
	return ..(Gear)

/////////////////////////////////////NIGHTVISION///////////////////////////////////////////////////////
/datum/data/modification/clothing/mask/nightvision/basic
	name = "ПНВ (I поколения)"
	cost = 12000
	desc = "Установка прибора ночного видения 1-го поколения."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	id = "visor_mask"
	tier = 1
	modificated_type = /obj/item/clothing/mask/gas/stalker

/datum/data/modification/clothing/mask/nightvision/basic/AffectEquipment(var/obj/item/clothing/mask/Gear)
	if(!Gear.nvg)
		//Gear.nvg = new /obj/item/nightvision(Gear)
		Gear.AttachNVG()
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_I
	return ..(Gear)

/datum/data/modification/clothing/mask/nightvision/advanced
	name = "ПНВ (II поколения)"
	cost = 25000
	desc = "Установка прибора ночного видения 2-го поколения."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	id = "visor_mask"
	tier = 2
	modificated_type = /obj/item/clothing/mask/gas/stalker

/datum/data/modification/clothing/mask/nightvision/advanced/AffectEquipment(var/obj/item/clothing/mask/Gear)
	if(!Gear.nvg)
		//Gear.nvg = new /obj/item/nightvision(Gear)
		Gear.AttachNVG()
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_II
	return ..(Gear)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////МОДИФИКАЦИИ КОСТЮМОВ////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/data/modification/clothing/suit
	name = "Модификации костюма"
	desc = "This is a suit modification."
	modificated_type = /obj/item/clothing/suit

/datum/data/modification/clothing/suit/lining
	name = "Мофификация подкладки"
	id = "lining_suit"

/datum/data/modification/clothing/suit/material
	name = "Мофификация Материала"
	id = "material_suit"

/datum/data/modification/clothing/suit/padding
	name = "Модификация набивки"
	id = "padding_suit"

/datum/data/modification/clothing/suit/accessory
	name = "Модификация аксессуара"
	id = "accessory_slot"
	var/int_slot = /datum/component/storage/concrete/pockets/internal_slot

/datum/data/modification/clothing/suit/accessory/AffectEquipment(var/obj/item/clothing/suit/Gear)
	//if(Gear.pocket_storage_component_path)
		//if(Gear.pocket_storage_component_path.contents.len)
		//	return 0
	//	qdel(Gear.pocket_storage_component_path)
	Gear.pocket_storage_component_path = new int_slot()
	//if(ispath(Gear.pocket_storage_component_path))
	//	LoadComponent(Gear.pocket_storage_component_path)
	Gear.RefreshPockets()
	return ..(Gear)


/////////////////////////////////////LINING - I TIER////////////////////////////////////////////////////////
/datum/data/modification/clothing/suit/lining/rubberoid
	name = "Резиновая изоляция"
	cost = 10000
	desc = "Используя специализированный спрей для покрытия внутренней подкладки вашей одежды, вы можете повысить защиту вашей одежды от электрических аномалий."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 1

/datum/data/modification/clothing/suit/lining/thinsulate
	name = "Огнестойкая ткань"
	cost = 12000
	desc = "Используя специализированную огнестойкую ткань, вы можете повысить защиту своей одежды от внезапных возгораний и огненных аномалий."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 1
/////////////////////////////////////LINING - II TIER///////////////////////////////////////////////////////
/datum/data/modification/clothing/suit/lining/nitrile
	name = "Нитриловая изоляция"
	cost = 20000
	desc = "Легкое нитриловое соединение улучшает электрическую изоляцию."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 20, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 2

/datum/data/modification/clothing/suit/lining/fiberglass
	name = "Слой из стекловолокна"
	cost = 24000
	desc = "Благодаря этому тонкому слою облицовки из стекловолокна пользователь получает значительную устойчивость к огню и пламени, обеспечивая оптимальную защиту от огненных аномалий."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 20, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 2
/////////////////////////////////////MATERIAL - I TIER//////////////////////////////////////////////////////
/datum/data/modification/clothing/suit/material/kevlar
	name = "Кевларовый слой"
	cost = 15000
	desc = "Легкий слой кевлара повышает устойчивость вашего костюма к огнестрельному оружию."
	add_armor = list("melee" = 5, "bullet" = 10, "laser" = 0, "energy" = 0, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 1

/datum/data/modification/clothing/suit/material/lead
	name = "Свинцовый слой"
	cost = 13500
	desc = "Маленькая свинцовая пластина толщиной в полдюйма, которая плотно прилегает к вашему костюму, достаточно большая, чтобы защитить большинство ваших жизненно важных органов от радиации."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 5, "bio" = 0, "rad" = 15, "fire" = 0, "psy" = 0)
	tier = 1

/datum/data/modification/clothing/suit/material/alloy
	name = "Сетчатый сплава"
	cost = 14000
	desc = "С добавлением слоя высокопрочного сетчатого сплава ваш костюм обеспечит легкую, но общую защиту от большинства аномалий Зоны."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 5, "energy" = 10, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 1

/////////////////////////////////////MATERIAL - II TIER/////////////////////////////////////////////////////
/datum/data/modification/clothing/suit/material/composite
	name = "Композитный слой"
	cost = 30000
	desc = "С этими композитными бронепластинами военного класса пользователь получает значительную защиту от холодного оружия, пуль и осколков."
	add_armor = list("melee" = 10, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 2

/datum/data/modification/clothing/suit/material/wolfram
	name = "Вольфрамовый слой"
	cost = 27000
	desc = "Вмонтированная пластина вольфрама шириной 2 мм значительно улучшает радиационную защиту."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 0, "psy" = 0)
	tier = 2

/datum/data/modification/clothing/suit/material/alloy_advanced
	name = "Слой улучшенного сетчатого сплава"
	cost = 28000
	desc = "С добавлением слоя улучшенного сетчатого сплава ваш костюм обеспечит достойную защиту от большинства аномалий зон."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 10, "energy" = 15, "bomb" = 0, "bio" = 15, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 2

/////////////////////////////////////PADDING - I TIER///////////////////////////////////////////////////////
/datum/data/modification/clothing/suit/padding/steelfiber
	name = "Набивка из стального волокна"
	cost = 16000
	desc = "Специальная набивка из стального волокна, которая увеличит сопротивление пользователя перед холодным оружием, проколами и атаками животных."
	add_armor = list("melee" = 10, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 1

/datum/data/modification/clothing/suit/padding/neylon
	name = "Нейлоновая набивка"
	cost = 14000
	desc = "Специализированная нейлоновая набивка обеспечит очень легкую термостойкость, а также высокую кислотную и химическую стойкость. Повышение противопожарной и кислотной защиты пользователей."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 5, "energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 1
/////////////////////////////////////PADDING - II TIER//////////////////////////////////////////////////////
/datum/data/modification/clothing/suit/padding/twaron
	name = "Твароновая набивка"
	cost = 28000
	desc = "Специализированная набивка Тварон, обеспечит общую защиту от большинства мутантов Зоны."
	add_armor = list("melee" = 15, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 2

/datum/data/modification/clothing/suit/padding/teflon
	name = "Тефлоновая набивка"
	cost = 24000
	desc = "Тефлоновая набивка обеспечивает идеальную защиту от любых кислотных воздействий."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 25, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	tier = 2

/////////////////////////////////////NIGHTVISION///////////////////////////////////////////////////////

/datum/data/modification/clothing/suit/nightvision
	name = "ПНВ"

/datum/data/modification/clothing/suit/nightvision/AffectEquipment(var/obj/item/clothing/suit/Gear)
	return ..(Gear)

/datum/data/modification/clothing/suit/nightvision/basic
	name = "ПНВ (I поколения)"
	cost = 20000
	desc = "Установка прибора ночного видения 1-го поколения."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	id = "visor_suit"
	tier = 1
	modificated_type = /obj/item/clothing/suit/hooded/sealed

/datum/data/modification/clothing/suit/nightvision/basic/AffectEquipment(var/obj/item/clothing/suit/hooded/Gear)
	if(!Gear.hood.nvg)
		//Gear.hood.nvg = new /obj/item/nightvision(Gear.hood)
		Gear.hood.AttachNVG()
	Gear.hood.nvg.colour_matrix = NIGHTVISION_MATRIX_I
	return ..(Gear)

/datum/data/modification/clothing/suit/nightvision/advanced
	name = "ПНВ (II поколения)"
	cost = 35000
	desc = "Установка прибора ночного видения 2-го поколения."
	add_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "psy" = 0)
	id = "visor_suit"
	tier = 2
	modificated_type = /obj/item/clothing/suit/hooded/sealed

/datum/data/modification/clothing/suit/nightvision/advanced/AffectEquipment(var/obj/item/clothing/suit/hooded/Gear)
	if(!Gear.hood.nvg)
		//Gear.hood.nvg = new /obj/item/nightvision(Gear.hood)
		Gear.hood.AttachNVG()
	Gear.hood.nvg.colour_matrix = NIGHTVISION_MATRIX_II
	return ..(Gear)

/////////////////////////////////////ACCESSORY SLOT/////////////////////////////////////////////////////////

/////////////////////////////////////WEBBING////////////////////////////////////////////////////////////////
/datum/data/modification/clothing/suit/accessory/webbing
	name = "Встроенная разгрузка"
	cost = 8000
	desc = "С установкой разгрузки пользователь сможет переносить больше снаряжения."
	tier = 1
	int_slot = /datum/component/storage/concrete/pockets/internal_slot/webbing

/datum/data/modification/clothing/suit/accessory/webbing/advanced
	name = "Улучшенная встроенная разгрузка"
	cost = 14000
	desc = "С расширением разгрузки пользователь сможет переносить дополнительное снаряжение."
	tier = 2
	int_slot = /datum/component/storage/concrete/pockets/internal_slot/webbing/advanced

/datum/data/modification/clothing/suit/accessory/webbing/advanced/SpecialCheck(var/obj/item/I)
	if(!istype(I, /obj/item/clothing/suit))
		return 0
	var/obj/item/clothing/suit/S = I
	if(!S.pocket_storage_component_path || !istype(S.pocket_storage_component_path, /datum/component/storage/concrete/pockets/internal_slot/webbing))
		return 0
	return 1

/datum/data/modification/clothing/suit/accessory/webbing/modern
	name = "Современная встроенная разгрузка"
	cost = 22000
	desc = "С расширением разгрузки пользователь сможет переносить дополнительное снаряжение."
	tier = 3
	int_slot = /datum/component/storage/concrete/pockets/internal_slot/webbing/modern

/datum/data/modification/clothing/suit/accessory/webbing/modern/SpecialCheck(var/obj/item/I)
	if(!istype(I, /obj/item/clothing/suit))
		return 0
	var/obj/item/clothing/suit/S = I
	if(!S.pocket_storage_component_path || !istype(S.pocket_storage_component_path, /datum/component/storage/concrete/pockets/internal_slot/webbing/advanced))
		return 0
	return 1

/////////////////////////////////////CONTAINER////////////////////////////////////////////////////////////////
/datum/data/modification/clothing/suit/accessory/container
	name = "Встроенный контейнер артефактов"
	cost = 16000
	desc = "С интеграцией специализированного контейнера артефактов, пользователь получает возможность использовать их спецэффекты."
	tier = 1
	int_slot = /datum/component/storage/concrete/pockets/internal_slot/container

/datum/data/modification/clothing/suit/accessory/container/advanced
	name = "Расширение контейнера артефактов"
	cost = 32000
	desc = "Расширение контейнера позволяет пользователю переносить больше артефактов."
	tier = 2
	int_slot = /datum/component/storage/concrete/pockets/internal_slot/container/advanced

/datum/data/modification/clothing/suit/accessory/container/advanced/SpecialCheck(var/obj/item/I)
	if(!istype(I, /obj/item/clothing/suit))
		return 0
	var/obj/item/clothing/suit/S = I
	if(!S.pocket_storage_component_path || !istype(S.pocket_storage_component_path, /datum/component/storage/concrete/pockets/internal_slot/container))
		return 0
	return 1

/datum/data/modification/clothing/suit/accessory/container/modern
	name = "Радиационная защита контейнера артефактов"
	cost = 64000
	desc = "Установка радиационной защиты вокруг интегрированного контейнера."
	tier = 3
	int_slot = /datum/component/storage/concrete/pockets/internal_slot/container/modern

/datum/data/modification/clothing/suit/accessory/container/modern/SpecialCheck(var/obj/item/I)
	if(!istype(I, /obj/item/clothing/suit))
		return 0
	var/obj/item/clothing/suit/S = I
	if(!S.pocket_storage_component_path || !istype(S.pocket_storage_component_path, /datum/component/storage/concrete/pockets/internal_slot/container/advanced))
		return 0
	return 1

/////////////////////////////////////GUNCASE/////////////////////////////////////////////////////////////////
/datum/data/modification/clothing/suit/accessory/guncase
	name = "Встроенный слот для оружия"
	cost = 32000
	desc = "Встроенное расширение контейнера позволяет пользователю носить с собой другое оружие."
	tier = 1
	int_slot = /datum/component/storage/concrete/pockets/internal_slot/gun_case

//Some suit internal slots

/datum/component/storage/concrete/pockets/internal_slot
	var/touch_sound = 'stalker/sound/objects/internal_slot_toggle.ogg'
	var/radiation_protection = 0
	max_combined_w_class = 2
	max_items = 1
	max_w_class = WEIGHT_CLASS_SMALL
	attack_hand_interact = TRUE

/datum/component/storage/concrete/pockets/internal_slot/show_to(mob/user)
	..()
	playsound(user, touch_sound, 50, 1, -5)

//Artifact container//

/datum/component/storage/concrete/pockets/internal_slot/container
	max_items = 1

/datum/component/storage/concrete/pockets/internal_slot/container/Initialize()
	can_hold = typecacheof(list(/obj/item/artifact))

/datum/component/storage/concrete/pockets/internal_slot/container/advanced
	max_combined_w_class = 4
	max_items = 2

/datum/component/storage/concrete/pockets/internal_slot/container/modern
	max_combined_w_class = 4
	max_items = 2
	radiation_protection = 1

//Item slots//

/datum/component/storage/concrete/pockets/internal_slot/webbing
	max_combined_w_class = 4
	max_items = 2

/datum/component/storage/concrete/pockets/internal_slot/webbing/advanced
	max_combined_w_class = 6
	max_items = 3

/datum/component/storage/concrete/pockets/internal_slot/webbing/modern
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = 6
	max_items = 4

//Gun slot//

/datum/component/storage/concrete/pockets/internal_slot/gun_case
	max_w_class = WEIGHT_CLASS_GIGANTIC
	max_combined_w_class = 6
	max_items = 1

/datum/component/storage/concrete/pockets/internal_slot/gun_case/Initialize()
	can_hold = typecacheof(list(/obj/item/gun))

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////МОДИФИКАЦИИ ОРУЖИЯ//////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/data/modification/gun
	name = "Модификация оружия"
	desc = "Это модификация оружия."

/datum/data/modification/gun/automatic/pistol

/datum/data/modification/gun/automatic

/datum/data/modification/gun/shotgun

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/structure/stalker/modification_table/attackby(obj/item/I, mob/user, params)
	if(!ishuman(usr))
		return

	var/mob/living/carbon/human/Hu = usr

	if(!istype(Hu.wear_id, /obj/item/stalker_pda))
		say("Наденьте ваш КПК.")
		return

	var/datum/data/record/sk = find_record("sid", Hu.sid, GLOB.data_core.stalkers)
	var/obj/item/stalker_pda/KPK = Hu.wear_id

	if(!sk || !KPK.owner)
		say("Активируйте ваш КПК.")
		return

	if(KPK.owner != Hu)
		say("Нет доступа.")
		return

	if(istype(I, /obj/item/clothing/head))
		var/obj/item/clothing/head/H = I
		if(H.durability)
			if(!user.is_holding(I))
				return 0
			if(!user.transferItemToLoc(I, src))
				to_chat(user, "<span class='warning'>\The [I] прилип к руке, его нельзя засунуть в [src.name]!</span>")
				return
			I.loc = src
			modificated = I
			return 1
		return 0

	if(istype(I, /obj/item/clothing/mask))
		var/obj/item/clothing/mask/M = I
		if(M.durability)
			if(!user.is_holding(I))
				return 0
			if(!user.transferItemToLoc(I, src))
				to_chat(user, "<span class='warning'>\The [I] прилип к руке, его нельзя засунуть в [src.name]!</span>")
				return
			I.loc = src
			modificated = I
			return 1
		return 0

	if(istype(I, /obj/item/clothing/suit))
		var/obj/item/clothing/suit/S = I
		if(S.durability)
			if(!user.is_holding(I))
				return 0
			if(!user.transferItemToLoc(I, src))
				to_chat(user, "<span class='warning'>\The [I] прилип к руке, его нельзя засунуть в [src.name]!</span>")
				return
			modificated = I
			return 1
		return 0

	if(istype(I, /obj/item/gun/ballistic))
		var/obj/item/gun/ballistic/P = I
		if(P.durability)
			if(!user.is_holding(I))
				return 0
			if(!user.transferItemToLoc(I, src))
				to_chat(user, "<span class='warning'>\The [I] прилип к руке, его нельзя засунуть в [src.name]!</span>")
				return
			I.loc = src
			modificated = I
			return 1
		return 0

/obj/structure/stalker/modification_table/attack_hand(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user

	ui_interact(H)

/obj/structure/stalker/modification_table/ui_interact(mob/living/carbon/human/H)
	if(!istype(H.wear_id, /obj/item/stalker_pda))
		say("Я не могу подключиться к вашему КПК.")
		return

	var/obj/item/stalker_pda/KPK = H.wear_id

	if(!KPK.profile || !KPK.owner)
		say("активируйте ваш КПК.")
		return

	if(KPK.owner != H)
		say("Нет доступа.")
		return

	if(!modificated)
		say("Вставка предмет для улучшения.")
		return

	H.set_machine(src)
	balance = KPK.profile.fields["money"]

	var/dat
	dat +="<div class='statusDisplay'>"
	dat += "Balance: [balance] р.<br>"
	dat += "<br><br>Instructions: Insert an item for improvement."
	dat += "<br><A href='?src=\ref[src];eject=1'>Eject</A>"
	dat += "</div>"
	dat += "<div class='lenta_scroll'>"
	dat += "<br><BR><table border='0' width='400'>"
	for(var/ML in modifications_list)
		var/dat_
		for(var/datum/data/modification/M in modifications_list[ML])
			dat_ += SetMenu(H, M)
		if(dat_)
			dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><big><b>[ML]</b></big></center></td><td></td><td></td></tr>"
			dat += dat_
	popup = new(H, "modtable", "Modification Table", 460, 705)
	popup.set_content(dat)
	popup.open()
	return

/obj/structure/stalker/modification_table/proc/SetMenu(var/mob/living/carbon/human/H, var/datum/data/modification/M)
	var/dat_
	if((M.id in modificated.modifications) && (M.tier == modificated.modifications[M.id] + 1))
		if(M.SpecialCheck(modificated))
			if(H.client.prefs.chat_toggles & CHAT_LANGUAGE)
				dat_ += "<tr><td><b>[M.name]</b></td><td><A href='?src=\ref[src];upgrade=\ref[M]'>UPGRADE</A></td></tr><tr><td style='padding-left:10px'>[M.desc]</td><td>[M.cost]</td></tr>"
			else
				dat_ += "<tr><td><b>[M.name]</b></td><td><A href='?src=\ref[src];upgrade=\ref[M]'>UPGRADE</A></td></tr><tr><td style='padding-left:10px'>[M.desc]</td><td>[M.cost]</td></tr>"
	return dat_

/obj/structure/stalker/modification_table/Topic(href, href_list)
	if(..())
		return

	var/mob/living/carbon/human/H = usr

	if(!istype(H.wear_id, /obj/item/stalker_pda))
		say("Наденьте ваш КПК.")
		updateUsrDialog()
		return

	var/obj/item/stalker_pda/KPK = H.wear_id

	if(href_list["upgrade"])
		var/datum/data/modification/M = locate(href_list["upgrade"])
		if(!M || (M.cost > KPK.profile.fields["money"]))
			say("У вас недостаточно денег, чтобы улучшить свое снаряжение.")
			updateUsrDialog()
			return
		if(!M.AffectEquipment(modificated))
			updateUsrDialog()
			return
		KPK.profile.fields["money"] -= M.cost
		balance = KPK.profile.fields["money"]

	if(href_list["eject"])
		if(!modificated)
			return
		var/turf/T = get_turf(src)
		for(var/atom/movable/A in contents)
			A.forceMove(T)
		modificated = null
		usr.unset_machine()
		popup.close()
		new /obj/structure/stalker/modification_table(src.loc)
		qdel(src)

	updateUsrDialog()
