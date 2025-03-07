/mob/living/simple_animal/hostile/mutant
	vision_range = 9
	aggro_vision_range = 9
	stat_attack = 2
	stat_exclusive = 0
	fearless = 0
	icon = 'stalker/icons/stalker.dmi'
	speak_chance = 1.5
	rating_add = 10
	loot = list()
	robust_searching = 1
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	var/random_butcher_results
	var/deletable = TRUE //Self-deletable dead bodies
	var/gib_targets = TRUE //Гибать
/*
/mob/living/simple_animal/hostile/mutant/death(gibbed)
	..()
	if(deletable)
		spawn(300)
			qdel(src)
*/
/*
/mob/living/simple_animal/hostile/mutant/Move(atom/NewLoc, direct)
	if(get_area(NewLoc).safezone)
		if(src.client && (src.client.prefs.chat_toggles & CHAT_LANGUAGE))
			src << "<span class='warning'>You can't be here!</span>"
		else
			src << "<span class='warning'>Вы не можете находитьcя в этой зоне!</span>"
		return 0
	return ..()
*/
/mob/living/simple_animal/hostile/mutant/AttackingTarget()
	..()
	if(istype(target, /mob/living))
		var/mob/living/L = target
		if (L.stat == DEAD && gib_targets)
			if(ishuman(L))
				var/mob/living/carbon/human/H = L
				if(prob(50))
					H.dropItemToGround(H.ears)
				if(prob(50))
					H.dropItemToGround(H.gloves)
				if(prob(50))
					H.dropItemToGround(H.glasses)
				if(prob(50))
					H.dropItemToGround(H.head)
				if(prob(50))
					H.dropItemToGround(H.shoes)
				if(prob(100))
					H.dropItemToGround(H.back)
				H.dropItemToGround(H.back)
				H.dropItemToGround(H.wear_id)
			L.gib()
			visible_message("<span class='danger'>[src] breaks [L] into pieces!</span>")
			to_chat(src, "<span class='userdanger'>You devour [L] and regain your health!</span>")
			src.revive()

/mob/living/simple_animal/hostile/mutant/dog
	name = "Слепой пёс"
	desc = "Самый привычный представитель фауны Зоны. Стаи этих псов можно встретить везде, кроме совершенно гибельных мест."
	turns_per_move = 15
	speed = 1
	a_intent = "harm"
	harm_intent_damage = 5
	icon_state = "stalker_dog"
	icon_living = "stalker_dog"
	icon_dead = "stalker_dog_dead"
	attacktext = "кусает"
	search_objects = 1
	speak_emote = list("скулит", "ревёт")
	emote_see = list("лает!")
	faction = list("stalker_mutants1")
	attack_sound = list('stalker/sound/mobs/mutants/attack/dog_attack.ogg',
						'stalker/sound/mobs/mutants/attack/dog_attack2.ogg',
						'stalker/sound/mobs/mutants/attack/dog_attack3.ogg')
	idle_sounds = list('stalker/sound/mobs/mutants/idle/bdog_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/bdog_idle_2.ogg',
						'stalker/sound/mobs/mutants/idle/bdog_idle_3.ogg',
						'stalker/sound/mobs/mutants/idle/bdog_idle_4.ogg')
	deathsound = 'stalker/sound/mobs/mutants/death/dog_death.ogg'
	melee_damage_lower = 10
	melee_damage_upper = 15
	maxHealth = 25
	fearborder = 10
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	healable = 1
	robust_searching = 0
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	deathmessage = "издает болезненный вой, прежде чем упасть на бок!"
	del_on_death = 0
	minbodytemp = 0
	maxbodytemp = 1500
	environment_smash = 0
	layer = MOB_LAYER - 0.1
	butcher_results = list(/obj/item/stalker/loot/mutantparts/dog_tail = 1,
							/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/dog_meat = 1)
	attack_type = "bite"
	move_to_delay = 1.2 //Real speed of a mob
	rating_add = 25
	vision_range = 15
	aggro_vision_range = 15

/mob/living/simple_animal/hostile/mutant/dog/New()
	..()
	if(prob(50))
		icon_state = "stalker_dog2"
		icon_living = "stalker_dog2"
		icon_dead = "stalker_dog2_dead"

/mob/living/simple_animal/hostile/mutant/dog/AttackingTarget()
	..()
	if(istype(target, /mob/living/carbon))
		var/mob/living/carbon/C = target
		if(C.health > 25)
			var/anydir = pick(GLOB.alldirs)
			walk_away(src, get_step(src, anydir), 7, move_to_delay)

