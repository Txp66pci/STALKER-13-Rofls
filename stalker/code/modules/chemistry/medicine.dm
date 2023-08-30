///// STALKER Medicines /////

// Anabiotics allow the player to survive a blowout if they are far from shelter.
// 20u during the blowout warning will keep the player safe and in a coma for the entire duration.
// They will wake up a couple of seconds after it ends. During this time, if any mutants find them.
// Well... Good luck, Stalker.
/datum/reagent/medicine/anabiotic
	name = "Анабиотик"
	id = "anabiotic"
	description = "Анабиотик — медицинский препарат, основным из свойств которого является возможность пережить выброс."
	reagent_state = LIQUID
	color = "#800000"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM

/datum/reagent/medicine/anabiotic/on_mob_add(mob/living/L)
	..()
	if(SSblowout.isblowout)
		L.add_trait(TRAIT_DEATHCOMA, id)
		L.add_trait(TRAIT_BLOWOUT_IMMUNE, id)
	else
		to_chat(L, "<span class = 'notice'>You don't feel any effect.</span>")
		return FALSE

/datum/reagent/medicine/anabiotic/on_mob_delete(mob/living/L)
	if(L.has_trait(TRAIT_DEATHCOMA) && L.has_trait(TRAIT_BLOWOUT_IMMUNE))
		L.remove_trait(TRAIT_DEATHCOMA, id)
		L.remove_trait(TRAIT_BLOWOUT_IMMUNE, id)
	..()

// Indraline (Radioprotectant) offers a signifiant amount of radiation protection to players. Unlike anti-rad, it does not purge radiation.
/datum/reagent/medicine/indraline
	name = "Радиопротектор"
	id = "indraline"
	description = "Мощный радиопротектор, который защищает от дальнейшего накопления радиации."
	reagent_state = LIQUID
	color = "#C39B77"
	metabolization_rate = 0.55 * REAGENTS_METABOLISM

/datum/reagent/medicine/indraline/on_mob_add(mob/living/L)
	..()
	L.add_trait(TRAIT_RADIMMUNE, id)

/datum/reagent/medicine/indraline/on_mob_delete(mob/living/L)
	L.remove_trait(TRAIT_RADIMMUNE, id)
	..()

// Viksolum is a powerful alternative to bandages. Although rare, it offers superior bleeding suppression.
/datum/reagent/medicine/viksolum
	name = "Барвинок"
	id = "viksolum"
	description = "Синтетический аналог витамина К. Основное действие заключается в повышении свёртываемости крови."
	reagent_state = LIQUID
	color = "#FF00FF"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/medicine/viksolum/on_mob_life(mob/living/carbon/human/M)
	if(!M.bleedsuppress) // This prevents stacking Vinca with bandages.
		M.suppress_bloodloss(1)
	..()
	return TRUE

// Hercules is an artificial steroid that promotes myogenesis and protein synthesis.
// We do not have carrying capacity so it will instead reduce stamina loss.
/datum/reagent/medicine/hercules
	name = "Геркулес"
	id = "hercules"
	description = "Искусственно созданный стероид, по химическому составу сходный с тестостероном. Применяется сталкерами в долгих переходах для повышения порога утомляемости мышц.."
	reagent_state = LIQUID
	color = "#FF00FF"
	metabolization_rate = 0.75 * REAGENTS_METABOLISM

/datum/reagent/medicine/hercules/on_mob_life(mob/living/carbon/human/M)
	M.adjustStaminaLoss(-0.5*REM, 0)
	..()

// Psy-block strengthens the user's nervous system against massive waves of psionic energy.
/datum/reagent/medicine/psyblock
	name = "Пси-блокада"
	id = "psyblock"
	description = "«Пси-блокада» — медицинский препарат, защищающий от воздействия пси-излучения."
	reagent_state = LIQUID
	color = "#770000"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/medicine/psyblock/on_mob_life(mob/living/carbon/human/M)
	M.adjustPsyLoss(-1.5*REM, 0)
	..()

// Cocaine is a powerful nervous system stimulant.
/datum/reagent/drug/cocaine
	name = "Кокаин"
	id = "cocaine"
	description = "Снижает стан в 2 раза. Очень вреден при передозировке и ломке."
	reagent_state = LIQUID
	color = "#FA00C8"
	overdose_threshold = 20
	addiction_threshold = 10

