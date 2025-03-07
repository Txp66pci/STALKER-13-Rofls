GLOBAL_LIST_EMPTY(KPKs)
var/global/global_lentahtml = ""

/obj/item/stalker_pda
	name = "КПК"
	desc = "Портативное устройство, используемое для общения с другими сталкерами."
	icon = 'stalker/icons/device_new.dmi'
	icon_state = "kpk_off"
	item_state = "kpk"
	w_class = 1

	var/mode = 1
	var/show_title = 0
	var/switches = FEED_SOUND | FEED_IMAGES | RATING_IMAGES
	var/mainhtml = ""
	var/navbarhtml = ""
	var/ratinghtml =""
	var/list/access = list()

	//ПРОФИЛЬ
	var/mob/living/carbon/human/owner = null
	var/datum/data/record/profile = null
	var/registered_name = null
	var/sid = null
	var/rotation = "front"
	var/rus_faction_s = "Одиночки"
	var/rating = 0
	var/reputation = 0
	var/money = 0
	var/obj/item/photo/photo_owner_front = new()
	var/obj/item/photo/photo_owner_west = new()
	var/obj/item/photo/photo_owner_back = new()
	var/obj/item/photo/photo_owner_east = new()
	var/password = null
	var/hacked = 0
	var/rep_color_s = "#ffe100"
	var/rep_name_s = "Нейтрал"
	var/eng_rep_name_s = "Нейтрал"
	var/rus_rank_name_s = "Новичок"
	var/eng_rank_name_s = "Новичок"
	var/eng_faction_s = "Одиночки"
	var/degree = 0

	//ЛЕНТА
	var/lentahtml = ""
	var/last_lenta = 0
	var/lenta_id = 0

	var/last_faction_lenta = 0
	var/lenta_faction_id = 0

	var/msg_name = "Лента"
	var/max_length = 10
	slot_flags = ITEM_SLOT_ID

	//ФРАКЦИЯ
	var/last_invite = 0

	//РЕЙТИНГ
	var/sortBy = "Рейтинг"
	var/order = 1
	var/lastlogin = 0

	//ЭНЦИКЛОПЕДИЯ
	var/article_title = "Zone"
	var/article_text = "The Zone of Alienation is the 60 km wide area of exclusion that was set up around the Chernobyl NPP following the 1986 disaster and extended by the second Chernobyl disaster in 2006."
	var/article_img = "nodata.gif"
	var/article_img_width = 179
	var/article_img_height = 128

/datum/asset/simple/encyclopedia
	assets = list(
		//Фото для энциклопедии
		"zone"					= 'stalker/icons/images/zone.png',
		"backwater"				= 'stalker/icons/images/backwater.jpg',
		"nodata.gif"			= 'stalker/icons/images/nodata.gif'
	)

/datum/asset/simple/basics
	assets = list(
		"kpk_background.png"	= 'stalker/icons/images/kpk.png',
		"nodata.png"			= 'stalker/icons/images/nodata.png',
		"photo_0"				= 'stalker/icons/images/sidor.png'
		//Курсоры
	)

/datum/asset/simple/cursors
	assets = list(
		"cursor_normal.ani"		= 'stalker/html/cursors/arrow.ani',
		"cursor_red.ani"		= 'stalker/html/cursors/wait.ani',
		"cursor_green.ani"		= 'stalker/html/cursors/appstarting.ani',
		"cursor_busy.ani"		= 'stalker/html/cursors/busy.ani'
	)

/obj/item/stalker_pda/New()
	..()
	return

/obj/item/stalker_pda/Destroy()
	..()
	if(src in GLOB.KPKs)
		GLOB.KPKs -= src
	return

/obj/item/stalker_pda/MouseDrop(atom/over_object)
	. = ..()
	var/mob/living/M = usr
	if(!istype(M) || M.incapacitated() || !Adjacent(M))
		return

	if(over_object == M)
		M.put_in_hands(src)

	else if(istype(over_object, /obj/screen/inventory/hand))
		var/obj/screen/inventory/hand/H = over_object
		M.putItemFromInventoryInHandIfPossible(src, H.held_index)

	add_fingerprint(M)

/obj/item/stalker_pda/attack_hand(mob/living/user)
	if(src.loc == user)
		attack_self(user)
	else
		..()

