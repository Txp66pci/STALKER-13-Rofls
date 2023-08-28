/datum/reagent/drug/energetic
	name = "Энергетик"
	id = "energetic"
	description = "Усиливает вас и заставляет двигаться, исправляет весь урон выносливости, который у вас может быть."
	reagent_state = LIQUID  //SNAKE!
	color = "#60A584"
	taste_description = "слегка сладкая химоза"

/datum/reagent/drug/energetic/on_mob_life(mob/living/M)
	var/high_message = pick("Вы чувствуете себя взвинченным.", "Вы чувствуете себя готовым.", "Вы чувствуете, что можете довести это до предела.")
	if(prob(5))
		M << "<span class='notice'>[high_message]</span>"
	M.adjustStaminaLoss(-5)
	..()
	return