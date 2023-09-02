/area/stalker
	icon = 'stalker/icons/areas.dmi'
	name = "Странное место"
	icon_state = "away"
	has_gravity = STANDARD_GRAVITY
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED

/area/stalker/blowout
	ambient_environment = DEFAULT_AMBIENT_ENVIRONMENT_DAY
	ambient_environment_night = DEFAULT_AMBIENT_ENVIRONMENT_NIGHT

/area/stalker/blowout/outdoor
	name = "Улица"
	icon = 'stalker/icons/areas_outdoor_blowout.dmi'
	icon_state = "outdoor"
	open_space = TRUE
	environment = 15

/area/stalker/sidor
	name = "Подвал Сидоровича"
	icon = 'stalker/icons/areas_buildings.dmi'
	icon_state = "sidor"
	requires_power = 1
	environment = 5
	safezone = 1

/area/stalker/blowout/buildings
	name = "Здания"
	icon = 'stalker/icons/areas_buildings_blowout.dmi'
	icon_state = "buildings"
	requires_power = 1
	environment = 2

/area/stalker/buildings
	name = "Здания"
	icon = 'stalker/icons/areas_buildings.dmi'
	icon_state = "buildings"
	requires_power = 1
	environment = 5

/area/stalker/adminspace
	name = "Admin Space"
	icon = 'stalker/icons/areas_buildings.dmi'
	icon_state = "admin_space"
	requires_power = 1

///////////////////////?????////////////////////////////////////////////////////////////////////////////////////////////////////////////

/area/stalker/buildings/backwater
	name = "Затон - Здания \[NB\]"
	icon_state = "buildings"
	environment = 2

/area/stalker/blowout/buildings/backwater
	name = "Затон - Здания"
	icon_state = "buildings"
	environment = 2

/area/stalker/blowout/outdoor/backwater
	name = "Затон - Улица \[O\]"
	icon_state = "outdoor"
	environment = 19

////////////////////////////////////////////////////////////////

///////////////////////????? - ??????????///////////////////////
/area/stalker/buildings/backwater/substation
	name = "Затон - Мастерская Подстанции \[NB\]"
	icon_state = "substation"
	environment = 5

/area/stalker/blowout/buildings/backwater/substation
	name = "Затон - Мастерская Подстанции"
	icon_state = "substation"

/area/stalker/blowout/outdoor/backwater/substation
	name = "Затон - Мастерская Подстанции \[O\]"
	icon_state = "substation"
////////////////////////////////////////////////////////////////

///////////////////////????? - ????????/////////////////////////
/area/stalker/buildings/backwater/skadovsk
	name = "Затон - Скадовск \[NB\]"
	icon_state = "skadovsk"
	safezone = 1
	environment = 0
	//ambient_music = list()

/area/stalker/buildings/backwater/skadovsk_respawn
	name = "Затон - Скадовск (2nd floor) \[NB\]"
	icon_state = "skadovsk"
	safezone = 1
	environment = 0
	//ambient_music = list()

/area/stalker/blowout/buildings/backwater/skadovsk
	name = "Затон - Скадовск"
	icon_state = "skadovsk"
	safezone = 1
	environment = 0
	//ambient_music = list()

/area/stalker/blowout/outdoor/backwater/skadovsk
	name = "Затон - Скадовск \[O\]"
	icon_state = "skadovsk"
	safezone = 1
	environment = 19

////////////////////////////////////////////////////////////////

///////////////////////????? - ????????/////////////////////////
/area/stalker/buildings/backwater/shevchenko
	name = "Затон - Шевченко \[NB\]"
	icon_state = "shevchenko"
	environment = 2

/area/stalker/blowout/buildings/backwater/shevchenko
	name = "Затон - Шевченко"
	icon_state = "shevchenko"
	environment = 2

/area/stalker/blowout/outdoor/backwater/shevchenko
	name = "Затон - Шевченко \[O\]"
	icon_state = "shevchenko"
////////////////////////////////////////////////////////////////

///////////////////////????? - ????????? ?????//////////////////
/area/stalker/buildings/backwater/burntfarm
	name = "Затон - Сгоревший хутор \[NB\]"
	icon_state = "burntfarm"

/area/stalker/blowout/buildings/backwater/burntfarm
	name = "Затон - Сгоревший хутор"
	icon_state = "burntfarm"

/area/stalker/blowout/outdoor/backwater/burntfarm
	name = "Затон - Сгоревший хутор \[O\]"
	icon_state = "burntfarm"
////////////////////////////////////////////////////////////////

///////////////////////????? - ???????? ???///////////////////
/area/stalker/buildings/backwater/ironforest
	name = "Затон - Железный лес \[NB\]"
	icon_state = "ironforest"
	ambient_background = list('stalker/sound/ambience/ugrnd/howled_4.ogg')
	ambient_background_cooldown = list(270)
	ambient_environment = DEFAULT_AMBIENT_ENVIRONMENT_UNDERGROUND
	ambient_environment_night = list()
	ambient_environment_cooldown = 800
	environment = 8

