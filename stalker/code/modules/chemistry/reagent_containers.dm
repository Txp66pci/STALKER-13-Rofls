//// PILLS ////

/obj/item/reagent_containers/pill/potassium_iodide
	name = "Таблетки йодида калия"
	desc = "Распространенный противорадиационный препарат, используемый сталкерами после незначительного радиационного облучения."
	icon_state = "pill11"
	list_reagents = list("potass_iodide" = 20)

/obj/item/reagent_containers/pill/radioprotectant
	name = "Радиопротекторная таблетки"
	desc = "Мощный радиопротектор, предотвращающий накопление дополнительного излучения пользователем."
	icon_state = "pill17"
	list_reagents = list("indraline" = 20)

/obj/item/reagent_containers/pill/vinca
	name = "Таблетки барвинка"
	desc = "Искусственный эквивалент витамина К, который быстро ускоряет свертываемость крови в организме."
	icon_state = "pill7"
	list_reagents = list("viksolum" = 20)

/obj/item/reagent_containers/pill/psyblock
	name = "Таблетки пси-блокады"
	desc = "Экспериментальный препарат, защищающий от странных псионических энергий, обнаруженных в Зоне."
	icon_state = "pill12"
	list_reagents = list("psyblock" = 20)

/obj/item/reagent_containers/pill/cocaine
	name = "Таблетки кокаина"
	desc = "Кокаин прессован в форме таблеток для облегчения потребления. Он обеспечивает бдительность и снижает усталость после приема."
	icon_state = "pill9"
	list_reagents = list("cocaine" = 10)

/obj/item/reagent_containers/pill/analgesic
	name = "Диклофенак"
	desc = "Популярное обезболивающее в Зоне, которое позволяет сталкерам выдерживать тяжелые травмы, такие как огнестрельные и осколочные ранения. Пользователи могут испытывать экстремальные побочные эффекты."
	icon_state = "pill8"
	list_reagents = list("analgesic" = 10)

/obj/item/reagent_containers/pill/caffeine
	name = "Таблетки кофеина"
	desc = "Кофеин и бензоат натрия, которые заставляют центральную нервную систему работать с максимально возможной эффективностью в данный момент времени. Уменьшит сонливость в значительной степени."
	icon_state = "pill0"
	list_reagents = list("coffee" = 20)

//// AUTOINJECTORS ////

/obj/item/reagent_containers/hypospray/medipen/stalker
	name = "Инжектор STALKER"
	desc = "Если вы видите это, сообщите об этом администратору."
	ignore_flags = 1 // This allows injecting through hardsuits.

/obj/item/reagent_containers/hypospray/medipen/stalker/anabiotic
	name = "Автоинъектор анабиотиков"
	desc = "Автоинжектор, заполненный анабиотиками, позволяющий пользователю пережить выброс за пределами укрытия. На время действия эффекта \ Пользователь будет находиться в коме, неотличимой от смерти."
	icon_state = "stimpen"
	volume = 25
	amount_per_transfer_from_this = 25
	list_reagents = list("anabiotic" = 25)

/obj/item/reagent_containers/hypospray/medipen/stalker/hercules
	name = "Автоинжектор Геркулеса"
	desc = "Автоинъектор, наполненный Геркулесом, искусственным стероидом, который снижает усталость."
	icon_state = "stimpen"
	volume = 24
	amount_per_transfer_from_this = 24
	list_reagents = list("anabiotic" = 24)

/obj/item/reagent_containers/hypospray/medipen/stalker/metamizole
	name = "Ампула метамизола"
	desc = "Железная ампула, разработанная в качестве полевого снаряжения для военно-полевого персонала для мгновенного уменьшения боли. Содержит мощную дозу \ Метамизол смешивают с антигеморрагическим препаратом. Его доступность в Зоне ограничена из-за сложности контрабанды."
	icon_state = "stimpen"
	volume = 25
	amount_per_transfer_from_this = 25
	list_reagents = list("sal_acid" = 20, "iron" = 5)

/obj/item/reagent_containers/hypospray/medipen/stalker/antirad
	name = "Шприц с антирадом"
	desc = "Препараты радиационной защиты Mexaminum распространены в Зоне. При использовании этот препарат вызывает сокращение периферических кровеносных сосудов и кислородное голодание, что служит для лечения и предотвращения радиационного облучения. Препарат не имеет выраженных побочных эффектов, хотя сообщалось о единичных случаях легкой тошноты, головокружения, спазмов и болей в животе. Можно использовать дважды."
	icon = 'stalker/icons/items.dmi'
	icon_state = "antirad"
	item_state = "antirad"
	amount_per_transfer_from_this = 9
	volume = 18
	list_reagents = list("pen_acid" = 18)

/obj/item/reagent_containers/hypospray/medipen/stalker/axyltallisal
	name = "Аксилталлисал \"Возрождение\""
	desc = "Предупреждение! Не используйте в сочетании с каким-либо другим препаратом, так как это может привести к летальному исходу. Эта мощная смесь, содержащаяся в маленьком шприце, заставит вас потерять сознание. Но когда вы проснетесь (если вы проснетесь), вы почувствуете себя заново родившимся. Вводите шприц в бедро, когда садитесь."
	icon_state = "stimpen"
	volume = 20
	amount_per_transfer_from_this = 20
	list_reagents = list("axyltallisal" = 20)