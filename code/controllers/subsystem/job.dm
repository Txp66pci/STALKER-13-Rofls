SUBSYSTEM_DEF(job)
	name = "Jobs"
	init_order = INIT_ORDER_JOBS
	flags = SS_NO_FIRE

	var/list/occupations = list()		//List of all jobs
	var/list/name_occupations = list()	//Dict of all jobs, keys are titles
	var/list/type_occupations = list()	//Dict of all jobs, keys are types
	var/list/unassigned = list()		//Players who need jobs
	var/initial_players_to_assign = 0 	//used for checking against population caps

	var/list/prioritized_jobs = list()
	var/list/latejoin_trackers = list()	//Don't read this list, use GetLateJoinTurfs() instead

	var/list/latejoin_bandit = list()
	var/list/latejoin_banditboss = list()
	var/list/latejoin_bandit_barman = list()
	var/list/latejoin_army = list()
	var/list/latejoin_army_spetsnaz = list()
	var/list/latejoin_militarycommander = list()
	var/list/latejoin_barman = list()
	var/list/latejoin_barman2 = list()
	var/list/latejoin_duty = list()
	var/list/latejoin_duty_lieutenant = list()
	var/list/latejoin_freedom = list()
	var/list/latejoin_freedom_lieutenant = list()
	var/list/latejoin_mercenary = list()
	var/list/latejoin_mercenarycommander = list()
	var/list/latejoin_trader = list()
	var/list/latejoin_stalker = list()
	var/list/latejoin_monolith = list()
	var/list/latejoin_monolith_hegumen = list()
	var/list/latejoin_ecologist = list()
	var/list/latejoin_ecologistguard = list()
	var/list/latejoin_chief_ecologist = list()
	var/list/latejoin_clearsky = list()
	var/list/latejoin_clearsky_leader = list()
	var/list/latejoin_renegade = list()

	var/overflow_role = "Assistant"

/datum/controller/subsystem/job/Initialize(timeofday)
	SSmapping.HACK_LoadMapConfig()
	if(!occupations.len)
		SetupOccupations()
	if(CONFIG_GET(flag/load_jobs_from_txt))
		LoadJobs()
	generate_selectable_species()
	//set_overflow_role(CONFIG_GET(string/overflow_job)) //NEED REWORK
	return ..()

/datum/controller/subsystem/job/proc/set_overflow_role(new_overflow_role)
	var/datum/job/new_overflow = GetJob(new_overflow_role)
	var/cap = CONFIG_GET(number/overflow_cap)

	new_overflow.spawn_positions = cap
	new_overflow.total_positions = cap

	if(new_overflow_role != overflow_role)
		var/datum/job/old_overflow = GetJob(overflow_role)
		old_overflow.spawn_positions = initial(old_overflow.spawn_positions)
		old_overflow.total_positions = initial(old_overflow.total_positions)
		overflow_role = new_overflow_role
		JobDebug("Overflow role set to : [new_overflow_role]")

/datum/controller/subsystem/job/proc/SetupOccupations(faction = "Station")
	occupations = list()
	var/list/all_jobs = subtypesof(/datum/job)
	if(!all_jobs.len)
		to_chat(world, "<span class='boldannounce'>Error setting up jobs, no job datums found</span>")
		return 0

	for(var/J in all_jobs)
		var/datum/job/job = new J()
		if(!job)
			continue
		if(job.faction != faction)
			continue
		if(!job.config_check())
			continue
		if(!job.map_check())	//Even though we initialize before mapping, this is fine because the config is loaded at new
			testing("Removed [job.type] due to map config");
			continue
		occupations += job
		name_occupations[job.title] = job
		type_occupations[J] = job

	return 1


/datum/controller/subsystem/job/proc/GetJob(rank)
	if(!occupations.len)
		SetupOccupations()
	return name_occupations[rank]

/datum/controller/subsystem/job/proc/GetJobType(jobtype)
	if(!occupations.len)
		SetupOccupations()
	return type_occupations[jobtype]

