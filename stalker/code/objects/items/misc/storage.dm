/obj/item/storage/wallet/stalker

/obj/item/storage/wallet/stalker/New()
	..()
	var/item1_type = pick(/obj/item/stack/spacecash/c100,/obj/item/stack/spacecash/c50)
	var/item2_type
	if(prob(50))
		item2_type = pick(/obj/item/stack/spacecash/c100,/obj/item/stack/spacecash/c50)

	spawn(2)
		if(item1_type)
			new item1_type(src)
		if(item2_type)
			new item2_type(src)

/obj/item/storage/backpack/stalker
	name = "Рюкзак"
	desc = "Вы носите это на спине и кладете в него предметы."
	icon_state = "backpack-tourist"
	item_state = "backpack-tourist"
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK

/obj/item/storage/backpack/stalker/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 30
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_items = 21
	STR.display_numerical_stacking = TRUE

/obj/item/storage/backpack/stalker/civilian
	name = "Гражданский рюкзак"
	desc = "Обычный походный рюкзак, популярный среди тех, кто только приехал в Зону."
	icon_state = "backpack-civilian"
	item_state = "backpack-civilian"

/obj/item/storage/backpack/stalker/civilian/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 20
	STR.max_w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/backpack/stalker/tourist
	name = "Туристический рюкзак"
	desc = "Спортивная сумка, предназначенная для туристов, с достаточным пространством для хранения припасов на несколько дней."
	icon_state = "backpack-tourist"
	item_state = "backpack-tourist"

/obj/item/storage/backpack/stalker/tourist/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 35
	STR.max_w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/backpack/stalker/professional
	name = "Профессиональный рюкзак"
	desc = "Сверхпрочный военный рюкзак. Вы можете нести небольшую комнату снабжения в этом."
	icon_state = "backpack-professional"
	item_state = "backpack-professional"

/obj/item/storage/backpack/stalker/professional/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 55
	STR.max_w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/backpack/stalker/rucksack
	name = "Рюкзак"
	desc = "Практичная сумка для военного использования в суровых условиях. Из-за отсутствия четких контуров эта сумка очень полезна для переноски чего угодно."
	icon_state = "backpack-rucksack"
	item_state = "backpack-rucksack"
	slowdown = 0.5

/obj/item/storage/backpack/stalker/rucksack/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 60
	STR.max_items = 24
	STR.max_w_class = WEIGHT_CLASS_BULKY


/obj/item/storage/backpack/satchel/stalker
	name = "сумка"
	icon_state = "satchel"
	item_state = "satchel"
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK

/obj/item/storage/backpack/satchel/stalker/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 30
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_items = 21
	STR.display_numerical_stacking = TRUE

/obj/item/storage/backpack/satchel/stalker/civilian
	name = "Гражданская сумка"
	desc = "Маленькая сумка, которой пользовались посыльные, лакеи и курьеры. Очень портативный по сравнению с другими сумками."
	icon_state = "satchel-civilian"
	item_state = "satchel-civilian"

/obj/item/storage/backpack/satchel/stalker/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 18
	STR.max_w_class = WEIGHT_CLASS_NORMAL

///obj/item/storage/backpack/stalker/stalker
//	name = "рюкзак"
//	desc = "Вы носите это на спине и кладете в него предметы."
//	icon_state = "backpack-stalker"
//	item_state = "backpack-stalker"
//	w_class = WEIGHT_CLASS_HUGE
//	slot_flags = ITEM_SLOT_BACK

///obj/item/storage/backpack/stalker/stalker/ComponentInitialize()
//	. = ..()
//	GET_COMPONENT(STR, /datum/component/storage)
//	STR.max_combined_w_class = 30
//	STR.max_w_class = WEIGHT_CLASS_BULKY
//	STR.max_items = 21
//	STR.display_numerical_stacking = TRUE

///obj/item/storage/backpack/stalker/stalker/duffel
//	name = "Вещевой мешок"
//	desc = "Вы носите это на спине и кладете в него предметы."
//	icon_state = "duffelbag-stalker"
//	item_state = "duffelbag-stalker"
//	w_class = WEIGHT_CLASS_HUGE
//	slot_flags = ITEM_SLOT_BACK

///obj/item/storage/backpack/stalker/stalker/ComponentInitialize()
//	. = ..()
//	GET_COMPONENT(STR, /datum/component/storage)
//	STR.max_combined_w_class = 30
//	STR.max_w_class = WEIGHT_CLASS_BULKY
//	STR.max_items = 35
//	STR.display_numerical_stacking = TRUE

///obj/item/storage/backpack/stalker/stalker/rucksack
//	name = "Рюкзак"
//	desc = "Вы носите это на спине и кладете в него предметы."
//	icon_state = "backpack-rucksack"
//	item_state = "backpack-rucksack"
//	w_class = WEIGHT_CLASS_HUGE
//	slot_flags = ITEM_SLOT_BACK

//obj/item/storage/backpack/stalker/stalker/ComponentInitialize()
//	. = ..()
//	GET_COMPONENT(STR, /datum/component/storage)
//	STR.max_combined_w_class = 55
//	STR.max_w_class = WEIGHT_CLASS_BULKY
//	STR.max_items = 30
//	STR.display_numerical_stacking = TRUE

/*
/obj/item/storage/backpack/stalker/attackby(obj/item/W, mob/user, params)
	playsound(src.loc, "sound/stalker/objects/inv_open.ogg", 50, 1, -5)
	..()
*/