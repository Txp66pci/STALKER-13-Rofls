/obj/item/reagent_containers/food/snacks/stalker
	var/wrapped = 0
	icon = 'stalker/icons/food.dmi'

/obj/item/reagent_containers/food/snacks/stalker/konserva
	name = "Радость туриста"
	desc = "Радость туриста, также известная как туристический завтрак, является основным продуктом питания в Зоне. Легенда гласит, что эти банки консерв были найдены во время рейда на армейский склад!"
	icon_state = "konserva"
	w_class = 2
	wrapped = 1
	trash = /obj/item/trash/konserva
	list_reagents = list("nutriment" = 13, "vitamin" = 2, "omnizine" = 0.5)
	icon = 'stalker/icons/food.dmi'
	var/icon_state_opened = "konserva_open"
	var/desc_opened = "Радость туриста, также известная как туристический завтрак, является основным продуктом питания в Зоне. Легенда гласит, что эти банки консерв были найдены во время рейда на армейский склад! Эта банка открыта."
	tastes = list("почти несъедобное соленое мясо" = 1)

/obj/item/reagent_containers/food/snacks/stalker/konserva/attack_self(mob/user)
	if(wrapped)
		Unwrap(user)
	else
		..()

/obj/item/reagent_containers/food/snacks/stalker/konserva/proc/Unwrap(mob/user)
	icon_state = icon_state_opened
	desc = desc_opened
	if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
		user << "<span class='notice'>Вы открываете банку.</span>"
	else
		user << "<span class='notice'>Вы открываете банку.</span>"
	wrapped = 0

/obj/item/trash/konserva
	name = "Пустая банка"
	desc = "Пустая банка радости туриста. Мусор!"
	icon = 'stalker/icons/food.dmi'
	icon_state = "konserva_empty"
	w_class = 2

/obj/item/reagent_containers/food/snacks/stalker/konserva/shproti
	name = "Шпроты"
	desc = "Европейские шпроты, происходящие из латвийского портового города Рига. Они были сохранены в густом подсолнечном масле."
	icon_state = "shproti0"
	icon_state_opened = "shproti1"
	list_reagents = list("nutriment" = 17, "vitamin" = 3, "omnizine" = 0.75)
	trash = /obj/item/trash/konserva/shproti
	desc_opened = "Европейские шпроты, происходящие из латвийского портового города Рига. Они были сохранены в густом подсолнечном масле. Эта банка открыта."
	tastes = list("жирная, соленая рыба" = 1)

/obj/item/trash/konserva/shproti
	name = "Пустая банка"
	icon_state = "shproti2"
	desc = "Пустая банка, пахнущая рыбой. Мусор!"

/obj/item/reagent_containers/food/snacks/stalker/konserva/soup
	name = "Суп"
	desc = "Сгущенный суп, который обычно разбавляют водой. Основной продукт питания туристов в зоне."
	icon_state = "soup0"
	icon_state_opened = "soup1"
	list_reagents = list("nutriment" = 20, "vitamin" = 4, "omnizine" = 1)
	trash = /obj/item/trash/konserva/soup
	desc_opened = "Сгущенный суп, который обычно разбавляют водой. Основной продукт питания туристов в зоне. Эта банка открыта."
	tastes = list("Вяленая свекла и колбаса" = 1)

/obj/item/trash/konserva/soup
	name = "Пустая банка"
	icon_state = "soup2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/bobi
	name = "Консервированные бобы"
	desc = "Банка 'Bean Surprise'. Мелодия дешевых безвкусных кусочков мяса и водянистых бобов (We love BOBI!)."
	icon_state = "bobi0"
	icon_state_opened = "bobi1"
	list_reagents = list("nutriment" = 17, "vitamin" = 3, "omnizine" = 0.75)
	trash = /obj/item/trash/konserva/bobi
	desc_opened = "Выглядит аппетитно."
	tastes = list("Смутный землистый привкус с безвкусным мясом" = 1)

