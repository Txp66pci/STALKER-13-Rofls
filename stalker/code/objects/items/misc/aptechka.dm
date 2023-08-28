/obj/item/reagent_containers/pill/stalker
	icon = 'stalker/icons/items.dmi'
	w_class = 2
	possible_transfer_amounts = list()
	volume = 60
	apply_type = PATCH
	apply_method = "apply"
	self_delay = 30

/obj/item/reagent_containers/pill/stalker/aptechka
	name = "Аптечка"
	desc = "Старая советская аптечка."

/obj/item/reagent_containers/pill/stalker/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

obj/item/reagent_containers/pill/stalker/afterattack(obj/target, mob/user , proximity)
	return // thanks inheritance again

/obj/item/reagent_containers/pill/stalker/injector
	name = "Инжектор"
	icon_state = "brute"
	desc = "Малоэффективный боевой стимулятор. 15 единиц в одном инжекторе."
	item_state = "brute"
	var/wrapped = 1
	list_reagents = list("cryoxadone" = 14)
	var/icon_state_opened = "sj1_open"
	var/desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/injector/attack_self(mob/user)
	if(wrapped)
		Unwrap(user)
	else
		..()

/obj/item/reagent_containers/pill/stalker/injector/proc/Unwrap(mob/user)
	icon_state = icon_state_opened
	desc = desc_opened
	to_chat(user, "<span class='notice'>Вы снимаете защитную крышку инжектора.</span>")
	wrapped = 0

/obj/item/reagent_containers/pill/stalker/injector/canconsume(mob/eater, mob/user)
	if(wrapped == 1)
		to_chat(user, "<span class='warning'>Инжектор закрыт! Вероятно, вам следует открыть его.</span>")
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

// Pill-Bottle | Made for Fast-Use with Helmets | Simplifies use

/obj/item/reagent_containers/pill/stalker/pillbottle
	name = "Контейнер для таблеток"
	icon_state = "alcopill"
	desc = "Если вы видите это, что-то пошло УЖАСНО не так"
	item_state = "brute"
	var/wrapped = 1
	list_reagents = list("water" = 15)
	var/icon_state_opened = "sj1_open"
	var/desc_opened = "Открыл бутылочку."

/obj/item/reagent_containers/pill/stalker/pillbottle/attack_self(mob/user)
	if(wrapped)
		Unwrap(user)
	else
		..()

/obj/item/reagent_containers/pill/stalker/pillbottle/proc/Unwrap(mob/user)
	icon_state = icon_state_opened
	desc = desc_opened
	to_chat(user, "<span class='notice'>Вы сломали защитную пломбу контейнера!</span>")
	wrapped = 0

/obj/item/reagent_containers/pill/stalker/pillbottle/canconsume(mob/eater, mob/user)
	if(wrapped == 1)
		to_chat(user, "<span class='warning'>Защитная пломба по-прежнему закрыта! Вам нужно открыть её, чтобы использовать это.</span>")
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

/obj/item/reagent_containers/pill/stalker/injector/brute
	name = "Инжектор для лечения физического урона"
	icon_state = "brute"
	desc = "Небольшой, но эффективный стимулятор заживления урона. 25 единиц в одном инжекторе. Не рекомендуется принимать их много."
	item_state = "brute"
	list_reagents = list("bicaridine" = 15)
	icon_state_opened = "brute_open"
	desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/injector/burn
	name = "Инжектор для лечения ожогов"
	icon_state = "burn"
	desc = "Небольшой, но эффективный раствор для лечения ожогов. 15 единиц в одном инжекторе. Не рекомендуется принимать их много."
	item_state = "burn"
	list_reagents = list("kelotane" = 15)
	icon_state_opened = "burn_open"
	desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/injector/toxin
	name = "Инжектор антитоксина"
	icon_state = "toxin"
	desc = "Небольшой, но эффективный инжектор антитоксина. 15 единиц в одном инжекторе."
	item_state = "toxin"
	list_reagents = list("charcoal" = 15)
	icon_state_opened = "toxin_open"
	desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/injector/oxygen
	name = "Инжектор оксигенации крови"
	icon_state = "oxygen"
	desc = "Небольшой, но эффективный инжектор оксигенации. 15 единиц в одном инжекторе."
	list_reagents = list("salbutamol" = 15)
	icon_state_opened = "oxygen_open"
	desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/injector/blood
	name = "Инжектор коагулянта и наполнителя крови"
	icon_state = "blood"
	desc = "Эффективный коагулянт, который также выполняет функцию гематогена. 25 единиц в одном инжекторе."
	item_state = "blood"
	list_reagents = list("coagulant" = 25)
	icon_state_opened = "blood_open"
	desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/injector/painkiller
	name = "Инъектор боевых стимуляторов"
	icon_state = "painkiller"
	desc = "Смесь боевых стимуляторов и обезболивающих военного класса. 30 единиц в одном инжекторе. Не рекомендуется принимать более одной дозы за раз."
	item_state = "painkiller"
	list_reagents = list("mine_salve" = 30)
	icon_state_opened = "painkiller_open"
	desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/injector/epinephrine
	name = "Инжектор адреналина"
	icon_state = "epipen"
	desc = "Универсальный инъектор адреналина для тяжелораненых. 15 единиц в одном инжекторе."
	item_state = "epipen"
	list_reagents = list("epinephrine" = 15)
	icon_state_opened = "epipen_open"
	desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/injector/antirad
	name = "Инжектор антирадина"
	icon_state = "radanti"
	desc = "Противорадиационные химические вещества, которые лечат лучевую болезнь и интоксикацию. 15 единиц в одном инжекторе. Может нанести легкие синяки."
	item_state = "radanti"
	list_reagents = list("pen_acid" = 15)
	icon_state_opened = "radanti_open"
	desc_opened = "Открыл инжектор."