/mob/living/simple_animal/hostile/mutant/snork
	name = "Снорк"
	desc = "Остатки людей... нет им покоя. Одиночный снорк - опасность для сноровистого охотника небольшая. Но в толпе..."
	turns_per_move = 15
	speed = 3
	a_intent = "harm"
	search_objects = 1
	icon_state = "snork"
	icon_living = "snork"
	icon_dead = "snork_dead"
	attacktext = "прыгает на"
	speak_emote = list("Рычит", "ревёт")
	emote_see = list("Рычит", "ревёт")
	maxHealth = 120
	healable = 1
	melee_damage_lower = 20
	attack_sound = list('stalker/sound/mobs/mutants/attack/snork_attack.ogg',
						'stalker/sound/mobs/mutants/attack/snork_attack1.ogg',
						'stalker/sound/mobs/mutants/attack/snork_attack2.ogg'
						)
	idle_sounds = list('stalker/sound/mobs/mutants/idle/snork_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/snork_idle_2.ogg',
						'stalker/sound/mobs/mutants/idle/snork_idle_3.ogg')
	deathsound = 'stalker/sound/mobs/mutants/death/snork_death.ogg'
	melee_damage_upper = 30
	fearborder = 10
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("stalker_mutants1", "monolith_forces")
	del_on_death = 0
	//environment_smash = 1
	robust_searching = 0
	deathmessage = "падает замертво"
	layer = MOB_LAYER - 0.1
	butcher_results = list(/obj/item/stalker/loot/mutantparts/snork_leg = 1,
							/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/snork_meat = 1)
	//random_butcher_results = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	ranged = 1
	ranged_cooldown = 1 //By default, start the Goliath with his cooldown off so that people can run away quickly on first sight
	ranged_cooldown_time = 2

	attack_type = "claw"
	var/leaping = 0
	move_to_delay = 2
	rating_add = 50
	vision_range = 15
	aggro_vision_range = 15

/mob/living/simple_animal/hostile/mutant/snork/New()
	..()
	if(prob(50))
		icon_state = "snork2"
		icon_living = "snork2"
		icon_dead = "snork2_dead"

/mob/living/simple_animal/hostile/mutant/snork/OpenFire()
	if(get_dist(src, target) <= 4)
		leaping = 1
		//throw_at_fast(target, 7, 1)
		throw_at(target, 7, 1, spin=1, diagonals_first = 1)
		leaping = 0
		ranged_cooldown = ranged_cooldown_time
	return
				//sleep(10)

/mob/living/simple_animal/hostile/mutant/snork/throw_impact(atom/A)

	if(!leaping)
		return ..()

	if(A)
		if(istype(A, /mob/living))
			var/mob/living/L = A
			var/blocked = 0
			if(ishuman(A))
				var/mob/living/carbon/human/H = A
				if(H.check_shields(90, "the [name]", src, attack_type = THROWN_PROJECTILE_ATTACK))
					blocked = 1
			if(!blocked)
				L.visible_message("<span class ='danger'>[src] pounces on [L]!</span>", "<span class ='userdanger'>[src] pounces on you!</span>")
				L.AdjustStun(20)
				sleep(2) //Runtime prevention (infinite bump() calls on hulks)
				step_towards(src,L)
		else if(A.density && !A.CanPass(src))
			visible_message("<span class ='danger'>[src] smashes into [A]!</span>", "<span class ='alertalien'>[src] smashes into [A]!</span>")

		if(leaping)
			leaping = 0
			update_icons()

/mob/living/simple_animal/hostile/mutant/flesh
	name = "Плоть"
	desc = "Плоть — мутировавшие до неузнаваемости свиньи, одни из самых безобидных мутантов в Зоне."
	turns_per_move = 15
	speed = 5
	a_intent = "harm"
	search_objects = 1
	icon_state = "plot"
	icon_living = "plot"
	icon_dead = "plot_dead"
	attacktext = "врезается в"
	speak_emote = list("хрипит")
	emote_see = list("агрессивно кричит!")
	maxHealth = 60
	healable = 5
	melee_damage_lower = 10
	attack_sound = list('stalker/sound/mobs/mutants/attack/flesh_attack.ogg',
						'stalker/sound/mobs/mutants/attack/flesh_attack1.ogg',
						'stalker/sound/mobs/mutants/attack/flesh_attack2.ogg',
						'stalker/sound/mobs/mutants/attack/flesh_attack3.ogg')
	idle_sounds = list('stalker/sound/mobs/mutants/idle/flesh_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/flesh_idle_2.ogg')
	deathsound = 'stalker/sound/mobs/mutants/death/flesh_death.ogg'
	melee_damage_upper = 25
	fearborder = 18
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("stalker_mutants1")
	del_on_death = 0
	environment_smash = 1
	robust_searching = 1
	deathmessage = "останавливается мёртвым и падает"
	layer = MOB_LAYER - 0.1
	butcher_results = list(/obj/item/stalker/loot/mutantparts/flesh_eye = 1,
							/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/flesh_meat = 1)
	//random_butcher_results = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	attack_type = "smash"
	move_to_delay = 3
	rating_add = 25
	vision_range = 15
	aggro_vision_range = 15

