/*
/mob/var/datum/hear_music/hear_music
#define NONE_MUSIC 0
#define UPLOADING 1
#define PLAYING 2

/datum/hear_music
	var/mob/target = null
	//var/stalker/sound/sound
	var/status = NONE_MUSIC
	var/stop = 0

	proc/play(stalker/sound/S)
		status = NONE_MUSIC
		if(!target)
			return
		if(!S)
			return
		status = UPLOADING
		target << browse_rsc(S)
		//sound = S
		if(target.hear_music != src)
			qdel(src)
		if(!stop)
			target << S
			status = PLAYING
		else
			qdel(src)

	proc/stop()
		if(!target)
			return
		if(status == PLAYING)
			var/stalker/sound/S = sound(null)
			S.channel = 10
			S.wait = 1
			target << S
			qdel(src)
		else if(status == UPLOADING)
			stop = 1
		target.hear_music = null

*/

/datum/data/turntable_soundtrack
	var/f_name
	var/path
	var/length

/datum/data/turntable_soundtrack/New(f_name, name, path, length)
	src.f_name = f_name
	src.name = name
	src.path = path
	src.length = length

/obj/machinery/party/turntable
	name = "Музыкальный автомат"
	desc = "Музыкальный автомат — это частично автоматизированное устройство для воспроизведения музыки, которое будет воспроизводить выбор посетителя из автономных носителей. Этот смоделирован по образцу радио и принимает оплату."
	icon = 'stalker/icons/lasers2.dmi'
	icon_state = "radio1"
	//var/timer_id = 0
	var/transition = 0
	var/play_song_cost = 500
	var/skip_song_cost = 250
	var/start_time = 0
	var/collected_money = 0
	var/obj/item/disk/music/disk
	var/playing = 1
	var/datum/data/turntable_soundtrack/track = null
	var/datum/data/turntable_soundtrack/next_track = null
	var/volume = 37
	var/list/mob/melomans = list()
	var/list/turntable_soundtracks = list(

		new /datum/data/turntable_soundtrack ("5nizza",				"Я солдат",						'stalker/sound/turntable/5nizza_ya_soldat.ogg',						2110),
		new /datum/data/turntable_soundtrack ("Жаман",				"Брат не засыпай",		'stalker/sound/turntable/dontfallasleep.ogg',						2110),
		new /datum/data/turntable_soundtrack ("7B",					"Молодые ветра",					'stalker/sound/turntable/semb_molodie_vetra.ogg',					2610),
		new /datum/data/turntable_soundtrack ("Addaraya",			"Gurza Dreaming",					'stalker/sound/turntable/gurza_dreaming.ogg',						2420),
		new /datum/data/turntable_soundtrack ("Афганистанская",			"Пыль глотаю",						'stalker/sound/turntable/afganistan_pil_glotayu.ogg',				3290),
		new /datum/data/turntable_soundtrack ("Агата Кристи",		"Как на войне",						'stalker/sound/turntable/agata_kristi_na_voine.ogg',				2470),
		new /datum/data/turntable_soundtrack ("Alai Oli",			"Крылья",							'stalker/sound/turntable/alai_oli_krilya.ogg',						2150),
		new /datum/data/turntable_soundtrack ("Ария",				"Беспечный ангел",					'stalker/sound/turntable/ariya_bespechniy_angel.ogg',				2380),
		new /datum/data/turntable_soundtrack ("Ария",				"Потерянный рай",					'stalker/sound/turntable/ariya_poteryaniy_ray.ogg',					3530),
		new /datum/data/turntable_soundtrack ("Ария",				"Я свободен",						'stalker/sound/turntable/ariya_ya_svoboden.ogg',					3540),
		new /datum/data/turntable_soundtrack ("Бандиты",			"Чики брики",					'stalker/sound/turntable/bandit_radio.ogg',							1110),
		new /datum/data/turntable_soundtrack ("Hoot",				"Pre-Release Moment",				'stalker/sound/turntable/hoot.ogg',									2110),
		new /datum/data/turntable_soundtrack ("Баста",				"Мама",								'stalker/sound/turntable/basta_mama.ogg',							2360),
		new /datum/data/turntable_soundtrack ("Би-2",				"Полковник",						'stalker/sound/turntable/bi2_polkovnik.ogg',						2900),
		new /datum/data/turntable_soundtrack ("Би-2",				"Серебро",							'stalker/sound/turntable/bi2_serebro.ogg',							2770),
		new /datum/data/turntable_soundtrack ("Би-2",				"Варвара",							'stalker/sound/turntable/bi2_varvara.ogg',							2990),
		new /datum/data/turntable_soundtrack ("Бутырка",			"Бутырская тюрьма",					'stalker/sound/turntable/butirka.ogg',								1920),
		new /datum/data/turntable_soundtrack ("Диспетчера",		"2000 Баксов",						'stalker/sound/turntable/2000_baksov.ogg',							2430),
		new /datum/data/turntable_soundtrack ("ДДТ",				"Осень",								'stalker/sound/turntable/ddt_osen.ogg',								2350),
		new /datum/data/turntable_soundtrack ("Дельфин",				"Надежда",							'stalker/sound/turntable/delfin_nadezhda.ogg',						2690),
		new /datum/data/turntable_soundtrack ("Дельфин",				"Снег",								'stalker/sound/turntable/delfin_sneg.ogg',							1820),
		new /datum/data/turntable_soundtrack ("Дельфин",				"Весна",							'stalker/sound/turntable/delfin_vesna.ogg',							2910),
		new /datum/data/turntable_soundtrack ("Дельфин",				"Я люблю людей",					'stalker/sound/turntable/delfin_ya_lublu_ludey.ogg',				2120),
		new /datum/data/turntable_soundtrack ("Электрофорез",		"Эшафот",							'stalker/sound/turntable/elektroforez_eshafot.ogg',					2090),
		new /datum/data/turntable_soundtrack ("Элизиум",			"Стоит жить",						'stalker/sound/turntable/elizium_stoit_zhit.ogg',					1800),
		new /datum/data/turntable_soundtrack ("Fleetwood Mac",		"Little Lies",						'stalker/sound/turntable/fleetwood_mac_little_lies.ogg',			2210),
		new /datum/data/turntable_soundtrack ("Firelake",			"Fighting Unknown",					'stalker/sound/turntable/agroprom.ogg',								710),
		new /datum/data/turntable_soundtrack ("Firelake",			"Dirge For The Planet",				'stalker/sound/turntable/dirge_for_the_planet.ogg',					2850),
		new /datum/data/turntable_soundtrack ("Firelake",			"Live To Forget",					'stalker/sound/turntable/live_to_forget.ogg',						2960),
		new /datum/data/turntable_soundtrack ("Свобода",			"Кури траву",						'stalker/sound/turntable/freedom_radio.ogg',						1140),
		new /datum/data/turntable_soundtrack ("Газманов",			"Путана",							'stalker/sound/turntable/putana.ogg',								2460),
		new /datum/data/turntable_soundtrack ("Круг",				"Кольщик",							'stalker/sound/turntable/kolshik.ogg',								2850),
		new /datum/data/turntable_soundtrack ("Кино",				"Группа крови",						'stalker/sound/turntable/kino_gruppa_krovi.ogg',					2030),
		new /datum/data/turntable_soundtrack ("Кино",				"Пачка сигарет",					'stalker/sound/turntable/kino_pachka_sigaret.ogg',					2780),
		new /datum/data/turntable_soundtrack ("Кино",				"Звезда по имени солнце",			'stalker/sound/turntable/kino_zvezda_po_imeni_solntse.ogg',			2245),
		new /datum/data/turntable_soundtrack ("Король и Шут",		"Кукла колдуна",					'stalker/sound/turntable/korol_i_shut_kukila_kolduna.ogg',			2040),
		new /datum/data/turntable_soundtrack ("Король и Шут",		"Лесник",							'stalker/sound/turntable/korol_i_shut_lesnik.ogg',					1910),
		new /datum/data/turntable_soundtrack ("Краски",				"Мама я полюбила бандита",			'stalker/sound/turntable/kraski_ya_polubila_bandita.ogg',			2020),
		new /datum/data/turntable_soundtrack ("Кровосток",			"Куртец",							'stalker/sound/turntable/krovostok_kurtec.ogg',						2400),
		new /datum/data/turntable_soundtrack ("Лепс",				"Рюмка водки на столе",				'stalker/sound/turntable/rumka.ogg',								2360),
		new /datum/data/turntable_soundtrack ("Леприконсы",			"Хали-гали, паратрупер",			'stalker/sound/turntable/leprikonsy_paratruper.ogg',				2060),
		new /datum/data/turntable_soundtrack ("Люмен",				"Сид и Нэнси",						'stalker/sound/turntable/lumen_sid_i_nensi.ogg',					2340),
		new /datum/data/turntable_soundtrack ("Мальчишник",		"В последний раз",					'stalker/sound/turntable/malchishnik_posledniy_raz.ogg',			3350),
		new /datum/data/turntable_soundtrack ("Многоточие",		"Щемит в душе тоска",				'stalker/sound/turntable/mnogotochie_shemit.ogg',					2310),
		new /datum/data/turntable_soundtrack ("Монокини",			"Адреналин",						'stalker/sound/turntable/monokini_adrenalin.ogg',					1970),
		new /datum/data/turntable_soundtrack ("Монокини",			"Дотянуться до солнца",			'stalker/sound/turntable/monokini_dotyanutsya_do_solntsa.ogg',		1600),
		new /datum/data/turntable_soundtrack ("муцараев",			"О аллах",							'stalker/sound/turntable/mucuraev_o_allah.ogg',						3970),
		new /datum/data/turntable_soundtrack ("Мумий троль",		"Дельфины",							'stalker/sound/turntable/mumiy_troll_delfiny.ogg',					2780),
		new /datum/data/turntable_soundtrack ("Мумий троль",		"Утекай",							'stalker/sound/turntable/mumiy_troll_utekay.ogg',					1410),
		new /datum/data/turntable_soundtrack ("Мумий троль",		"Владивосток 2000",					'stalker/sound/turntable/mumiy_troll_vladivostok2000.ogg',			1610),
		new /datum/data/turntable_soundtrack ("Nautilus Pomilius",	"апостол Андрей",					'stalker/sound/turntable/nautilus_pompilius_apostol_andrey.ogg',	2170),
		new /datum/data/turntable_soundtrack ("Nautilus Pomilius",	"Крылья",							'stalker/sound/turntable/nautilus_pompilius_krylya.ogg',			2080),
		new /datum/data/turntable_soundtrack ("Nautilus Pomilius",	"Скованные",							'stalker/sound/turntable/nautilus_pompilius_skovanye.ogg',			2530),
		new /datum/data/turntable_soundtrack ("Nautilus Pomilius",	"Я хочу быть с тобой",				'stalker/sound/turntable/nautilus_pompilius_ya_hochu_byt_s_toboy.ogg',2710),
		new /datum/data/turntable_soundtrack ("Русская народная",	"Вприсядку",					'stalker/sound/turntable/tf2_kazotsky_kic.ogg',						670),
		new /datum/data/turntable_soundtrack ("Ноггано",			"Армия",							'stalker/sound/turntable/noggano_armiya.ogg',						3890),
		new /datum/data/turntable_soundtrack ("Океан Ельзи",			"обiйми",							'stalker/sound/turntable/okean_elzi_obime.ogg',						2260),
		new /datum/data/turntable_soundtrack ("Океан Ельзи",			"вiдпусти",							'stalker/sound/turntable/okean_elzi_vidpusti.ogg',					2300),
		new /datum/data/turntable_soundtrack ("Phil Collins",		"In The Air Tonight",				'stalker/sound/turntable/phil_collins_in_the_air_tonight.ogg',		3300),
		new /datum/data/turntable_soundtrack ("Пропоганда",			"Белым мелом",						'stalker/sound/turntable/propaganda_belim_melom.ogg',				1740),
		new /datum/data/turntable_soundtrack ("Ранетки",			"О тебе",							'stalker/sound/turntable/ranetki_o_tebe.ogg',						1650),
		new /datum/data/turntable_soundtrack ("Ранетки",			"Она одна",							'stalker/sound/turntable/ranetki_ona_odna.ogg',						1640),
		new /datum/data/turntable_soundtrack ("Rick Astley",		"Never Gonna Give You Up",			'stalker/sound/turntable/rick_astley_nggyu.ogg',					2120),
		new /datum/data/turntable_soundtrack ("Розенбаум",		"Дагомыс",							'stalker/sound/turntable/gopstop.ogg',								2450),
		new /datum/data/turntable_soundtrack ("Шнуров",			"Мобильник",							'stalker/sound/turntable/shnurov_mobilnik.ogg',						1680),
		new /datum/data/turntable_soundtrack ("Шнуров",			"Привет Морриконе",					'stalker/sound/turntable/shnurov_morikone.ogg',						2230),
		new /datum/data/turntable_soundtrack ("Сплин",				"Мы сидели и курили",				'stalker/sound/turntable/splin_mi_sideli_i_kurili.ogg',				1980),
		new /datum/data/turntable_soundtrack ("Сплин",				"Моё сердце",						'stalker/sound/turntable/splin_moe_serdce.ogg',						2440),
		new /datum/data/turntable_soundtrack ("Сплин",				"Романс",							'stalker/sound/turntable/splin_romans.ogg',							2070),
		new /datum/data/turntable_soundtrack ("Сплин",				"Выхода нет",						'stalker/sound/turntable/splin_vihoda_net.ogg',						2230),
		new /datum/data/turntable_soundtrack ("Стекловата",			"Новый год",						'stalker/sound/turntable/steklovata_noviy_god.ogg',					2380),
		new /datum/data/turntable_soundtrack ("Total",				"Бьёт по глазам",			'stalker/sound/turntable/total_byet_po_glazam_adrenalin.ogg',		2530),
		new /datum/data/turntable_soundtrack ("Трубецкой",			"Капитал",							'stalker/sound/turntable/trubetskoy_kapital.ogg',					2000),
		new /datum/data/turntable_soundtrack ("XS-project",			"Колотушки",						'stalker/sound/turntable/xsproject_kolotushki.ogg',					1610),
		new /datum/data/turntable_soundtrack ("Земфира",			"Хочешь?",							'stalker/sound/turntable/zemfira_hochesh.ogg',						1920),
		new /datum/data/turntable_soundtrack ("Жуки",				"Батарейка",						'stalker/sound/turntable/zhuki_batareyka.ogg',						2240),
		new /datum/data/turntable_soundtrack ("Земляне",			"Земля в иллюминаторе",			'stalker/sound/turntable/zemlyane_zemlya_v_illuminatore.ogg',		2330),
		new /datum/data/turntable_soundtrack ("Blonde Redhead",		"For The Damaged Soda",				'stalker/sound/turntable/blonde.ogg',								2488),
		new /datum/data/turntable_soundtrack ("Yakui The Maid",		"Chloramine",						'stalker/sound/turntable/ytm_chloramine.ogg',						2337),
		new /datum/data/turntable_soundtrack ("Yakui The Maid",		"Calamity",							'stalker/sound/turntable/ytm_calamity.ogg',							2481),
		new /datum/data/turntable_soundtrack ("Yakui The Maid x Ozoi The Maid",		"Unreleased",		'stalker/sound/turntable/ytmxotm_unr.ogg',							2444),
		new /datum/data/turntable_soundtrack ("Vladimir Vasilkov",	"Woodpeckers Dont Get Headaches",	'stalker/sound/turntable/woodpeckersdontgetheadaches.ogg',					1110),
		new /datum/data/turntable_soundtrack ("Soyol Erdene",		"The First Snow",					'stalker/sound/turntable/soyolerdene_thefirstsnow.ogg',						1110),
		new /datum/data/turntable_soundtrack ("Molchat Doma",		"Танцевать",							'stalker/sound/turntable/molchatdoma_tancevat.ogg',							1110),
		new /datum/data/turntable_soundtrack ("England",			"No Other Way",						'stalker/sound/turntable/england_nootherway.ogg',							1110),
		new /datum/data/turntable_soundtrack ("Space",				"Ballad for Space Lovers",			'stalker/sound/turntable/space_balladforspacelovers.ogg',					1110),
		new /datum/data/turntable_soundtrack ("Venetian Snares",	"Black Sabbath",					'stalker/sound/turntable/Snares-BlackSabbath.ogg',							1110),
		new /datum/data/turntable_soundtrack ("Glintshake",			"Steppe is the Place",				'stalker/sound/turntable/Glintshake_SteppeisthePlace.ogg',					1110)
	)
	anchored = 1
	density = 1