/datum/controller/subsystem/job/proc/AssignRole(mob/dead/new_player/player, rank, latejoin = FALSE)
	JobDebug("Running AR, Player: [player], Rank: [rank], LJ: [latejoin]")
	if(player && player.mind && rank)
		var/datum/job/job = GetJob(rank)
		if(!job)
			return FALSE
		if(is_banned_from(player.ckey, rank) || QDELETED(player))
			return FALSE
		if(!job.player_old_enough(player.client))
			return FALSE
		if(job.required_playtime_remaining(player.client))
			return FALSE
		var/position_limit = job.total_positions
		if(!latejoin)
			position_limit = job.spawn_positions
		JobDebug("Player: [player] is now Rank: [rank], JCP:[job.current_positions], JPL:[position_limit]")
		player.mind.assigned_role = rank
		unassigned -= player
		job.current_positions++
		return TRUE
	JobDebug("AR has failed, Player: [player], Rank: [rank]")
	return FALSE


/datum/controller/subsystem/job/proc/FindOccupationCandidates(datum/job/job, level, flag)
	JobDebug("Running FOC, Job: [job], Level: [level], Flag: [flag]")
	var/list/candidates = list()
	for(var/mob/dead/new_player/player in unassigned)
		if(is_banned_from(player.ckey, job.title) || QDELETED(player))
			JobDebug("FOC isbanned failed, Player: [player]")
			continue
		if(!job.player_old_enough(player.client))
			JobDebug("FOC player not old enough, Player: [player]")
			continue
		if(job.required_playtime_remaining(player.client))
			JobDebug("FOC player not enough xp, Player: [player]")
			continue
		if(flag && (!(flag in player.client.prefs.be_special)))
			JobDebug("FOC flag failed, Player: [player], Flag: [flag], ")
			continue
		if(player.mind && job.title in player.mind.restricted_roles)
			JobDebug("FOC incompatible with antagonist role, Player: [player]")
			continue
		if(player.client.prefs.GetJobDepartment(job, level) & job.flag)
			JobDebug("FOC pass, Player: [player], Level:[level]")
			candidates += player
	return candidates

/datum/controller/subsystem/job/proc/GiveRandomJob(mob/dead/new_player/player)
	JobDebug("GRJ Giving random job, Player: [player]")
	. = FALSE
	for(var/datum/job/job in shuffle(occupations))
		if(!job)
			continue

		if(istype(job, GetJob(SSjob.overflow_role))) // We don't want to give him assistant, that's boring!
			continue

		if(job.title in GLOB.command_positions) //If you want a command position, select it!
			continue

		if(is_banned_from(player.ckey, job.title) || QDELETED(player))
			if(QDELETED(player))
				JobDebug("GRJ isbanned failed, Player deleted")
				break
			JobDebug("GRJ isbanned failed, Player: [player], Job: [job.title]")
			continue

		if(!job.player_old_enough(player.client))
			JobDebug("GRJ player not old enough, Player: [player]")
			continue

		if(job.required_playtime_remaining(player.client))
			JobDebug("GRJ player not enough xp, Player: [player]")
			continue

		if(player.mind && job.title in player.mind.restricted_roles)
			JobDebug("GRJ incompatible with antagonist role, Player: [player], Job: [job.title]")
			continue

		if((job.current_positions < job.spawn_positions) || job.spawn_positions == -1)
			JobDebug("GRJ Random job given, Player: [player], Job: [job]")
			if(AssignRole(player, job.title))
				return TRUE

/datum/controller/subsystem/job/proc/ResetOccupations()
	JobDebug("Occupations reset.")
	for(var/mob/dead/new_player/player in GLOB.player_list)
		if((player) && (player.mind))
			player.mind.assigned_role = null
			player.mind.special_role = null
			SSpersistence.antag_rep_change[player.ckey] = 0
	SetupOccupations()
	unassigned = list()
	return