/mob/living/simple_animal/hostile/mutant/boar
	name = "Кабан"
	desc = "Кабан — одно из многочисленных животных Зоны, подвергшееся воздействию аномальной энергии, после Второй катастрофы на ЧАЭС."
	turns_per_move = 15
	speed = 5
	a_intent = "harm"
	search_objects = 1
	icon_state = "boar"
	icon_living = "boar"
	icon_dead = "boar_dead"
	attacktext = "врезается в"
	speak_emote = list("grunts")
	emote_see = list("grunts aggressively!")
	maxHealth = 180
	healable = 1
	melee_damage_lower = 25
	attack_sound = 'stalker/sound/mobs/mutants/attack/boar_attack.ogg'
	idle_sounds = list('stalker/sound/mobs/mutants/idle/boar_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/boar_idle_2.ogg',
						'stalker/sound/mobs/mutants/idle/boar_idle_3.ogg')
	deathsound = 'stalker/sound/mobs/mutants/death/boar_death.ogg'
	melee_damage_upper = 40
	fearborder = 18
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("stalker_mutants1")
	del_on_death = 0
	environment_smash = 1
	robust_searching = 1
	deathmessage = "падает на землю!"
	layer = MOB_LAYER - 0.1
	butcher_results = list(/obj/item/stalker/loot/mutantparts/boar_leg = 1,
							/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/boar_meat = 1)
	//random_butcher_results = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	attack_type = "smash"
	move_to_delay = 3
	rating_add = 50
	vision_range = 15
	aggro_vision_range = 15

	/*Код крашера с колониал маринов
	Раскидывает мобов с дороги в стороны
	for(var/o=0, o<10, o++)
		target = get_turf(get_step(target,cur_dir))
	L.throw_at(target, 200, 100)
	*/

/mob/living/simple_animal/hostile/mutant/bloodsucker
	name = "Кровосос"
	desc = "О, это охотники на охотников! Камуфляж у них — мечта! Когда замаскируются, их почти не видно."
	turns_per_move = 15
	speed = 3
	a_intent = "harm"
	search_objects = 0
	icon = 'stalker/icons/bloodsucker.dmi'
	icon_state = "bloodsucker"
	icon_living = "bloodsucker"
	icon_dead = "bloodsucker_dead"
	attacktext = "кромсает"
	speak_emote = list("рычит", "ревёт")
	emote_see = list("рычит!", "ревёт!")
	maxHealth = 300
	healable = 1
	melee_damage_lower = 30
	attack_sound = list('stalker/sound/mobs/mutants/attack/bloodsucker_attack.ogg',
						'stalker/sound/mobs/mutants/attack/bloodsucker_attack1.ogg',
						'stalker/sound/mobs/mutants/attack/bloodsucker_attack2.ogg',
						'stalker/sound/mobs/mutants/attack/bloodsucker_attack3.ogg'
						)
	idle_sounds =	list('stalker/sound/mobs/mutants/idle/bloodsucker_idle_1.ogg'
						)
	deathsound = 'stalker/sound/mobs/mutants/death/bloodsucker_death.ogg'
	melee_damage_upper = 35
	fearborder = 0
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("stalker_mutants1", "monolith_forces")
	del_on_death = 0
	robust_searching = 1
	deathmessage = "захлебывается кровью и падает на землю!"
	layer = MOB_LAYER - 0.1
	butcher_results = list(/obj/item/stalker/loot/mutantparts/bloodsucker = 1,
							/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/bloodsucker_meat = 1)
	//random_butcher_results = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	attack_type = "claw"
	move_to_delay = 1.8
	speak_chance = 0.5
	rating_add = 500
	vision_range = 15
	aggro_vision_range = 15

/mob/living/simple_animal/hostile/mutant/bloodsucker/Life()
	if(..())
		if(ckey)
			return
		handle_invisibility()

/mob/living/simple_animal/hostile/mutant/bloodsucker/proc/handle_invisibility()
	if(target)
		playsound(src, 'stalker/sound/mobs/mutants/idle/bloodsucker_breath.ogg', 40, 0)
		switch(get_dist(src, target))
			if(0 to 2)
				icon_state = "bloodsucker"
			else
				icon_state = "bloodsucker_invisible"
		return

	if(icon_state != initial(icon_state))
		icon_state = initial(icon_state)

/mob/living/simple_animal/hostile/mutant/bloodsucker/handle_automated_sounds()
	if(idle_sounds)
		if(rand(0,200) < speak_chance)
			var/s = safepick(idle_sounds)
			playsound(src, s, 65, 1, 15, 7)

/mob/living/simple_animal/hostile/mutant/bloodsucker/AttackingTarget()
	..()
	icon_state = "bloodsucker"
	if(istype(target, /mob/living/carbon))
		var/mob/living/carbon/C = target
		if(C.health > 35)
			icon_state = "bloodsucker_invisible"
			var/anydir = pick(GLOB.alldirs)
			//target_last_loc = target.loc
			walk_away(src, get_step(src, anydir), 7, move_to_delay)