/obj/machinery/party/turntable/New()
	..()
	spawn(5)
		turntable_soundtracks = sortSoundtrack(turntable_soundtracks)
/*
	turntable_soundtracks = list()
	for(var/i in subtypesof(/datum/turntable_soundtrack/)
		var/datum/turntable_soundtrack/D = new i()
		if(D.path)
			turntable_soundtracks += D
*/

/obj/machinery/party/turntable/attackby(obj/O, mob/user)
	if(istype(O, /obj/item/disk/music) && !disk)
		user.dropItemToGround()
		O.loc = src
		disk = O
		attack_hand(user)


/obj/machinery/party/turntable/attack_paw(user as mob)
	return src.attack_hand(user)

/obj/machinery/party/turntable/attack_hand(mob/living/user as mob)
	if (..())
		return

	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user

	interact(H)

/obj/machinery/party/turntable/ui_interact(var/mob/living/carbon/human/H)

	if(!istype(H.wear_id, /obj/item/stalker_pda))
		say("Наденьте ваш КПК.")
		return

	var/obj/item/stalker_pda/KPK = H.wear_id

	if(!KPK.profile || !KPK.owner)
		say("Активируйте ваш КПК.")
		return

	if(KPK.owner != H)
		say("Нет доступа.")
		return

	H.set_machine(src)
	//balance = KPK.profile.fields["money"]

	var/dat
	dat +="<div class='statusDisplay'>"
	dat += "Now playing: <b>[track.f_name] - [track.name]</b>"
	//dat += "Balance: [balance] р.<br>"
	dat += "<br>"
	if(KPK.profile.fields["faction_s"] == "Traders")
		dat += "<br><A href='?src=\ref[src];collect_money=\ref[src]'>Collect Money</A>"
		dat += "<br><A href='?src=\ref[src];change_volume=\ref[src]'>Change Volume</A>"
		if(playing)
			dat += "<br><A href='?src\ref[src];turn_off=\ref[src]'>Turn Off</A>"
		else
			dat += "<br><A href='?src\ref[src];turn_on=\ref[src]'>Turn On</A>"
	dat += "<br><A href='?src=\ref[src];skip=\ref[src]'>Skip</A> - <b>[skip_song_cost] RU</b>"
	dat += "<br>Play your song - <b>[play_song_cost] RU</b>"
	dat += "<br>Volume: <b>[volume]%</b>"
	dat += "</div>"
	dat += "<div class='lenta_scroll'>"
	dat += "<br><BR><table border='0' width='400'>"
	for(var/datum/data/turntable_soundtrack/TS in turntable_soundtracks)
		dat += "<tr><td>[TS.f_name]</td><td>[TS.name]</td><td><A href='?src=\ref[src];order=\ref[TS]'>PLAY</A></td></tr>"
	dat += "</table>"
	dat += "</div>"

	var/datum/browser/popup
	if(KPK.profile.fields["faction_s"] != "Traders")
		popup = new(H, "jukebox", "Jukebox", 450, 700)
	else
		popup = new(H, "jukebox", "Jukebox", 460, 760)
	popup.set_content(dat)
	popup.open()
	return