// MEDICAL REWORK

// AI-2 MEDICATIONS

/obj/item/reagent_containers/pill/stalker/injector/ai2
	name = "Инжектор промедола"
	icon_state = "burn"
	desc = "Содержится в медицинской аптечке АИ-2. Содержит низкосортные лекарства, способствующие заживлению ран."
	item_state = "epipen"
	list_reagents = list("promedolsolution" = 15)
	icon_state_opened = "burn_open"
	desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/pillbottle/radprotectorai2
	name = "Малиновая бутылка"
	icon_state = "promepill"
	desc = "Флакон малинового цвета, содержащий радиопротекторное лекарство. Срок их действия истек десятилетия назад.."
	item_state = "epipen"
	list_reagents = list("ai2rp" = 15)
	icon_state_opened = "promepill_open"
	desc_opened = "Открой и молись Богородице."

/obj/item/reagent_containers/pill/stalker/pillbottle/antiradai2
	name = "Клубничная бутылка"
	icon_state = "strawpill"
	desc = "Бутылка клубничного цвета с противорадиационными препаратами. Они довольно слабые и просроченные.."
	item_state = "epipen"
	list_reagents = list("ai2ar" = 15)
	icon_state_opened = "strawpill_open"
	desc_opened = "Открой и молись Богородице."

// ARMY MEDKIT MEDICATIONS

/obj/item/reagent_containers/pill/stalker/injector/armymedicalinjector
	name = "Армейский инжектор"
	icon_state = "brute"
	desc = "Содержится в военной аптечке. Используется для борьбы с боевыми травмами."
	item_state = "epipen"
	list_reagents = list("armysolution" = 15)
	icon_state_opened = "brute_open"
	desc_opened = "Открыл инжектор."

// SCIENCE MEDKIT MEDICATION

/obj/item/reagent_containers/pill/stalker/injector/scimedicalinjector
	name = "Научный инжектор"
	icon_state = "sci"
	desc = "Содержится в научной аптечке. Используется для эффективного лечения всех ран!"
	item_state = "epipen"
	list_reagents = list("scisolution" = 15)
	icon_state_opened = "sci_open"
	desc_opened = "Открыл инжектор."

/obj/item/reagent_containers/pill/stalker/injector/sciradinjector
	name = "Научный инжектор антирадина"
	icon_state = "radanti"
	desc = "Содержится в научной аптечке. Используется для эффективного лечения радиации!"
	item_state = "epipen"
	list_reagents = list("sciradsolution" = 15)
	icon_state_opened = "radanti_open"
	desc_opened = "Открыл инжектор."

// Stimpacks

// Improvised Stimpack

/obj/item/reagent_containers/pill/stalker/injector/improvisedstim
	name = "Импровизированный стимпак"
	icon_state = "stimimprov"
	desc = "Импровизированный стимпак с повторным использованием старого инжектора. Его безопасность под вопросом."
	item_state = "epipen"
	list_reagents = list("impstim" = 5)
	icon_state_opened = "stimimprov_open"
	desc_opened = "Игла удлиненна."

// Army Stimpack
/obj/item/reagent_containers/pill/stalker/injector/armystim
	name = "Армейский стимпак"
	icon_state = "stimarmy"
	desc = "Военные изготовили боевой стим для борьбы с экстремальными телесными повреждениями."
	item_state = "epipen"
	list_reagents = list("stimarmypack" = 5)
	icon_state_opened = "stimarmy_open"
	desc_opened = "Игла удлиненна."

// Scientific Stimpack

/obj/item/reagent_containers/pill/stalker/injector/scistim
	name = "Научный стимпак"
	icon_state = "stimsci"
	desc = "Производится за пределами Зоны по военным контрактам. Этот чрезвычайно редкий и мощный стим способен спасти даже самого раненого Сталкера."
	item_state = "epipen"
	list_reagents = list("scistim" = 5)
	icon_state_opened = "stimsci_open"
	desc_opened = "Игла удлиненна."