/mob/living/simple_animal/hostile/mutant/pseudog
	name = "Псевдособака"
	desc = "Псевдособаки — мутанты, обитающие почти на всей территории Зоны. Некогда это были дикие волки, обитавшие в лесах Зоны на момент катастрофы, которые и стали родоначальниками этого вида мутантов."
	turns_per_move = 15
	speed = 3
	a_intent = "harm"
	search_objects = 1
	icon_state = "psydog"
	icon_living = "psydog"
	icon_dead = "psydog_dead"
	attacktext = "кусает"
	speak_emote = list("рычит", "ревёт")
	emote_see = list("рычит!", "ревёт!")
	maxHealth = 80
	healable = 1
	melee_damage_lower = 15
	attack_sound = list('stalker/sound/mobs/mutants/attack/pdog_attack.ogg',
							'stalker/sound/mobs/mutants/attack/pdog_attack1.ogg',
							'stalker/sound/mobs/mutants/attack/pdog_attack2.ogg',
							'stalker/sound/mobs/mutants/attack/pdog_attack3.ogg',
						)
	idle_sounds =	list('stalker/sound/mobs/mutants/idle/pdog_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/pdog_idle_2.ogg',
						'stalker/sound/mobs/mutants/idle/pdog_idle_3.ogg',
						'stalker/sound/mobs/mutants/idle/pdog_idle_4.ogg'
						)
	deathsound = 'stalker/sound/mobs/mutants/death/pdog_death.ogg'
	melee_damage_upper = 20
	fearborder = 0
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("stalker_mutants1", "monolith_forces")
	del_on_death = 0
	robust_searching = 1
	deathmessage = "издает зловещий вой, прежде чем упасть на бок!"
	layer = MOB_LAYER - 0.1
	butcher_results = list(/obj/item/stalker/loot/mutantparts/pseudo_tail = 1,
							/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/pseudo_meat = 1)
	//random_butcher_results = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	attack_type = "bite"
	move_to_delay = 1.4
	speak_chance = 10
	rating_add = 250
	vision_range = 15
	aggro_vision_range = 15

/mob/living/simple_animal/hostile/mutant/controller
	name = "Контролёр"
	desc = "Контролёр — один из самых опасных мутантов, встречающихся в Зоне. Результат генетических экспериментов, проводимых учёными по программе развития в человеке телепатических способностей. Он обладает высокими телепатическими способностями — поражения мозга жертвы практически всегда необратимы. Старается перемещаться так, чтобы постоянно держать врага в поле зрения."
	turns_per_move = 15
	speed = 3
	a_intent = "harm"
	search_objects = 1
	icon_state = "controller"
	icon_living = "controller"
	icon_dead = "controller_dead"
	attacktext = "кромсает"
	speak_emote = list("рычит", "ревёт")
	emote_see = list("рычит!", "ревёт!")
	maxHealth = 200
	healable = 1
	melee_damage_lower = 25
	attack_sound = 'stalker/sound/mobs/mutants/attack/controller_attack.ogg'
	idle_sounds =	list('stalker/sound/mobs/mutants/idle/controller_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/controller_idle_2.ogg'
						)
	deathsound = 'stalker/sound/mobs/mutants/death/controller_death.ogg'
	melee_damage_upper = 30
	fearborder = 0
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("stalker_mutants1", "monolith_forces")
	del_on_death = 0
	robust_searching = 1
	deathmessage = "кричит в агонии, напрягая ваш разум своим последним вздохом!"
	layer = MOB_LAYER - 0.1
	butcher_results = list(/obj/item/stalker/loot/mutantparts/controller_brain = 1,
							/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/controller_meat = 1)
	//random_butcher_results = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	attack_type = "claw"
	move_to_delay = 10
	speak_chance = 5
	vision_range = 15
	aggro_vision_range = 15
	ranged_cooldown_time = 1
	//min_range_distance = 2
	ranged = 1
	var/attack_stage = 0
	var/last_attack_time = 0
	//see_through_walls = 1
	rating_add = 800
	//long_attack = 1

/mob/living/simple_animal/hostile/mutant/controller/Life()
	..()
	if(stat != DEAD)
		for(var/mob/living/carbon/human/H in view(15, src))
			var/monol_ = 0
			for(var/faction_ in faction)
				if(faction_ in H.faction)
					monol_ = 1

			if(monol_)
				continue

			var/damage_ = 0
			switch(get_dist(src, H))
				if(0 to 2)
					damage_ = 35
				if(3 to 4)
					damage_ = 25
				if(5 to 6)
					damage_ = 15
				if(7 to 8)
					damage_ = 7
				if(8 to INFINITY)
					damage_ = 25 / get_dist(src, H)
			H.apply_damage(damage_, PSY, null, blocked = getarmor("head", "psy", 0))
			//if(H.psyloss >= 200)
				//H.zombiefied = MENTAL_ZOMBIE

/mob/living/simple_animal/hostile/mutant/controller/OpenFire(atom/A)
	if(!istype(A, /mob/living/carbon/human))
		return

	if(attack_stage && last_attack_time + (10 * attack_stage) + 5 < world.time)
		ranged_cooldown = max(0, ranged_cooldown_time - attack_stage)
		attack_stage = 0
		return

	var/mob/living/carbon/human/H = A

	switch(attack_stage)
		if(0)
			visible_message("<span class='danger'><b>[src]</b> stares at [H]!</span>")
			last_attack_time = world.time

			if(H in view(15, src))
				H << sound('stalker/sound/mobs/mutants/attack/controller_tube_prepare.ogg', wait = 0, channel = 47, volume = 50)
				attack_stage++
			else
				ranged_cooldown = max(0, ranged_cooldown_time - attack_stage)
				attack_stage = 0


		if(1)
			if(H in view(15, src))
				last_attack_time = world.time
				attack_stage++
			else
				ranged_cooldown = max(0, ranged_cooldown_time - attack_stage)
				attack_stage = 0
		if(2)
			if(H in view(15, src))
				last_attack_time = world.time
				H << sound('stalker/sound/mobs/mutants/attack/controller_whoosh.ogg', wait = 0, channel = 47, volume = 50)
				visible_message("<span class='danger'><b>[src]</b> stares right into [A] eyes!</span>")
				H.apply_damage(200, PSY, null, blocked = getarmor("head", "psy", 0))
				//if(H.psyloss >= 200)
				//	H.zombiefied = MENTAL_ZOMBIE

			ranged_cooldown = max(0, ranged_cooldown_time - attack_stage)
			attack_stage = 0
	return