//This proc is called before the level loop of DivideOccupations() and will try to select a head, ignoring ALL non-head preferences for every level until
//it locates a head or runs out of levels to check
//This is basically to ensure that there's atleast a few heads in the round
/datum/controller/subsystem/job/proc/FillHeadPosition()
	for(var/level = 1 to 3)
		for(var/command_position in GLOB.command_positions)
			var/datum/job/job = GetJob(command_position)
			if(!job)
				continue
			if((job.current_positions >= job.total_positions) && job.total_positions != -1)
				continue
			var/list/candidates = FindOccupationCandidates(job, level)
			if(!candidates.len)
				continue
			var/mob/dead/new_player/candidate = pick(candidates)
			if(AssignRole(candidate, command_position))
				return 1
	return 0


//This proc is called at the start of the level loop of DivideOccupations() and will cause head jobs to be checked before any other jobs of the same level
//This is also to ensure we get as many heads as possible
/datum/controller/subsystem/job/proc/CheckHeadPositions(level)
	for(var/command_position in GLOB.command_positions)
		var/datum/job/job = GetJob(command_position)
		if(!job)
			continue
		if((job.current_positions >= job.total_positions) && job.total_positions != -1)
			continue
		var/list/candidates = FindOccupationCandidates(job, level)
		if(!candidates.len)
			continue
		var/mob/dead/new_player/candidate = pick(candidates)
		AssignRole(candidate, command_position)

/datum/controller/subsystem/job/proc/FillAIPosition()
	var/ai_selected = 0
	var/datum/job/job = GetJob("AI")
	if(!job)
		return 0
	for(var/i = job.total_positions, i > 0, i--)
		for(var/level = 1 to 3)
			var/list/candidates = list()
			candidates = FindOccupationCandidates(job, level)
			if(candidates.len)
				var/mob/dead/new_player/candidate = pick(candidates)
				if(AssignRole(candidate, "AI"))
					ai_selected++
					break
	if(ai_selected)
		return 1
	return 0


/** Proc DivideOccupations
 *  fills var "assigned_role" for all ready players.
 *  This proc must not have any side effect besides of modifying "assigned_role".
 **/
