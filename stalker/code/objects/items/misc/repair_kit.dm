/obj/item/repair_kit
	name = "Ремнабор"
	var/uses = 1
	var/min_durability = 50
	var/add_durability = 30

/obj/item/repair_kit/clothing
	name = "Ремнабор для брони"
	desc = "Ремкомплект бронекостюмов и шлемов. Предназначен для некритичного ремонта (состояние от 25% до 100%)."
	icon = 'stalker/icons/device_new.dmi'
	icon_state = "repair_kit_clothing_25"
	uses = 1
	min_durability = 25
	add_durability = 40

/obj/item/clothing/suit/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/repair_kit/clothing))
		var/obj/item/repair_kit/RK = A
		if(src.loc == user)
			user << "<span class='warning'>Положите [src] на пол или стол.</span>"
			return 0

		if((src.durability/initial(durability)*100) < RK.min_durability)
			user << "<span class='warning'>[src] прочность слишком низкая. Вы не можете отремонтировать его с помощью комплекта такого типа.</span>"
			return 0

		playsound(user.loc, 'stalker/sound/inv_repair_spray_oil.ogg', 50, 1)
		user.visible_message("<span class='notice'>[user] начинает ремонтировать [src]...</span>", "<span class='notice'>Вы начинаете Чинить [src]...</span>")
		if(!do_after(user, 50, target = src))
			playsound(src.loc, null, 50, 0)

		durability = (((durability / initial(durability) * 100) + RK.add_durability) / 100) * initial(durability)
		RK.uses -=1
		user.visible_message("<span class='notice'>[user] чинит [src].</span>", "<span class='notice'>Ты чинишь [src].")

		if(RK.uses <= 0)
			qdel(RK)

		if(durability > initial(durability))
			durability = initial(durability)
		return 1

	/*if(internal_slot)

		if(!internal_slot.can_be_inserted(A, 0 , user))
			return 0

		internal_slot.handle_item_insertion(A, 0 , user)
		return 1*/ //NEED REWORK


/obj/item/clothing/head/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/repair_kit/clothing))
		var/obj/item/repair_kit/RK = A

		if(src.loc == user)
			user << "<span class='warning'>Положите [src] на пол или стол.</span>"
			return 0

		if((src.durability/initial(durability)*100) < RK.min_durability)
			user << "<span class='warning'>[src] прочность слишком низкая. Вы не можете отремонтировать его с помощью комплекта такого типа.</span>"
			return 0

		playsound(user.loc, 'stalker/sound/inv_repair_spray_oil.ogg', 50, 1)
		user.visible_message("<span class='notice'>[user] Начинает ремонтировать [src]...</span>", "<span class='notice'>Ты начинаешь чинить [src]...</span>")
		if(!do_after(user, 50, target = src))
			playsound(src.loc, null, 50, 0)

		durability = (((durability / initial(durability) * 100) + RK.add_durability) / 100) * initial(durability)
		RK.uses -=1
		user.visible_message("<span class='notice'>[user] ремонтирует [src].</span>", "<span class='notice'>Ты чинишь [src].")

		if(RK.uses <= 0)
			qdel(RK)

		if(durability > initial(durability))
			durability = initial(durability)
		return 1

/obj/item/repair_kit/gun
	name = "Комплект для чистки оружия"
	desc = "Набор для чистки огнестрельного оружия. Предназначен для восстановления работоспособности поврежденного огнестрельного оружия (состояние от 25% до 100%)."
	icon = 'stalker/icons/device_new.dmi'
	icon_state = "repair_kit_gun_25"
	uses = 1
	min_durability = 25
	add_durability = 40

/obj/item/gun/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/repair_kit/gun))
		var/obj/item/repair_kit/RK = A
		if(src.loc == user)
			user << "<span class='warning'>Положите [src] на пол или стол.</span>"
			return 0

		if((src.durability/initial(durability)*100) < RK.min_durability)
			user << "<span class='warning'>[src] прочность слишком низкая. Вы не можете отремонтировать его с помощью комплекта такого типа.</span>"
			return 0

		playsound(user.loc, 'stalker/sound/inv_repair_spray_oil.ogg', 50, 1)
		user.visible_message("<span class='notice'>[user] начинает чистить [src]...</span>", "<span class='notice'>Вы начинаете чистить [src]...</span>")

		if(!do_after(user, 50, target = src))
			playsound(user.loc, null, 50, 0)

		durability = (((durability / initial(durability) * 100) + RK.add_durability) / 100) * initial(durability)
		RK.uses -=1
		user.visible_message("<span class='notice'>[user] чистит [src].</span>", "<span class='notice'>Вы чистите [src].")

		if(RK.uses <= 0)
			qdel(RK)

		if(durability > initial(durability))
			durability = initial(durability)
		return 1

/obj/item/repair_kit/examine(mob/user)
	..()
	user << "<span class='notice'>Uses left - [uses]</span>"
	user << "<span class='notice'>Restores - [add_durability]%</span>"