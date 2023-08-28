#define IU238 	(1<<0)
#define IPU238 	(1<<1)
#define	IPO210	(1<<2)

GLOBAL_LIST_EMPTY(all_artifacts)

/obj/item/artifact
	icon = 'stalker/icons/artifacts.dmi'
	desc = "Simple Artifact"
	var/capacity = 0
	var/charge = 0
	var/list/art_armor = list()
	var/radiation = 2
	var/waspicked = 0
	var/level_s = 1
	w_class = 2
	var/obj/effect/fakeart/phantom = null

/obj/item/artifact/Initialize()
	. = ..()
	GLOB.all_artifacts += src
	capacity = rand(1000, 10000)
	charge = capacity

/obj/item/artifact/Destroy()
	. = ..()
	GLOB.all_artifacts -= src
	if(phantom)
		qdel(phantom)
	phantom = null

/obj/item/artifact/proc/Think(mob/user)
	if(!charge) 
		return 0
	if(istype(user, /mob/living/carbon))
		var/mob/living/carbon/mob = user
		if(istype(loc, user))
			mob.radiation = max(0, mob.radiation + radiation)

		else if(istype(loc, /obj/item/storage))
			mob.radiation = max(0, mob.radiation + radiation)

		return art_armor
	return 0

/obj/item/artifact/pickup(mob/user)
	. = ..()
	if(invisibility)
		invisibility = 0

/////////////////////////////////////////Gravity artifacts/////////////////////////////////////////
/obj/item/artifact/meduza
	name = "Медуза"
	desc = "Этот гравитационный артефакт притягивает и поглощает радиоактивные частицы, уменьшая воздействие радиации на организм. Очень распространен в Зоне и неофициально используется за пределами Зоны для лечения острой лучевой болезни в исключительных обстоятельствах."
	icon_state = "meduza"
	art_armor = list()
	radiation = -2
	level_s = 1
/
/obj/item/artifact/stoneflower
	name = "Каменный цветок"
	desc = "Родился в гравитационных аномалиях. Этот артефакт встречается только в нескольких областях Зоны. Кусочки металлических соединений создают красивую игру света."
	icon_state = "stoneflower"
	art_armor = list(bullet = 10)
	radiation = 2
	level_s = 2

/obj/item/artifact/nightstar
	name = "Ночная звезда"
	desc = "Этот чудесный артефакт образован гравитационными аномалиями. Использование артефакта требует нейтрализации смертоносной радиации. Дорогой и редкий."
	icon_state = "nightstar"
	art_armor = list(bullet = 20)
	radiation = 3
	level_s = 3
/
/obj/item/artifact/stoneflower_depleted
	name = "Истощённый каменный цветок"
	desc = "Родился в гравитационных аномалиях. Этот артефакт встречается только в нескольких областях Зоны. Кусочки металлических соединений создают красивую игру света."
	icon_state = "stoneflower"
	art_armor = list()
	radiation = 2
	level_s = 2

/obj/item/artifact/nightstar_depleted
	name = "Истощённая ночная звезда"
	desc = "Этот чудесный артефакт образован гравитационными аномалиями. Использование артефакта требует нейтрализации смертоносной радиации. Дорогой и редкий."
	icon_state = "nightstar"
	art_armor = list()
	radiation = 3
	level_s = 3

/obj/item/artifact/soul
	name = "Душа"
	desc = "Уникальный органический артефакт с такими же уникальными свойствами. Каким-то образом он увеличивает общую скорость восстановления организма после повреждений любого рода, не ускоряя накопление токсинов. Благодаря своим эффектам и привлекательному внешнему виду этот артефакт является ценным предметом коллекционирования. Излучает радиацию."
	icon_state = "soul"
	art_armor = list()
	radiation = 2
	level_s = 4

/obj/item/artifact/soul/Think(mob/user)
	if(!..()) return 0
	if(istype(user, /mob/living/carbon))
		var/mob/living/carbon/mob = user
		mob.adjustBruteLoss(-1)
	return 1

	/////////////////////////////////////////Electro artifacts/////////////////////////////////////////