/////////////////
// Poltergeist!//
/////////////////
/mob/living/simple_animal/hostile/mutant/poltergeist
	name = "Полтергейст"
	real_name = "poltergeist"
	faction = list("stalker_mutants1", "monolith_forces")
	icon = 'stalker/icons/anomalies.dmi'
	density = TRUE
	anchored = TRUE
	maxHealth = 500
	incorporeal_move = INCORPOREAL_MOVE_SHADOW
	layer = 4
	minimum_distance = 12//Beyond sight, normally.
	vision_range = 15
	aggro_vision_range = 15
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 15
	robust_searching = 1
	melee_damage_upper = 25
	melee_damage_lower = 15
	loot = list(/obj/item/stalker/loot/mutantparts/poltergeist_skin)
	attack_sound = 	list('stalker/sound/mobs/mutants/special/poltergeist/attack_0.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/attack_1.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/attack_2.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/attack_3.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/attack_4.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/attack_5.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/attack_6.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/attack_7.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/attack_8.ogg'
						)
	idle_sounds =	list('stalker/sound/mobs/mutants/special/poltergeist/tele_idle_0.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/idle_0.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/idle_1.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/idle_2.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/idle_3.ogg'
						)
	deathsound =	list('stalker/sound/mobs/mutants/special/poltergeist/death_0.ogg',
						'stalker/sound/mobs/mutants/special/poltergeist/death_1.ogg'
						)

	var/timer = 0
	var/flick_timer = 0

/mob/living/simple_animal/hostile/mutant/poltergeist/Initialize()
	. = ..()
	icon_state = "electra0"
	icon_living = icon_state
//	status_flags |= GODMODE
	timer = rand(1,5)
	flick_timer = rand(1,15)

/mob/living/simple_animal/hostile/mutant/poltergeist/Life()
	..()
	timer--
	flick_timer--
	if(timer == 0)
		polter()
		timer = rand(1,5)
	if(flick_timer == 0)
		flick("electra1", src)
		flick_timer = rand(1,15)

/mob/living/simple_animal/hostile/mutant/poltergeist/proc/polter()
	..()
	if(stat != DEAD)
		for(var/mob/living/carbon/human/H in view(15, src))
			var/most_violent = -1
			var/obj/item/throwing
			for(var/obj/item/I in view(15, get_turf(H)))
				if(I.anchored)
					continue
				if(I.throwforce > most_violent)
					most_violent = I.throwforce
					throwing = I
			if(throwing)
				playsound(src, pick('stalker/sound/mobs/mutants/special/poltergeist/tele_damage_0.ogg',
							'stalker/sound/mobs/mutants/special/poltergeist/tele_damage_1.ogg'))
				throwing.throw_at(H, 8, 2)
/*
/mob/living/simple_animal/hostile/mutant/poltergeist/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = 0

/mob/living/simple_animal/hostile/mutant/poltergeist/CanPass(atom/movable/mover, turf/target)
	return 1
*/
/mob/living/simple_animal/hostile/mutant/poltergeist/death()
	..()
	gib()

/mob/living/simple_animal/hostile/mutant/rat
	name = "Тушкан"
	desc = "Тушкан — маленькое крысоподобное существо, передвигающиеся на двух лапах. Обитают в основном в подвалах и подземельях, на поверхность выбираются редко."
	turns_per_move = 15
	speed = 1
	a_intent = "harm"
	harm_intent_damage = 5
	icon_state = "rat"
	icon_living = "rat"
	icon_dead = "rat_dead"
	attacktext = "кусает"
	search_objects = 1
	speak_emote = list("пищит", "ПИЩИТ")
	emote_see = list("пищит!", "ПИЩИТ!")
	faction = list("stalker_mutants1")
	attack_sound = 'sound/effects/mousesqueek.ogg'
	idle_sounds = list('sound/effects/mousesqueek.ogg')
	deathsound = 'sound/effects/mousesqueek.ogg'
	melee_damage_lower = 5
	melee_damage_upper = 10
	maxHealth = 20
	fearborder = 10
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	healable = 1
	robust_searching = 1
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	deathmessage = "издает болезненный писк, прежде чем упасть на бок!"
	del_on_death = 0
	minbodytemp = 0
	maxbodytemp = 1500
	environment_smash = 0
	layer = MOB_LAYER - 0.1
	butcher_results = list(/obj/item/stalker/loot/mutantparts/rat_tail = 1,
							/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/rat_meat = 1)
	//random_butcher_results = 1
	attack_type = "bite"
	move_to_delay = 1.2 //Real speed of a mob
	rating_add = 25
	vision_range = 15
	aggro_vision_range = 15