/obj/item/trash/konserva/bobi
	name = "Пустая банка"
	icon_state = "bobi2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/govyadina2
	name = "Тушёнка"
	desc = "Банка тушеной говядины! Горячо любимый продукт тех, кто рыщет по старым руинам в поисках добычи!"
	//weight = 0.7
	icon_state = "govyadina0"
	icon_state_opened = "govyadina1"
	list_reagents = list("nutriment" = 20, "vitamin" = 4, "omnizine" = 1)
	trash = /obj/item/trash/konserva/govyadina
	desc_opened = "Банка тушеной говядины! Горячо любимый продукт тех, кто рыщет по старым руинам в поисках добычи! Эта банка открыта."
	tastes = list("ароматная мясная подливка с картофелем" = 1)

/obj/item/trash/konserva/govyadina
	name = "Пустая банка"
	icon_state = "govyadina2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/fish
	name = "Консервированная рыба"
	desc = "Рыбные консервы. Простой, легко усваиваемый и, как правило, любимый большинством в Зоне."
	icon_state = "fish0"
	icon_state_opened = "fish1"
	list_reagents = list("nutriment" = 17, "vitamin" = 3, "omnizine" = 0.75)
	trash = /obj/item/trash/konserva/fish
	desc_opened = "Рыбные консервы. Простой, легко усваиваемый и, как правило, любимый большинством в Зоне. Эта банка открыта."
	tastes = list("жирная, соленая рыба" = 1)

/obj/item/trash/konserva/fish
	name = "Пустая банка"
	icon_state = "fish2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/sirok
	name = "Сырок"
	desc = "Банка сливочного сыра, которую обычно можно увидеть в пайках альпинистов ВСУ. Оно... может быть просроченно."
	icon_state = "sirok"
	icon_state_opened = "sirok1"
	list_reagents = list("nutriment" = 11, "vitamin" = 1, "omnizine" = 0.3)
	trash = /obj/item/trash/konserva/sirok
	desc_opened = "Банка сливочного сыра, которую обычно можно увидеть в пайках альпинистов ВСУ. Оно... может быть просроченно."
	tastes = list("Подслащенный творог с ванильным оттенком" = 1)

/obj/item/trash/konserva/sirok
	name = "мусор"
	//weight = 0.01
	icon_state = "sirok2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/snikers
	name = "Сникерс"
	desc = "Сникерс. Напоминание о доме для западных туристов, странно сладкая закуска для местных жителей."
	icon_state = "snikers"
	icon_state_opened = "snikers1"
	list_reagents = list("nutriment" = 8, "sugar" = 6, "omnizine" = 0.2)
	trash = /obj/item/trash/konserva/snikers
	desc_opened = "Сникерс. Напоминание о доме для западных туристов, странно сладкая закуска для местных жителей. Его упаковка развёрнута."
	tastes = list("насыщенный шоколад и арахисовое масло с орехами" = 1)

/obj/item/trash/konserva/snikers
	name = "мусор"
	//weight = 0.01
	icon_state = "snikers2"
	desc = "Пустая обертка от «Сникерс». Мусор!"

/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/chocolate
	name = "Шоколад"
	desc = "Плитка шоколада. Напоминание о доме в этом суровом месте."
	icon_state = "Choco1"
	icon_state_opened = "Choco2"
	list_reagents = list("nutriment" = 9, "sugar" = 1, "omnizine" = 0.1, "energetic" = 5)
	trash = /obj/item/trash/konserva/chocolate
	desc_opened = "Плитка шоколада. Напоминание о доме в этом суровом месте. Его упаковка открыта."
	tastes = list("artisinal chocolate. It isn't as sweet as processed chocolate, but still very good" = 1)

/obj/item/trash/konserva/chocolate
	name = "мусор"
	//weight = 0.01
	icon_state = "Choco3"