/obj/item/artifact/flash
	name = "Вспышка"
	desc = "Этот электростатический артефакт является мощным поглотителем электричества, которое он позже разряжает. Вспышка способна защитить своего носителя от поражения электрическим током напряжением до 5 000 вольт. Излучает радиацию."
	icon_state = "flash"
	art_armor = list(energy = 10)
	radiation = 1
	level_s = 1

/obj/item/artifact/moonlight
	name = "Лунный свет"
	desc = "Выраженный случай активности аномалии Электра. Кажется, что такая замечательная круглая форма создается, когда аномалия подвергается термическим воздействиям. Дорогой артефакт."
	icon_state = "moonlight"
	art_armor = list(energy = 20)
	radiation = 2
	level_s = 2

/obj/item/artifact/pustishka
	name = "Пустышка"
	desc = "Выраженный случай активности аномалии Электра. Кажется, что такая замечательная форма создается, когда аномалия подвергается термическим воздействиям. Дорогой артефакт."
	icon_state = "pustishka"
	art_armor = list(energy = 30)
	radiation = 2
	level_s = 3

/obj/item/artifact/battery
	name = "Батарейка"
	desc = "В состав этого артефакта входят электростатические элементы, но ученым еще предстоит определить точные физические условия, необходимые для его формирования. Артефакт популярен в Зоне и ценится ее жителями и посетителями за его освежающие свойства, хотя он может утомить тело при длительном использовании. Не излучает радиацию."
	icon_state = "battery"
	art_armor = list(energy = 30)
	level_s = 4

	/////////////////////////////////////////Fire artifacts/////////////////////////////////////////

/obj/item/artifact/droplet
	name = "Капля"
	desc = "Образующаяся в термических аномалия при высоких температурах. Снаружи выглядит слезообразно, с глянцевой поверхностью, покрытой трещинами."
	icon_state = "droplet"
	art_armor = list(rad = 10)
	radiation = -1
	level_s = 1
/*
/obj/item/artifact/droplet/Think(user)
	if(!..()) return 0
	if(istype(user, /mob/living/carbon))
		var/mob/living/carbon/mob = user
		mob.adjustStaminaLoss(1.8)
	return 1
*/
/obj/item/artifact/fireball
	name = "Огненный шар"
	desc = "Кристаллизуется в аномалиях огненного типа. Хорошо борется с радиацией, хотя повышенная скорость энергообмена истощает мышцы. Долго бегать не получится. Артефакт излучает тепло."
	icon_state = "fireball"
	art_armor = list(rad = 15)
	radiation = -2
	level_s = 2

/obj/item/artifact/crystal
	name = "Кристал"
	desc = "Создается, когда тяжелые металлы попадают в огненных аномалиях. Этот артефакт чудесным образом устраняет радиацию. Он высоко ценится сталкерами и его трудно найти."
	icon_state = "crystal"
	art_armor = list()
	radiation = -5
	level_s = 4

/obj/item/artifact/maminibusi
	name = "Мамины буссы"
	desc = "Многое об этом артефакте остается полной загадкой для ученых. В то же время доподлинно известно, что выбросы, производимые импульсами в его более толстых участках, заставляют кровь в открытых ранах быстрее сворачиваться, образуя защитный струп. Одним из наиболее заметных эффектов этого артефакта является повышенная скорость заживления ран. Испускает радиацию."
	icon_state = "mamini_busi"
	art_armor = list()
	radiation = 5
	level_s = 4

/obj/item/artifact/maminibusi/Think(mob/user)
	if(!..()) return 0
	if(istype(user, /mob/living/carbon))
		var/mob/living/carbon/mob = user
		mob.adjustFireLoss(-1)
	return 1


	/////////////////////////////////////////Chemical artifacts/////////////////////////////////////////

/obj/item/artifact/stone_blood
	name = "Кровь камня"
	desc = "Красноватое образование из сжатых и окаменелых растений, почвы и остатков животных. Может частично нейтрализовать химические яды. Испускает радиацию."
	icon_state = "stone_blood"
	art_armor = list(bio = 10)
	radiation = 1
	level_s = 1

/obj/item/artifact/bubble
	name = "Пузырь"
	desc = "Соединение нескольких полых органических образований, этот артефакт выделяет газообразное вещество, которое может нейтрализовать радиоактивные частицы внутри организма, не причиняя ему вреда. Из-за своей эффективности этот артефакт пользуется большим спросом."
	icon_state = "bubble"
	art_armor = list()
	radiation = -3
	level_s = 2