/mob/living/simple_animal/hostile/mutant/zombiesimp
	name = "Зомби"
	desc = "Зомби, длительно подвергавшийся сильному воздействию пси-излучения или существ-телепатов."
	icon_state = "zombiesimp"
	icon_living = "zombiesimp"
	icon_dead = "zombiesimp_dead"
	ranged = 0
	retreat_distance = 5
	minimum_distance = 5
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	speak_chance = 1
	turns_per_move = 5
	response_help = "тычет"
	response_disarm = "толкает"
	response_harm = "бьёт"
	speed = 0
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	maxHealth = 125
	health = 125
	fearless = 1
	fearborder = 20
	search_objects = 1
	AIStatus = AI_ON
	harm_intent_damage = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "рвёт"
	attack_sound = 'sound/weapons/punch1.ogg'
	idle_sounds =	list('stalker/sound/mobs/mutants/idle/zombie_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_2.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_3.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_4.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_5.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_6.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_7.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_8.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_9.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_10.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_11.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_12.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_13.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_14.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_15.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_16.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_17.ogg'
						)
	deathsound = list('stalker/sound/mobs/mutants/death/zombie_die_0.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_1.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_2.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_3.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_4.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_5.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_6.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_7.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_8.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_9.ogg'
						)
	a_intent = INTENT_HARM
	faction = list("stalker_mutants1", "monolith_forces")
	check_friendly_fire = 1
	status_flags = CANPUSH
	dodging = TRUE
	rapid_melee = 2
	do_footstep = TRUE
	butcher_results = list(/obj/item/stack/spacecash/c100 = 1)
	rating_add = 50


/mob/living/simple_animal/hostile/mutant/zombiesimp/New()
	..()
	if(prob(5))
		icon_state = "zombiesimp1"
		icon_living = "zombiesimp1"
		icon_dead = "zombiesimp1_dead"
	if(prob(5))
		icon_state = "zombiesimp2"
		icon_living = "zombiesimp2"
		icon_dead = "zombiesimp2_dead"
	if(prob(5))
		icon_state = "zombiesimp3"
		icon_living = "zombiesimp3"
		icon_dead = "zombiesimp3_dead"
	if(prob(5))
		icon_state = "zombiesimp4"
		icon_living = "zombiesimp4"
		icon_dead = "zombiesimp4_dead"
	if(prob(5))
		icon_state = "zombiesimp5"
		icon_living = "zombiesimp5"
		icon_dead = "zombiesimp5_dead"
	if(prob(5))
		icon_state = "zombiesimp6"
		icon_living = "zombiesimp6"
		icon_dead = "zombiesimp6_dead"
	if(prob(5))
		icon_state = "zombiesimp7"
		icon_living = "zombiesimp7"
		icon_dead = "zombiesimp7_dead"
	if(prob(5))
		icon_state = "zombiesimp8"
		icon_living = "zombiesimp8"
		icon_dead = "zombiesimp8_dead"
	if(prob(5))
		icon_state = "zombiesimp9"
		icon_living = "zombiesimp9"
		icon_dead = "zombiesimp9_dead"
	if(prob(5))
		icon_state = "zombiesimp10"
		icon_living = "zombiesimp10"
		icon_dead = "zombiesimp10_dead"
	if(prob(5))
		icon_state = "zombiesimp11"
		icon_living = "zombiesimp11"
		icon_dead = "zombiesimp11_dead"
	if(prob(5))
		icon_state = "zombiesimp12"
		icon_living = "zombiesimp12"
		icon_dead = "zombiesimp12_dead"
	if(prob(5))
		icon_state = "zombiesimp13"
		icon_living = "zombiesimp13"
		icon_dead = "zombiesimp13_dead"
	if(prob(5))
		icon_state = "zombiesimp14"
		icon_living = "zombiesimp14"
		icon_dead = "zombiesimp14_dead"
	if(prob(5))
		icon_state = "zombiesimp15"
		icon_living = "zombiesimp15"
		icon_dead = "zombiesimp15_dead"
	if(prob(5))
		icon_state = "zombiesimp16"
		icon_living = "zombiesimp16"
		icon_dead = "zombiesimp16_dead"
	if(prob(5))
		icon_state = "zombiesimp17"
		icon_living = "zombiesimp17"
		icon_dead = "zombiesimp17_dead"
	if(prob(5))
		icon_state = "zombiesimp18"
		icon_living = "zombiesimp18"
		icon_dead = "zombiesimp18_dead"
	if(prob(5))
		icon_state = "zombiesimp19"
		icon_living = "zombiesimp19"
		icon_dead = "zombiesimp19_dead"
	if(prob(5))
		icon_state = "zombiesimp20"
		icon_living = "zombiesimp20"
		icon_dead = "zombiesimp20_dead"
	if(prob(5))
		icon_state = "zombiesimp21"
		icon_living = "zombiesimp21"
		icon_dead = "zombiesimp21_dead"
	if(prob(5))
		icon_state = "zombiesimp22"
		icon_living = "zombiesimp22"
		icon_dead = "zombiesimp22_dead"

