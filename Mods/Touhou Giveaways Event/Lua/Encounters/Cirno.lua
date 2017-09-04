music = "megalovania"
encountertext = "A wild Cirno appears!"
nextwaves = {"strongest"}
wavetimer = 6.0
arenasize = {200, 130}

enemies = {
	"cirno"
}

enemypositions = {
	{0, 0}
}

autolinebreak = true
--playerskipdocommand = false
--unescape = false
--flee = true
--revive = false
--deathtext = nil
--deathmusic = nil

SetGlobal("DUNKED", false)
SetGlobal("FINAL", false)
SetGlobal("SPARE", false)
SetGlobal("INSULT", 0)
SetGlobal("TURN", 0)

available_attacks = {"icicle1", "icicle2", "block1", "block2", "block3", "block4", "bullet1", "bullet2", "bullet3", "laser1", "laser2"}
available_items = {"Snowman", "BundleTrash", "MusicBox", "CheckReqs"}
available_songs = {"cirno", "megalovania", "one"}

current_pitch = 1
current_song = music

Counter = 0

function EncounterStarting()
	DEBUG("EncounterStarting()")
	Player.name = "konrads6"
	Player.lv = 3
	Player.hp = 28
	Inventory.AddCustomItems(available_items, {0, 3, 3, 3})
	Inventory.SetInventory(available_items)
	SetPPCollision(true)
	Audio.Stop()
	--State("ACTIONSELECT")
	State("ENEMYDIALOGUE")
end

function EnemyDialogueStarting()
	DEBUG("EnemyDialogueStarting() Counter: " .. Counter)
	if Counter == 0 then
		enemies[1].SetVar('currentdialogue', {
			"[noskip][voice:cirno]SteamGifts users.",
			"[noskip][voice:cirno][func:SetSprite,cirno/proud]I heard that some of you were SO smart the last time we did this.",
			"[noskip][voice:cirno][func:SetSprite,cirno/wink]Checking the HTML for the link to the gibs instead of fighting.",
			"[noskip][voice:cirno][func:SetSprite,cirno/base]...but.[w:10] NO ONE IS SMARTER THAN ME!",
			"[noskip][voice:cirno]Because EYE!",
			"[noskip][voice:cirno][func:SetSprite,cirno/happy]Cirno![func:StartMusic][w:45][next]",
			"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful]Wait a second, this doesn't sound right...[w:90][next]",
			"[noskip][voice:cirno][func:SetSprite,cirno/annoyed]Ekhm...[func:LoadMusic,cirno][w:30][next]",
			"[noskip][voice:cirno][func:SetSprite,cirno/happy]Cirno![func:StartMusic]",
			"[noskip][voice:cirno]The strongest of ALL the fairies!",
			"[noskip][voice:cirno][color:ff0000]WILL DEFEAT YOU HERE AND NOW![color:000000]",
			"[noskip][voice:cirno]Have a taste of my [color:ff0000]Strongest Attack[color:000000]![func:SetSprite,cirno/proud]"
		})
	elseif Counter == 1 then
		enemies[1].SetVar('currentdialogue', {
			"[noskip][voice:cirno][func:SetSprite,cirno/wink]Hehe...",
			"[noskip][voice:cirno][func:SetSprite,cirno/surprised]Wait, you're still alive?!",
			"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful]Oh, i see... I'm supposed to target this box thing...",
			"[noskip][voice:cirno]...what a weird game.",
			"[noskip][voice:cirno][func:SetSprite,cirno/annoyed]...anyway, erm... [func:SetSprite,cirno/happy]EYE'LL TAKE YOU DOWN!",
			"[func:State,ACTIONSELECT]" -- We're ending dialogue here, don't forget to bump counter!
		})
		Counter = Counter + 1
	elseif Counter == 2 then
		enemies[1].SetVar('comments', {
			"Eye'm the strongest!",
			"Cirno seems proud of herself.",
			"Smells like ice.",
			"Cirno.",
			"9.",
			"You'll get no sympathy from her.\n...well, not for now.",
			"The area is frozen now.\nThat's her attack.",
			"It's cold in there...",
			"You can feel ice crawling on\nyour back.",
			"She seems to think it's a game."
		})
	elseif Counter == 4 then
		enemies[1].SetVar('currentdialogue', {
			"[noskip][voice:cirno][func:SetSprite,cirno/wink]1st letter is X"
		})
	elseif Counter == 5 then
		enemies[1].SetVar('currentdialogue', {
			"[noskip][voice:cirno][func:SetSprite,cirno/wink]2nd letter is X"
		})
	elseif Counter == 6 then
		enemies[1].SetVar('currentdialogue', {
			"[noskip][voice:cirno][func:SetSprite,cirno/wink]3rd letter is X"
		})
	elseif Counter == 7 then
		enemies[1].SetVar('currentdialogue', {
			"[noskip][voice:cirno][func:SetSprite,cirno/wink]4th letter is X"
		})
	elseif Counter == 8 then
		enemies[1].SetVar('currentdialogue', {
			"[noskip][voice:cirno][func:SetSprite,cirno/wink]Last letter is X"
		})
	elseif GetGlobal("TURN") == 14 then
		enemies[1].SetVar('currentdialogue', {
			"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful][func:beaten]Huff... puff...",
			"[noskip][voice:cirno][func:SetSprite,cirno/proud]Hehehe... [func:SetSprite,cirno/wink]You're not the kind of person that will die easily, right?",
			"[noskip][voice:cirno][func:SetSprite,cirno/proud]Even my deadliest attack didn't take you down... I'm impressed.",
			"[noskip][voice:cirno][func:SetSprite,cirno/base]Alright, you won, i guess. I'm too lazy to FIGHT more.",
			"[noskip][voice:cirno][func:SetSprite,cirno/wink]Hey, since the fight is over... maybe Yukari will accept to send you to Gensokyo? It's a nice place.",
			"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful]...we'll have to convince her, though.",
			"[noskip][voice:cirno][func:SetSprite,cirno/base]Anyway, why don't you come along?"
		})
		SetGlobal("TURN", 15)
		SetGlobal("SPARE", true)
	end