/datum/reagent/drug/cocaine/on_mob_life(mob/living/carbon/M)
	if(prob(5))
		var/high_message = pick("«Вы нервничаете», «Вы чувствуете, что должны идти быстро», «Вы чувствуете, что вам нужно сделать шаг вперед».")
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.AdjustStun(-20, FALSE)
	M.AdjustKnockdown(-20, FALSE)
	M.AdjustUnconscious(-20, FALSE)
	M.AdjustImmobilized(-20, FALSE)
	M.AdjustParalyzed(-20, FALSE)
	..()
	. = 1

/datum/reagent/drug/cocaine/overdose_process(mob/living/M)
	M.adjustBrainLoss(2*REM)
	M.adjustToxLoss(2*REM, 0)
	M.adjustBruteLoss(2*REM, FALSE, FALSE, BODYPART_ORGANIC)
	..()
	. = 1

/datum/reagent/drug/cocaine/addiction_act_stage1(mob/living/M)
	M.adjustBrainLoss(5*REM)
	..()

/datum/reagent/drug/cocaine/addiction_act_stage2(mob/living/M)
	M.adjustToxLoss(5*REM, 0)
	..()
	. = 1

/datum/reagent/drug/cocaine/addiction_act_stage3(mob/living/M)
	M.adjustBruteLoss(5*REM, 0)
	..()
	. = 1

/datum/reagent/drug/cocaine/addiction_act_stage4(mob/living/M)
	M.adjustBrainLoss(3*REM)
	M.adjustToxLoss(5*REM, 0)
	M.adjustBruteLoss(5*REM, 0)
	..()
	. = 1

// A useful painkiller that reduces stun times and pain. However, the player will be unable to accurately gauge their health via the HUD and will suffer from nasty side effects such as
// drowsiness and poor motor function.
/datum/reagent/medicine/analgesic
	name = "Диклофенак"
	id = "analgesic"
	description = "Диклофенак используется для лечения боли, пользуется спросом так как помогает пережить больше выстрелов или ударов"
	reagent_state = LIQUID
	color = "#A9FBFB"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 30

/datum/reagent/medicine/analgesic/on_mob_add(mob/living/L)
	..()
	L.ignore_slowdown(id)

/datum/reagent/medicine/analgesic/on_mob_delete(mob/living/L)
	L.unignore_slowdown(id)
	..()

/datum/reagent/medicine/analgesic/on_mob_life(mob/living/carbon/M)
	M.hal_screwyhud = SCREWYHUD_HEALTHY
	if(prob(20) && iscarbon(M))
		var/obj/item/I = M.get_active_held_item()
		if(I && M.dropItemToGround(I))
			to_chat(M, "<span class ='notice'>Твои руки дёргаются, и ты роняешь то, что держал в руках!</span>")
			M.Jitter(10)

	M.AdjustAllImmobility(-20, FALSE)
	M.adjustStaminaLoss(-1*REM, FALSE)

	switch(current_cycle)
		if(11)
			to_chat(M, "<span class='warning'>У вас начинает кружиться голова...</span>" )
		if(12 to 24)
			M.drowsyness += 1
		if(24 to INFINITY)
			M.Sleeping(40, 0)
			. = 1
	..()

