/obj/item/attachment
	icon = 'stalker/icons/weapon_mods.dmi'
	var/list/types = list()
	w_class = 2

/obj/item/attachment/suppressor
	name = "Глушитель"
	desc = "Универсальный глушитель."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "suppressor"
	types = list(/obj/item/gun/ballistic/automatic/pistol/pm,
				/obj/item/gun/ballistic/automatic/pistol/fort12,
				/obj/item/gun/ballistic/automatic/pistol/marta,
				/obj/item/gun/ballistic/automatic/pistol/sip,
				/obj/item/gun/ballistic/automatic/pistol/cora,
				/obj/item/gun/ballistic/automatic/pistol/usp_match,
				/obj/item/gun/ballistic/automatic/mp5,
				/obj/item/gun/ballistic/automatic/groza,
				/obj/item/gun/ballistic/automatic/ak74,
				/obj/item/gun/ballistic/automatic/aksu74,
				/obj/item/gun/ballistic/automatic/abakan,
				/obj/item/gun/ballistic/automatic/tpc301,
				/obj/item/gun/ballistic/automatic/kiparis,
				/obj/item/gun/ballistic/automatic/p90,
				/obj/item/gun/ballistic/automatic/m16,
				/obj/item/gun/ballistic/automatic/m16a4,
				/obj/item/gun/ballistic/automatic/m4)
	var/oldsound = null
	var/initial_w_class = null

/obj/item/attachment/scope
	name = "Прицел"
	desc = "Универсальный прицел."
	icon = 'stalker/icons/weapon_mods.dmi'
	icon_state = "susat"
	var/zoom_add = 2

/obj/item/attachment/scope/SUSAT
	name = "СУСАТ"
	desc = "4-кратный, фиксированный прицел, производимый в основном в западных странах. Крепится к оружию с помощью планки Пикатинни стандарта НАТО. Часто используется для ведения точного огня из стрелкового оружия на средних и дальних дистанциях."
	icon = 'stalker/icons/weapon_mods.dmi'
	icon_state = "susat"
	types = list(/obj/item/gun/ballistic/automatic/tpc301,
				/obj/item/gun/ballistic/automatic/mp5,
				/obj/item/gun/ballistic/automatic/sigsg550,
				/obj/item/gun/ballistic/automatic/p90)
	zoom_add = 4

/obj/item/attachment/scope/PS
	types = list(/obj/item/gun/ballistic/automatic/aksu74,
				 /obj/item/gun/ballistic/automatic/ak74,
				 /obj/item/gun/ballistic/automatic/abakan,
				 /obj/item/gun/ballistic/automatic/val,
				 /obj/item/gun/ballistic/automatic/groza)
	zoom_add = 2

/obj/item/attachment/scope/PS/U1
	name = "ПСУ-1"
	desc = "Оптический прицел с фиксированным увеличением (2,7 диоптрии). Оптимизирован для боя на средних дистанциях, а также для использования в городских условиях. Для установки на оружие используется стандартное в странах Варшавского договора крепление типа «ласточкин хвост»."
	icon_state = "PSU1"
	types = list(/obj/item/gun/ballistic/automatic/aksu74,
				/obj/item/gun/ballistic/automatic/ak74,
				/obj/item/gun/ballistic/automatic/akm,
				/obj/item/gun/ballistic/automatic/abakan,
				/obj/item/gun/ballistic/automatic/val,
				/obj/item/gun/ballistic/automatic/groza)
	zoom_add = 3

/obj/item/attachment/scope/PS/O1
	name = "ПСО-1"
	desc = "Широко распространенный советский оптический прицел с фиксированным увеличением (5). Оснащен шкалой определения дальности до цели. Для установки на оружие используется стандартное в странах Варшавского договора крепление типа «ласточкин хвост»."
	icon_state = "PSO1"
	types = list(/obj/item/gun/ballistic/automatic/aksu74,
				 /obj/item/gun/ballistic/automatic/ak74,
				 /obj/item/gun/ballistic/automatic/akm,
				 /obj/item/gun/ballistic/automatic/abakan,
				 /obj/item/gun/ballistic/automatic/val,
				 /obj/item/gun/ballistic/automatic/groza)
	zoom_add = 5

/obj/item/attachment/scope/rifle
	name = "Прицел"
	desc = "Оптический прицел, разработанный примерно в начале Второй мировой войны."
	icon_state = "rifle"
	types = list(/obj/item/gun/ballistic/rifle/boltaction/enfield,
				/obj/item/gun/ballistic/rifle/boltaction/mosin,
				/obj/item/gun/ballistic/shotgun/bm16,
				/obj/item/gun/ballistic/shotgun/bm16/toz34,
				/obj/item/gun/ballistic/automatic/fnfal,
				/obj/item/gun/ballistic/automatic/woodfnfal,
				/obj/item/gun/ballistic/automatic/m14)
	zoom_add = 6

/obj/item/attachment/scope/fnf2000
	name = "Прицел для ФН Ф2000"
	desc = "Прицел для винтовки ФН-Ф2000."
	icon_state = "fnf2000-scope"
	types = list(/obj/item/gun/ballistic/automatic/fnf2000)

/obj/item/attachment/grenadelauncher
	name = "Подствольный гранатомёт"
	desc = "Гранатомет, устанавливаемый на подвешенный рельс или другую систему крепления."
	icon_state = ""
	types = list()

/obj/item/attachment/grenadelauncher/fnf2000
	name = "Гранатомёт для ФН-Ф2000"
	desc = "Гранатомет, устанавливаемый на систему крепления ФН-Ф2000."
	icon_state = "fnf2000-gl"