/datum/controller/subsystem/job/proc/DivideOccupations()
	//Setup new player list and get the jobs list
	JobDebug("Running DO")

	//Holder for Triumvirate is stored in the SSticker, this just processes it
	if(SSticker.triai)
		for(var/datum/job/ai/A in occupations)
			A.spawn_positions = 3
		for(var/obj/effect/landmark/start/ai/secondary/S in GLOB.start_landmarks_list)
			S.latejoin_active = TRUE

	//Get the players who are ready
	for(var/mob/dead/new_player/player in GLOB.player_list)
		if(player.ready == PLAYER_READY_TO_PLAY && player.mind && !player.mind.assigned_role)
			unassigned += player

	initial_players_to_assign = unassigned.len

	JobDebug("DO, Len: [unassigned.len]")
	if(unassigned.len == 0)
		return 0

	//Scale number of open security officer slots to population
	setup_officer_positions()

	//Jobs will have fewer access permissions if the number of players exceeds the threshold defined in game_options.txt
	var/mat = CONFIG_GET(number/minimal_access_threshold)
	if(mat)
		if(mat > unassigned.len)
			CONFIG_SET(flag/jobs_have_minimal_access, FALSE)
		else
			CONFIG_SET(flag/jobs_have_minimal_access, TRUE)

	//Shuffle players and jobs
	unassigned = shuffle(unassigned)

	HandleFeedbackGathering()

	//People who wants to be the overflow role, sure, go on.
	JobDebug("DO, Running Overflow Check 1")
	var/datum/job/overflow = GetJob(SSjob.overflow_role)
	var/list/overflow_candidates = FindOccupationCandidates(overflow, 3)
	JobDebug("AC1, Candidates: [overflow_candidates.len]")
	for(var/mob/dead/new_player/player in overflow_candidates)
		JobDebug("AC1 pass, Player: [player]")
		AssignRole(player, SSjob.overflow_role)
		overflow_candidates -= player
	JobDebug("DO, AC1 end")

	//Select one head
	JobDebug("DO, Running Head Check")
	FillHeadPosition()
	JobDebug("DO, Head Check end")

	//Check for an AI
	JobDebug("DO, Running AI Check")
	FillAIPosition()
	JobDebug("DO, AI Check end")

	//Other jobs are now checked
	JobDebug("DO, Running Standard Check")


	// New job giving system by Donkie
	// This will cause lots of more loops, but since it's only done once it shouldn't really matter much at all.
	// Hopefully this will add more randomness and fairness to job giving.

	// Loop through all levels from high to low
	var/list/shuffledoccupations = shuffle(occupations)
	for(var/level = 1 to 3)
		//Check the head jobs first each level
		CheckHeadPositions(level)

		// Loop through all unassigned players
		for(var/mob/dead/new_player/player in unassigned)
			if(PopcapReached())
				RejectPlayer(player)

			// Loop through all jobs
			for(var/datum/job/job in shuffledoccupations) // SHUFFLE ME BABY
				if(!job)
					continue

				if(is_banned_from(player.ckey, job.title))
					JobDebug("DO isbanned failed, Player: [player], Job:[job.title]")
					continue

				if(QDELETED(player))
					JobDebug("DO player deleted during job ban check")
					break

				if(!job.player_old_enough(player.client))
					JobDebug("DO player not old enough, Player: [player], Job:[job.title]")
					continue

				if(job.required_playtime_remaining(player.client))
					JobDebug("DO player not enough xp, Player: [player], Job:[job.title]")
					continue

				if(player.mind && job.title in player.mind.restricted_roles)
					JobDebug("DO incompatible with antagonist role, Player: [player], Job:[job.title]")
					continue

				// If the player wants that job on this level, then try give it to him.
				if(player.client.prefs.GetJobDepartment(job, level) & job.flag)
					// If the job isn't filled
					if((job.current_positions < job.spawn_positions) || job.spawn_positions == -1)
						JobDebug("DO pass, Player: [player], Level:[level], Job:[job.title]")
						AssignRole(player, job.title)
						unassigned -= player
						break


	JobDebug("DO, Handling unassigned.")
	// Hand out random jobs to the people who didn't get any in the last check
	// Also makes sure that they got their preference correct
	for(var/mob/dead/new_player/player in unassigned)
		HandleUnassigned(player)

	JobDebug("DO, Handling unrejectable unassigned")
	//Mop up people who can't leave.
	for(var/mob/dead/new_player/player in unassigned) //Players that wanted to back out but couldn't because they're antags (can you feel the edge case?)
		if(!GiveRandomJob(player))
			AssignRole(player, SSjob.overflow_role) //If everything is already filled, make them an assistant

	return 1

//We couldn't find a job from prefs for this guy.
/datum/controller/subsystem/job/proc/HandleUnassigned(mob/dead/new_player/player)
	if(PopcapReached())
		RejectPlayer(player)
	else if(player.client.prefs.joblessrole == BEOVERFLOW)
		var/allowed_to_be_a_loser = !is_banned_from(player.ckey, SSjob.overflow_role)
		if(QDELETED(player) || !allowed_to_be_a_loser)
			RejectPlayer(player)
		else
			if(!AssignRole(player, SSjob.overflow_role))
				RejectPlayer(player)
	else if(player.client.prefs.joblessrole == BERANDOMJOB)
		if(!GiveRandomJob(player))
			RejectPlayer(player)
	else if(player.client.prefs.joblessrole == RETURNTOLOBBY)
		RejectPlayer(player)
	else //Something gone wrong if we got here.
		var/message = "DO: [player] fell through handling unassigned"
		JobDebug(message)
		log_game(message)
		message_admins(message)
		RejectPlayer(player)