/obj/machinery/party/turntable/power_change()
	return
	//turn_off()

/obj/machinery/party/turntable/Topic(href, href_list)
	if(..())
		return

	var/mob/living/carbon/human/H = usr

	if(!istype(H.wear_id, /obj/item/stalker_pda))
		say("Наденьте ваш КПК.")
		updateUsrDialog()
		return

	var/obj/item/stalker_pda/KPK = H.wear_id

	if(href_list["collect_money"])
		switch(alert("Вы хотите перевести [collected_money]Р на ваш аккаунт?", "Turntable", "Да", "Нет"))
			if("Да")
				KPK.profile.fields["money"] += collected_money
				collected_money = 0
			if("Нет")
				return

	if(href_list["Сменить громкость"])
		set_volume(input("Выберите громкость.", "Turntable", src.volume) as num)
		return

	if(href_list["Заказать"])
		var/datum/data/turntable_soundtrack/TS = locate(href_list["order"])

		if(!playing)
			say("Музыкальный автомат выключен.")
			return

		if(transition)
			return

		if(alert("Вы хотите включить [TS.name] за [play_song_cost] рублей?", "Turntable", "Да", "Нет") == "Нет")
			return

		if(next_track)
			say("Следующая песня уже выбрана: [next_track.f_name] - [next_track.name]")
			return

		if (!TS)
			updateUsrDialog()
			return

		if(play_song_cost > KPK.profile.fields["money"])
			say("У вас недостаточно денег, чтобы заказать песню.")
			updateUsrDialog()
			return

		//deltimer(timer_id)
		//skip_song(TS)

		next_track = TS
		say("Следующим играет: [next_track.f_name] - [next_track.name]")

		KPK.profile.fields["money"] -= play_song_cost
		collected_money += play_song_cost
		return

	if(href_list["Пропустить"])

		if(!playing)
			say("Музыкальный автомат выключен.")
			return

		if(skip_song_cost > KPK.profile.fields["money"])
			say("У вас недостаточно денег, чтобы пропустить песню.")
			updateUsrDialog()
			return

		if(alert("Пропустить [track.name] за [skip_song_cost] Р?", "Turntable", "Да", "Нет") == "Нет")
			return

		//deltimer(timer_id)
		skip_song(next_track)

		KPK.profile.fields["money"] -= skip_song_cost
		collected_money += skip_song_cost
		return

	if(href_list["set_volume"])
		set_volume(text2num(href_list["set_volume"]))
		return

	if(href_list["turn_off"])
		turn_off()
		return

	if(href_list["turn_on"])
		turn_on()
		return
