/obj/item/grenade/preprime(mob/user, delayoverride, msg = TRUE, volume = 60)
	var/area/B = get_area(user.loc)
	if(B.safezone)
		to_chat(user, "<span class='warning'>Вы пытаетесь выдернуть чеку, но дёргаете своё очко. </span> ")
		return 0
	..()

/obj/item/grenade/syndieminibomb/concussion/stalker/frag/prime()
	update_mob()
	var/turf/startloc = get_turf(src)
	for(var/T in RANGE_TURFS(12, startloc) - startloc)
		if(prob(3))
			var/obj/item/projectile/P = new /obj/item/projectile/bullet/fragment(startloc)
			P.preparePixelProjectile(T, startloc)
			P.firer = src
			P.fire(T)
	explosion(src.loc,0,0,1,flame_range = 3)
	qdel(src)

/obj/item/grenade/syndieminibomb/concussion/stalker/frag
	name = "РГД-5"
	desc = "Наступательная ручная граната с малым радиусом осколочного поражения."
	icon_state = "rgd5grenade"

//smoke
/obj/item/grenade/smokebomb/rgd
	name = "РГД-3"
	desc = "Граната, предназначенная для задымления области. Используйте с осторожностью."
	icon_state = "smoke"