/mob/living/simple_animal/hostile/mutant/zombiesimp/ranged
	name = "Зомбированный"
	desc = "Зомбированный сталкер, длительно подвергавшийся сильному воздействию пси-излучения или существ-телепатов."
	icon_state = "zombiesimp"
	icon_living = "zombiesimp"
	icon_dead = "zombiesimp_dead"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	speak_chance = 80
	turns_per_move = 5
	ranged = 1
	response_help = "тычет"
	response_disarm = "толкает"
	response_harm = "бьёт"
	speed = 0
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	maxHealth = 125
	health = 125
	harm_intent_damage = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "рвёт"
	attack_sound = 'sound/weapons/punch1.ogg'
	idle_sounds =	list('stalker/sound/mobs/mutants/idle/zombie_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_2.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_3.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_4.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_5.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_6.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_7.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_8.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_9.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_10.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_11.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_12.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_13.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_14.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_15.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_16.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_17.ogg'
						)
	deathsound = list('stalker/sound/mobs/mutants/death/zombie_die_0.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_1.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_2.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_3.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_4.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_5.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_6.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_7.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_8.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_9.ogg'
						)
	a_intent = INTENT_HARM
	faction = list("stalker_mutants1", "monolith_forces")
	check_friendly_fire = 1
	status_flags = CANPUSH
	dodging = TRUE
	rapid_melee = 2
	do_footstep = TRUE
	ranged_cooldown = 1
	ranged_cooldown_time = 2
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'stalker/sound/weapons/colt1911_shot.ogg'

/mob/living/simple_animal/hostile/mutant/zombiesimp/ranged/New()
	..()
	if(prob(5))
		icon_state = "zombiesimp1"
		icon_living = "zombiesimp1"
		icon_dead = "zombiesimp1_dead"
	if(prob(5))
		icon_state = "zombiesimp2"
		icon_living = "zombiesimp2"
		icon_dead = "zombiesimp2_dead"
	if(prob(5))
		icon_state = "zombiesimp3"
		icon_living = "zombiesimp3"
		icon_dead = "zombiesimp3_dead"
	if(prob(5))
		icon_state = "zombiesimp4"
		icon_living = "zombiesimp4"
		icon_dead = "zombiesimp4_dead"
	if(prob(5))
		icon_state = "zombiesimp5"
		icon_living = "zombiesimp5"
		icon_dead = "zombiesimp5_dead"
	if(prob(5))
		icon_state = "zombiesimp6"
		icon_living = "zombiesimp6"
		icon_dead = "zombiesimp6_dead"
	if(prob(5))
		icon_state = "zombiesimp7"
		icon_living = "zombiesimp7"
		icon_dead = "zombiesimp7_dead"
	if(prob(5))
		icon_state = "zombiesimp8"
		icon_living = "zombiesimp8"
		icon_dead = "zombiesimp8_dead"
	if(prob(5))
		icon_state = "zombiesimp9"
		icon_living = "zombiesimp9"
		icon_dead = "zombiesimp9_dead"
	if(prob(5))
		icon_state = "zombiesimp10"
		icon_living = "zombiesimp10"
		icon_dead = "zombiesimp10_dead"
	if(prob(5))
		icon_state = "zombiesimp11"
		icon_living = "zombiesimp11"
		icon_dead = "zombiesimp11_dead"
	if(prob(5))
		icon_state = "zombiesimp12"
		icon_living = "zombiesimp12"
		icon_dead = "zombiesimp12_dead"
	if(prob(5))
		icon_state = "zombiesimp13"
		icon_living = "zombiesimp13"
		icon_dead = "zombiesimp13_dead"
	if(prob(5))
		icon_state = "zombiesimp14"
		icon_living = "zombiesimp14"
		icon_dead = "zombiesimp14_dead"
	if(prob(5))
		icon_state = "zombiesimp15"
		icon_living = "zombiesimp15"
		icon_dead = "zombiesimp15_dead"
	if(prob(5))
		icon_state = "zombiesimp16"
		icon_living = "zombiesimp16"
		icon_dead = "zombiesimp16_dead"
	if(prob(5))
		icon_state = "zombiesimp17"
		icon_living = "zombiesimp17"
		icon_dead = "zombiesimp17_dead"
	if(prob(5))
		icon_state = "zombiesimp18"
		icon_living = "zombiesimp18"
		icon_dead = "zombiesimp18_dead"
	if(prob(5))
		icon_state = "zombiesimp19"
		icon_living = "zombiesimp19"
		icon_dead = "zombiesimp19_dead"
	if(prob(5))
		icon_state = "zombiesimp20"
		icon_living = "zombiesimp20"
		icon_dead = "zombiesimp20_dead"
	if(prob(5))
		icon_state = "zombiesimp21"
		icon_living = "zombiesimp21"
		icon_dead = "zombiesimp21_dead"
	if(prob(5))
		icon_state = "zombiesimp22"
		icon_living = "zombiesimp22"
		icon_dead = "zombiesimp22_dead"