//Gives the player the stuff he should have with his rank
/datum/controller/subsystem/job/proc/EquipRank(mob/M, rank, joined_late = FALSE)
	var/mob/dead/new_player/N
	var/mob/living/H
	if(!joined_late)
		N = M
		H = N.new_character
	else
		H = M

	var/datum/job/job = GetJob(rank)

	H.job = rank

	//If we joined at roundstart we should be positioned at our workstation
	if(!joined_late)
		var/obj/S = null
		for(var/obj/effect/landmark/start/sloc in GLOB.start_landmarks_list)
			//if(sloc.name != rank)
			//	S = sloc //so we can revert to spawning them on top of eachother if something goes wrong
			//	continue
			if(locate(/mob/living) in sloc.loc)
				continue
			S = sloc
			sloc.used = TRUE
			break
		if(length(GLOB.jobspawn_overrides[rank]))
			S = pick(GLOB.jobspawn_overrides[rank])
		if(S)
			SendToAtom(H, S, buckle = FALSE)
		if(!S) //if there isn't a spawnpoint send them to latejoin, if there's no latejoin go yell at your mapper
			log_world("Не найдена точка для спавна [rank]")
			SendToLateJoin(H)


	if(H.mind)
		H.mind.assigned_role = rank

	if(job)
		var/new_mob = job.equip(H, null, null, joined_late , null, M.client)
		if(ismob(new_mob))
			H = new_mob
			if(!joined_late)
				N.new_character = H
			else
				M = H

		SSpersistence.antag_rep_change[M.client.ckey] += job.GetAntagRep()

	to_chat(M, "<b>Вы проснулись как [job.title] Ещё один день в Зоне. <FONT color='purple'> Вы вдыхаете холодный воздух и осматриваете унылое окружение.</b>")
	if(job)
		to_chat(M, "Вы член фракции [job.faction_s] как [job.title], вы отвечаете перед [job.supervisors]. Особые обстоятельства могут изменить это.")
		to_chat(M, "<FONT color='blue'><B>[job.description]</b>")
		to_chat(M, "<FONT color='green'><b>Как член фракции [job.faction_s], ДЕЛАЙТЕ: [job.enforces]</b>")
		to_chat(M, "<FONT color='red'><b>Как член фракции [job.faction_s], НЕ ДЕЛАЙТЕ: [job.forbids]</b>")
		to_chat(M, "<FONT color='red'><b><h2><FONT color='blue'>Руководство по Войне: Военные могут стрелять в любого, кто приближается к КПП, они могут поступить иначе, если захотят. Не подходите к КПП, не спросив предварительно.<FONT color='black'> Долговцы могут стрелять в Свободовцев и наоборот. <FONT color='green'> Чистонебовцы могут стрелять в Ренегатов и наоборот.<FONT color='purple'>Монолитовцы остаются на Радаре и могут стрелять в любого, кто войдет на их территорию. Они уходят только тогда, когда Монолит захочет этого (вмешательство администратора). <FONT color='black'>Бандиты, Ренегаты или Монолитовцы считаются валидными для отстрела, и наоборот. По-настоящему робастные эскалируют конфликт перед пальбой. Либо стрелйте, либо обостряйте.<FONT color='red'> Не жалуйтесь на несправедливые смерти в deadchat, OOC или публичном канале ДС; свяжитесь с админами, и мы вам поможем. НЕ КЭМПИТЕ ЛАГЕРЬ. Мирные группировки могут быть расстреляны за кадром или способами, которые будут сочтены несправедливыми.</h2></b>")
		//to_chat(M, "<b>Как [job.title] вы слушаетесь лидера [job.faction_s].</b>")
		//job.radio_help_message(M)
		if(job.req_admin_notify)
			to_chat(M, "<b>Вы играете роль, которая требует постоянного взаимодействия с игрой. Если вы собираетесь отойти, то сообщите об этом администратору.</b>")
	//	if(CONFIG_GET(number/minimal_access_threshold))
	//		to_chat(M, "<FONT color='blue'><B>As this station was initially staffed with a [CONFIG_GET(flag/jobs_have_minimal_access) ? "full crew, only your job's necessities" : "skeleton crew, additional access may"] have been added to your ID card.</B></font>")
	if(ishuman(H))
		H.add_whitelist_items()

	if(job && H)
		job.after_spawn(H, M, joined_late) // note: this happens before the mob has a key! M will always have a client, H might not.

	return H


