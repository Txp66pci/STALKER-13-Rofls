/obj/item/stalker/loot
	icon = 'stalker/icons/loot.dmi'

/obj/item/stalker/loot/mutantparts
	name = "mutant parts"

/obj/item/stalker/loot/mutantparts/dog_tail
	name = "Хвост собаки"
	desc = "Устойчивость кожи собаки-мутанта к электричеству и химическим агентам уже давно является предметом научного внимания. Поскольку хвост животного почти полностью свободен от жировой ткани, он особенно подходит для лабораторных экспериментов."
	icon_state = "pes"
	grind_results = list("carbon" = 10, "unknownsubstance" = 5, "nutriment" = 10, "blood" = 10)

/obj/item/stalker/loot/mutantparts/rat_tail
	name = "Крысиный хвост"
	desc = "Это крысиный хвост... Будет ли это полезно или нет, предстоит выяснить ученому."
	icon_state = "rattail"
	grind_results = list("carbon" = 5, "unknownsubstance" = 2.5, "nutriment" = 5, "blood" = 5)

/obj/item/stalker/loot/mutantparts/flesh_eye
	name = "Глаз плоти"
	desc = "Мутировавший, опухший глаз Плоти приобрел ряд странных характеристик, наиболее полезной из которых является способность к регенерации хрусталика. Специфика процесса неизвестна, хотя такое открытие, безусловно, произведет революцию в современной медицине. Вы можете сыграть свою роль в научном развитии, продавая глаза плоти ученым для их экспериментов."
	icon_state = "plot"
	grind_results = list("carbon" = 5, "unknownsubstancetwo" = 5, "nutriment" = 10, "blood" = 10)

/obj/item/stalker/loot/mutantparts/boar_leg
	name = "Копыто кабана"
	desc = "Копыто кабана используется учеными для изготовления некоторых лекарственных средств, наиболее распространенными из которых являются противорадиационные препараты."
	icon_state = "boar"
	grind_results = list("carbon" = 5, "unknownsubstancetwo" = 5, "nutriment" = 10, "blood" = 10)

/obj/item/stalker/loot/mutantparts/snork_leg
	name = "Нога снорка"
	desc = "Нога снорка содержат огромное количество высокоэластичных сухожилий. Это объясняет способность зверя совершать невероятно длинные прыжки."
	icon_state = "snork_leg"
	grind_results = list("carbon" = 10, "unknownsubstancefour" = 5, "nutriment" = 10, "blood" = 10)

/obj/item/stalker/loot/mutantparts/pseudo_tail
	name = "Хвост псевдособаки"
	desc = "Устойчивость кожи мутировавших собак к химическому и электрическому воздействию давно привлекает внимание ученых. Благодаря отсутствию жировых отложений, хвосты собак наиболее подходят для лабораторных исследований."
	icon_state = "psevdopes"
	grind_results = list("carbon" = 10, "unknownsubstance" = 5, "nutriment" = 10, "blood" = 10)

/obj/item/stalker/loot/mutantparts/bloodsucker
	name = "Щупальца кровососа"
	desc = "Щупальца кровососа содержат специальную железу, используемую для выделения фермента, который растворяет кожу жертвы и в то же время препятствует свертыванию крови. Если ученым удастся определить структуру фермента, это поможет совершить прорыв в медицине. "
	icon_state = "bloodsucker"
	grind_results = list("carbon" = 10, "unknownsubstancefour" = 7.5, "nutriment" = 10, "blood" = 10)

/obj/item/stalker/loot/mutantparts/controller_brain
	name = "Мозг контролёра"
	desc = "Мозг. Вы можете почувствовать, как пси-волны проникают в ваши мысли, когда вы держите его в руках."
	icon_state = "controller_brain"
	grind_results = list("carbon" = 10, "unknownsubstancefour" = 7.5, "nutriment" = 10, "blood" = 10)

/obj/item/stalker/loot/mutantparts/poltergeist_skin
	name = "Плоть полтергейста"
	desc = "Кусок плоти, взятый из полтергейста. Кажется, что он еле движется сам по себе, как-то."
	icon_state = "myaso"
	grind_results = list("carbon" = 5, "unknownsubstancethree" = 7.5, "nutriment" = 5, "blood" = 5, "slimejelly" = 5)

	/// Raw Meat ///

/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat
	name = "Мясо мутанта"
	desc = "Тягучее, дичное мясо мутанта."
	icon_state = "mutantmeat"
	grind_results = list("carbon" = 10, "unknownsubstance" = 5, "nutriment" = 10, "blood" = 10)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mutant
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/mutant
	tastes = list("meat" = 1)
	foodtype = MEAT | RAW
	dried_type = /obj/item/reagent_containers/food/snacks/sosjerky/mutant
	bitesize = 3
	list_reagents = list("nutriment" = 3, "cooking_oil" = 2) //Meat has fats that a food processor can process into cooking oil