/area/stalker/blowout/buildings/backwater/ironforest
	name = "Затон - Железный лес"
	icon_state = "ironforest"

/area/stalker/blowout/outdoor/backwater/ironforest
	name = "Затон - Железный лес \[O\]"
	icon_state = "ironforest"
////////////////////////////////////////////////////////////////

///////////////////////????? - ??? ????///////////////////
/area/stalker/buildings/backwater/krug
	name = "Затон - ВНЗ Круг \[NB\]"
	icon_state = "krug"
	environment = 5
	ambient_background = list('stalker/sound/ambience/ugrnd/howled_4.ogg')
	ambient_background_cooldown = list(270)
	ambient_environment = DEFAULT_AMBIENT_ENVIRONMENT_UNDERGROUND
	ambient_environment_night = list()
	ambient_environment_cooldown = 800
	environment = 8

/area/stalker/blowout/buildings/backwater/krug
	name = "Затон - ВНЗ Круг"
	icon_state = "krug"
	environment = 2

/area/stalker/blowout/outdoor/backwater/krug
	name = "Затон - ВНЗ Круг \[O\]"
	icon_state = "krug"
////////////////////////////////////////////////////////////////

///////////////////////????? - ?????????///////////////////
/area/stalker/buildings/backwater/sawmill
	name = "Затон - Лесопилка \[NB\]"
	icon_state = "sawmill"

/area/stalker/blowout/buildings/backwater/sawmill
	name = "Затон - Лесопилка"
	icon_state = "sawmill"

/area/stalker/blowout/outdoor/backwater/sawmill
	name = "Затон - Лесопилка \[O\]"
	icon_state = "sawmill"
////////////////////////////////////////////////////////////////

///////////////////////????? - ???????????///////////////////
/area/stalker/buildings/backwater/ranger
	name = "Затон - Лесничество \[NB\]"
	icon_state = "ranger"

/area/stalker/blowout/buildings/backwater/ranger
	name = "Затон - Лесничество"
	icon_state = "ranger"

/area/stalker/blowout/outdoor/backwater/ranger
	name = "Затон - Лесничество \[O\]"
	icon_state = "ranger"
////////////////////////////////////////////////////////////////

///////////////////////????? - ??????? ??????????? ???????///////////////////
/area/stalker/buildings/backwater/waste
	name = "Затон - Станция Переработки Отходов \[NB\]"
	icon_state = "waste"

/area/stalker/blowout/buildings/backwater/waste
	name = "Затон - Станция Переработки Отходов"
	icon_state = "waste"

/area/stalker/blowout/outdoor/backwater/waste
	name = "Затон - Станция Переработки Отходов \[O\]"
	icon_state = "waste"
	environment

////////////////////////////////////////////////////////////////

///////////////////////????? - ??????? ??????????? ???????///////////////////
/area/stalker/buildings/backwater/waste
	name = "Затон - Станция Переработки Отходов \[NB\]"
	icon_state = "waste"

/area/stalker/blowout/buildings/backwater/waste
	name = "Затон - Станция Переработки Отходов"
	icon_state = "waste"

/area/stalker/blowout/outdoor/backwater/waste
	name = "Затон - Станция Переработки Отходов \[O\]"
	icon_state = "waste"
////////////////////////////////////////////////////////////////

///////////////////////????? - ??????///////////////////
/area/stalker/buildings/backwater/claw
	name = "Затон - Коготь \[NB\]"
	icon_state = "claw"

/area/stalker/blowout/buildings/backwater/claw
	name = "Затон - Коготь"
	icon_state = "claw"

/area/stalker/blowout/outdoor/backwater/claw
	name = "Затон - Коготь \[O\]"
	icon_state = "claw"
////////////////////////////////////////////////////////////////

///////////////////////????? - ????? ?????///////////////////
/area/stalker/buildings/backwater/plateau
	name = "Затон - Южное Плато \[NB\]"
	icon_state = "plateau"
	ambient_background = list('stalker/sound/ambience/ugrnd/howled_4.ogg')
	ambient_background_cooldown = list(270)
	ambient_environment = DEFAULT_AMBIENT_ENVIRONMENT_UNDERGROUND
	ambient_environment_night = list()
	ambient_environment_cooldown = 800
	environment = 8

/area/stalker/blowout/buildings/backwater/plateau
	name = "Затон - Южное Плато"
	icon_state = "plateau"

/area/stalker/blowout/outdoor/backwater/plateau
	name = "Затон - Южное Плато \[O\]"
	icon_state = "plateau"
////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/area/stalker/kordon
	requires_power = 1

/area/stalker/kordon/buildings
	name = "Здания в Кордоне"
	icon_state = "cellar"

/area/stalker/blowout/kordon/buildings
	name = "Здания в Кордоне"
	icon_state = "buildings"

/area/stalker/kordon/cellar
	name = "Подвал в Кордоне"
	icon_state = "cellar"