/*
	if(href_list["eject"])
		if(disk)
			disk.loc = src.loc
			if(disk.data && track == disk.data)
				turn_off()
				track = null
			disk = null
		return
*/
/obj/machinery/party/turntable/process()
	if(playing)
		update_sound()

/obj/machinery/party/turntable/proc/skip_song(var/datum/data/turntable_soundtrack/TS = pick(turntable_soundtracks - track))
	next_track = null
	var/area/A = get_area(src)
	transition = 1
	for(var/client/C in melomans)
		if(!C || !(C.mob))
			continue

		if(!playing || (get_area(C.mob) != A))
			continue

		C.music_juke.status = SOUND_STREAM
		C.music_juke.file = null
		C.mob << C.music_juke
		sleep(0)
		C.music_juke.status = SOUND_STREAM
		C.music_juke.file = 'stalker/sound/objects/radio_noise.ogg'
		C.music_juke.volume = volume
		C.mob << C.music_juke
	sleep(40)
	transition = 0
	//timer_id = addtimer(src, "skip_song", TS.length - 10)
	track = TS
	say("Сейчас играет: [track.f_name] - [track.name]")
	start_time = world.timeofday
	//update_sound()

/obj/machinery/party/turntable/proc/turn_on(var/datum/data/turntable_soundtrack/selected)
	if(playing)
		return

	playing = 1

	if(selected)
		skip_song(selected)
	else
		skip_song()

	//MusicSwitch()
	var/area/A = get_area(src)
	for(var/obj/machinery/party/lasermachine/L in A)
		L.turnon(L.dir)

