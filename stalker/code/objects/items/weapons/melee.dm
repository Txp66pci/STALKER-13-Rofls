/obj/item/kitchen/knife/tourist
	name = "Туристический нож"
	desc = "Дешевый нож, но достаточно хороший для туриста."
	icon = 'stalker/icons/weapons.dmi'
	icon_state = "knife"
	slot_flags = ITEM_SLOT_BELT
	force = 20
	throwforce = 15
	w_class = WEIGHT_CLASS_SMALL
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1

/obj/item/kitchen/knife/bayonet
	name = "Байонет"
	desc = "Опасен, но плох в разделке мутантов."
	icon = 'stalker/icons/weapons.dmi'
	icon_state = "bayonet"
	slot_flags = ITEM_SLOT_BELT
	force = 25
	throwforce = 20
	w_class = WEIGHT_CLASS_NORMAL
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	bayonet = TRUE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/throwing
	name = "Метательный нож"
	desc = "Маленький нож, который лучше бросать, а не использовать в ближнем бою."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "throwingknife"
	slot_flags = ITEM_SLOT_BELT
	force = 8
	throwforce = 24
	throw_speed = 4
	embedding = list("embedded_pain_multiplier" = 4, "embed_chance" = 75, "embedded_fall_chance" = 25)
	w_class = WEIGHT_CLASS_SMALL
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("пробивает", "дырявит")
	sharpness = IS_SHARP_ACCURATE

/obj/item/kitchen/knife/machete
	name = "Мачете"
	desc = "Отлично подходит для разрубания ваших проблем."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "machete"
	item_state = "machete"
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 20
	w_class = WEIGHT_CLASS_BULKY
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/knifeswing.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/machete2
	name = "Мачете"
	desc = "Отлично подходит для разрубания ваших проблем."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "machete2"
	item_state = "machete2"
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 20
	w_class = WEIGHT_CLASS_BULKY
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/knifeswing.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/machete3
	name = "Мачете"
	desc = "Отлично подходит для разрубания ваших проблем."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "machete3"
	item_state = "scrapsabre"
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 20
	w_class = WEIGHT_CLASS_BULKY
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/knifeswing.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/machete4
	name = "Мачете"
	desc = "Отлично подходит для разрубания ваших проблем."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "machete4"
	item_state = "salvagedmachete"
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 20
	w_class = WEIGHT_CLASS_BULKY
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/knifeswing.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/foreignsabre
	name = "Иностранная сабля"
	desc = "Отлично подходит для разрубания ваших проблем. Кажется, это настоящая сабля, она тяжелая и много использовалась."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "foreignsabre"
	item_state = "sabre"
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 20
	w_class = WEIGHT_CLASS_BULKY
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/knifeswing.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/rapier0
	name = "Рапира"
	desc = "Отлично подходит для затыкивания ваших проблем. Кажется, это настоящая рапира, она тяжелая и много использовалась."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "rapier0"
	item_state = "rapier"
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 20
	w_class = WEIGHT_CLASS_BULKY
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/knifeswing.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/sickle
	name = "Серп"
	desc = "Отлично подходит для разрубания ваших проблем. Все, что вам нужно сейчас это молоток!"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "sickle"
	item_state = "sickle"
	slot_flags = ITEM_SLOT_BELT
	force = 20
	throwforce = 5
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/knifeswing.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "пробивает")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/trench
	name = "Траншейный нож"
	desc = "Опасный, сделанный для окопов."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "knife_trench"
	item_state = "knife_trench"
	slot_flags = ITEM_SLOT_BELT
	force = 25
	throwforce = 20
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
//	bayonet = TRUE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/bowie
	name = "Нож Боуи"
	desc = "Day bow bow ... chicka chi-kow!"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "knife_bowie"
	item_state = "knife_bowie"
	slot_flags = ITEM_SLOT_BELT
	force = 25
	throwforce = 25
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
//	bayonet = TRUE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/bolo
	name = "Нож Боло"
	desc = "Большой режущий инструмент филиппинского происхождения, похожий на мачете. Он используется, в частности, на Филиппинах, в джунглях Индонезии, Малайзии и Брунея, а также на сахарных плантациях Кубы."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "bolo"
	item_state = "bolo"
	slot_flags = ITEM_SLOT_BELT
	force = 33
	throwforce = 20
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
//	bayonet = TRUE
	//butcher_speed = 1.25

/obj/item/kitchen/knife/kukri
	name = "Кукри"
	desc = "Большое изогнутое лезвие в богато украшенной рукояти. Большинство людей предположили бы, что он австралийского происхождения. Исключительно эффективен при броске."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "kukri"
	item_state = "kukri"
	slot_flags = ITEM_SLOT_BELT
	force = 33
	throwforce = 50
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
//	bayonet = TRUE
	//butcher_speed = 1.25

/obj/item/shovel/entrenching_tool
	name = "Сапёрная лопатка"
	desc = "Самый полезный инструмент в окопах!"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "entrenching_tool"
	item_state = "entrenching_tool"
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 15
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
//	bayonet = TRUE