/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/dog_meat
	name = "Собачье мясо"
	desc = "Тягучее, дичное мясо собаки-мутанта."
	icon_state = "mutantmeat"
	grind_results = list("carbon" = 10, "unknownsubstance" = 5, "nutriment" = 10, "blood" = 10)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mutant/dog
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/mutant/dog
	tastes = list("meat" = 1)
	foodtype = MEAT | RAW
	bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/rat_meat
	name = "Крысиное мясо"
	desc = "Это крысиное мясо... Он не кажется слишком аппетитным."
	icon_state = "mutantmeat"
	grind_results = list("carbon" = 5, "unknownsubstance" = 2.5, "nutriment" = 5, "blood" = 5)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mutant/rat
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/mutant/rat
	tastes = list("meat" = 1)
	foodtype = MEAT | RAW
	bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/flesh_meat
	name = "Мясо плоти"
	desc = "Мясо из плоти; имеет сильный гнилостный запах."
	icon_state = "mutantmeat"
	grind_results = list("carbon" = 5, "unknownsubstancetwo" = 5, "nutriment" = 10, "blood" = 10)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mutant/flesh
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/mutant/flesh
	tastes = list("meat" = 1)
	foodtype = MEAT | RAW
	bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/boar_meat
	name = "Мясо кабана"
	desc = "Мясо дикого мутировавшего кабана; Он кажется толстым и трудно гнётся."
	icon_state = "mutantmeat"
	grind_results = list("carbon" = 5, "unknownsubstancetwo" = 5, "nutriment" = 10, "blood" = 10)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mutant/boar
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/mutant/boar
	tastes = list("meat" = 1)
	foodtype = MEAT | RAW
	bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/snork_meat
	name = "Мясо снорка"
	desc = "Мясо снорка, оно очень постное и жесткое."
	icon_state = "mutantmeat"
	grind_results = list("carbon" = 10, "unknownsubstancefour" = 5, "nutriment" = 10, "blood" = 10)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mutant/snork
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/mutant/snork
	tastes = list("meat" = 1)
	foodtype = MEAT | RAW
	bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/pseudo_meat
	name = "Мясо псевдособаки"
	desc = "Тягучее, дичное мясо псевдособаки."
	icon_state = "mutantmeat"
	grind_results = list("carbon" = 10, "unknownsubstance" = 5, "nutriment" = 10, "blood" = 10)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mutant/pseudo
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/mutant/pseudo
	tastes = list("meat" = 1)
	foodtype = MEAT | RAW
	bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/bloodsucker_meat
	name = "Мясо кровососа"
	desc = "Мясо кровососа, пахнет гнилью и, кажется, время от времени дергается."
	icon_state = "mutantmeat"
	grind_results = list("carbon" = 10, "unknownsubstancefour" = 7.5, "nutriment" = 10, "blood" = 10)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mutant/bloodsucker
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/mutant/bloodsucker
	tastes = list("meat" = 1)
	foodtype = MEAT | RAW
	bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/slab/mutantmeat/controller_meat
	name = "Мясо контролёра"
	desc = "Вы можете почувствовать пульсацию, исходящую от этого липкого куска плоти."
	icon_state = "mutantmeat"
	grind_results = list("carbon" = 10, "unknownsubstancefour" = 7.5, "nutriment" = 10, "blood" = 10)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mutant/controller
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/mutant/controller
	tastes = list("meat" = 1)
	foodtype = MEAT | RAW
	bitesize = 3

	/// Cooked Meat ///

/obj/item/reagent_containers/food/snacks/meat/steak/mutant
	name = "Приготовленное мясо мутантов"
	desc = "Тягучее, дичное мясо мутанта."
	icon_state = "mutantmeatcooked"
	trash = null

/obj/item/reagent_containers/food/snacks/meat/steak/mutant/dog
	name = "Приготовленное мясо собаки"
	desc = "Тягучее, дичное мясо собаки-мутанта."

/obj/item/reagent_containers/food/snacks/meat/steak/mutant/rat
	name = "Приготовленное крысиное мясо"
	desc = "Это крысиное мясо... Он не кажется слишком аппетитным."

/obj/item/reagent_containers/food/snacks/meat/steak/mutant/flesh
	name = "Приготовленное мясо плоти"
	desc = "Мясо из плоти; имеет сильный гнилостный запах."

/obj/item/reagent_containers/food/snacks/meat/steak/mutant/boar
	name = "Приготовленное мясо кабана"
	desc = "Мясо дикого мутировавшего кабана; Он кажется толстым и трудно гнётся."

/obj/item/reagent_containers/food/snacks/meat/steak/mutant/snork
	name = "Приготовленное мясо снорка"
	desc = "Мясо снорка, оно очень постное и жесткое."

/obj/item/reagent_containers/food/snacks/meat/steak/mutant/pseudo
	name = "Приготовленное мясо псевдособаки"
	desc = "Тягучее, дичное мясо псевдособаки."

/obj/item/reagent_containers/food/snacks/meat/steak/mutant/bloodsucker
	name = "Приготовленное мясо кровососа"
	desc = "Мясо кровососа, пахнет гнилью и, кажется, время от времени дергается."

/obj/item/reagent_containers/food/snacks/meat/steak/mutant/controller
	name = "Приготовленное мясо контролёра"
	desc = "Вы можете почувствовать пульсацию, исходящую от этого липкого куска плоти."