/datum/reagent/medicine/analgesic/overdose_process(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(2)
		M.Jitter(2)
	..()

// An extraordinarily powerful drug that heals all wounds, cures all ailments, and purges all radiation. The user will be in a coma as the drugs acts, healing all their wounds. Very, very, very rare.
/datum/reagent/medicine/axyltallisal
	name = "Аксилталлисал"
	id = "axyltallisal"
	description = "Эта мощная микстура поставляется в маленьких шприцах и заставляет вас вырубиться. Но когда вы всманете (если встанете), вы почувствуете себя перерождённым."
	reagent_state = LIQUID
	color = "#A9FBFB"
	overdose_threshold = 30

/datum/reagent/medicine/axyltallisal/on_mob_add(mob/living/carbon/M)
	..()
	M.reagents.remove_all_type(/datum/reagent/toxin, 5*REM, 0, 1)
	M.setCloneLoss(0, 0)
	M.setOxyLoss(0, 0)
	M.radiation = 0
	M.heal_bodypart_damage(5,5)
	M.adjustToxLoss(-5, 0, TRUE)
	M.hallucination = 0
	M.setBrainLoss(0)
	M.remove_all_traits()
	M.set_blurriness(0)
	M.set_blindness(0)
	M.SetKnockdown(0, FALSE)
	M.SetStun(0, FALSE)
	M.SetUnconscious(0, FALSE)
	M.SetParalyzed(0, FALSE)
	M.SetImmobilized(0, FALSE)
	M.silent = FALSE
	M.dizziness = 0
	M.disgust = 0
	M.drowsyness = 0
	M.stuttering = 0
	M.slurring = 0
	M.confused = 0
	M.SetSleeping(0, 0)
	M.jitteriness = 0
	M.cure_all_traumas(TRAUMA_RESILIENCE_MAGIC)
	for(var/thing in M.diseases)
		var/datum/disease/D = thing
		if(D.severity == DISEASE_SEVERITY_POSITIVE)
			continue
		D.cure()

/datum/reagent/medicine/axyltallisal/on_mob_life(mob/living/carbon/M)
	M.Sleeping(40, 0)
	..()

/datum/reagent/medicine/axyltallisal/overdose_process(mob/living/M)
	M.adjust_fire_stacks(2)
	M.IgniteMob()
	..()

// Medical Rework

// COMBAT STIMULANT is now it's own specific chemical isntead of working off miner salve. This is for the sanity of other devs
// It has seen a buff, due to becoming scarcer and cheaper alternatives being created!


/datum/reagent/medicine/combatstimulant
	name = "Боевой Стимулятор"
	id = "combat_stim"
	description = "Мощный и быстродействующий. Находится в серой зоне безопасности в использовании, по меркам Зоны."
	reagent_state = LIQUID
	color = "#4f0000"
	metabolization_rate = 0.2 * REAGENTS_METABOLISM

/datum/reagent/medicine/mine_salve/on_mob_life(mob/living/carbon/C)
	C.ignore_slowdown(id)
	C.hal_screwyhud = SCREWYHUD_HEALTHY
//	C.adjustBruteLoss(-0.25*REM, 0)
//	C.adjustFireLoss(-0.25*REM, 0)
	..()
	return TRUE

/datum/reagent/medicine/combatstimulant/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, INJECT))
			M.adjust_nutrition(-10) // HUNGER!
			if(show_message)
				to_chat(M, "<span class='warning'>На мгновение вы чувствуете себя очень плохо..</span>")
		else
			var/mob/living/carbon/C = M
			for(var/s in C.surgeries)
				var/datum/surgery/S = s
				S.success_multiplier = max(0.1, S.success_multiplier)
				// +10% success propability on each step, useful while operating in less-than-perfect conditions

			if(show_message)
				to_chat(M, "<span class='danger'>ТЫ ЧУВСТВУЕШЬ ЧТО ТЫ НЕПОБЕДИМ!</span>" )
	..()

/datum/reagent/medicine/combatstimulant/on_mob_delete(mob/living/M)
	M.unignore_slowdown(id)
	if(iscarbon(M))
		var/mob/living/carbon/N = M
		N.hal_screwyhud = SCREWYHUD_NONE
	..()

// MEDICAL KIT MEDICATIONS | Cheap, effective and heals over time. Cures and prevents damage!

// AI-2 'Civilian Grade' | Lowest Grade Medical Kit

// AI-2 Injector Medication | BRUTE + BURN HEALING | 30 point heal

/datum/reagent/medicine/promedolsolution
	name = "Раствор Промедола"
	id = "promedolsolution"
	description = "Простая смесь дешёвых опиоидов. Работает очень медленно и может вызвать передозировку!"
	reagent_state = LIQUID
	color = "#e6eaff"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = 20