/obj/machinery/party/turntable/proc/turn_off()
	if(!playing)
		return

	//deltimer(timer_id)
	//timer_id = 0

	for(var/client/C in melomans)
		//C.jukeboxplaying = 0
		if(C.mob)
			C.mob << sound(null, channel = CHANNEL_JUKEBOX, wait = 0)
		melomans.Remove(C)

	playing = 0

	var/area/A = get_area(src)
	for(var/obj/machinery/party/lasermachine/L in A)
		L.turnoff()

/obj/machinery/party/turntable/proc/set_volume(var/new_volume)
	volume = max(0, min(100, new_volume))
	//if(playing)
	//	update_sound()

/obj/machinery/party/turntable/proc/update_sound()
	if(transition)
		return

	var/area/A = get_area(src)

	if(!track || (start_time + track.length < world.timeofday + SSobj.wait))
		skip_song()

	for(var/client/C in GLOB.clients)

		if(!C || !C.mob)
			continue

		if(get_area(C.mob) != A)
			continue

		//if(!C.mob.client.jukeboxplaying)
		if(!(C.mob.client in melomans))
			//create_sound(C.mob)
			//C.mob.music.volume = volume
			//C.mob << C.mob.music
			//C.jukeboxplaying = 1
			melomans.Add(C)

	for (var/client/C in melomans)
		//var/inRange = (get_area(C.mob) in A.related)

		if(!C)
			melomans -= C
			continue

		if(!(C.mob))
			C << sound(null, channel = CHANNEL_JUKEBOX, wait = 0)
			melomans.Remove(C)
			continue

		if(!playing || (get_area(C.mob) != A))
			if(C.music_juke)
				C.music_juke.status = SOUND_STREAM | SOUND_UPDATE
				C.music_juke.volume = 0
				C.mob << C.music_juke
				C.music_juke.status = SOUND_STREAM
			else
				C.mob << sound(null, channel = CHANNEL_JUKEBOX, wait = 0)
			//C.jukeboxplaying = 0
			melomans.Remove(C)
			continue

		if(!C.music_juke)
			create_sound(C)
			continue

		if(!C.music_juke.transition && C.music_juke.file != track.path)
			C.music_juke.file = track.path
		//	C.mob.music.status = SOUND_STREAM
		else
			C.music_juke.status = SOUND_STREAM | SOUND_UPDATE

		C.music_juke.volume = volume
		C.mob << C.music_juke
		C.music_juke.status = SOUND_STREAM

