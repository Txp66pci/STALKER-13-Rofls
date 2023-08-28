/obj/item/reagent_containers/food/drinks/soda_cans/energetic
	name = "Энергетик"
	desc = "Отличный энергетический напиток Non-Stop. Содержит кофеин, таурин и мощный витаминный комплекс, который снимает усталость и добавляет сил. Чувствуете, что вам нужен импульс? Тогда это именно то, что вам нужно."
	icon = 'stalker/icons/food.dmi'
	icon_state = "nonstop"
	list_reagents = list("energetic" = 10, "water" = 20)
	w_class = 2

/obj/item/reagent_containers/food/drinks/soda_cans/crunk
	name = "Мощный энергетический напиток"
	desc = "Отличный энергетический напиток. Содержит кофеин, таурин и много витаминов. Не можете сделать шаг? Тогда это то, что вам нужно. ВНИМАНИЕ: Потенциально опасно для вашего здоровья!"
	icon = 'stalker/icons/food.dmi'
	icon_state = "crunk"
	list_reagents = list("grey_bull" = 25, "energetic" = 15)
	w_class = 2

// Alcoholism redoes drinks below here. Above needs to be redone if still exists.
// FROM WORST TO BEST (If that exists!)

// VODKA

/obj/item/reagent_containers/food/drinks/bottle/vodka/stalkervodka
	name = "Зоновская водка"
	desc = "Водка, произведенная отчаянием некоторых «гениальных» сталкеров с использованием местных грибов и диких трав. На вкус и запах-моча, но он сделает свою работу дешево!"
	icon = 'stalker/icons/food.dmi'
	icon_state = "stalker_vodka"
	list_reagents = list("stalkervodka" = 100)

/obj/item/reagent_containers/food/drinks/bottle/vodka/kazaki
	name = "Водка Казаки"
	desc = "Водка украинской компании GSC. Легко пьется. Может вывести рад излучение."
	icon = 'stalker/icons/food.dmi'
	icon_state = "gsc_vodka"
	list_reagents = list("vodka" = 90, "potass_iodide" = 10)

/obj/item/reagent_containers/food/drinks/bottle/vodka/stolichnaya
	name = "Водка столичная"
	desc = "Водка, которая производится на некоторых из старейших винокурен России. Мягкий как по вкусу, так и по гари. Некоторые сталкеры боготворят его способностью лечить радиационное отравление!"
	icon = 'icons/obj/drinks.dmi'
	icon_state = "stolichnaya"
	list_reagents = list("vodka" = 80, "potass_iodide" = 20)
	w_class = 2

/obj/item/reagent_containers/food/drinks/bottle/vodka/blacklabelvodka
	name = "Водка Black-Label"
	desc = "Производится в Европейском Союзе. Этот зерновой спирт является доказательством того, что даже в Зоне (?) Роскошь можно найти! Мощный и энергичный напиток!"
	icon = 'icons/obj/drinks.dmi'
	icon_state = "blacklabel_vodka"
	list_reagents = list("vodka" = 70, "potass_iodide" = 20, "energetic" = 10)
	w_class = 2


// BEER

/obj/item/reagent_containers/food/drinks/soda_cans/lowqualbeer
	name = "Украинское пиво"
	desc = "Освежающее пшеничное пиво украинского производства."
	icon = 'stalker/icons/food.dmi'
	icon_state = "pivo"
	list_reagents = list("beer" = 40)
	w_class = 2

/obj/item/reagent_containers/food/drinks/soda_cans/highqualbeer
	name = "Русское пиво"
	desc = "Вкусный и густой Имперский Стаут Российского производства."
	icon = 'stalker/icons/food.dmi'
	icon_state = "pivo2"
	list_reagents = list("ale" = 38, "omnizine" = 2)
	w_class = 2

// JUICE & DRINKS

/obj/item/reagent_containers/food/drinks/soda_cans/terragon
	name = "Тархун"
	desc = "Освежающий и слегка сладкий тархун!"
	icon = 'stalker/icons/food.dmi'
	icon_state = "terragon"
	list_reagents = list("energetic" = 3, "terragonsoda" = 37)
	w_class = 2

/obj/item/reagent_containers/food/drinks/soda_cans/pineapple
	name = "Ананасовый сок"
	desc = "Ананасовый сок. Сладкий и полный углеводов: это именно то, что нужно сталкеру!"
	icon = 'stalker/icons/food.dmi'
	icon_state = "army_pineapple"
	list_reagents = list("omnizine" = 3, "pine" = 37)
	w_class = 2

/obj/item/reagent_containers/food/drinks/soda_cans/purifiedwater
	name = "Очищенная вода"
	desc = "маленький пластиковый контейнер, наполненный очищенной водой!"
	icon = 'stalker/icons/food.dmi'
	icon_state = "purified_water"
	list_reagents = list("water" = 40)
	w_class = 2

/obj/item/reagent_containers/food/drinks/soda_cans/zonetea
	name = "Чай Бороды"
	desc = "Производится из отборных лекарственных грибов с березовой дубильной основой: этот бодрящий и омолаживающий напиток любим всеми сталкерами, которые могут себе это позволить!"
	icon = 'stalker/icons/food.dmi'
	icon_state = "zonetea"
	list_reagents = list("tea" = 15, "omnizine" = 10, "potass_iodide" = 10, "energetic" = 3, "psicodine" = 2)
	w_class = 2

/obj/item/reagent_containers/food/drinks/soda_cans/voda
	name = "Минеральная вода"
	desc = "Освежающая минеральная вода."
	icon = 'stalker/icons/food.dmi'
	icon_state = "voda"
	list_reagents = list("energetic" = 3, "water" = 37)
	w_class = 2
