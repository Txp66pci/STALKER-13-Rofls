/*
/obj/item/clothing/head/New()
	..()
	sleep(5)
	if(nvg)
		if(nvg.colour_matrix == NIGHTVISION_MATRIX_I)
			modifications += "visor"
		else if(nvg.colour_matrix == NIGHTVISION_MATRIX_II)
			modifications += "visor"
*/
/obj/item/clothing/head/steel
	name = "Стальной шлем"
	desc = "Отчаянно устаревший стальной армейский шлем без каких-либо дополнений. Не обеспечивает защиты от аномалий или радиации, но может отклонять пули. Этот шлем никогда не был особенно популярен в Зоне, за исключением использования в коротких вооруженных конфликтах между фракциями."
	icon_state = "steelhelmet"
	item_state = "steelhelmet"
	armor = list("melee" = 25, "bullet" = 30, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "psy" = 10)
	flags_inv = HIDEHAIR
	flags_cover = 0
	resistance_flags = UNACIDABLE
	durability = 40
	modifications = list("material_head" = 0)

/obj/item/clothing/head/ssh
	name = "СШ-68"
	desc = "СШ-68 пришел на смену общеармейскому шлему СШ-60. Отличается от предшественника большей прочностью, большим наклоном лицевой части и короткими боковыми бортами."
	icon_state = "ssh-68"
	item_state = "ssh-68"
	armor = list("melee" = 25, "bullet" = 35, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "psy" = 10)
	flags_inv = HIDEHAIR
	flags_cover = 0
	resistance_flags = UNACIDABLE
	durability = 40
	modifications = list("material_head" = 0)

/obj/item/clothing/head/tsh
	name = "ТШ-4M"
	desc = "Данный шлем предназначен для обеспечения двусторонней радиотелефонной связи на объектах с высоким уровнем шума, для защиты его от климатических факторов и от ударов по конструктивным элементам объектов. Он имеет плохую защиту для нужд зоны, но очень теплый."
	icon_state = "TSH-4M"
	item_state = "TSH-4M"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	armor = list("melee" = 5, "bullet" = 5, "laser" = 0, "energy" = 15, "bomb" = 5, "bio" = 5, "rad" = 10, "fire" = 30, "acid" = 0, "psy" = 5)
	flags_inv = HIDEHAIR
	resistance_flags = UNACIDABLE|FIRE_PROOF
	durability = 30

/obj/item/clothing/head/mob_can_equip(mob/M, slot, disable_warning = 0)
	if(!iscarbon(M))
		return ..()

	var/mob/living/carbon/C = M

	if(slot != ITEM_SLOT_HEAD)
		return ..()

	if(!(flags_cover & HEADCOVERSMOUTH))
		return ..()

	if(!(C.wear_mask))
		return ..()

	return 0

/obj/item/clothing/head/tacticalhelmet
	name = "Тактический шлем"
	desc = "Французский тактический шлем SPECTRA, лишенный камуфляжа. Неизвестно, как он попал в Зону. Шлем предназначен для обеспечения командиру отделения стратегического превосходства над противником с помощью его многочисленных сканеров и устройств спутниковой связи, которые не были установлены в этом конкретном шлеме. Поставляется с многослойной кевларовой защитой и бронированными элементами для защиты электронных компонентов. В комплекте респиратор и прибор ночного видения."
	icon_state = "hardhat0_tactical"
	item_state = "hardhat0_tactical"
	item_color = "tactical"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	dynamic_hair_suffix = ""
	armor = list("melee" = 50, "bullet" = 60, "laser" = 0, "energy" = 30, "bomb" = 0, "bio" = 30, "rad" = 40, "fire" = 20, "acid" = 0, "psy" = 12)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = UNACIDABLE
	durability = 300
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 1)

/obj/item/clothing/head/tacticalhelmet/New()
	nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/head/hardhat/tactical/light
	name = "Легкий тактический шлем"
	desc = "Британская модель тактического шлема MK VI, лишенная камуфляжа. Неизвестно, как он попал в Зону. Поставляется с многослойной кевларовой защитой и бронированными элементами для защиты электронных компонентов."
	icon_state = "hardhat0_lighttactical"
	item_state = "hardhat0_lighttactical"
	item_color = "lighttactical"
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR
	dynamic_hair_suffix = ""
	armor = list("melee" = 35, "bullet" = 45, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "psy" = 5)
	brightness_on = 3 //luminosity when on
	flags_cover = HEADCOVERSEYES
	resistance_flags = UNACIDABLE
	durability = 200
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)

/obj/item/clothing/head/hardhat/tactical/light/New()
	..()
	return

/obj/item/clothing/head/hardhat/tactical/guardian_of_freedom
	name = "Шлем Защитника Свободы"
	desc = "Британская модель тактического шлема MK VI, модифицированная фракцией Свободы. Неизвестно, как он попал в Зону. Поставляется с многослойной кевларовой защитой и бронированными элементами для защиты электронных компонентов."
	icon_state = "hardhat0_gof"
	item_state = "hardhat0_gof"
	item_color = "gof"
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR
	dynamic_hair_suffix = ""
	armor = list("melee" = 35, "bullet" = 45, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "psy" = 10)
	brightness_on = 3 //luminosity when on
	flags_cover = HEADCOVERSEYES
	resistance_flags = UNACIDABLE
	durability = 200
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)