/datum/controller/subsystem/job/proc/setup_officer_positions()
	var/datum/job/J = SSjob.GetJob("Security Officer")
	if(!J)
		throw EXCEPTION("setup_officer_positions(): Security officer job is missing")

	var/ssc = CONFIG_GET(number/security_scaling_coeff)
	if(ssc > 0)
		if(J.spawn_positions > 0)
			var/officer_positions = min(12, max(J.spawn_positions, round(unassigned.len / ssc))) //Scale between configured minimum and 12 officers
			JobDebug("Setting open security officer positions to [officer_positions]")
			J.total_positions = officer_positions
			J.spawn_positions = officer_positions

	//Spawn some extra eqipment lockers if we have more than 5 officers
	var/equip_needed = J.total_positions
	if(equip_needed < 0) // -1: infinite available slots
		equip_needed = 12
	for(var/i=equip_needed-5, i>0, i--)
		if(GLOB.secequipment.len)
			var/spawnloc = GLOB.secequipment[1]
			new /obj/structure/closet/secure_closet/security/sec(spawnloc)
			GLOB.secequipment -= spawnloc
		else //We ran out of spare locker spawns!
			break


/datum/controller/subsystem/job/proc/LoadJobs()
	var/jobstext = file2text("[global.config.directory]/jobs.txt")
	for(var/datum/job/J in occupations)
		var/regex/jobs = new("[J.title]=(-1|\\d+),(-1|\\d+)")
		jobs.Find(jobstext)
		J.total_positions = text2num(jobs.group[1])
		J.spawn_positions = text2num(jobs.group[2])

/datum/controller/subsystem/job/proc/HandleFeedbackGathering()
	for(var/datum/job/job in occupations)
		var/high = 0 //high
		var/medium = 0 //medium
		var/low = 0 //low
		var/never = 0 //never
		var/banned = 0 //banned
		var/young = 0 //account too young
		for(var/mob/dead/new_player/player in GLOB.player_list)
			if(!(player.ready == PLAYER_READY_TO_PLAY && player.mind && !player.mind.assigned_role))
				continue //This player is not ready
			if(is_banned_from(player.ckey, job.title) || QDELETED(player))
				banned++
				continue
			if(!job.player_old_enough(player.client))
				young++
				continue
			if(job.required_playtime_remaining(player.client))
				young++
				continue
			if(player.client.prefs.GetJobDepartment(job, 1) & job.flag)
				high++
			else if(player.client.prefs.GetJobDepartment(job, 2) & job.flag)
				medium++
			else if(player.client.prefs.GetJobDepartment(job, 3) & job.flag)
				low++
			else never++ //not selected
		SSblackbox.record_feedback("nested tally", "job_preferences", high, list("[job.title]", "high"))
		SSblackbox.record_feedback("nested tally", "job_preferences", medium, list("[job.title]", "medium"))
		SSblackbox.record_feedback("nested tally", "job_preferences", low, list("[job.title]", "low"))
		SSblackbox.record_feedback("nested tally", "job_preferences", never, list("[job.title]", "never"))
		SSblackbox.record_feedback("nested tally", "job_preferences", banned, list("[job.title]", "banned"))
		SSblackbox.record_feedback("nested tally", "job_preferences", young, list("[job.title]", "young"))