/obj/item/hatchet/ancienthatchet
	name = "Древний топор"
	desc = "Старый ручной топор все еще кажется крепким и острым."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "ancienthatchet"
	item_state = "hatchet"
	slot_flags = ITEM_SLOT_BELT
	force = 24
	throwforce = 20
	w_class = WEIGHT_CLASS_SMALL
	lefthand_file = 'icons/mob/inhands/equipment/hydroponics_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/hydroponics_righthand.dmi'
	hitsound = 'sound/weapons/knifeswing.ogg'
	attack_verb = list("атакует", "режет", "дырявит", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1.25

/obj/item/hatchet/woodhatchet
	name = "Деревянный топорик"
	desc = "Старый деревянный ручной топор все еще кажется крепким и острым."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "woodhatchet"
	item_state = "hatchet"
	slot_flags = ITEM_SLOT_BELT
	force = 27
	throwforce = 20
	w_class = WEIGHT_CLASS_SMALL
	lefthand_file = 'icons/mob/inhands/equipment/hydroponics_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/hydroponics_righthand.dmi'
	hitsound = 'sound/weapons/knifeswing.ogg'
	attack_verb = list("атакует", "режет", "кромсает", "рвёт")
	sharpness = IS_SHARP_ACCURATE
	//butcher_speed = 1.25

/obj/item/melee/halliganbar
	name = "Монтировка"
	desc = "Ржавый металлический хулиган, который можно использовать для избиения мутантов и сталкеров. Конец изогнут и непригоден для правильного использования."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "halliganbar"
	item_state = "crowbar"
	slot_flags = ITEM_SLOT_BELT
	force = 28
	throwforce = 15
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bluntswing.ogg'
	attack_verb = list("атакует", "бьёт", "избивает")
	sharpness = IS_BLUNT

/obj/item/melee/largewrench
	name = "Большой ключ"
	desc = "Ржавый металлический гаечный ключ, который можно использовать для избиения мутантов и сталкеров. Конец погнут и непригоден."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "largewrench"
	item_state = "bigwrench"
	slot_flags = ITEM_SLOT_BELT
	force = 24
	throwforce = 15
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bluntswing.ogg'
	attack_verb = list("атакует", "бьёт", "избивает")
	sharpness = IS_BLUNT

/obj/item/melee/redwrench
	name = "Большой ключ"
	desc = "Ржавый красный металлический ключ, который можно использовать для избиения мутантов и сталкеров. Конец погнут и непригоден."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "redwrench"
	item_state = "bigwrench"
	slot_flags = ITEM_SLOT_BELT
	force = 24
	throwforce = 15
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bluntswing.ogg'
	attack_verb = list("атакует", "бьёт", "избивает")
	sharpness = IS_BLUNT

/obj/item/melee/tireiron
	name = "Монтировка"
	desc = "Ржавый металлический ключ для шин, который можно использовать для избиения мутантов и сталкеров. Конец погнут и непригоден."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "tireiron"
	item_state = "tireiron"
	slot_flags = ITEM_SLOT_BELT
	force = 24
	throwforce = 15
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bluntswing.ogg'
	attack_verb = list("атакует", "бьёт", "избивает")
	sharpness = IS_BLUNT

/obj/item/melee/tireiron2
	name = "Монтировка"
	desc = "Ржавый металлический ключ для шин, который можно использовать для избиения мутантов и сталкеров. Конец погнут и непригоден."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "tireiron2"
	item_state = "tireiron"
	slot_flags = ITEM_SLOT_BELT
	force = 24
	throwforce = 15
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bluntswing.ogg'
	attack_verb = list("атакует", "бьёт", "избивает")
	sharpness = IS_BLUNT

/obj/item/melee/pipe
	name = "Металлическая труба"
	desc = "Ржавая металлическая труба, которую можно использовать для избиения мутантов и сталкеров."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "pipe"
	item_state = "nullrod"
	slot_flags = ITEM_SLOT_BELT
	force = 20
	throwforce = 15
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bluntswing.ogg'
	attack_verb = list("атакует", "бьёт", "избивает")
	sharpness = IS_BLUNT

/obj/item/melee/pipe2
	name = "Металлическая труба"
	desc = "Ржавая металлическая труба, которую можно использовать для избиения мутантов и сталкеров."
	icon_state = "pipe2"
	item_state = "pipe"
	slot_flags = ITEM_SLOT_BELT
	force = 20
	throwforce = 15
	w_class = WEIGHT_CLASS_NORMAL
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	hitsound = 'sound/weapons/bluntswing.ogg'
	attack_verb = list("атакует", "бьёт", "избивает")
	sharpness = IS_BLUNT

/obj/item/melee/baseball_bat/nail
	name = "Бита с гвоздями"
	desc = "В лиге нет ни одного черепа, который мог бы противостоять бите. К этой прибиты гвозди."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "nailbat"
	item_state = "nailbat"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 20
	throwforce = 12
	attack_verb = list("атакует", "бьёт", "избивает", "бонкает")
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BELT

/obj/item/melee/baseball_bat/barbed
	name = "Бита с колючей проволокой"
	desc = "В лиге нет ни одного черепа, который мог бы противостоять бите. К этой привязана проволока."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "barbedbat"
	item_state = "barbedbat"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 25
	throwforce = 12
	attack_verb = list("атакует", "бьёт", "избивает", "бонкает")
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BELT