/obj/item/clothing/head/hardhat/tactical/guardian_of_freedom/New()
	..()
	return

/obj/item/clothing/head/assaultmerc
	name = "Шлем Наёмников"
	desc = "Сделан в Швейцарии и используется Наемниками Мертвого города."
	icon_state = "assaultmerc"
	item_state = "assaultmerc"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	dynamic_hair_suffix = ""
	armor = list("melee" = 50, "bullet" = 75, "laser" = 25, "energy" = 50, "bomb" = 50, "bio" = 0, "rad" = 20, "fire" = 50, "acid" = 0, "psy" = 10)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = UNACIDABLE
	durability = 250
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)

/obj/item/clothing/head/gopcap
	name = "Кепка"
	desc = "Пустите ему в лоб ёбаную пулю!"
	icon_state = "gopcap"
	item_state = "gopcap"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/soft/jacknoircap
	name = "Шапка"
	desc = "Кто знает, как британцы добрались до Чернобыля?"
	icon_state = "jacknoirsoft"
	item_color = "jacknoir"
	item_state = "greysoft"

/obj/item/clothing/head/spheram
	name = "Сфера M12"
	desc = "Алюминиево-титановый шлем, которая поставляется с местом для дополнительного улучшения и маской для лица. Сфера M12 обычно используются как часть брони, которая включает в себя бронежилеты спецназа серии ПСЗ. Довольно популярен в Зоне благодаря респиратору и встроенному прибору ночного видения первого поколения, а также обеспечивает максимально возможную защиту головы. Поставляется со слотами для электроники."
	icon_state = "sphera"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	dynamic_hair_suffix = ""
	armor = list("melee" = 60, "bullet" = 65, "laser" = 0, "energy" = 35, "bomb" = 0, "bio" = 30, "rad" = 60, "fire" = 35, "acid" = 0, "psy" = 20)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = UNACIDABLE
	durability = 400
	//МОДИФИКАЦИИ//
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 1)

/obj/item/clothing/head/spheram/New()
	//nvg = new /obj/item/nightvision(src)
	AttachNVG()
	..()

/obj/item/clothing/head/skathelmet
	name = "Шлем СКАТ-M9"
	desc = "Немного улучшенная версия Сферы M12. Обычно используется как часть комбинации, включающей бронежилеты спецназа серии ПСЗ. Довольно популярен в Зоне благодаря респиратору и встроенному прибору ночного видения первого поколения, а также обеспечивает максимально возможную защиту головы. Поставляется со слотами для электроники."
	icon_state = "helmet_skat"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	dynamic_hair_suffix = ""
	armor = list("melee" = 75, "bullet" = 75, "laser" = 60, "energy" = 70, "bomb" = 70, "bio" = 50, "rad" = 80, "fire" = 70, "acid" = 0, "psy" = 10)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = UNACIDABLE
	durability = 400
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 1)

/obj/item/clothing/head/skathelmet/New()
	//nvg = new /obj/item/nightvision(src)
	AttachNVG()
	..()

/obj/item/clothing/head/petrovichhelmet
	name = "СКОТ-M777"
	desc = "Алюминиево-картонный шлем из шпрот с карманами для мелочи и доспехов. Обычно идет с водкой. Недостаточно популярен в Зоне из-за заговора Петровича. "
	icon_state = "helmet_skot"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	armor = list("melee" = 75, "bullet" = 75, "laser" = 60, "energy" = 70, "bomb" = 70, "bio" = 50, "rad" = 80, "fire" = 70, "acid" = 0, "psy" = 50)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = UNACIDABLE
	durability = 400
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)

/obj/item/clothing/head/beret_ua
	name = "Военный берет"
	desc = "Стоит больше, чем месячная зарплата призывника."
	icon_state = "beret_ua"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "psy" = 0)
	strip_delay = 80
/*
/obj/item/clothing/mask/gas/New()
	..()
	sleep(5)
	if(nvg)
		if(nvg.colour_matrix == NIGHTVISION_MATRIX_I)
			modifications += "visor"
		else if(nvg.colour_matrix == NIGHTVISION_MATRIX_II)
			modifications += "visor"
*/

/obj/item/clothing/head/maska_1
	name = "Шлем МАСКА-1Щ"
	desc = "Шлем Маска-1 использовался МВД России до тех пор, пока не был в значительной степени заменен алюминиевым ЗШ-1-2. Теперь его чаще носят сталкеры Чистого Неба."
	icon_state = "maska_1"
	item_state = "maska_1"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	dynamic_hair_suffix = ""
	armor = list("melee" = 50, "bullet" = 45, "laser" = 0, "energy" = 30, "bomb" = 0, "bio" = 30, "rad" = 40, "fire" = 20, "acid" = 0, "psy" = 12)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = UNACIDABLE
	durability = 300
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 1)