/datum/controller/subsystem/job/proc/PopcapReached()
	var/hpc = CONFIG_GET(number/hard_popcap)
	var/epc = CONFIG_GET(number/extreme_popcap)
	if(hpc || epc)
		var/relevent_cap = max(hpc, epc)
		if((initial_players_to_assign - unassigned.len) >= relevent_cap)
			return 1
	return 0

/datum/controller/subsystem/job/proc/RejectPlayer(mob/dead/new_player/player)
	if(player.mind && player.mind.special_role)
		return
	if(PopcapReached())
		JobDebug("Popcap overflow Check observer located, Player: [player]")
	JobDebug("Player rejected :[player]")
	to_chat(player, "<b>You have failed to qualify for any job you desired.</b>")
	unassigned -= player
	player.ready = PLAYER_NOT_READY


/datum/controller/subsystem/job/Recover()
	set waitfor = FALSE
	var/oldjobs = SSjob.occupations
	sleep(20)
	for (var/datum/job/J in oldjobs)
		INVOKE_ASYNC(src, .proc/RecoverJob, J)

/datum/controller/subsystem/job/proc/RecoverJob(datum/job/J)
	var/datum/job/newjob = GetJob(J.title)
	if (!istype(newjob))
		return
	newjob.total_positions = J.total_positions
	newjob.spawn_positions = J.spawn_positions
	newjob.current_positions = J.current_positions

/datum/controller/subsystem/job/proc/SendToAtom(mob/M, atom/A, buckle)
	if(buckle && isliving(M) && istype(A, /obj/structure/chair))
		var/obj/structure/chair/C = A
		if(C.buckle_mob(M, FALSE, FALSE))
			return
	M.forceMove(get_turf(A))

/datum/controller/subsystem/job/proc/SendToLateJoin(mob/M, buckle = TRUE, rank = null)
	if(M.mind && M.mind.assigned_role && length(GLOB.jobspawn_overrides[M.mind.assigned_role])) //We're doing something special today.
		SendToAtom(M,pick(GLOB.jobspawn_overrides[M.mind.assigned_role]),FALSE)
		return

	if(latejoin_trackers.len)
		switch (rank)
			if ("Monolith")
				SendToAtom(M, safepick(latejoin_monolith), buckle)
			if ("Monolith Preacher")
				SendToAtom(M, safepick(latejoin_monolith_hegumen), buckle)
			if ("Military Soldier")
				SendToAtom(M, safepick(latejoin_army), buckle)
			if ("Military Spetsnaz")
				SendToAtom(M, safepick(latejoin_army_spetsnaz), buckle)
			if ("Military Commander")
				SendToAtom(M, safepick(latejoin_militarycommander), buckle)
			if ("Bandit")
				SendToAtom(M, safepick(latejoin_bandit), buckle)
			if ("Bandit Boss")
				SendToAtom(M, safepick(latejoin_banditboss), buckle)
			if ("Bandit Barman")
				SendToAtom(M, safepick(latejoin_bandit_barman), buckle)
			if ("Barman")
				SendToAtom(M, safepick(latejoin_barman), buckle)
			if ("Barman2")
				SendToAtom(M, safepick(latejoin_barman2), buckle)
			if ("Trader")
				SendToAtom(M, safepick(latejoin_trader), buckle)
			if ("Duty Soldier")
				SendToAtom(M, safepick(latejoin_duty), buckle)
			if ("Duty Lieutenant")
				SendToAtom(M, safepick(latejoin_duty_lieutenant), buckle)
			if ("Freedom Soldier")
				SendToAtom(M, safepick(latejoin_freedom), buckle)
			if ("Freedom Lieutenant")
				SendToAtom(M, safepick(latejoin_freedom_lieutenant), buckle)
			if ("Mercenary")
				SendToAtom(M, safepick(latejoin_mercenary), buckle)
			if ("Mercenary Commander")
				SendToAtom(M, safepick(latejoin_mercenarycommander), buckle)
			if ("Trader")
				SendToAtom(M, safepick(latejoin_trader), buckle)
			if ("Old Stalker")
				SendToAtom(M, safepick(latejoin_stalker), buckle)
			if ("Ecologist")
				SendToAtom(M, safepick(latejoin_ecologist), buckle)
			if ("Ecologist Guard")
				SendToAtom(M, safepick(latejoin_ecologistguard), buckle)
			if ("Chief Ecologist")
				SendToAtom(M, safepick(latejoin_chief_ecologist), buckle)
			if ("Clear Sky Soldier")
				SendToAtom(M, safepick(latejoin_clearsky), buckle)
			if ("Clear Sky Leader")
				SendToAtom(M, safepick(latejoin_clearsky_leader), buckle)
			if ("Renegade")
				SendToAtom(M, safepick(latejoin_renegade), buckle)
			else
				SendToAtom(M, pick(latejoin_trackers), buckle)
	else
		//bad mojo
		var/area/shuttle/arrival/A = GLOB.areas_by_type[/area/shuttle/arrival]
		if(A)
			//first check if we can find a chair
			var/obj/structure/chair/C = locate() in A
			if(C)
				SendToAtom(M, C, buckle)
				return
			else	//last hurrah
				var/list/avail = list()
				for(var/turf/T in A)
					if(!is_blocked_turf(T, TRUE))
						avail += T
				if(avail.len)
					SendToAtom(M, pick(avail), FALSE)
					return

		//pick an open spot on arrivals and dump em
		var/list/arrivals_turfs = shuffle(get_area_turfs(/area/shuttle/arrival))
		if(arrivals_turfs.len)
			for(var/turf/T in arrivals_turfs)
				if(!is_blocked_turf(T, TRUE))
					SendToAtom(M, T, FALSE)
					return
			//last chance, pick ANY spot on arrivals and dump em
			SendToAtom(M, arrivals_turfs[1], FALSE)
		else
			var/msg = "Невозможно отправить [M] в Зону!"
			message_admins(msg)
			CRASH(msg)