/obj/item/storage/box/MRE
	name = "ИРП"
	desc = "Украинский круглосуточный паёк. Наполнен всем, что понадобится Сталкеру за день!"
	var/desc_opened = "Украинский круглосуточный паёк. Наполнен всем, что понадобится Сталкеру за день! Его упаковка вскрыта." //а пахне як мммм
	icon = 'stalker/icons/food.dmi'
	icon_state = "box1"
	var/icon_state_opened = "box3"
	var/wrapped = 1

/obj/item/storage/box/MRE/New()
	..()
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/galets(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/galets(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/galets(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/galets(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/kasha(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva1(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva2(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva3(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/snack/chocolate(src)
	new /obj/item/reagent_containers/food/drinks/soda_cans/voda(src)

/obj/item/storage/box/MRE/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 10
	STR.can_hold = typecacheof(list(/obj/item/reagent_containers/food/snacks/stalker/konserva, /obj/item/trash/konserva, /obj/item/reagent_containers/food/drinks))

/obj/item/storage/box/MRE/attack_self(mob/user)
	if(wrapped)
		Unwrap(user)

/obj/item/storage/box/MRE/proc/Unwrap(mob/user)
	icon_state = icon_state_opened
	//desc = desc_opened
	if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
		user << "<span class='notice'>Вы разворачиваете пакет</span>"
	else
		user << "<span class='notice'>Вы разворачиваете пакет</span>"
	wrapped = 0

/obj/item/reagent_containers/food/snacks/stalker/konserva/galets
	name = "Галеты"
	desc = "Сухие крекеры, которые сколят зуб любому, кто подумает, что это маслянистое печенье!"
	desc_opened = "Сухие крекеры, которые сколят зуб любому, кто подумает, что это маслянистое печенье! Его упаковка вскрыта."
	icon_state = "GAL1"
	icon_state_opened = "GAL2"
	list_reagents = list("nutriment" = 10, "omnizine" = 0.1)
	trash = /obj/item/trash/konserva/galets
	tastes = list("сухие, несвежие сухари. Лучше, чем голодать" = 1)

/obj/item/trash/konserva/galets
	name = "мусор"
	icon_state = "GAL3"

/obj/item/reagent_containers/food/snacks/stalker/konserva/kasha
	name = "Консервированная каша"
	desc = "Вакуумно упакованная банка вареной гречневой каши. Разве её не надо варить?"
	desc_opened = "Вакуумно упакованная банка вареной гречневой каши. Разве её не надо варить? Её упаковка вскрыта."
	icon_state = "Kasha1"
	icon_state_opened = "Kasha2"
	list_reagents = list("nutriment" = 15, "omnizine" = 0.2)
	trash = /obj/item/trash/konserva/kasha
	tastes = list("сильный, ореховый вкус гречки" = 1)

/obj/item/trash/konserva/kasha
	name = "мусор"
	icon_state = "Kasha3"

/obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva1
	name = "Консервированная свинина"
	desc = "Консервированная свинина, соль и специи. Нет нчего проще и полезнее в зоне!"
	desc_opened = "Консервированная свинина, соль и специи. Нет нчего проще и полезнее в зоне! Её банка открыта."
	icon_state = "TushenkaRed1"
	icon_state_opened = "TushenkaRed2"
	list_reagents = list("nutriment" = 17, "omnizine" = 0.2)
	trash = /obj/item/trash/konserva/MREkonserva1
	tastes = list("Мясо со специями и солью" = 1)

/obj/item/trash/konserva/MREkonserva1
	name = "мусор"
	icon_state = "TushenkaRed3"

/obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva2
	name = "Консервированная курятина"
	desc = "Консервированная курица с овощным ассорти. Сытная трапеза в Зоне."
	desc_opened = "Консервированная курица с овощным ассорти. Сытная трапеза в Зоне. Эта банка открыта."
	icon_state = "TushenkaGreen1"
	icon_state_opened = "TushenkaGreen2"
	list_reagents = list("nutriment" = 17, "omnizine" = 0.2)
	trash = /obj/item/trash/konserva/MREkonserva2
	tastes = list("птица и различные овощи" = 1)

/obj/item/trash/konserva/MREkonserva2
	name = "мусор"
	icon_state = "TushenkaGreen3"

/obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva3
	name = "Консервированные овощи"
	desc = "Овощное ассорти. Здоровая и сытная еда в Зоне!"
	desc_opened = "Овощное ассорти. Здоровая и сытная еда в Зоне! Эта банка открыта."
	icon_state = "TushenkaBlue1"
	icon_state_opened = "TushenkaBlue2"
	list_reagents = list("nutriment" = 17, "omnizine" = 0.2, "vitamin" = 10)
	trash = /obj/item/trash/konserva/MREkonserva3
	tastes = list("Большое разнообразие овощей" = 1)

/obj/item/trash/konserva/MREkonserva3
	name = "мусор"
	icon_state = "TushenkaBlue3"

/obj/item/reagent_containers/food/snacks/stalker/kolbasa
	name = "Колбаса"
	desc = "Диетическая колбаса, приготовленная из смеси курицы и сои, часто, за неимением других вариантов, является завтраком, обедом и ужином сталкера в одном."
	icon_state = "kolbasa"
	w_class = 2
	list_reagents = list("nutriment" = 11, "vitamin" = 1, "omnizine" = 0.3)
	tastes = list("Отчетливый вкус кардамона поверх классической украинской колбасы" = 1)

/obj/item/reagent_containers/food/snacks/stalker/baton
	name = "хлеб"
	desc = "Буханка хлеба совершенно сомнительного происхождения. Никто не жаловался на неприятный привкус или проблемы с ним за все годы, что он был в диете сталкеров!"
	icon_state = "baton_stalker"
	w_class = 2
	list_reagents = list("nutriment" = 8, "omnizine" = 0.2)
	tastes = list("сухой, но приятный хлеб" = 1)

/obj/item/reagent_containers/food/snacks/stalker/fermented/tomaty
	name = "маринованные помидоры"
	desc = "Маринованные помидоры неизвестного возраста. Пробуйте на свой страх и риск."
	icon_state = "tomaty"
	w_class = 2
	list_reagents = list("nutriment" = 16, "omnizine" = 5, "vitamin" = 10)
	tastes = list("терпкие, острые помидоры. Они немного кашеобразные" = 1)

/obj/item/reagent_containers/food/snacks/stalker/fermented/sauerkraut
	name = "квашеная капуста"
	desc = "Квашеная капуста неизвестного возраста. Пробуйте на свой страх и риск."
	icon_state = "sauerkraut"
	w_class = 2
	list_reagents = list("nutriment" = 16, "omnizine" = 5, "vitamin" = 10)
	tastes = list("терпкая, острая квашеная капуста. Она немного кашеобразная" = 1)

/obj/item/reagent_containers/food/snacks/stalker/stew
	name = "Тушеное мясо и овощи"
	desc = "Кусочки мяса с овощами в миске. Выглядит не очень съедобно."
	icon_state = "stew"
	w_class = 2
	list_reagents = list("nutriment" = 25, "omnizine" = 1, "vitamin" = 5)
	tastes = list("пресное мясо и овощи. Это едва ли еда" = 1)

/obj/item/reagent_containers/food/snacks/stalker/veggiestew
	name = "Вегетарианское рагу"
	desc = "Кусочки овощей в миске. Выглядит не очень съедобно."
	icon_state = "stew"
	w_class = 2
	list_reagents = list("nutriment" = 25, "omnizine" = 1, "vitamin" = 5)
	tastes = list("пресные овощи. Это едва ли еда" = 1)

/obj/item/reagent_containers/food/snacks/stalker/kolbasa/doctorsausage
	name = "Докторская колбаса"
	desc = "Вареная бледно-розовая колбаса из сильно обработанной говядины. Произведенная в СССР колбаса предназначалась для использования в качестве биологически активной добавки к пище для людей с признаками длительного голодания."
	icon_state = "sausage"
	w_class = 2
	list_reagents = list("nutriment" = 15, "vitamin" = 1, "omnizine" = 0.3)
	tastes = list("Отчетливо классический вкус колбасы" = 1)


// STALKER NEW-FOODS

// Goulash

/obj/item/reagent_containers/food/snacks/stalker/putridstew
	name = "гнилой гуляш"
	desc = "Кусочки низкосортного мяса, приготовленные в густой каше из мутантьего бульона. Это не очень вкусно, если не сказать больше!"
	icon_state = "stew"
	w_class = 2
	list_reagents = list("nutriment" = 17, "omnizine" = 1, "sodiumchloride" = 2)
	tastes = list("Зернистое и жевательное мясо с чрезмерно горьким бульоном. Это абсолютно гнилое.." = 1)

/obj/item/reagent_containers/food/snacks/stalker/putrescentstew
	name = "гнилостный гуляш"
	desc = "Кусочки диетического колбасного мяса, приготовленные в густой кашице из маринованного томатного бульона. Это не очень вкусно, если не сказать больше!"
	icon_state = "stew"
	w_class = 2
	list_reagents = list("nutriment" = 25, "omnizine" = 5, "sodiumchloride" = 2)
	tastes = list("Зернистое и жилистое мясо с чрезмерно уксусно-томатным бульоном. Это абсолютно гнило.." = 1)

/obj/item/reagent_containers/food/snacks/stalker/lowgradestew
	name = "низкосортный гуляш"
	desc = "Кусочки мясных обрезков варёных в тонкой кашице из грибного бульона. Это не очень вкусно, но не даст вам умереть с голоду!"
	icon_state = "lowgrade_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 20, "omnizine" = 5, "sodiumchloride" = 2)
	tastes = list("Зернистое и жилистое мясо с чрезмерно землистым бульоном. Это не очень приятно.." = 1)

/obj/item/reagent_containers/food/snacks/stalker/shroomstew
	name = "Грибной гуляш"
	desc = "Изнуряющая еда, предлагаемая барменами для тех, кому не повезло. Состоящая из всякого дерьма, едва пригодного для потребления человеком."
	icon_state = "stew"
	w_class = 2
	list_reagents = list("nutriment" = 15, "sodiumchloride" = 5, "mushroomhallucinogen" = 0.05)
	tastes = list("песковатый и землистый вкус. Это ужасно.." = 1)

/// BORSCHT

/obj/item/reagent_containers/food/snacks/stalker/borscht/poor
	name = "Борщ для бедняков"
	desc = "Кислый суп, распространенный в Восточной Европе и Северной Азии."
	icon_state = "beetsoup"
	w_class = 2
	list_reagents = list("nutriment" = 20, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("песковатый и землистый вкус. Это ужасно.." = 1)

/obj/item/reagent_containers/food/snacks/stalker/borscht
	name = "Постный борщ"
	desc = "Кислый суп, распространенный в Восточной Европе и Северной Азии."
	icon_state = "beetsoup"
	w_class = 2
	list_reagents = list("nutriment" = 25, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("еорнеподобная текстура с землистым вкусом. Это приятно..." = 1)

/obj/item/reagent_containers/food/snacks/stalker/borscht/luxury
	name = "Борщ класса люкс"
	desc = "Кислый суп, распространенный в Восточной Европе и Северной Азии."
	icon_state = "beetsoup"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("Ароматные приправленные овощи с легким землистым вкусом. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/okroshkasoup
	name = "Окрошка"
	desc = "Окрошка — холодный суп русского происхождения, вероятно, возникший в Поволжье.."
	icon = 'stalker/icons/food.dmi'
	icon_state = "lowgrade_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 35, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("освежающий вкус возвращающий вас на момент в детство" = 1)

/obj/item/reagent_containers/food/snacks/stalker/ukha
	name = "уха"
	desc = "Уха начала использоваться как термин для обозначения рыбного бульона в русской кухне в конце 17-го - начале 18-го веков.."
	icon_state = "stew"
	w_class = 2
	list_reagents = list("nutriment" = 35, "omnizine" = 10, "vitamin" = 10, "sodiumchloride" = 2)
	tastes = list("ароматные кусочки рыбы в бульоне из жидкого, прозрачного бульона. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/meatstew/rat
	name = "Гуляш из крысиного мяса"
	desc = "Кусочки тушеного крысиного мяса, приготовленные с тоннами перца и соли с качественными культивированными грибами! Ничто так не согревает живот сталкеров!"
	icon_state = "lowgrade_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("Ароматные кусочки крысиного мяса в бульоне из густой подливки с овощами. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/meatstew/flesh
	name = "Гуляш из плоти"
	desc = "Кусочки тушеного мяса плоти, приготовленные с тоннами перца и соли с качественными культивированными грибами! Ничто так не согревает живот сталкеров!"
	icon_state = "meat_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("Ароматные кусочки свиного мяса в бульоне из густой подливки с овощами. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/meatstew/dog
	name = "гуляш из собачьего мяса"
	desc = "Кусочки тушеного мяса собаки-мутанта, приготовленные с тоннами перца и соли с качественными культивированными грибами! Ничто так не согревает живот сталкеров!"
	icon_state = "meat_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("ароматные кусочки свиного мяса в бульоне из густой подливки с овощами. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/meatstew/boar
	name = "гуляш из мяса кабана"
	desc = "Кусочки тушеного мяса кабана-мутанта, приготовленные с тоннами перца и соли с качественными культивируемыми грибами! Ничто так не согревает живот сталкеров!"
	icon_state = "meat_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("ароматные кусочки свиного мяса в бульоне из густой подливки с овощами. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/meatstew/snork
	name = "Гуляш из мяса снорка"
	desc = "Кусочки тушеного мяса снорка, приготовленные с тоннами перца и соли с качественными культивируемыми грибами! Ничто так не согревает живот сталкеров!"
	icon_state = "meat_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("ароматные кусочки снорка в бульоне из густой подливки с овощами. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/meatstew/pseudo
	name = "Гуляш из псевдособачьего мяса"
	desc = "Кусочки тушеного мяса собаки-мутанта, приготовленные с тоннами перца и соли с качественными культивируемыми грибами! Ничто так не согревает живот сталкеров!"
	icon_state = "meat_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("ароматные кусочки мяса собаки в бульоне из густой подливки с овощами. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/meatstew/bloodsucker
	name = "гуляш из кровососа"
	desc = "Кусочки тушеного мяса кровососа, приготовленные с тоннами перца и соли с качественными культивируемыми грибами! Ничто так не согревает живот сталкеров!"
	icon_state = "meat_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("ароматные кусочки кровососьего мяса в бульоне из густой подливки с овощами. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/meatstew/controller
	name = "гуляш из контролёра"
	desc = "Кусочки тушеного мяса контролёра, приготовленные с тоннами перца и соли с качественными культивируемыми грибами! Ничто так не согревает живот сталкеров!"
	icon_state = "meat_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 2)
	tastes = list("ароматные кусочки мяса контролёра в бульоне из густой подливки с овощами. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/meatstew/mutantdelight
	name = "Гуляш из мяса мутантов"
	desc = "Разнообразное тушеное мясо мутантов, приготовленное с тоннами перца и соли, с качественными культивированными грибами и всевозможными овощами! Ничто так не согревает живот сталкеров!"
	icon_state = "meat_goulash"
	w_class = 2
	list_reagents = list("nutriment" = 45, "omnizine" = 10, "vitamin" = 10, "sodiumchloride" = 2)
	tastes = list("ароматные кусочки мяса мутантов в бульоне из густой подливки с овощами. Это замечательно!" = 1)

// Candy-Bars and King-Ass Rippers Snack

/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/thebar
	name = "Шоколадный батончик без сахара"
	desc = "Завезен в более поздние годы сталкерами, которые ясно понимали, что диета из хлеба, мяса и водки делает с желудком. Это сделает... «Чистое небо» в кишечнике!"
	icon_state = "thebar"
	icon_state_opened = "thebar1"
	list_reagents = list("lipolicide" = 10, "omnizine" = 1)
	trash = /obj/item/trash/konserva/snikers
	desc_opened = "Завезен в более поздние годы сталкерами, которые ясно понимали, что диета из хлеба, мяса и водки делает с желудком. Это сделает... «Чистое небо» в кишечнике! Его упаковка открыта!"
	tastes = list("Как ни странно, удовлетворительный шоколад, который, кажется, заставляет ваш... Желудок.. Ворчать.. О, нет..." = 1)

/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/thebar
	name = "Плитка русского шоколада"
	desc = "Напоминание о жизни, брошенной во внешнем мире местными жителями. Этот шоколадный батончик богат как вкусом, так и домашней атмосферой!"
	icon_state = "choco1"
	icon_state_opened = "choco2"
	list_reagents = list("nutriment" = 5, "omnizine" = 1, "psicodine" = 1)
	trash = /obj/item/trash/konserva/snikers
	desc_opened =  "Напоминание о жизни, брошенной во внешнем мире местными жителями. Этот шоколадный батончик богат как вкусом, так и домашней атмосферой! Его упаковка открыта."
	tastes = list("Вкусный шоколад и напоминание о более спокойной жизни.." = 1)

/// KEBABS ///

/obj/item/reagent_containers/food/snacks/stalker/kebab/mutantmeat
	name = "Мясной шашлык из мутантов"
	desc = "Кусочки тушеного мяса мутантов, приготовленные с тоннами перца и соли на стержне! Ничто так не согревает живот сталкеров!"
	icon_state = "meatkebab"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 5)
	tastes = list("Ароматные куски мяса мутантов прямо с шампура. Это замечательно!" = 1)

/obj/item/reagent_containers/food/snacks/stalker/kebab/mutantonionmeat
	name = "Шашлык из мяса мутантов и лука"
	desc = "Кусочки тушеного мяса мутантов и лук, приготовленные с тоннами перца и соли на стержне! Ничто так не согревает живот сталкеров"
	icon_state = "onionmeatkebab"
	w_class = 2
	list_reagents = list("nutriment" = 30, "omnizine" = 10, "vitamin" = 5, "sodiumchloride" = 5)
	tastes = list("Ароматные куски мяса мутантов и лука прямо с шампура. Это замечательно!" = 1)

// JERKY

/obj/item/reagent_containers/food/snacks/sosjerky/mutant
	name = "Самодельное вяленое мясо-мутанта"
	desc = "Самодельное вяленое мясо-мутанта, приготовленное из лучшего в Зоне."
	list_reagents = list("nutriment" = 25, "vitamin" = 5, "omnizine" = 5, "sugar" = 3, "sodiumchloride" = 2)
	junkiness = 0

// PASHTET

/obj/item/reagent_containers/food/snacks/pashtet/mutantmix
	name = "Самодельный Паштет из мутантов"
	desc = "Самодельный Паштет сделанный из разных частей нескольких видов мутантов."
	list_reagents = list("nutriment" = 25, "vitamin" = 5, "omnizine" = 5, "sugar" = 3, "sodiumchloride" = 2)
	junkiness = 0

/obj/item/reagent_containers/food/snacks/pashtet/mutantmeatmix
	name = "Самодельный Паштет из мутантов"
	desc = "Самодельный Паштет сделанный из лучших частей нескольких видов мутантов"
	list_reagents = list("nutriment" = 35, "vitamin" = 5, "omnizine" = 5, "sugar" = 3, "sodiumchloride" = 2)
	junkiness = 0
