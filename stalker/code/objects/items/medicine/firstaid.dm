/obj/item/stack/medical/gauze/bint
	name = "Бинт"
	desc = "Обычная марлевая повязка. Это будет очень хорошо работать для остановки любого кровотечения!"
	icon = 'stalker/icons/items.dmi'
	icon_state = "bint"
	amount = 2
	max_amount = 2
	self_delay = 10

/obj/item/storage/firstaid/ifak
	name = "IFAK"
	desc = "Пехотная аптечка, содержащая все, что нужно сталкеру для стабилизации ран!"
	icon = 'stalker/icons/items.dmi'
	icon_state = "ifak"
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/firstaid/ifak/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 16
	STR.can_hold = typecacheof(list(/obj/item/stack/medical,
									/obj/item/reagent_containers/pill))

/obj/item/storage/firstaid/ifak/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/stack/medical/gauze/bint = 4,
		/obj/item/stack/medical/suture = 2,
		/obj/item/stack/medical/mesh = 2,
		/obj/item/reagent_containers/pill/stalker/injector/blood = 2,
		/obj/item/reagent_containers/pill/stalker/injector/painkiller = 2,
		/obj/item/reagent_containers/pill/stalker/injector/oxygen = 2,
		/obj/item/reagent_containers/pill/stalker/injector/epinephrine = 2)
	generate_items_inside(items_inside,src)

/obj/item/reagent_containers/pill/iron
	name = "Таблетки железа"
	desc = "Используется для ускорения лечения дефицита крови."
	icon_state = "pill17"
	list_reagents = list("iron" = 20)
	rename_with_volume = FALSE

/obj/item/reagent_containers/pill/painkiller
	name = "Болеутоляющее"
	desc = "Используется для подавления боли. Вызывает спазмы желудка после приема внутрь, ешьте перед применением!"
	icon_state = "pill17"
	list_reagents = list("mine_salve" = 15)
	rename_with_volume = FALSE

/obj/item/storage/pill_bottle/iron
	name = "Флакон таблеток железа"
	desc = "Содержит таблетки, используемые для борьбы с дефицитом крови."

/obj/item/storage/pill_bottle/iron/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/iron(src)

/obj/item/storage/pill_bottle/bicaridine
	name = "Флакон таблеток бикаридина"
	desc = "Содержит таблетки, используемые для борьбы с физическими уроном."

/obj/item/storage/pill_bottle/bicaridine/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/bicaridine(src)

/obj/item/storage/pill_bottle/kelotane
	name = "флакон таблеток келотана"
	desc = "Содержит таблетки, используемые для борьбы с ожогами."

/obj/item/storage/pill_bottle/kelotane/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/kelotane(src)

/obj/item/storage/pill_bottle/salbutamol
	name = "Флакон сальбутамола в таблетках"
	desc = "Содержит таблетки, используемые для борьбы с усталостью и дефицитом кислорода после потери крови."

/obj/item/storage/pill_bottle/salbutamol/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/salbutamol(src)

/obj/item/storage/pill_bottle/painkiller
	name = "Флакон обезболивающих таблеток"
	desc = "Содержит таблетки, используемые для облегчения боли."

/obj/item/storage/pill_bottle/painkiller/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/painkiller(src)

/obj/item/reagent_containers/pill/bicaridine
	name = "Таблетка бикаридина"
	desc = "Используется для борьбы с физическими уроном."
	icon_state = "pill17"
	list_reagents = list("bicaridine" = 20)
	rename_with_volume = FALSE

/obj/item/reagent_containers/pill/kelotane
	name = "Таблетка келотана"
	desc = " Используется для борьбы с ожогами."
	icon_state = "pill19"
	list_reagents = list("kelotane" = 20)
	rename_with_volume = FALSE

