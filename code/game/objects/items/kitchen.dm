/* Kitchen tools
 * Contains:
 *		Fork
 *		Kitchen knives
 *		Ritual Knife
 *		Butcher's cleaver
 *		Combat Knife
 *		Rolling Pins
 */

/obj/item/kitchen
	icon = 'icons/obj/kitchen.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'

/obj/item/kitchen/fork
	name = "fork"
	desc = "Pointy."
	icon_state = "fork"
	force = 5
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	throw_speed = 3
	throw_range = 5
	materials = list(MAT_METAL=80)
	flags_1 = CONDUCT_1
	attack_verb = list("attacked", "stabbed", "poked")
	hitsound = 'sound/weapons/bladeslice.ogg'
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 30)
	var/datum/reagent/forkload //used to eat omelette

/obj/item/kitchen/fork/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] stabs \the [src] into [user.p_their()] chest! It looks like [user.p_theyre()] trying to take a bite out of [user.p_them()]self!</span>")
	playsound(src, 'sound/items/eatfood.ogg', 50, 1)
	return BRUTELOSS

/obj/item/kitchen/fork/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(!istype(M))
		return ..()

	if(forkload)
		if(M == user)
			M.visible_message("<span class='notice'>[user] eats a delicious forkful of omelette!</span>")
			M.reagents.add_reagent(forkload.id, 1)
		else
			M.visible_message("<span class='notice'>[user] feeds [M] a delicious forkful of omelette!</span>")
			M.reagents.add_reagent(forkload.id, 1)
		icon_state = "fork"
		forkload = null

	else if(user.zone_selected == BODY_ZONE_PRECISE_EYES)
		if(user.has_trait(TRAIT_CLUMSY) && prob(50))
			M = user
		return eyestab(M,user)
	else
		return ..()


/obj/item/kitchen/knife
	name = "Кухонный нож"
	icon_state = "knife"
	item_state = "knife"
	desc = "Кухонный нож общего назначения, используемый шеф-поварами во всем мире. Не особенно хорош в бою, но лучше, чем ничего."
	flags_1 = CONDUCT_1
	force = 15
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 10
	hitsound = 'sound/weapons/bladeslice.ogg'
	throw_speed = 3
	throw_range = 6
	sharpness = IS_SHARP_ACCURATE
	slot_flags = ITEM_SLOT_BELT
	materials = list(MAT_METAL=12000)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	sharpness = IS_SHARP_ACCURATE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	var/bayonet = FALSE	//Can this be attached to a gun?
	custom_price = 30

/obj/item/kitchen/knife/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 80 - force, 100, force - 10) //bonus chance increases depending on force

/obj/item/kitchen/knife/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(user.zone_selected == BODY_ZONE_PRECISE_EYES)
		if(user.has_trait(TRAIT_CLUMSY) && prob(50))
			M = user
		return eyestab(M,user)
	else
		return ..()

/obj/item/kitchen/knife/suicide_act(mob/user)
	user.visible_message(pick("<span class='suicide'>[user] is slitting [user.p_their()] wrists with the [src.name]! It looks like [user.p_theyre()] trying to commit suicide.</span>", \
						"<span class='suicide'>[user] is slitting [user.p_their()] throat with the [src.name]! It looks like [user.p_theyre()] trying to commit suicide.</span>", \
						"<span class='suicide'>[user] is slitting [user.p_their()] stomach open with the [src.name]! It looks like [user.p_theyre()] trying to commit seppuku.</span>"))
	return (BRUTELOSS)

/obj/item/kitchen/knife/ritual
	name = "ritual knife"
	desc = "The unearthly energies that once powered this blade are now dormant."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/kitchen/knife/butcher
	name = "Мясницкий нож"
	icon_state = "butch"
	item_state = "butch"
	desc = "Отличный тесак для разделки мутантов. Также хорош в разделке сталкеров!"
	flags_1 = CONDUCT_1
	force = 20
	throwforce = 10
	hitsound = "sound/weapons/knifeswing.ogg"
	sharpness = IS_SHARP_ACCURATE
	slot_flags = ITEM_SLOT_BELT
	materials = list(MAT_METAL=18000)
	attack_verb = list("cleaved", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	w_class = WEIGHT_CLASS_NORMAL
	custom_price = 60

/obj/item/kitchen/knife/combat
	name = "combat knife"
	icon_state = "buckknife"
	desc = "A military combat utility survival knife."
	embedding = list("embedded_pain_multiplier" = 4, "embed_chance" = 65, "embedded_fall_chance" = 10, "embedded_ignore_throwspeed_threshold" = TRUE)
	force = 20
	throwforce = 20
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "cut")
	bayonet = TRUE

/obj/item/kitchen/knife/combat/survival
	name = "survival knife"
	icon_state = "survivalknife"
	embedding = list("embedded_pain_multiplier" = 4, "embed_chance" = 35, "embedded_fall_chance" = 10)
	desc = "A hunting grade survival knife."
	force = 15
	throwforce = 15
	bayonet = TRUE

/obj/item/kitchen/knife/combat/bone
	name = "bone dagger"
	item_state = "bone_dagger"
	icon_state = "bone_dagger"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	desc = "A sharpened bone. The bare minimum in survival."
	embedding = list("embedded_pain_multiplier" = 4, "embed_chance" = 35, "embedded_fall_chance" = 10)
	force = 15
	throwforce = 15
	materials = list()

/obj/item/kitchen/knife/combat/cyborg
	name = "cyborg knife"
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "knife"
	desc = "A cyborg-mounted plasteel knife. Extremely sharp and durable."

/obj/item/kitchen/knife/carrotshiv
	name = "carrot shiv"
	icon_state = "carrotshiv"
	item_state = "carrotshiv"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	desc = "Unlike other carrots, you should probably keep this far away from your eyes."
	force = 8
	throwforce = 12//fuck git
	materials = list()
	attack_verb = list("shanked", "shivved")
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/kitchen/rollingpin
	name = "rolling pin"
	desc = "Used to knock out the Bartender."
	icon_state = "rolling_pin"
	force = 8
	throwforce = 5
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "whacked")
	custom_price = 20

/obj/item/kitchen/rollingpin/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins flattening [user.p_their()] head with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS
/* Trays  moved to /obj/item/storage/bag */

/obj/item/weapon/kitchen/knife/hunting
	name = "hunting knife"
	icon_state = "huntingknife"
	item_state = "knife"
	desc = "A hunting knife that is typically used by stalkers and military personnel alike. It has a serrated edge which is fit for survival usage, and a bayonet lug on its hilt."
	force = 30
	throwforce = 20
	sharpness = IS_SHARP_ACCURATE
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	hitsound = "sound/weapons/knifeswing.ogg"
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "cut")

/obj/item/weapon/kitchen/knife/m9
	name = "m9 knife"
	icon_state = "m9knife"
	item_state = "knife"
	desc = "An M9 Phrobis III multipurpose knife and bayonet. Sports a 7-inch blade and is purpose-built to stab things, in your hands or on a gun. Really pointy."
	force = 35
	throwforce = 20
	armour_penetration = 35
	sharpness = IS_SHARP_ACCURATE
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	hitsound = "sound/weapons/knifeswing.ogg"
	attack_verb = list("penetrated", "stabbed", "punctured", "impaled", "skewered", "pierced")