/obj/item/clothing/mask/gas/stalker
	name = "Противогаз"
	desc = "Обычный пластиково-резиновый противогаз, используемый для фильтрации воздуха от радиоактивных частиц и отравляющих веществ. Широко используется новичками и ветеранами всех фракций благодаря своему универсальному функционалу. Не обеспечивает никакой физической защиты."
	icon_state = "gasmasknew"
	item_state = "gasmasknew"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	flags_inv = HIDEHAIR
	armor = list("melee" = 5, "bullet" = 0, "laser" = 30, "energy" = 30, "bomb" = 0, "bio" = 0, "rad" = 100, "fire" = 30, "acid" = 0, "psy" = 0)
	resistance_flags = UNACIDABLE|FIRE_PROOF
	durability = 400
	//МОДИФИКАЦИИ//
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)

/obj/item/clothing/mask/gas/stalker/gp4
	name = "Противогаз ГП-4"
	desc = "Советский ГП-4 - еще одна маска в серии ГП. Он был сделан для выдачи гражданским лицам из-за растущей паники по поводу холодной войны. Эта модель чрезвычайно распространена в Зоне и пользуется популярностью у многих сталкеров из-за ее относительной надежности и небольшого веса."
	icon_state = "gp4"
	item_state = "gp4"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	flags_inv = HIDEHAIR
	armor = list("melee" = 5, "bullet" = 0, "laser" = 30, "energy" = 30, "bomb" = 0, "bio" = 20, "rad" = 100, "fire" = 30, "acid" = 0, "psy" = 0)
	resistance_flags = UNACIDABLE|FIRE_PROOF
	durability = 400
	//МОДИФИКАЦИИ//
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)

/obj/item/clothing/mask/gas/stalker/gp5
	name = "Противогаз ГП-5"
	desc = "Подобно ГП-4, эта маска включает в себя фильтр ШМ-62. К сожалению, этот фильтр дозируется асбестом, а корпус, как известно, разлагает свинец в фильтр. Если это ваш единственный вариант, ищите фильтр с использованием активированного угля."
	icon_state = "gp5"
	item_state = "gp5"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	flags_inv = HIDEHAIR
	armor = list("melee" = 5, "bullet" = 0, "laser" = 30, "energy" = 30, "bomb" = 0, "bio" = 20, "rad" = 100, "fire" = 30, "acid" = 0, "psy" = 0)
	resistance_flags = UNACIDABLE|FIRE_PROOF
	durability = 400
	//МОДИФИКАЦИИ//
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)

/obj/item/clothing/mask/gas/stalker/mercenary
	name = "Противогаз"
	desc = "Западный пластиково-резиновый противогаз, используемый для фильтрации воздуха от радиоактивных частиц и ядовитых веществ. Широко используется Наёмниками. Не обеспечивает никакой физической защиты."
	icon_state = "mercenary_gasmask"
	item_state = "mercenary_gasmask"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	armor = list("melee" = 5, "bullet" = 0, "laser" = 30, "energy" = 30, "bomb" = 0, "bio" = 20, "rad" = 100, "fire" = 30, "acid" = 0, "psy" = 0)
	resistance_flags = UNACIDABLE|FIRE_PROOF
	durability = 400
	//МОДИФИКАЦИИ//
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)

/obj/item/clothing/mask/gas/stalker/respirator
	name = "Респиратор"
	desc = "Старый респиратор. Не защищает от многого."
	icon_state = "respirator"
	item_state = "respirator"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	armor = list("melee" = 5, "bullet" = 0, "laser" = 30, "energy" = 30, "bomb" = 0, "bio" = 20, "rad" = 100, "fire" = 30, "acid" = 0, "psy" = 0)
	resistance_flags = UNACIDABLE|FIRE_PROOF
	durability = 400
	//МОДИФИКАЦИИ//
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)

/obj/item/clothing/head/buckethelmet
	name = "Ведрошлем"
	desc = "Ведро с двумя отверстиями, чтобы видеть. Защищает голову от ударов. Цена? Ты выглядишь как идиот. Если подумать, может быть, это не лучший выбор для защиты."
	icon_state = "bucket_helmet"
	item_state = "bucket_helmet"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	armor = list("melee" = 15, "bullet" = 1, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "psy" = 10)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = FIRE_PROOF
	durability = 50

/obj/item/clothing/mask/gas/stalker/renegademask
	name = "Баллистическая маска ренегата"
	desc = "Маска из легкого, но прочного материала, которая дает вам шанс пережить шальную пулю в лицо. Имеет два непулевых отверстия."
	icon_state = "renegade_mask"
	item_state = "renegade_mask"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	flags_inv = HIDEEARS
	dynamic_hair_suffix = ""
	armor = list("melee" = 15, "bullet" = 15, "laser" = 0, "energy" = 20, "bomb" = 15, "bio" = 20, "rad" = 0, "fire" = 0, "acid" = 0, "psy" = 1)
	resistance_flags = UNACIDABLE
	durability = 300
	modifications = list("padding_head" = 0, "material_head" = 0, "visor_head" = 0)