/obj/item/artifact/mica
	name = "Слюда"
	desc = "Аномалия \"Кисель\" способна создать такой артефакт при редчайшей, самой экстремальной коллекции физических условий. В результате получается полупрозрачный твердый объект. Редкий и дорогой артефакт."
	icon_state = "mica"
	art_armor = list(laser = 10, bio = 10)
	radiation = 3
	level_s = 3

/obj/item/artifact/mica/Think(mob/user)
	if(!..()) return 0
	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(!H.bleedsuppress) //so you can't stack bleed suppression
			H.suppress_bloodloss(1)

			if(H.stat != DEAD && H.bodytemperature >= 170)

				var/blood_volume = round(H.reagents.get_reagent_amount("blood"))
				if(blood_volume < 560 && blood_volume)

					var/datum/reagent/blood/B = locate() in H.reagents.reagent_list
					if(B)
						if(B.data["donor"] != src) //If it's not theirs, then we look for theirs
							for(var/datum/reagent/blood/D in H.reagents.reagent_list)
								if(D.data["donor"] == src)
									B = D
									break

						B.volume += 0.5
	return 1

/obj/item/artifact/firefly
	name = "Светляк"
	desc = "Светляк взаимодействует с неизвестными науке полями, значительно ускоряя регенерацию тканей и органов у живых существ, а также нормализуя обменные процессы. Этот артефакт может буквально за считанные секунды поставить тяжело раненого сталкера на ноги. К сожалению, Светляк встречается крайне редко. Излучает радиацию."
	icon_state = "firefly"
	art_armor = list()
	radiation = 5
	level_s = 4

/obj/item/artifact/firefly/Think(mob/user)
	if(!..()) return 0
	if(istype(user, /mob/living/carbon))
		var/mob/living/carbon/mob = user
		mob.adjustFireLoss(-0.5)
		mob.adjustBruteLoss(-0.5)
	return 1

	//ПОЯС
/obj/item/storage/belt/stalker
	name = "Пояс для артефактов"
	desc = "Специальный пояс для артефактов."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "artifactbelt"
	item_state = "utility"

/obj/item/storage/belt/stalker/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 5
	STR.can_hold = typecacheof(list(/obj/item/artifact))

/obj/item/storage/belt/stalker/artifact_belt
	var/thinkrate = 100

/obj/item/storage/belt/stalker/artifact_belt/small
	name = "Маленький пояс для артефактов"
	desc = "Специальный пояс для артефактов."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "artifactbeltsmall"
	item_state = "artifacts"

/obj/item/storage/belt/stalker/artifact_belt/small/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 2

/obj/item/storage/belt/stalker/artifact_belt/proc/Think(mob/user)
	for(var/obj/item/artifact/A in contents)
		A.Think(user)
	//spawn(thinkrate)
	//	Think()
/
/obj/item/storage/belt/stalker/artifact_belt/handle_item_insertion(obj/item/W, prevent_warning = 0, mob/user)
	if(..(W, prevent_warning, user) && istype(W, /obj/item/artifact))
		var/obj/item/artifact/artifact = W
		var/mob/living/carbon/mob = loc
		for(var/i=1,i<=artifact.art_armor.len,i++)
			var/armortype = artifact.art_armor[i]
			if(!(armortype in mob.global_armor))
				mob.global_armor += armortype
			mob.global_armor[armortype] += artifact.art_armor[armortype]
		return 1
	return 0

/obj/item/storage/belt/stalker/artifact_belt/remove_from_storage(obj/item/W, atom/new_location, fire = 0)
	if(..(W, new_location, fire) && istype(W, /obj/item/artifact))
		var/obj/item/artifact/artifact = W
		var/mob/living/carbon/mob = loc
		for(var/i=1,i<=artifact.art_armor.len,i++)
			var/armortype = artifact.art_armor[i]
			if(!(armortype in mob.global_armor))
				mob.global_armor += armortype
			mob.global_armor[armortype] -= artifact.art_armor[armortype]
		return 1
	return 0
/