/obj/machinery/party/turntable/proc/create_sound(client/C)
	if(!C.music_juke || C.music_juke.file != track.path)
		var/sound/S = new/sound/ambient(track.path)
		S.repeat = 0
		S.channel = CHANNEL_JUKEBOX
		S.falloff = 2
		S.wait = 0
		S.volume = 0
		S.status = SOUND_STREAM //SOUND_STREAM
		S.environment = get_area(src).environment
		C.music_juke = S
		C.mob << S
		//SEND_SOUND(C.mob, S)
	else
		C.music_juke.status = SOUND_STREAM | SOUND_UPDATE
		C.music_juke.volume = volume
		C.mob << C.music_juke
		C.music_juke.status = SOUND_STREAM

/obj/machinery/party/mixer
	name = "Микшер"
	desc = "Микшерный пульт для микширования музыки"
	icon = 'stalker/icons/lasers2.dmi'
	icon_state = "mixer"
	density = 0
	anchored = 1

/obj/machinery/party/lasermachine
	name = "Лазерная машина"
	desc = "Лазерная машина, стреляющая лазерами."
	icon = 'stalker/icons/lasers2.dmi'
	icon_state = "lasermachine"
	dir = 4
	anchored = 1
	var/mirrored = 0

/obj/effect/laser2
	name = "Лазер"
	desc = "Лазер..."
	icon = 'stalker/icons/lasers2.dmi'
	icon_state = "laserred1"
	anchored = 1
	layer = 4