end

function EnemyDialogueEnding()
	DEBUG("EnemyDialogueEnding() Counter: " .. Counter .. " | Turn: " .. GetGlobal("TURN"))
	if Counter >= 2 then
		if GetGlobal("SPARE") == true then
			enemies[1].SetVar('comments', {"Cirno is sparing you."})
		elseif GetGlobal("TURN") >= 7 then
			enemies[1].SetVar('comments', {"Looks like she's having fun."})
		elseif GetGlobal("INSULT") > 0 then
			enemies[1].SetVar('comments', {"Seems like you pissed her off."})
		end
	end

	if GetGlobal("INSULT") > 0 then
		enemies[1].SetVar('currentdialogue', {"[voice:cirno]What are you doing, standing here like a snowman? Get out."})
	elseif GetGlobal("SPARE") == true then
		enemies[1].SetVar('currentdialogue', {"[voice:cirno][func:SetSprite,cirno/confused]What are you doing? [func:SetSprite,cirno/happy]C'mere!"})
		enemies[1].SetVar('commands', {"Check"})
		enemies[1].Call("SetSprite","cirno/base")
	elseif GetGlobal("TURN") >= 7 then
		enemies[1].SetVar('currentdialogue', {"[voice:cirno][func:SetSprite,cirno/happy]Don't be scared, FIGHT me! [func:SetSprite,cirno/wink]I promise i won't hurt you."})
		enemies[1].Call("SetSprite","cirno/happy")
	else
		if Counter > 0 then
			enemies[1].Call("SetSprite","cirno/base")
		end
	end

	if GetGlobal("TURN") == 8 then
		enemies[1].SetVar("def", 0)
	elseif GetGlobal("TURN") == 9 then
		enemies[1].SetVar("def", -50)
	elseif GetGlobal("TURN") == 10 then
		enemies[1].SetVar("def", -1000)
	elseif GetGlobal("TURN") == 11 then
		enemies[1].SetVar("def", -50000)
	elseif GetGlobal("TURN") > 11 then
		enemies[1].SetVar("def", 999999999)
	end

	if GetGlobal("DUNKED") == true then
		nextwaves = {"dunk"}
	elseif GetGlobal("SPARE") == true then
		nextwaves = {"nothing"}
	elseif GetGlobal("FINAL") == true then
		nextwaves = {"truestrongest"}
	elseif Counter == 0 then
		enemies[1].SetVar('comments', {"A wild Cirno appears!"})
		nextwaves = {"strongest"}
	elseif Counter == 1 then
		nextwaves = {"nothing"}
	elseif Counter == 2 then
		nextwaves = {"icicle1"}
	elseif Counter == 3 then
		nextwaves = {"block1"}
	elseif Counter == 4 then
		nextwaves = {"block2"}
	elseif Counter == 5 then
		nextwaves = {"bullet1"}
	elseif Counter == 6 then
		nextwaves = {"icicle1"}
	elseif Counter == 7 then
		nextwaves = {"laser1"}
	elseif Counter == 8 then
		nextwaves = {"bullet2"}
	elseif Counter == 9 then
		nextwaves = {"block3"}
	elseif Counter == 10 then
		nextwaves = {"icicle2"}
	elseif Counter == 11 then
		nextwaves = {"bullet3"}
	elseif Counter == 12 then
		nextwaves = {"laser2"}
	elseif Counter == 13 then
		nextwaves = {"block4"}
	else
		nextwaves = { available_attacks[math.random(#available_attacks)] }
	end

	Counter = Counter + 1
end

function DefenseEnding()
	encountertext = RandomEncounterText()
end

function HandleSpare()
	State("ENEMYDIALOGUE")
end

function UpdateMusicPitch()
	Audio.Pitch(current_pitch)
end

function LoadMusic(filename)
	Audio.LoadFile(filename)
	StopMusic()
end

function PauseMusic()
	Audio.Pause()
end

function StartMusic()
	Audio.Play()
end

function StopMusic()
	Audio.Stop()
end

function UnpauseMusic()
	Audio.Unpause()
end

function HandleItem(ItemID)
	if ItemID == "SNOWMAN" then  --TODO find the other sprites for snowman so I can have it get smaller and smaller
		Player.Heal(15)
		BattleDialog("You take a bite  out of the snowman[w:2]")
		enemies[1].SetVar('currentdialogue', {
		"[voice:cirno][func:SetSprite,cirno/surprised]You... [w:2][func:SetSprite,cirno/confused]You ate... [w:3]You ate my friend! [func:SetSprite,cirno/annoyed]"})
	elseif ItemID == "BUNDLETRASH" then
		BattleDialog("You offer Cirno some bundle trash you've been hoarding [func:SetSprite,cirno/confused][w:3]She ignores it")
	elseif ItemID == "MUSICBOX" then
		local diceRoll = math.random(6)
		local pitch = math.random() - 0.5
		if (diceRoll == 1 or diceRoll == 2) then
			if (diceRoll == 1) then
				current_pitch = current_pitch - pitch
			else
				current_pitch = current_pitch + pitch
			end

			StopMusic()
			BattleDialog("[noskip]You hit the button in hope that it'll work...[w:30][func:UpdateMusicPitch][func:StartMusic] It malfunctioned!")
		else
			local random_song = current_song

			while (random_song == current_song) do
				random_song = available_songs[math.random(#available_songs)]
			end

			current_song = random_song;
			LoadMusic(current_song)

			BattleDialog("[noskip]You hit the button in hope that it'll work...[w:30][func:StartMusic] It did!")
		end
	elseif (ItemID == "CHECKREQS") then
		BattleDialog("[noskip]Checking... Please wait![w:90]\nRequirements check failed.\nSorry, rules are secret ;)")
	end

end