/area/stalker/kordon/tunnel
	name = "Тунель Кордон"
	icon_state = "tunnel_s"
	environment = 13
	ambient_environment = DEFAULT_AMBIENT_ENVIRONMENT_UNDERGROUND
	ambient_environment_night = list()
	ambient_environment_cooldown = 800

/area/stalker/blowout/kordon/tunnel
	name = "Тунель"
	icon_state = "tunnel"

/area/stalker/cave
	name = "Пещера"
	icon_state = "tunnel"
	dynamic_lighting = DYNAMIC_LIGHTING_ENABLED
	requires_power = 1
	environment = 8

/area/stalker/svalka
	requires_power = 1

/area/stalker/svalka/buildings
	name = "Здания свалки"
	icon_state = "buildings"

/area/stalker/blowout/svalka/buildings
	name = "Здания свалки"
	icon_state = "buildings"

/area/stalker/blowout/svalka/buildings/bar
	name = "Бар свалки"
	icon_state = "buildings"

/area/stalker/svalka/cellar
	name = "Подвал свалки"
	icon_state = "cellar"

/area/stalker/svalka/tunnel
	name = "Тунель свалки"
	icon_state = "tunnel_s"

/area/stalker/blowout/svalka/tunnel
	name = "Тунель свалки"
	icon_state = "tunnel"



/area/stalker/agroprom
	requires_power = 1

/area/stalker/agroprom/buildings
	name = "Здания_Выброс Агропром"
	icon_state = "buildings"

/area/stalker/blowout/agroprom/buildings
	name = "Здания_Выброс Агропром"
	icon_state = "buildings_blowout"

/area/stalker/agroprom/cellar
	name = "Подвал Агропром"
	icon_state = "cellar"

/area/stalker/agroprom/tunnel
	name = "Тунель Агропром"
	icon_state = "tunnel_s"

/area/stalker/blowout/agroprom/tunnel
	name = "Тунель Агропром"
	icon_state = "tunnel"

/area/stalker/agroprom/caves
	name = "Пещеры Агропром"
	icon_state = "caves"
	requires_power = 1
	ambient_music = null
	ambient_background = list('stalker/sound/ambience/ugrnd/howled_4.ogg')
	ambient_background_cooldown = list(270)
	ambient_environment = DEFAULT_AMBIENT_ENVIRONMENT_UNDERGROUND
	ambient_environment_night = list()
	ambient_environment_cooldown = 800
	environment = 8

/area/stalker/byadt
	requires_power = 1

/area/stalker/byadt/bar
	name = "Бар"
	icon_state = "realbar"

/area/stalker/byadt/buildings
	name = "Здания ХЗ"
	icon_state = "buildings_s"

/area/stalker/blowout/byadt/buildings
	name = "Здания Выброс"
	icon_state = "buildings"

/area/stalker/byadt/buildings/mercenary
	name = "Наёмники"
	icon_state = "mercenary"


//bar

/area/stalker/blowout/buildings/bar
	name = "Бар"
	icon_state = "buildings_s"

/area/stalker/blowout/outdoor/bar
	icon = 'stalker/icons/areas_outdoor_blowout.dmi'
	icon_state = "outdoor"

/area/stalker/buildings/bar/city
	name = "Здания"
	icon_state = "buildings"

/area/stalker/buildings/bar/rentgen
	name = "100 РЕНТГЕН"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "realbar"
	safezone = 1

/area/stalker/buildings/monolith
	name = "Зона Монолита"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "monolith"
	monolithsafezone = 1

/area/stalker/buildings/duty
	name = "Зона Долга"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "duty"
	dutysafezone = 1

/area/stalker/buildings/freedom
	name = "Зона Свооды"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "freedom"
	freedomsafezone = 1

/area/stalker/buildings/clearsky
	name = "Зона ЧН"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "clearsky"
	cssafezone = 1

/area/stalker/buildings/bandit
	name = "Зона Бандитов"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "bandit"
	banditsafezone = 1

/area/stalker/buildings/military
	name = "Зона Военных"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "military"
	militarysafezone = 1

/area/stalker/buildings/renegade
	name = "Зона Ренегатов"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "renegades"
	renegadesafezone = 1

/area/stalker/buildings/mercenary
	name = "Зона Мерков"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "mercenary"
	mercenarysafezone = 1

/area/stalker/buildings/ecologist
	name = "Зона Экологов"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "ecologist"
	ecosafezone = 1

/area/stalker/buildings/ecologist_entrance
	name = "Экологи"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "ecologist entrance"
	safezone = 1

//bar


//kordon + svalka

/area/stalker/blowout/buildings/kordon
	name = "Бар"
	icon_state = "buildings_s"

/area/stalker/blowout/outdoor/kordon
	icon = 'stalker/icons/areas_outdoor_blowout.dmi'
	icon_state = "outdoor"

/area/stalker/buildings/kordon/domik
	name = "Домик Кордона"
	icon_state = "buildings"

/area/stalker/buildings/kordon/banditbar
	name = "Бар Бандитов"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "bandit_bar"
//	banditsafezone = 1

//radar
/area/stalker/buildings/radar
	name = "Здания"
	icon_state = "buildings"