/obj/item/storage/firstaid/ecologists
	name = "Научная аптечка"
	desc = "Сумка п, до краев наполненная всем что нужно СТАЛКЕРУ, всё что можно захотеть или пожелать в Зоне!"
	icon = 'stalker/icons/items.dmi'
	icon_state = "scikit"
	w_class = WEIGHT_CLASS_BULKY
	throw_speed = 1
	throw_range = 4

/obj/item/storage/firstaid/ai2/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 12
	STR.can_hold = typecacheof(list(/obj/item/stack/medical,
									/obj/item/reagent_containers/pill,
									/obj/item/reagent_containers/pill/stalker/injector,
									/obj/item/storage/pill_bottle))

/obj/item/storage/firstaid/ecologists/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/stalker/injector/scimedicalinjector = 2,
		/obj/item/reagent_containers/pill/stalker/injector/blood = 2,
		/obj/item/storage/pill_bottle/bicaridine = 1,
		/obj/item/storage/pill_bottle/kelotane = 1,
		/obj/item/storage/pill_bottle/salbutamol = 1,
		/obj/item/storage/pill_bottle/iron = 1,
		/obj/item/storage/pill_bottle/painkiller = 1,
		/obj/item/storage/pill_bottle/charcoal = 1,
		/obj/item/storage/pill_bottle/epinephrine = 1,
		/obj/item/storage/pill_bottle/penacid = 1)
	generate_items_inside(items_inside,src)

// MEDICAL REWORK

// AI-2
/obj/item/storage/firstaid/ai2
	name = "Аптечка"
	desc = "Аптечка первой помощи, разработанная изначально для радиологической катастрофы. Распространенный и доступный медицинский продукт в Зоне!"
	icon = 'stalker/icons/items.dmi'
	icon_state = "aptechkar"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/firstaid/ai2/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 3
	STR.can_hold = typecacheof(list(/obj/item/reagent_containers/pill/stalker/injector,
									/obj/item/reagent_containers/pill/stalker/pillbottle))

/obj/item/storage/firstaid/ai2/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/stalker/injector/ai2 = 1,
		/obj/item/reagent_containers/pill/stalker/pillbottle/radprotectorai2 = 1,
		/obj/item/reagent_containers/pill/stalker/pillbottle/antiradai2 = 1)
	generate_items_inside(items_inside,src)

// ARMY-MEDKIT

/obj/item/storage/firstaid/armymedkit
	name = "Армейская аптечка"
	desc = "Аптечка, предназначенная для боевых ситуаций. Она превосходит обычную, но не содержит радиологических препаратов."
	icon = 'stalker/icons/items.dmi'
	icon_state = "aptechkab"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/firstaid/armymedkit/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 3
	STR.can_hold = typecacheof(list(/obj/item/reagent_containers/pill/stalker/injector,
									/obj/item/reagent_containers/pill/stalker/pillbottle))

/obj/item/storage/firstaid/armymedkit/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/stalker/injector/blood = 1,
		/obj/item/reagent_containers/pill/stalker/injector/armymedicalinjector = 1,
		/obj/item/reagent_containers/pill/stalker/injector/painkiller = 1)
	generate_items_inside(items_inside,src)

// SCIENTIFIC MEDKIT

/obj/item/storage/firstaid/sciencemedkit
	name = "Научная аптечка"
	desc = "Аптечка, разработанная экологами. В этом современном наборе есть все, чтобы спасти жизнь сталкеров!"
	icon = 'stalker/icons/items.dmi'
	icon_state = "aptechkay"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/firstaid/sciencemedkit/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 3
	STR.can_hold = typecacheof(list(/obj/item/reagent_containers/pill/stalker/injector,
									/obj/item/reagent_containers/pill/stalker/pillbottle))

/obj/item/storage/firstaid/sciencemedkit/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/stalker/injector/scimedicalinjector = 1,
		/obj/item/reagent_containers/pill/stalker/injector/sciradinjector = 1,
		/obj/item/reagent_containers/pill/stalker/injector/oxygen = 1)
	generate_items_inside(items_inside,src)
