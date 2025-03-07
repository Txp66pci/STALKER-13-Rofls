//lazy rip from f13
// oy vey
// - Carl
/obj/machinery/door/poddoor/gate
	name = "Ворота контрольно-пропускного пункта"
	desc = "Тяжелые ворота, которые открываются механически, предназначены для защиты контрольно-пропускного пункта как от диких животных, так и от сталкеров."
	icon = 'stalker/icons/structure/military_gate.dmi'
	icon_state = "closed"
	id = 333
	bound_width = 96
	var/list/opacity_objects = list()

/obj/machinery/door/poddoor/gate/New()
	..()
	var/atom/movable/S = new (locate(x+1,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S
	S = new (locate(x+2,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S

/obj/machinery/door/poddoor/gate/Destroy()
	for(var/atom/movable/S in opacity_objects)
		qdel(S)
	..()

/obj/machinery/door/poddoor/gate/open()
	..()
	for(var/atom/movable/S in opacity_objects)
		S.set_opacity(0)
	playsound(src, 'sound/machines/warning-buzzer.ogg', 30, 1)


/obj/machinery/door/poddoor/gate/close()
	..()
	for(var/atom/movable/S in opacity_objects)
		S.set_opacity(1)
	playsound(src, 'sound/machines/warning-buzzer.ogg', 30, 1)