/datum/reagent/medicine/promedolsolution/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-1*REM, 0)
	M.adjustFireLoss(-1*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/promedolsolution/overdose_process(mob/living/M)
	M.adjustToxLoss(1.5*REM, 0)
	..()
	. = 1

// AI-2 Rasberry Bottle | Radioprotectant | Lasts about 30 seconds.

/datum/reagent/medicine/ai2radioprotectant
	name = "Низкосортный радиопротектор"
	id = "ai2rp"
	description = "Слабый радиопротектор, защищающий пользователя от накопления дополнительного излучения."
	reagent_state = LIQUID
	color = "#e6eaff"
	metabolization_rate = 1 * REAGENTS_METABOLISM

/datum/reagent/medicine/ai2radioprotectant/on_mob_add(mob/living/L)
	..()
	L.add_trait(TRAIT_RADIMMUNE, id)

/datum/reagent/medicine/ai2radioprotectant/on_mob_delete(mob/living/L)
	L.remove_trait(TRAIT_RADIMMUNE, id)
	..()

// AI-2 Strawberry Bottle | Anti-Rad | Does the job poorly

/datum/reagent/medicine/ai2antirad
	name = "Низкосортный антирад"
	id = "ai2ar"
	description = "Неэффективно лечит лучевую болезнь."
	reagent_state = LIQUID
	color = "#e6eaff"
	metabolization_rate = 1 * REAGENTS_METABOLISM

/datum/reagent/medicine/ai2antirad/on_mob_life(mob/living/carbon/M)
	if(M.radiation > 0)
		M.radiation -= min(M.radiation, 3)
	..()

// ARMY MEDICAL KIT | BRUTE + BURN HEALING + BLEED (Via Coag) | 60 point heal

/datum/reagent/medicine/armysolution
	name = "Армейский медицинский раствор"
	id = "armysolution"
	description = "Сильнодействующее и надежное лекарство, содержащее свертывающие средства."
	reagent_state = LIQUID
	color = "#e6eaff"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = 20

/datum/reagent/medicine/armysolution/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-2*REM, 0)
	M.adjustFireLoss(-2*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/armysolution/overdose_process(mob/living/M)
	M.adjustToxLoss(3*REM, 0)
	..()
	. = 1

// SCIENTIFIC MEDICAL KIT | BRUTE, BURN, TOXIN, ANTIRADIATION | 120 point heal

/datum/reagent/medicine/scisolution
	name = "Продвинутый раствор"
	id = "scisolution"
	description = "Чрезвычайно мощная смесь химических веществ!"
	reagent_state = LIQUID
	color = "#e6eaff"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = 20

/datum/reagent/medicine/scisolution/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-3*REM, 0)
	M.adjustFireLoss(-3*REM, 0)
	M.adjustToxLoss(-2*REM, 0)
	if(M.radiation > 0)
		M.radiation -= min(M.radiation, 5)
	..()
	. = 1

/datum/reagent/medicine/scisolution/overdose_process(mob/living/M)
	M.adjustToxLoss(3*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/sciradsolution
	name = "Продвинутый антирад"
	id = "sciradsolution"
	description = "Чрезвычайно мощная химических веществ!"
	reagent_state = LIQUID
	color = "#e6eaff"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 20

/datum/reagent/medicine/sciradsolution/on_mob_life(mob/living/carbon/M)
	if(M.radiation > 0)
		M.radiation -= min(M.radiation, 5)
	..()
	. = 1

/datum/reagent/medicine/sciradsolution/overdose_process(mob/living/M)
	M.adjustToxLoss(3*REM, 0)
	..()
	. = 1

// STIMPACKS
// INCREDIBLE healing potential and rapidly: At a premium!

// Improvised Stimm | 25 Health | Rapid
/datum/reagent/medicine/stim/improvisedstim
	name = "Импровизированный стимулятор"
	id = "impstim"
	description = "Ты почти уверен, что это дерьмо убьет тебя."
	reagent_state = LIQUID
	color = "#e6eaff"
	metabolization_rate = 2 * REAGENTS_METABOLISM
	overdose_threshold = 6

/datum/reagent/medicine/stim/improvisedstimulant/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-5*REM, 0)
	M.adjustFireLoss(-5*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/stim/overdose_process(mob/living/M)
	M.adjustToxLoss(5*REM, 0)
	..()
	. = 1

// Army Stimm | 50 Health | Rapid
/datum/reagent/medicine/stim/armystim
	name = "Армейский стимулятор"
	id = "stimarmypack"
	description = "Способствует быстрому заживлению мягких тканей."
	reagent_state = LIQUID
	color = "#e6eaff"
	metabolization_rate = 2 * REAGENTS_METABOLISM
	overdose_threshold = 6

/datum/reagent/medicine/stim/armystim/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-10*REM, 0)
	M.adjustFireLoss(-10*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/stim/overdose_process(mob/living/M)
	M.adjustToxLoss(5*REM, 0)
	..()
	. = 1

// Army Stimm | 100 Health | Rapid
/datum/reagent/medicine/stim/scistim
	name = "Научный стимулятор"
	id = "scistim"
	description = "Неизвестная смесь медицинских жидкостей. По вкусу он явно похож на вишню."
	reagent_state = LIQUID
	color = "#e6eaff"
	metabolization_rate = 2 * REAGENTS_METABOLISM
	overdose_threshold = 6

/datum/reagent/medicine/stim/scistim/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-20*REM, 0)
	M.adjustFireLoss(-20*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/stim/overdose_process(mob/living/M)
	M.adjustToxLoss(5*REM, 0)
	..()
	. = 1

/*
WHAT TO FIX:
- No known bugs during playtests
*/