/mob/living/simple_animal/hostile/mutant/zombiesimp/ranged/merc
	name = "Зомбированный Наёмник"
	desc = "Зомбированный Наёмник, длительно подвергавшийся сильному воздействию пси-излучения или существ-телепатов."
	icon_state = "zombiesimp"
	icon_living = "zombiesimp"
	icon_dead = "zombiesimp_dead"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	speak_chance = 80
	turns_per_move = 5
	ranged = 1
	response_help = "тычет"
	response_disarm = "толкает"
	response_harm = "бьёт"
	speed = 0
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	maxHealth = 250
	health = 250
	harm_intent_damage = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "claws"
	attack_sound = 'sound/weapons/punch1.ogg'
	idle_sounds =	list('stalker/sound/mobs/mutants/idle/zombie_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_2.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_3.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_4.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_5.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_6.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_7.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_8.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_9.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_10.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_11.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_12.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_13.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_14.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_15.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_16.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_17.ogg'
						)
	deathsound = list('stalker/sound/mobs/mutants/death/zombie_die_0.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_1.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_2.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_3.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_4.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_5.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_6.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_7.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_8.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_9.ogg'
						)
	a_intent = INTENT_HARM
	faction = list("stalker_mutants1", "monolith_forces")
	check_friendly_fire = 1
	status_flags = CANPUSH
	dodging = TRUE
	rapid_melee = 2
	do_footstep = TRUE
	ranged_cooldown = 1
	ranged_cooldown_time = 40
	casingtype = /obj/item/ammo_casing/c556x45
	projectilesound = 'stalker/sound/weapons/tpc301_shoot.ogg'
	rating_add = 100

/mob/living/simple_animal/hostile/mutant/zombiesimp/ranged/merc/New()
	..()
	if(prob(100))
		icon_state = "zombiesimp15"
		icon_living = "zombiesimp15"
		icon_dead = "zombiesimp15_dead"

/mob/living/simple_animal/hostile/mutant/zombiesimp/ranged/duty
	name = "Зомбированный Долговец"
	desc = "Зомбированный долговец, длительно подвергавшийся сильному воздействию пси-излучения или существ-телепатов."
	icon_state = "zombiesimp"
	icon_living = "zombiesimp"
	icon_dead = "zombiesimp_dead"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	speak_chance = 80
	turns_per_move = 5
	ranged = 1
	response_help = "тычет"
	response_disarm = "толкает"
	response_harm = "бьёт"
	speed = 0
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	maxHealth = 175
	health = 175
	harm_intent_damage = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "рвёт"
	attack_sound = 'sound/weapons/punch1.ogg'
	idle_sounds =	list('stalker/sound/mobs/mutants/idle/zombie_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_2.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_3.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_4.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_5.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_6.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_7.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_8.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_9.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_10.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_11.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_12.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_13.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_14.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_15.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_16.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_17.ogg'
						)
	deathsound = list('stalker/sound/mobs/mutants/death/zombie_die_0.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_1.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_2.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_3.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_4.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_5.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_6.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_7.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_8.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_9.ogg'
						)
	a_intent = INTENT_HARM
	faction = list("stalker_mutants1", "monolith_forces")
	check_friendly_fire = 1
	status_flags = CANPUSH
	dodging = TRUE
	rapid_melee = 2
	do_footstep = TRUE
	ranged_cooldown = 1
	ranged_cooldown_time = 40
	casingtype = /obj/item/ammo_casing/c545
	projectilesound = 'stalker/sound/weapons/ak74u_shot.ogg'
	rating_add = 80

/mob/living/simple_animal/hostile/mutant/zombiesimp/ranged/duty/New()
	..()
	if(prob(100))
		icon_state = "zombiesimp14"
		icon_living = "zombiesimp14"
		icon_dead = "zombiesimp14_dead"

/mob/living/simple_animal/hostile/mutant/zombiesimp/ranged/military
	name = "Зобированный военный"
	desc = "Зомбированный военный, длительно подвергавшийся сильному воздействию пси-излучения или существ-телепатов."
	icon_state = "zombiesimp"
	icon_living = "zombiesimp"
	icon_dead = "zombiesimp_dead"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	speak_chance = 80
	turns_per_move = 5
	ranged = 1
	response_help = "тычет"
	response_disarm = "толкает"
	response_harm = "бьёт"
	speed = 0
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	maxHealth = 225
	health = 225
	harm_intent_damage = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "claws"
	attack_sound = 'sound/weapons/punch1.ogg'
	idle_sounds =	list('stalker/sound/mobs/mutants/idle/zombie_idle_1.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_2.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_3.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_4.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_5.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_6.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_7.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_8.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_9.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_10.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_11.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_12.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_13.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_14.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_15.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_16.ogg',
						'stalker/sound/mobs/mutants/idle/zombie_idle_17.ogg'
						)
	deathsound = list('stalker/sound/mobs/mutants/death/zombie_die_0.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_1.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_2.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_3.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_4.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_5.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_6.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_7.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_8.ogg',
						'stalker/sound/mobs/mutants/death/zombie_die_9.ogg'
						)
	a_intent = INTENT_HARM
	faction = list("stalker_mutants1", "monolith_forces")
	check_friendly_fire = 1
	status_flags = CANPUSH
	dodging = TRUE
	rapid_melee = 2
	do_footstep = TRUE
	ranged_cooldown = 1
	ranged_cooldown_time = 40
	casingtype = /obj/item/ammo_casing/c762x39
	projectilesound = 'stalker/sound/weapons/akm_shot.ogg'
	rating_add = 100

/mob/living/simple_animal/hostile/mutant/zombiesimp/ranged/military/New()
	..()
	if(prob(100))
		icon_state = "zombiesimp3"
		icon_living = "zombiesimp3"
		icon_dead = "zombiesimp3_dead"