///////////////////////////////////
//Keeps track of all living heads//
///////////////////////////////////
/datum/controller/subsystem/job/proc/get_living_heads()
	. = list()
	for(var/mob/living/carbon/human/player in GLOB.alive_mob_list)
		if(player.stat != DEAD && player.mind && (player.mind.assigned_role in GLOB.command_positions))
			. |= player.mind


////////////////////////////
//Keeps track of all heads//
////////////////////////////
/datum/controller/subsystem/job/proc/get_all_heads()
	. = list()
	for(var/i in GLOB.mob_list)
		var/mob/player = i
		if(player.mind && (player.mind.assigned_role in GLOB.command_positions))
			. |= player.mind

//////////////////////////////////////////////
//Keeps track of all living security members//
//////////////////////////////////////////////
/datum/controller/subsystem/job/proc/get_living_sec()
	. = list()
	for(var/mob/living/carbon/human/player in GLOB.carbon_list)
		if(player.stat != DEAD && player.mind && (player.mind.assigned_role in GLOB.security_positions))
			. |= player.mind

////////////////////////////////////////
//Keeps track of all  security members//
////////////////////////////////////////
/datum/controller/subsystem/job/proc/get_all_sec()
	. = list()
	for(var/mob/living/carbon/human/player in GLOB.carbon_list)
		if(player.mind && (player.mind.assigned_role in GLOB.security_positions))
			. |= player.mind

/datum/controller/subsystem/job/proc/JobDebug(message)
	log_job_debug(message)

////////////////////////////////////////
//    Gives keypad codes roundstart   //
////////////////////////////////////////
/datum/controller/subsystem/job/proc/GiveKeypadCodes(mob/living/H, rank)
	for(var/obj/machinery/button/door/keypad/faction/K in all_faction_keypads)
		if(rank in K.allowed_jobs)
			H.mind.memory += "<BR><b>Вы вспомнили что код к [K.name] это [K.correctcode].</b>"
			H << "<span class = 'notice'>Вы вспомнили что код к [K.name] это [K.correctcode].</span>"