/obj/item/stalker_pda/attack_self(mob/user)
	if(!istype(user, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/H = user

	if(owner == H)
		if(!profile)
			owner = null
		else
			set_owner_info(profile)
			profile.fields["lastlogin"] = world.time

	icon_state = "kpk_on"
	H.set_machine(src)

	//user.set_machine(src)
	mainhtml ="<html> \
	<meta charset='utf-8'>\
	<style>\
	a:link {color: #607D8B;}\
	a:visited {color: #607D8B;}\
	a:active {color: #607D8B;}\
	a:hover {\
	background-color: #9E9E9E;\
	cursor: url('cursor_green.ani');\
	}\
	a {text-decoration: none;}\
	html {cursor: url('cursor_normal.ani');}\
	body {\
		background-image: url('kpk_background.png');\
		padding-top: 18px;\
		padding-left: 35px;\
	}\
	table {\
		background: #131416;\
		padding: 15px;\
		margin-bottom: 10px;\
		color: #afb2a1;\
	}\
	\
	#table-bottom1 {\
		background: #2e2e38;\
		padding-top: 5px;\
		padding-bottom: 5px;\
	}\
	#table-center1 {\
		position: relative;\
		background: #2e2e38;\
		padding-top: 5px;\
		padding-bottom: 5px;\
		bottom: 100px;\
	}\
	#table-center2 {\
		position: relative;\
		background: #2e2e38;\
		bottom: 0px;\
	}\
	#table-lenta {\
		background: #9E9E9E;\
	}\
	div.relative {\
		position: relative;\
		width: 250px;\
		height: 200px;\
		top: 70px;\
	}\
	\
	#lenta {\
		background: #2e2e38;\
		color: white;\
		padding: 5px;\
		width: 449px;\
		height: 228px;\
		overflow: auto;\
		border: 1px solid #ccc;\
		word-wrap: break-word;\
	}\
	p.lentamsg {\
		margin: 0px;\
		word-wrap: break-word;\
	}\
	#navbar {\
		overflow: hidden;\
		background-color: #099;\
		position: fixed;\
		top: 0;\
		width: 100%;\
		padding-top: 3px;\
		padding-bottom: 3px;\
		padding-left: 20px;\
	}\
	#navbar a {\
		float: left;\
		display: block;\
		color: #666;\
		text-align: center;\
		padding-right: 20px;\
		text-decoration: none;\
		font-size: 17px;\
	}\
	#navbar a:hover {\
		background-color: #ddd;\
		color: black;\
	}\
	#navbar a.active {\
		background-color: #4CAF50;\
		color: white;\
	}\
	#ratingimg {\
		vertical-align:middle;\
	}\
	.main {\
	}\
	.main img {\
		height: auto;\
	}\
	.button {\
		width: 300px;\
		height: 60px;\
	}\
	#encyclopedia_table {\
		background: #131416;\
		padding: 0px;\
		margin-bottom: 0px;\
		color: #afb2a1;\
		margin-left: 0px;\
	}\
	#encyclopedia_list {\
		background: #2e2e38;\
		color: #afb2a1;\
		padding: 5px;\
		width: 160px;\
		height: 228px;\
		overflow: auto;\
		border: 1px solid #ccc;\
		word-wrap: break-word;\
		margin-left: 3px;\
	}\
	#encyclopedia_list li{\
		list-style-type: none;\
		height: 0em;\
		margin-left : 0px;\
	}\
	#encyclopedia_list li ul{\
		visibility: hidden;\
		height: 0em;\
		margin-left : 0px;\
	}\
	#encyclopedia_list li ul li{\
		height: 0em;\
		margin-left : 0px;\
	}\
	#encyclopedia_info {\
		background: #2e2e38;\
		color: #afb2a1;\
		padding: 0px;\
		padding-left: 5px;\
		width: 273px;\
		height: 228px;\
		overflow: auto;\
		border: 1px solid #ccc;\
		word-wrap: break-word;\
		margin-right : 0px;\
	}\
	</style>"
	if (!owner || !password)
		mainhtml +="<body>\
		<table border=0 height=\"314\" width=\"455\">\
		<tr>\
		<td valign=\"top\" align=\"center\">\
		<div align=\"right\"><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div><br>\
		<div class=\"relative\" align=\"center\">"
		mainhtml += "ВВЕДИТЕ ПАРОЛЬ"
		mainhtml +="\
		</div>\
		</td>\
		</tr>\
		<tr>\
		<td colspan=\"2\" align=\"center\" id=\"table-center1\" height=60>\
				| <a style=\"color:#c10000;\" href='byond://?src=\ref[src];choice=password_input'>_______________</a> |<br>\
		<div align=\"center\"></div>\
		</td>\
		</tr>"
	else
		if (user != owner && hacked == 0)
			mainhtml +="<body>\
			\
			<table border=0 height=\"314\" width=\"455\">\
			<tr>\
			<td align=\"left\" width=200>\
			<div style=\"overflow: hidden; height: 200px; width: 180px;\" ><img height=80 width=80 border=4 src=photo_front><img height=80 width=80 border=4 background src=photo_side></div>\
			</td>\
			<td valign=\"top\" align=\"left\">\
			 <div align=\"right\"><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div><br>"
			mainhtml +="\
			 <b>Имя:</b> [owner.real_name]<br><br>\
			 <b>Группировка:</b> [rus_faction_s]<br><br>\
			 <b>Ранг:</b> [rating]<br><br>\
			 <b>Репутация:</b> <font color=\"[rep_color_s]\">[rep_name_s]</font>"
			 mainhtml +="\
			 \
			</td>\
			</tr>\
			\
			<tr>\
			<td colspan=\"2\" align=\"center\" id=\"table-bottom1\" height=60>\
				| <a style=\"color:#c10000;\" href='byond://?src=\ref[src];choice=password_check'>В ДОСТУПЕ ОТКАЗАНО - ВВЕДИТЕ ПАРОЛЬ</a> |<br>\
			<div align=\"center\"></div>\
			</td>\
			</tr>"
		else
			switch(mode)

		//ПРОФИЛЬ

				if(1)
					navbarhtml ="| <a>Профиль</a> | <a href='byond://?src=\ref[src];choice=2'>Энциклопедия</a> | <a href='byond://?src=\ref[src];choice=3'>Рейтинг</a> | <a href='byond://?src=\ref[src];choice=4'>Лента</a> |<br>"

					mainhtml +="\
					<body>\
					\
					<table border=0 height=\"314\" width=\"455\">\
						<tr>\
							<td valign=\"top\" align=\"left\">"
					mainhtml +="\
					<div align=\"right\"><a style=\"color:#c10000;\" align=\"center\" href='byond://?src=\ref[src];choice=exit'>\[ВЫХОД\]</a><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>"

					mainhtml +="\
							</td>\
							</tr>\
							<tr valign=\"top\">\
							<td>\
								<table>\
									<tr>\
					<td style=\"text-align: center;\" valign=\"top\" align=\"left\" width=90 height=90>\
					<img style=\"margin-left: auto; margin-right: auto;\" height=80 width=80 border=4 src=photo_[rotation]>\
					<br>\
					</td>\
					<td>"
					mainhtml+="\
					<b>Имя:</b> [owner.real_name]<br>\
					<b>Группировка:</b> [rus_faction_s]<br>\
					<b>Ранг:</b> [rus_rank_name_s] ([rating])<br>\
					<b>Репутация:</b> <font color=\"[rep_color_s]\">[rep_name_s] ([reputation])</font><br>\
					<b>Баланс:</b> [num2text(money, 8)] Руб<br>"

					mainhtml +="\
					</td>\
					</tr>\
				</table>\
			</td>\
		</tr>"

		//ЭНЦИКЛОПЕДИЯ

				if(2)
					navbarhtml ="| <a href='byond://?src=\ref[src];choice=1'>Профиль</a> | <a>Энциклопедия</a> | <a href='byond://?src=\ref[src];choice=3'>Рейтинг</a> | <a href='byond://?src=\ref[src];choice=4'>Лента</a> |<br>"

					mainhtml +="\
					<body>\
						<table border=0 height=\"314\" width=\"455\">\
							<tr>\
								<td valign=\"top\" align=\"left\">\
									<div align=\"right\"><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>\
								</td>\
							</tr>\
							<tr style=\"border: 0px;\" valign=\"top\" align=\"left\">\
								<td valign=\"top\" align=\"left\">\
									<table id=\"encyclopedia_table\" align=\"left\">\
										<tr align=\"left\">\
											<td align=\"left\">\
												<div id=\"encyclopedia_list\">\
													<h3 style=\"margin-top:0px;margin-bottom:0px\"><a href='byond://?src=\ref[src];choice=2;page=Zone'>Зона</a></h4>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Backwater'>Затон</a><br>\
													<h3 style=\"margin-top:0px;margin-bottom:0px\"><a href='byond://?src=\ref[src];choice=2;page=Anomalies'>Аномалии</a></h4>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Electro'>Электра</a><br>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Vortex'>Грави</a><br>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Whirligig'>Карусель</a><br>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Burner'>Жарка</a><br>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Fruit Punch'>Кисель</a><br>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Burnt Fuzz'>Жгучий пух</a><br>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Radiation'>Радиация</a><br>\
													<h3 style=\"margin-top:0px;margin-bottom:0px\"><a href='byond://?src=\ref[src];choice=2;page=Mutants'>Мутанты</a></h4>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Blind Dog'>Слепая собака</a><br>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Flesh'>Плоть</a><br>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Snork'>Снорк</a><br>\
													<a style=\"margin-left:10px\" href='byond://?src=\ref[src];choice=2;page=Boar'>Кабан</a><br>\
													<h3 style=\"margin-top:0px;margin-bottom:0px\"><a href='byond://?src=\ref[src];choice=2;page=Artifacts'>Артефакты</a></h4>\
												</div>\
											</td>\
											<td valign=\"top\">\
												<div id=\"encyclopedia_info\">\
													<h4 style=\"margin:0px\">[article_title]</h4><br>\
													<img style=\"width:[article_img_width];height:[article_img_height];margin-bottom:0px;margin-top:0px;margin-left:10px\" src=[article_img]><br>\
													<p style=\"margin-left:10px\">[article_text]</p>\
												</div>\
											</td>\
										</tr>\
									</table>\
								</td>\
							</tr>"

		//РЕЙТИНГ

				if(3)
					navbarhtml ="| <a href='byond://?src=\ref[src];choice=1'>Профиль</a> | <a href='byond://?src=\ref[src];choice=2'>Энциклопедия</a> | <a>Рейтинг</a> | <a href='byond://?src=\ref[src];choice=4'>Лента</a> |<br>"

					mainhtml +="\
					<body>\
					\
					<table border=0 height=\"314\" width=\"455\">\
						<tr>\
							<td valign=\"top\" align=\"left\">\
								<div align=\"right\"><a style=\"color:#c10000;\" align=\"center\" href='byond://?src=\ref[src];choice=rating_images'>\[IMAGES\]</a><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>"
					mainhtml +="\
						<div align = \"center\" > | <a href='byond://?src=\ref[src];choice=refresh_rating'>Обновить список сталкеров</a> | </div>"
					mainhtml +="\
							</td>\
						</tr>\
						<tr valign=\"top\">\
							<td>\
								<div id= \"lenta\">\
								[ratinghtml]\
								</div>\
							</td>\
						</tr>"

		//ЛЕНТА

				if(4)
					navbarhtml ="| <a href='byond://?src=\ref[src];choice=1'>Профиль</a> | <a href='byond://?src=\ref[src];choice=2'>Энциклопедия</a> | <a href='byond://?src=\ref[src];choice=3'>Рейтинг</a> | <a>Лента</a> |<br>"
					mainhtml +="\
					<body>\
					\
					<table border=0 height=\"314\" width=\"455\">\
					<tr>\
					<td valign=\"top\" align=\"left\">\
					<div align=\"right\"><a style=\"color:#c10000;\" align=\"center\" href='byond://?src=\ref[src];choice=lenta_images'>\[IMAGES\]</a><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>"
					mainhtml +="\
					<div align = \"center\" > | <a href='byond://?src=\ref[src];choice=lenta_add'>Написать в ленту</a> | <a href='byond://?src=\ref[src];choice=lenta_faction_add'>Написать группировке</a> | <a href='byond://?src=\ref[src];choice=lenta_sound'>Вкл/Выкл звук</a> |</div>"
					mainhtml +="\
					</td>\
					</tr>\
					<tr style=\"border: 0px;\" valign=\"top\">\
					<td style=\"border: 0px;\">\
					<div id=\"lenta\">"
					mainhtml +="[lentahtml]\
					</div>\
					</td>\
					</tr>"

		//КАРТА

				if(5)
					navbarhtml ="| <a href='byond://?src=\ref[src];choice=1'>Профиль</a> | <a href='byond://?src=\ref[src];choice=2'>Энциклопедия</a> | <a href='byond://?src=\ref[src];choice=3'>Рейтинг</a> | <a href='byond://?src=\ref[src];choice=4'>Лента</a> |<br>"

					mainhtml +="\
					<body>\
					\
					<table border=0 height=\"314\" width=\"455\">\
					<tr>\
					<td valign=\"top\" align=\"left\">\
					<div align=\"right\">\
					<a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>\
					<div align = \"center\">\
					| <a href='byond://?src=\ref[src];choice=zoom' onclick=\"zoomin()\"> Zoom In</a> | \
					<a href='byond://?src=\ref[src];choice=zoom' onclick=\"zoomout()\"> Zoom Out</a> | \
					</div>\
					</td>\
					</tr>\
					<tr valign=\"top\">\
					<td>\
					<div id=\"lenta\">\
					<div class=\"main\">"
					if(user.z != 1)
						mainhtml += "<img id=\"map\" height=415 width=415 src=minimap_[user.z].png>"
					else
						mainhtml += "<img id=\"map\" height=415 width=415 src=nodata.png>"
					mainhtml +="\
					</div>\
					</div>\
					</td>\
					</tr>"

			mainhtml +="\
			<tr>\
				<td colspan=\"1\" align=\"center\" id=\"table-bottom1\" height=30>\
					[navbarhtml]\
					<div align=\"center\"></div>\
				</td>\
			</tr>"
	mainhtml +="\
	<table>\
	<script>\
	function toggleShowHide(id){\
		var d = document.getElementById(id);\
		d.style.visibility = (d.style.visibility == \"visible\") ? \"hidden\" : \"visible\";\
		d.style.height = (d.style.height == \"auto\") ? \"0em\" : \"auto\";\
	}\
	function zoomin(){\
		var myImg = document.getElementById(\"map\");\
		var currWidth = myImg.clientWidth;\
		if(currWidth >= 1015) return false;\
		else{\
			myImg.style.width = (currWidth + 200) + \"px\";\
		} \
	}\
	function zoomout(){\
		var myImg = document.getElementById(\"map\");\
		var currWidth = myImg.clientWidth;\
		if(currWidth <= 415) return false;\
		else{\
			myImg.style.width = (currWidth - 200) + \"px\";\
		}\
	}\
	</script>\
	</body>\
	\
	</html>"
	if(show_title)
		user << browse(mainhtml, "window=mainhtml;size=568x388;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=1")
	else
		user << browse(mainhtml, "window=mainhtml;size=568x388;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=0")

/obj/item/stalker_pda/Topic(href, href_list)
	..()

	//var/mob/living/U = usr
	var/mob/living/carbon/human/H = usr
	if(!usr.canUseTopic(src))
		hacked = 0
		H.unset_machine()
		H << browse(null, "window=mainhtml")
		return
	//add_fingerprint(H)
	//get_asset_datum(/datum/asset/simple/basics).send(H)

	switch(href_list["choice"])
		if("title")
			if(show_title)
				H << browse(mainhtml, "window=mainhtml;size=568x388;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=0")
				show_title = 0
			else
				H << browse(mainhtml, "window=mainhtml;size=568x388;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=1")
				show_title = 1

		if("close")
			icon_state = "kpk_off"
			H.unset_machine()
			hacked = 0
			H << browse(null, "window=mainhtml")
			return

		if("password_input")
			var/t = message_input(H, "password", 10)

			if(!t)
				to_chat(H, "<span class='warning'>You entered no password.</span>")
				return

			var/datum/data/record/sk = find_record("sid", H.sid, GLOB.data_core.stalkers)

			if(!sk) //если человек не зарегистрирован в сети сталкеров
				password = t
				var/pass = password

				GLOB.data_core.manifest_inject(H)

				registered_name = H.real_name
				owner = H
				sid = H.sid
				lentahtml = global_lentahtml

				//var/image = GLOB.data_core.fields["photo_front"]
				//var/obj/item/photo/owner_photo_front = new()

				//owner_photo_front.picture.picture_image = icon(image, dir = SOUTH)

				to_chat(H, "<B>KPK password</B>: <span class='danger'>\"[pass]\"</span>")
				H.mind.store_memory("<b>KPK password</b>: \"[pass]\"")
				GLOB.KPKs += src
				GLOB.KPK_mobs += H

				profile = find_record("sid", H.sid, GLOB.data_core.stalkers)

				profile.fields["pass"] = pass

				if(H.job == "Старый сталкер" || H.job == "Долговец" || H.job == "Монолитовец" || H.job == "Свободовец")
					profile.fields["rating"] = 3000
				else if(H.job == "Лейтенант Долга" || H.job == "Проповедник Монолита" || H.job == "Лейтенант Свободы")
					profile.fields["rating"] = 5000

				set_owner_info(profile)
			else //Если человек зарегистрирован в сети сталкеров
				if(sk && sk.fields["pass"] != t)
					to_chat(H, "<span class='warning'>Неправильный пароль!.</span>")
					return

				password = t
				//var/datum/job/J = SSjob.GetJob(H.job)
				//access = J.get_access()

				registered_name = H.real_name
				eng_faction_s = sk.fields["faction"]
				rating = sk.fields["rating"]
				owner = H
				sid = H.sid
				if(!lentahtml)
					lentahtml = global_lentahtml

				//var/image = GLOB.data_core.get_id_photo(H)

				//var/obj/item/photo/owner_photo_front = new()

				//owner_photo_front.picture.picture_image = icon(image, dir = SOUTH)

				GLOB.KPKs += src

				profile = sk
				set_owner_info(profile)

				for(var/obj/item/stalker_pda/KPK in GLOB.KPKs)
					if((KPK != src) && (KPK.owner == src.owner))
						KPK.registered_name = null
						KPK.eng_faction_s = null
						KPK.rus_faction_s = null
						KPK.rating = null
						KPK.owner = null
						KPK.money = 0
						KPK.photo_owner_front = null
						KPK.photo_owner_west = null
						KPK.photo_owner_east = null
						KPK.photo_owner_back = null
						KPK.hacked = 0
						KPK.password = null
						KPK.profile = null

						GLOB.KPKs -= KPK

		if("load_cache")
			//get_asset_datum(/datum/asset/simple/basics).send(H)

		if("exit")
			registered_name = null
			eng_faction_s = null
			rus_faction_s = null
			rating = null
			owner = null
			money = 0
			photo_owner_front = null
			photo_owner_west = null
			photo_owner_east = null
			photo_owner_back = null
			hacked = 0
			password = null
			profile = null

			GLOB.KPKs -= src

		if("password_check")
			var/t = message_input(H, "password", 10)
			if(t == password)
				//hacked = 1
				hacked = 0
				to_chat(H, "<span class='warning'>Вы не владелец КПК.</span>")
			else
				to_chat(H, "<span class='warning'>Неправильный пароль.</span>")

		if("rotate")
			switch(rotation)
				if ("front")
					rotation = "west"
				if("west")
					rotation = "back"
				if("back")
					rotation = "east"
				if("east")
					rotation = "front"

		if("make_avatar")
			make_avatar(H)
			set_owner_photo()

		if("lenta_add")
			var/t = message_input(H, "message", 250)
			if(!t)
				to_chat(H, "<span class='warning'>Введите сообщение!</span>")
			else
				if ( !(last_lenta && world.time < last_lenta + LENTA_MESSAGE_COOLDOWN) )
					last_lenta = world.time

					add_lenta_message(src, sid, owner.real_name, eng_faction_s, t)

				else
					to_chat(H, "<span class='warning'>Вы сможете отправить следующее сообщение через: [round((LENTA_MESSAGE_COOLDOWN + last_lenta - world.time)/10)] сек.</span>")

		if("lenta_faction_add")
			var/t = message_input(H, "message", 500)
			if(!t)
				to_chat(H, "<span class='warning'>Введите сообщение!</span>")
			else
				if ( !(last_faction_lenta && world.time < last_faction_lenta + LENTA_FACTION_MESSAGE_COOLDOWN) )
					last_faction_lenta = world.time
					add_faction_lenta_message(src, sid, owner.real_name, eng_faction_s, t)

				else
					to_chat(H, "<span class='warning'>Вы сможете отправить следующее сообщение через: [round((LENTA_FACTION_MESSAGE_COOLDOWN + last_faction_lenta - world.time)/10)] сек.</span>")

		if("lenta_sound")
			if(switches & FEED_SOUND)
				switches &= ~FEED_SOUND
				to_chat(H, "<span class='notice'>Звук оповещения о сообщениях в ленте выключен.</span>")
			else
				switches |= FEED_SOUND
				to_chat(H, "<span class='notice'>Звук оповещения о сообщениях в ленте активирован.</span>")


		if("lenta_images")
			if(switches & FEED_IMAGES)
				switches &= ~FEED_IMAGES
				to_chat(H, "<span class='notice'>Аватары сталкеров в ленте теперь не будут скачиваться.</span>")
			else
				switches |= FEED_IMAGES
				to_chat(H, "<span class='notice'>Аватары сталкеров в ленте теперь будут скачиваться.</span>")

		if("rating_images")
			if(switches & RATING_IMAGES)
				switches &= ~RATING_IMAGES
				to_chat(H, "<span class='notice'>Аватары сталкеров в рейтинге теперь не будут скачиваться.</span>")
			else
				switches |= RATING_IMAGES
				to_chat(H, "<span class='notice'>Аватары сталкеров в рейтинге теперь будут скачиваться.</span>")

		if("refresh_rating")
			ratinghtml = ""
			if(GLOB.data_core.stalkers.len)
				refresh_rating(H)

		if("zoom")
			return

		if("1")			//ПРОФИЛЬ
			set_owner_info(profile)
			set_owner_photo()
			mode = 1

		if("2")			//ЭНЦИКЛОПЕДИЯ
			mode = 2
			get_asset_datum(/datum/asset/simple/encyclopedia).send(H)
			if(href_list["page"])
				switch(href_list["page"])
					if("Zone")
						article_title = "Зона"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "ЧЗО - это зона отчуждения шириной 60 км, которая была создана вокруг Чернобыльской АЭС после катастрофы 1986 года и расширена второй Чернобыльской катастрофой в 2006 году."
					if("Backwater")
						article_title = "Затон"
						article_img = "backwater"
						article_img_width = 200
						article_img_height = 125
						article_text = "Затон в основном расположен в болотистой местности, с несколькими промышленными заводами, разбросанными вокруг него, и заброшенными, севшими на мель лодками, некоторые из которых были построены еще до инцидента. Судя по отдаленным сооружениям и значительному количеству севших на мель лодок и танкеров вокруг, Затон, по-видимому, лишился своей воды через некоторое время после аварии на Чернобыльской АЭС. Бар для сталкеров находится в ведении Бороды, на затонувшем танкере - Скадовске."
					if("Anomalies")
						article_title = "Аномалии"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "После второй Чернобыльской катастрофы Зона была усеяна местами, где законы природы и физики были искажены. Эти небольшие странности называются аномалиями. Они опасны, часто смертельны для людей и других существ, поскольку могут вызывать поражение электрическим током или жечь, разъедать и искажать физические объекты. Большинство аномалий производят видимые воздушные или световые искажения, поэтому их местоположение можно определить, бросив все, что сделано из металла, например, болты, чтобы вызвать их. Аномалии, по-видимому, излучают мощное магнитное поле, поэтому логично предположить, что аномалии активируются чем-либо из металла, который попадает в магнитное поле. Поскольку позвоночные на Земле имеют кровь на основе железа, эти существа с достаточной массой тела способны активировать аномалии."
					if("Electro")
						article_title = "Электра"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Аномальное образование диаметром около 10 метров, накапливающее статическое электричество. Потревоженная аномалия взрывается десятком мини-молний, причём поражение током для любого живого существа почти всегда смертельно. Характерной особенностью «электры» является видимый над ней днём голубоватый свет. Ночью легко обнаруживается любыми видами детекторов или с помощью бросания металлических предметов."
					if("Vortex")
						article_title = "Воронка"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Аномалия предположительно гравитационной природы. В момент активизации со страшной силой втягивает в себя всё, что находится в радиусе десяти-пятнадцати метров. При попадании в центр «воронки» шансов выжить нет: тело и животного, и человека будет сжато в плотный комок, а затем разорвано в момент так называемой разрядки."
					if("Whirligig")
						article_title = "Карусель"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Название обусловлено эффектом поднятия в воздух любого живого существа с последующей раскруткой до огромной скорости. Природа «карусели» пока не исследована до конца."
					if("Burner")
						article_title = "Жарка"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "В неактивном состоянии выглядит как едва видимое облако горячего воздуха, однако при попадании в зону действия любого предмета или живого существа образует компактную зону, разогретую до температуры около 1500К."
					if("Fruit Punch")
						article_title = "Кисель"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Образование не ясной до конца природы. При контакте с телом наносит травмы, сходные с эффектом воздействия сильной кислоты."
					if("Burnt Fuzz")
						article_title = "Жгучий пух"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Аномалия представляет собой свисающую волокнистую растительность, обычно закреплённое на дереве, металле или бетоне. Свисающая часть «паутины» очень лёгкая и колышется на ветру, время от времени из неё опадают на землю тёмные хлопья. Произрастает как на открытой местности, так и в помещениях. При быстром приближении любого тела выбрасывает облачко частиц, которые при контакте с какой-либо поверхностью обжигают её."
					if("Radiation")
						article_title = "Радиация"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Зона повышенного уровня — более 50 мкР/ч (микроРентген/час) — радиации. Необходимо избегать длительного нахождения в подобных местах."
					if("Mutants")
						article_title = "Мутанты"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Мутанты — мутировавший животный мир Зоны. Довольно разнообразен и однозначно опасен. Сталкерам известен только один вид животных, который не представляет угрозы, — это ворона."
					if("Blind Dog")
						article_title = "Слепой пёс"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Со времён первой катастрофы в собачьем роду сменилось уже несколько поколений, и в каждом из них всё более наблюдалось влияние Зоны. Мутации и эволюционная адаптация привели к усилению прежде слабо выраженных собачьих способностей, причём зачастую в ущерб привычным. Основные физиологические изменения коснулись зрения — оно оказалось почти бесполезным после стремительного усиления чутья: например, слепые щенки выживали в Зоне не хуже, а то и лучше своих зрячих собратьев. В результате обычные собаки вскоре выродились здесь полностью, уступив место новому виду — слепым псам. Данные животные прекрасно распознают и обходят аномалии, радиацию и другие невидимые опасности, которыми кишит Зона. Как и их предки, слепые псы охотятся стаями; встреча с большой группой этих существ означает серьёзную опасность даже для хорошо вооруженного сталкера."
					if("Flesh")
						article_title = "Плоть"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Оказавшиеся в Зоне домашние свиньи, как и многие другие живые организмы, подверглись сильной мутации. Поскольку были затронуты гены, контролирующие процессы метаболизма, фенотип животного резко изменился. Мутировавшая свинья, которую сталкеры называют плотью — один из самых наглядных примеров надругательства Зоны над природой. У этих существ сформировался чешуйчато-костный защитный покров, значительно увеличилась способность организма к регенерации, усложнилась нервная система. Как и обычная свинья, плоть всеядна, поэтому, будучи голодной, вполне может напасть на сталкера."
					if("Snork")
						article_title = "Снорк"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Эти существа, судя по всему, некогда были людьми, хотя сложно представить, какие условия могут довести человека до подобного состояния. Снорки — это сумасшедшие, ведущие совершенно животный образ жизни создания, по сути своей слабо отличающиеся от хищных монстров Зоны. Передвигаются они на четырёх конечностях, подпрыгивая над землёй и постоянно нюхая её, чтобы уловить запах жертвы. Охотятся осторожно и расчётливо, подстерегая сталкеров подобно хищным животным. Молниеносные рефлексы и гипертрофированные мышцы позволяют сноркам совершать длинные точные прыжки и за несколько секунд разрывать жертву в клочья. На некоторых особях сохранились детали армейской униформы или отдельные детали экипировки, что позволяет предположить в них пропавших без вести военных сталкеров."
					if("Boar")
						article_title = "Кабан"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Крупный зверь, достигающий полутора метров в холке. Своей живучестью и агрессивностью данное животное превосходит своих родственников вне Зоны и не уступает большинству мутантов. Мутагенные процессы, обусловленные воздействием радиации и аномалий, в значительной степени сказались на облике этих млекопитающих: местами последние облысели, а местами, наоборот, обросли очень длинной жёсткой шерстью. Копыта зверей изменили свою форму и стали более острыми, приобретя некоторое сходство с когтями; зрачки обесцветились, на облысевшей голове проявились пигментационные пятна и глубокие морщины. Кабаны Зоны хорошо переносят радиацию, что позволяет им подолгу находиться на сильно загрязнённых территориях. Обычно эти животные атакуют с разбега, пытаясь клыками распороть живот жертвы или сбить её с ног."
					if("Artifacts")
						article_title = "Артефакты"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = "Артефакт — предмет не до конца понятной физической природы, образующийся в аномалиях. Интересен первым делом тем, что по-разному влияет на носителя: влияние может быть как благотворное, так и вредоносное. Продажа артефактов теоретически является главным источником дохода сталкеров, большинство из которых прибыли в Зону именно за этим. В изучении свойств артефактов весьма заинтересованы учёные, работающие в различных сферах, например, в медицине."
					if("Artifacts")
						article_title = "Артефакты"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = ""
					if("Artifacts")
						article_title = "Артефакты"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = ""
					if("Artifacts")
						article_title = "Артефакты"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = ""
					if("Artifacts")
						article_title = "Артефакты"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = ""
					if("Artifacts")
						article_title = "Артефакты"
						article_img = "nodata.gif"
						article_img_width = 179
						article_img_height = 128
						article_text = ""





		if("3")			//РЕЙТИНГ
			if(GLOB.data_core.stalkers.len)
				refresh_rating(H)
			mode = 3

		if("4")			//ЛЕНТА
			if(switches & FEED_IMAGES)
				for(var/datum/data/record/R in GLOB.data_core.stalkers)
					if(R.fields["lastlogin"] + RATING_REMOVE_TIMER > world.time)
						continue
					var/sid_p = R.fields["sid"]
					var/obj/item/photo/P1 = R.fields["photo_front"]
					H << browse_rsc(P1.picture.picture_image, "photo_[sid_p]")
			mode = 4

		/*if("5")			//КАРТА
			SSminimap.sendMinimaps(H)
			mode = 5*/

	if(href_list["invite"])

		var/sid_ = text2num(href_list["invite"])
		var/datum/job/J = SSjob.GetJob(get_job_title(eng_faction_s))

		if(!J)
			return

		if((J.current_positions >= J.total_positions) && J.total_positions != -1)
			return

		if(last_invite + LEADER_INVITE_COOLDOWN > world.time)
			return

		var/datum/data/record/sk_invited = find_record("sid", sid_, GLOB.data_core.stalkers)

		if(!sk_invited)
			return

		last_invite = world.time
		for(var/obj/item/stalker_pda/KPK_invited in GLOB.KPKs)
			if(KPK_invited.sid == sid_)
				show_lenta_message(src, KPK_invited, sid, owner.real_name, eng_faction_s, "Вас приглассили в группировку [eng_faction_s]. Осмотрите ленту для большей информации.")
				add_local_lenta_message(src, KPK_invited, sid, owner.real_name, eng_faction_s,"Вас приглассили в группировку [eng_faction_s]. <a style=\"color:#c10000;\" href='byond://?src=\ref[KPK_invited];changefaction=[J.title]'>\[Accept invitation\]</a>")

	if(href_list["remove"])

		var/sid_ = text2num(href_list["remove"])
		var/datum/job/J = SSjob.GetJob(get_job_title(eng_faction_s))

		var/datum/data/record/sk_removed = find_record("sid", sid_, GLOB.data_core.stalkers)

		if(!sk_removed)
			return

		SSjob.AssignRole(owner, "Loner", 1)
		sk_removed.fields["faction_s"] = "Loners"
		J.current_positions--

		for(var/obj/item/stalker_pda/KPK_removed in GLOB.KPKs)
			if(KPK_removed.sid == sid_)
				show_lenta_message(src, KPK_removed, sid, owner.real_name, eng_faction_s, "Вы были изгнанны из группировки [eng_faction_s].")
				add_local_lenta_message(src, KPK_removed, sid, owner.real_name, eng_faction_s,"Вы были изгнанны из группировки [eng_faction_s].")

				KPK_removed.set_owner_info(KPK_removed.profile)

	if(href_list["changefaction"])

		var/new_eng_faction_s =  SSjob.GetJob(href_list["changefaction"]).faction_s
		var/confirm = alert(H, "Хотите сменить вашу группировку [eng_faction_s] на [new_eng_faction_s]?", "КПК", "Да", "Нет")
		if(confirm == "Yes")
			var/datum/job/J =  SSjob.GetJob(href_list["changefaction"])

			if(!J)
				return

			if((J.current_positions >= J.total_positions) && J.total_positions != -1)
				return

			SSjob.AssignRole(owner, href_list["changefaction"], 1)

			profile.fields["faction_s"] = J.faction_s
			set_owner_info(profile)

	//usr.set_machine(src)
	updateSelfDialog()
	return

/obj/item/stalker_pda/proc/message_input(mob/living/U = usr, msg_name, max_length)
	var/t = stripped_input(U, "Введите [msg_name]", name, null, max_length)
	if (!t)
		return
	if (!in_range(src, U) && loc != U)
		return
	if(!U.canUseTopic(src))
		return
	return t

/proc/add_lenta_message(var/obj/item/stalker_pda/KPK_owner, var/sid_owner, var/name_owner, var/faction_owner, msg, selfsound = 0)
	var/factioncolor 	= get_faction_color(faction_owner)
	var/faction_title = faction_owner
	if(KPK_owner && KPK_owner.profile && KPK_owner.profile.fields["degree"] >= 1)
		faction_title += "Лидер - "

	var/t = "<table style=\"margin-top: 0px; margin-bottom: 5px; border: 0px; background: #2e2e38;\">\
		<tr style=\"border: 0px solid black;\">\
		<td style=\"border: 0px solid black; vertical-align: top; background: #2e2e38;\" width=32 height=32>\
		<img id=\"ratingbox\" style=\"background: #2e2e38; border: 1px solid black;\" height=32 width=32 src=photo_[sid_owner]>\
		</td>\
		\
		<td width=386 height=32 align=\"top\" style=\"background: #131416; border: 0px; text-align:left; vertical-align: top;\">\
		\
		<p class=\"lentamsg\"><b><font color = \"[factioncolor]\">[name_owner]\[[faction_title]\]</font></b>:<br><font color = \"#afb2a1\">[msg]</font></p>\
		\
		</td>\
		\
		</tr>\
		</table>"

	global_lentahtml = t + global_lentahtml
	for(var/obj/item/stalker_pda/KPK in GLOB.KPKs)
		KPK.lentahtml = t + KPK.lentahtml
		show_lenta_message(KPK_owner, KPK, sid_owner, name_owner, faction_owner, msg)

	show_dead_lenta_message(KPK_owner, name_owner, faction_owner, msg, isfactionchat = 0)
	//var/eng_faction_s 	= faction_owner//get_eng_faction(faction_owner)

/proc/add_local_lenta_message(var/obj/item/stalker_pda/KPK_owner, var/obj/item/stalker_pda/KPK_guest, var/sid_owner, var/name_owner, var/faction_owner, msg)
	var/factioncolor 	= get_faction_color(faction_owner)
	var/faction_title = faction_owner
	if(KPK_owner && KPK_owner.profile && KPK_owner.profile.fields["degree"] >= 1)
		faction_title += "Лидер - "
	KPK_guest.lentahtml = "<table style=\"margin-top: 0px; margin-bottom: 5px; border: 0px; background: #2e2e38;\">\
	<tr style=\"border: 0px solid black;\">\
	<td style=\"border: 0px solid black; vertical-align: top; background: #2e2e38;\" width=32 height=32>\
	<img id=\"ratingbox\" style=\"background: #2e2e38; border: 1px solid black;\" height=32 width=32 src=photo_[sid_owner]>\
	</td>\
	\
	<td width=386 height=32 align=\"top\" style=\"background: #131416; border: 0px; text-align:left; vertical-align: top;\">\
	\
	<p class=\"lentamsg\"><b><font color = \"[factioncolor]\">[name_owner]\[[faction_title]\]</font></b>:<br><font color = \"#afb2a1\">[msg]</font></p>\
	\
	</td>\
	\
	</tr>\
	</table>" + KPK_guest.lentahtml
	show_lenta_message(KPK_owner, KPK_guest, sid_owner, name_owner, faction_owner, msg)

/proc/add_faction_lenta_message(var/obj/item/stalker_pda/KPK_owner, var/sid_owner, var/name_owner, var/faction_owner, msg, selfsound = 0)
	var/factioncolor 	= get_faction_color(faction_owner)
	var/faction_title = faction_owner
	if(KPK_owner && KPK_owner.profile && KPK_owner.profile.fields["degree"] >= 1)
		faction_title += " - leader"
	for(var/obj/item/stalker_pda/KPK in GLOB.KPKs)
		if(KPK_owner.eng_faction_s != KPK.eng_faction_s)
			continue
		KPK.lentahtml = "<table style=\"margin-top: 0px; margin-bottom: 5px; border: 0px; background: #2e2e38;\">\
		<tr style=\"border: 0px solid black;\">\
		<td style=\"border: 0px solid black; vertical-align: top; background: #2e2e38;\" width=32 height=32>\
		<img id=\"ratingbox\" style=\"background: #2e2e38; border: 1px solid black;\" height=32 width=32 src=photo_[sid_owner]>\
		</td>\
		\
		<td width=386 height=32 align=\"top\" style=\"background: #131416; border: 0px; text-align:left; vertical-align: top;\">\
		\
		<p class=\"lentamsg\"><b><font color = \"[factioncolor]\">[name_owner]\[[faction_title]\](Чат группировки)</font></b>:<br><font color = \"#afb2a1\">[msg]</font></p>\
		\
		</td>\
		\
		</tr>\
		</table>" + KPK.lentahtml
		show_lenta_message(KPK_owner, KPK, sid_owner, name_owner, faction_owner, msg, isfactionchat = 1)
	show_dead_lenta_message(KPK_owner, name_owner, faction_owner, msg, isfactionchat = 1)
	//var/eng_faction_s 	= faction_owner//get_eng_faction(faction_owner)

/proc/show_lenta_message(var/obj/item/stalker_pda/KPK_owner, var/obj/item/stalker_pda/KPK, var/sid_owner, var/name_owner, var/faction_owner, msg, selfsound = 0, var/isfactionchat = 0)

	var/mob/living/carbon/C = null

	if(KPK.loc && isliving(KPK.loc))
		C = KPK.loc

	if(!C || C.stat == UNCONSCIOUS)
		return

	var/factioncolor	= get_faction_color(faction_owner)
	//var/eng_faction_s 	= get_eng_faction(faction_owner)

	if(KPK_owner && KPK_owner.profile && KPK_owner.profile.fields["degree"] >= 1)
		faction_owner += " - leader"

	if(isfactionchat)
		to_chat(C, "<p style=\"margin-top: 0px; margin-bottom: 0px;\">\icon[KPK]<b style=\"margin-top: 0px; margin-bottom: 0px;\"><font style=\"margin-top: 0px; margin-bottom: 0px;\" color=\"[factioncolor]\">[name_owner]\[[faction_owner]\](faction chat):</font></b><br><font color=\"#006699\"> \"[msg]\"</font></p>")
	else
		to_chat(C, "<p style=\"margin-top: 0px; margin-bottom: 0px;\">\icon[KPK]<b style=\"margin-top: 0px; margin-bottom: 0px;\"><font style=\"margin-top: 0px; margin-bottom: 0px;\" color=\"[factioncolor]\">[name_owner]\[[faction_owner]\]:</font></b><br><font color=\"#006699\"> \"[msg]\"</font></p>")

	if(KPK_owner)
		if((KPK != KPK_owner || selfsound) && KPK.switches & FEED_SOUND)
			C << sound('stalker/sound/pda/sms.ogg', volume = 30)
	else
		if(KPK.switches & FEED_SOUND)
			C << sound('stalker/sound/pda/sms.ogg', volume = 30)

/proc/show_dead_lenta_message(var/obj/item/stalker_pda/KPK_owner, var/name_owner, var/faction_owner, var/msg, var/isfactionchat = 0)
	var/factioncolor	= get_faction_color(faction_owner)
	if(isfactionchat)
		msg = "<p style=\"margin-top: 0px; margin-bottom: 0px;\">\icon[KPK_owner]<b style=\"margin-top: 0px; margin-bottom: 0px;\"><font style=\"margin-top: 0px; margin-bottom: 0px;\" color=\"[factioncolor]\">[name_owner]\[[faction_owner]\](Чат группировки):</font></b><br><font color=\"#006699\"> \"[msg]\"</font></p>"
	else
		msg = "<p style=\"margin-top: 0px; margin-bottom: 0px;\">\icon[KPK_owner]<b style=\"margin-top: 0px; margin-bottom: 0px;\"><font style=\"margin-top: 0px; margin-bottom: 0px;\" color=\"[factioncolor]\">[name_owner]\[[faction_owner]\]:</font></b><br><font color=\"#006699\"> \"[msg]\"</font></p>"

	for(var/mob/M in GLOB.player_list)

		var/adminoverride = 0

		if(M.client && M.client.holder && (M.client.prefs.chat_toggles & CHAT_DEAD))
			adminoverride = 1

		if(istype(M, /mob/dead/new_player) && !adminoverride)
			continue

		if(M.stat != DEAD && !adminoverride)
			continue

		if(istype(M, /mob/dead/observer))
			if(KPK_owner && KPK_owner.loc)
				to_chat(M, "<a href=?src=\ref[M];follow=\ref[KPK_owner.loc]>(F)</a> [msg]")
			else
				to_chat(M, "<a href=?src=\ref[M];follow=\ref[KPK_owner]>(F)</a> [msg]")
		else
			to_chat(M, "[msg]")


/obj/item/stalker_pda/proc/refresh_rating(var/mob/living/carbon/human/H)
	var/count = 0
	ratinghtml = ""

	for(var/datum/data/record/R in sortRecordNum(GLOB.data_core.stalkers, "rating", -1))
		if(R.fields["lastlogin"] + 12000 < world.time)
			continue

		var/sid_p = R.fields["sid"]
		if(switches & RATING_IMAGES)
			var/obj/item/photo/P1 = R.fields["photo_front"]
			H << browse_rsc(P1.picture.picture_image, "photo_[sid_p]")
		var/n = R.fields["name"]
		var/r = R.fields["rating"]

		var/eng_f = R.fields["faction_s"]
		var/f = get_rus_faction(eng_f)

		var/rep_color = get_rep_color(R.fields["reputation"])
		var/rep = get_rep_name(R.fields["reputation"])

		var/rank_name = get_rus_rank_name(r)

		count++

		ratinghtml += "<table style=\"margin-top: 0px; margin-bottom: 5px;\">\
				<tr style=\"border: 1px solid black;\">\
				\
				<td width=64 height=64 align=\"top\">\
				<img id=\"ratingbox\" height=64 width=64 src=photo_[sid_p]>\
				</td>\
				\
				<td height=64 width=354 align=\"top\" style=\"text-align:left;vertical-align: top;\">\
				\
				<b>\[[count]\]</b> [n] ([f])"
		//Faction menu
		if(!R.fields["degree"])
			if(eng_faction_s == eng_f)
				ratinghtml += "<a style=\"color:#c10000;\" href='byond://?src=\ref[src];remove=[sid_p]'>\[исключить\]</a>"
			else
				ratinghtml += "<a style=\"color:#7ac100;\" href='byond://?src=\ref[src];invite=[sid_p]'>\[пригласить\]</a>"
		else
			ratinghtml += "<b>\[ЛИДЕР\]</b>"
		//////////////
		ratinghtml += "<br><b>Ранг:</b> [rank_name] ([r])<br>\
				<b>Репутация:</b> <font color=\"[rep_color]\">[rep]</font><br>\
				\
				</td>\
				\
				</tr>\
				</table>"

	return ratinghtml

/obj/item/stalker_pda/proc/make_avatar(var/mob/living/carbon/human/H)
	var/datum/outfit/avatar = new /datum/outfit

	if(H.w_uniform)
		avatar.uniform 		= H.w_uniform.type
	if(H.wear_suit)
		avatar.suit 		= H.wear_suit.type
	if(H.back)
		avatar.back			= H.back.type
	if(H.belt)
		avatar.belt 		= H.belt.type
	if(H.gloves)
		avatar.gloves		= H.gloves.type
	if(H.shoes)
		avatar.shoes		= H.shoes.type
	if(H.head)
		avatar.head			= H.head.type
	if(H.wear_mask)
		avatar.mask			= H.wear_mask.type
	if(H.glasses)
		avatar.glasses		= H.glasses.type
	if(H.s_store)
		avatar.suit_store	= H.s_store.type
	/*if(H.r_hand && !istype(H.r_hand ,/obj/item/stalker_pda))
		avatar.r_hand		= H.r_hand.type
	if(H.l_hand && !istype(H.l_hand ,/obj/item/stalker_pda))
		avatar.l_hand		= H.l_hand.type*/

	if(avatar.uniform == null || avatar.shoes == null)
		to_chat(H, "<span class='warning'>Вам нужно надеть свитер и ботинки перед тем, как делать фотографию!</span>")
	else
		var/image = get_avatar(H, avatar)

		var/obj/item/photo/photo_owner_front = new()

		photo_owner_front.picture.picture_image = icon(image, dir = SOUTH)

		for(var/datum/data/record/sk in GLOB.data_core.stalkers)
			if(H.sid == sk.fields["sid"])
				sk.fields["photo_front"]	= photo_owner_front
				return

/obj/item/stalker_pda/proc/get_avatar(var/mob/living/carbon/human/H, var/datum/outfit/avatar)
	var/datum/preferences/P = H.client.prefs
	return get_flat_human_icon(null, avatar, P)

/obj/item/stalker_pda/proc/set_owner_info(var/datum/data/record/sk)
	var/obj/item/photo/P1 = sk.fields["photo_front"]

	usr << browse_rsc(P1.picture.picture_image, "photo_front")

	eng_faction_s		= sk.fields["faction_s"]
	rus_faction_s 		= get_rus_faction(eng_faction_s)

	rating			= sk.fields["rating"]
	money			= sk.fields["money"]
	reputation		= sk.fields["reputation"]

	rep_name_s 		= get_rep_name(sk.fields["reputation"])
	eng_rep_name_s 	= get_eng_rep_name(sk.fields["reputation"])
	rep_color_s 	= get_rep_color(sk.fields["reputation"])

	rus_rank_name_s 	= get_rus_rank_name(sk.fields["rating"])
	eng_rank_name_s	= get_eng_rank_name(sk.fields["rating"])

	degree = sk.fields["degree"]

/obj/item/stalker_pda/proc/set_owner_photo()
	var/obj/item/photo/P1 = profile.fields["photo_front"]

	usr << browse_rsc(P1.picture.picture_image, "photo_front")

/proc/get_rus_rank_name(var/rating)
	var/rus_rank_name_s = "Новичок"
	switch(rating)
		if(ZONE_LEGEND to INFINITY)
			rus_rank_name_s = "Легенда Зоны"
		if(EXPERT to ZONE_LEGEND)
			rus_rank_name_s = "Мастер"
		if(VETERAN to EXPERT)
			rus_rank_name_s = "Ветеран"
		if(EXPERIENCED to VETERAN)
			rus_rank_name_s = "Опытный"
		if(ROOKIE to EXPERT)
			rus_rank_name_s = "Новичок"
	return rus_rank_name_s

/proc/get_eng_rank_name(var/rating)
	var/eng_rank_name_s = "Новичок"
	switch(rating)
		if(ZONE_LEGEND to INFINITY)
			eng_rank_name_s = "Легенда Зоны"
		if(EXPERT to ZONE_LEGEND)
			eng_rank_name_s = "Мастер"
		if(VETERAN to EXPERT)
			eng_rank_name_s = "Ветеран"
		if(EXPERIENCED to VETERAN)
			eng_rank_name_s = "Опытный"
		if(ROOKIE to EXPERIENCED)
			eng_rank_name_s = "Новичок"
	return eng_rank_name_s

/proc/get_rus_faction(var/eng_faction_s)
	var/faction_s = "Одиночки"
	switch(eng_faction_s)
		if("Бандиты")
			faction_s = "Бандиты"
		if("Наёмники")
			faction_s = "Наёмники"
		if("Долг")
			faction_s = "Долг"
		if("Торговцы")
			faction_s = "Торговец"
		if("Свобода")
			faction_s = "Свобода"
		if("Монолит")
			faction_s = "Монолит"
		if("Военные")
			faction_s = "Военные"
		if("Чистое Небо")
			faction_s = "Чистое Небо"
		if("Ренегаты")
			faction_s = "Ренегаты"
		if("Экологи")
			faction_s = "Экологи"
	return faction_s

/proc/get_faction_color(var/eng_faction_s)
	var/factioncolor = "#ff7733"
	switch(eng_faction_s)
		if("Бандиты")
			factioncolor = "#8c8c8c"
		if("Одиночки")
			factioncolor = "#ff7733"
		if("Наёмники")
			factioncolor = "#3399ff"
		if("Долг")
			factioncolor = "#ff4d4d"
		if("Свобода")
			factioncolor = "#6cba3f"
		if("Монолит")
			factioncolor = "#7c26d3"
		if("Ренегаты")
			factioncolor = "#bbae6a"
		if("Чистое Небо")
			factioncolor = "#64B2F7"
		if("Экологи")
			factioncolor = "#601919"
		if("Военные")
			factioncolor = "#2E8B57"
	return factioncolor

/proc/get_rep_name(var/rep)
	var/rep_name_s = "Нейтральная"

	switch(rep)
		if(AMAZING to INFINITY)
			rep_name_s = "Отлично"
		if(VERYGOOD to AMAZING)
			rep_name_s = "Очень хорошо"
		if(GOOD to VERYGOOD)
			rep_name_s = "Хорошо"
		if(BAD to GOOD)
			rep_name_s = "Нейтрал"
		if(VERYBAD to BAD)
			rep_name_s = "Плохо"
		if(DISGUSTING to VERYBAD)
			rep_name_s = "Очень плохо"
		if(-INFINITY to DISGUSTING)
			rep_name_s = "Ужасно"

	return rep_name_s

/proc/get_eng_rep_name(var/rep)
	var/eng_rep_name_s = "Нейтрал"

	switch(rep)
		if(AMAZING to INFINITY)
			eng_rep_name_s = "Отлично"
		if(VERYGOOD to AMAZING)
			eng_rep_name_s = "Очень хорошо"
		if(GOOD to VERYGOOD)
			eng_rep_name_s = "Хорошо"
		if(BAD to GOOD)
			eng_rep_name_s = "Нейтрал"
		if(VERYBAD to BAD)
			eng_rep_name_s = "Плохо"
		if(DISGUSTING to VERYBAD)
			eng_rep_name_s = "Очень плохо"
		if(-INFINITY to DISGUSTING)
			eng_rep_name_s = "Ужасно"

	return eng_rep_name_s

/proc/get_rep_color(var/rep)
	var/rep_color_s = "#ffe100"
	switch(rep)
		if(AMAZING to INFINITY)
			rep_color_s = "#00abdb" //#00abdb
		if(VERYGOOD to AMAZING)
			rep_color_s = "#b6ff38" //#6ddb00
		if(GOOD to VERYGOOD)
			rep_color_s = "#daff21" //#b6db00
		if(BAD to GOOD)
			rep_color_s = "#ffe100" //#ffb200
		if(VERYBAD to BAD)
			rep_color_s = "#ff6b3a" //#db5700
		if(DISGUSTING to VERYBAD)
			rep_color_s = "#db2b00"
		if(-INFINITY to DISGUSTING)
			rep_color_s = "#7c0000" //#7c0000
	return rep_color_s

/proc/get_job_title(var/faction_s)
	switch(faction_s)
		if("Бандиты")
			return "Бандит"
		if("Наёмники")
			return "Наёмник"
		if("Долг")
			return "Долговец"
		if("Торговцы")
			return "Торговец"
		if("Свобода")
			return "Свободовец"
		if("Монолит")
			return "Монолитовец"
		if("Военные")
			return "Военный"
		if("Чистое Небо")
			return "Чистонебовец"
		if("Ренегаты")
			return "Ренегат"
		if("Экологи")
			return "Эколог"
		else
			return "Одиночка"