/obj/machinery/party/lasermachine/proc/turnon(laser_dir)
	var/wall = 0
	var/cycle = 1
	var/area/A = get_area(src)
	var/X = 1
	var/Y = 0
	if(mirrored == 0)
		while(wall == 0)
			if(cycle == 1)
				var/obj/effect/laser2/F = new/obj/effect/laser2(src)
				F.x = src.x+X
				F.y = src.y+Y
				F.z = src.z
				F.dir = laser_dir
				F.icon_state = "laserred1"
				var/area/AA = get_area(F)
				var/turf/T = get_turf(F)
				if(T.density == 1 || AA.name != A.name)
					qdel(F)
					return
				cycle++
				if(cycle > 3)
					cycle = 1
				X++
			if(cycle == 2)
				var/obj/effect/laser2/F = new/obj/effect/laser2(src)
				F.x = src.x+X
				F.y = src.y+Y
				F.z = src.z
				F.dir = laser_dir
				F.icon_state = "laserred2"
				var/area/AA = get_area(F)
				var/turf/T = get_turf(F)
				if(T.density == 1 || AA.name != A.name)
					qdel(F)
					return
				cycle++
				if(cycle > 3)
					cycle = 1
				Y++
			if(cycle == 3)
				var/obj/effect/laser2/F = new/obj/effect/laser2(src)
				F.x = src.x+X
				F.y = src.y+Y
				F.z = src.z
				F.dir = laser_dir
				F.icon_state = "laserred3"
				var/area/AA = get_area(F)
				var/turf/T = get_turf(F)
				if(T.density == 1 || AA.name != A.name)
					qdel(F)
					return
				cycle++
				if(cycle > 3)
					cycle = 1
				X++
	if(mirrored == 1)
		while(wall == 0)
			if(cycle == 1)
				var/obj/effect/laser2/F = new/obj/effect/laser2(src)
				F.x = src.x+X
				F.y = src.y-Y
				F.z = src.z
				F.icon_state = "laserred1m"
				var/area/AA = get_area(F)
				var/turf/T = get_turf(F)
				if(T.density == 1 || AA.name != A.name)
					qdel(F)
					return
				cycle++
				if(cycle > 3)
					cycle = 1
				Y++
			if(cycle == 2)
				var/obj/effect/laser2/F = new/obj/effect/laser2(src)
				F.x = src.x+X
				F.y = src.y-Y
				F.z = src.z
				F.icon_state = "laserred2m"
				var/area/AA = get_area(F)
				var/turf/T = get_turf(F)
				if(T.density == 1 || AA.name != A.name)
					qdel(F)
					return
				cycle++
				if(cycle > 3)
					cycle = 1
				X++
			if(cycle == 3)
				var/obj/effect/laser2/F = new/obj/effect/laser2(src)
				F.x = src.x+X
				F.y = src.y-Y
				F.z = src.z
				F.icon_state = "laserred3m"
				var/area/AA = get_area(F)
				var/turf/T = get_turf(F)
				if(T.density == 1 || AA.name != A.name)
					qdel(F)
					return
				cycle++
				if(cycle > 3)
					cycle = 1
				X++



/obj/machinery/party/lasermachine/proc/turnoff()
	var/area/A = src.loc.loc
	for(var/area/RA in A.related)
		for(var/obj/effect/laser2/F in RA)
			qdel(F)

/obj/machinery/party/lasermachine/Move()
	..()
	turnon(src.dir)
