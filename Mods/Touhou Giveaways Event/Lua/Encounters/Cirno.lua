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

Dunked = false
Final = false
Spare = false
Insult = 0
Turn = 0

AvailableAttacks = {"icicle1", "icicle2", "block1", "block2", "block3", "block4", "bullet1", "bullet2", "bullet3", "laser1", "laser2"}
AvailableItems = {"Snowman", "Pandora's box", "Bundle trash", "Music box", "Check Reqs"}
AvailableItemTypes = {0, 0, 0, 3, 3}
AvailableSongs = {"cirno", "megalovania", "one"}

CurrentPitch = 1
CurrentSong = music

Counter = 0
CustomAttack = 0
SnowmanHP = 3

function EncounterStarting()
	Player.name = "konrads6"
	Player.lv = 3
	Player.hp = 28
	Inventory.AddCustomItems(AvailableItems, AvailableItemTypes)
	Inventory.SetInventory(AvailableItems)
	SetPPCollision(true)
	Audio.Stop()
	State("ENEMYDIALOGUE")
	--State("ACTIONSELECT")
	--State("DEFENDING")
end

function EnteringState(newState, oldState)
	--DEBUG("EnteringState() " .. oldState .. " -> " .. newState)
	if newState == "ENEMYDIALOGUE" then
		if (CustomAttack == 1) then
			enemies[1].SetVar('currentdialogue', {
				"[voice:cirno][func:SetSprite,cirno/annoyed]I'll show you where you can put this!"
			})
		elseif Counter == 0 then
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
				"[func:State,ACTIONSELECT]" -- We're ending dialogue here, don't forget to bump Counter!
			})
			Counter = Counter + 1
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
		elseif Turn == 14 then
			enemies[1].SetVar('currentdialogue', {
				"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful][func:beaten]Huff... puff...",
				"[noskip][voice:cirno][func:SetSprite,cirno/proud]Hehehe... [func:SetSprite,cirno/wink]You're not the kind of person that will die easily, right?",
				"[noskip][voice:cirno][func:SetSprite,cirno/proud]Even my deadliest attack didn't take you down... I'm impressed.",
				"[noskip][voice:cirno][func:SetSprite,cirno/base]Alright, you won, i guess. I'm too lazy to FIGHT more.",
				"[noskip][voice:cirno][func:SetSprite,cirno/wink]Hey, since the fight is over... maybe Yukari will accept to send you to Gensokyo? It's a nice place.",
				"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful]...we'll have to convince her, though.",
				"[noskip][voice:cirno][func:SetSprite,cirno/base]Anyway, why don't you come along?"
			})
			Turn = 15
			Spare = true
		end
	elseif (newState == "DEFENDING") then
		if Counter >= 2 then
			if Spare == true then
				enemies[1].SetVar('comments', {"Cirno is sparing you."})
			elseif Turn >= 7 then
				enemies[1].SetVar('comments', {"Looks like she's having fun."})
			elseif Insult > 0 then
				enemies[1].SetVar('comments', {"Seems like you pissed her off."})
			end
		end

		if Insult > 0 then
			enemies[1].SetVar('currentdialogue', {"[voice:cirno]What are you doing, standing here like a snowman? Get out."})
		elseif Spare == true then
			enemies[1].SetVar('currentdialogue', {"[voice:cirno][func:SetSprite,cirno/confused]What are you doing? [func:SetSprite,cirno/happy]C'mere!"})
			enemies[1].SetVar('commands', {"Check"})
			enemies[1].Call("SetSprite","cirno/base")
		elseif Turn >= 7 then
			enemies[1].SetVar('currentdialogue', {"[voice:cirno][func:SetSprite,cirno/happy]Don't be scared, FIGHT me! [func:SetSprite,cirno/wink]I promise i won't hurt you."})
			enemies[1].Call("SetSprite","cirno/happy")
		else
			if Counter > 0 then
				enemies[1].Call("SetSprite","cirno/base")
			end
		end

		if Turn == 8 then
			enemies[1].SetVar("def", 0)
		elseif Turn == 9 then
			enemies[1].SetVar("def", -50)
		elseif Turn == 10 then
			enemies[1].SetVar("def", -1000)
		elseif Turn == 11 then
			enemies[1].SetVar("def", -50000)
		elseif Turn > 11 then
			enemies[1].SetVar("def", 999999999)
		end

		if (CustomAttack == 1) then
			nextwaves = {"trashu"}
			CustomAttack = 0
			return -- Don't increment Counter!
		elseif Dunked == true then
			nextwaves = {"dunk"}
		elseif Spare == true then
			nextwaves = {"nothing"}
		elseif Final == true then
			nextwaves = {"truestrongest"}
		elseif Counter == 0 then
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
			nextwaves = { AvailableAttacks[math.random(#AvailableAttacks)] }
		end

		Counter = Counter + 1
	elseif (oldState == "DEFENDING") then
		if (Counter > 1) then
			encountertext = RandomEncounterText()
		end
	end
end

function HandleSpare()
	State("ENEMYDIALOGUE")
end

function UpdateMusicPitch()
	Audio.Pitch(CurrentPitch)
end

function LoadMusic(fileName)
	CurrentSong = fileName;
	Audio.LoadFile(fileName)
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
	if ItemID == "SNOWMAN" then
		if (SnowmanHP >= 3) then
			BattleDialog("You take a bite out of the snowman.[w:15]\nYou recovered 15 HP.")
			Player.Heal(15)
			Inventory.NoDelete = true
		elseif (SnowmanHP == 2) then
			BattleDialog("You take another bite out of the snowman.[w:15]\nYou recovered 13 HP.")
			Player.Heal(13)
			Inventory.NoDelete = true
		elseif (SnowmanHP == 1) then
			BattleDialog("You stuff the last of the snowman into your mouth.[w:15]\nYou recovered 11 HP.")
			Player.Heal(11)
		else
			-- Should never happen
			BattleDialog("The snowman has melted.")
		end

		SnowmanHP = SnowmanHP - 1;
	elseif (ItemID == "PANDORA'S BOX") then
		BattleDialog("[noskip]You opened Pandora's box[w:30]\nYour nickname is now <redacted>.")
		Player.name = "redacted"
	elseif ItemID == "BUNDLE TRASH" then
		BattleDialog("[noskip]You offer Cirno some bundle trash you've been hoarding.[w:15]\nShe's not impressed.")
		CustomAttack = 1
	elseif ItemID == "MUSIC BOX" then
		if (CurrentSong == nil) then
			BattleDialog("[noskip]You broke it for good, it's no use.")
		else
			local diceRoll = math.random(7)
			local pitch = math.random() - 0.5
			if (diceRoll == 1 or diceRoll == 2) then
				if (diceRoll == 1) then
					CurrentPitch = CurrentPitch - pitch
				else
					CurrentPitch = CurrentPitch + pitch
				end

				StopMusic()
				BattleDialog("[noskip]You hit the button in hope that it'll work...[w:30][func:UpdateMusicPitch][func:StartMusic] It malfunctioned!")
			elseif (diceRoll == 7) then
				CurrentSong = nil
				StopMusic()
				BattleDialog("[noskip]You hit the button in hope that it'll work...[w:30] Congratulations! You broke it.")
			else
				local randomSong = CurrentSong

				while (randomSong == CurrentSong) do
					randomSong = AvailableSongs[math.random(#AvailableSongs)]
				end

				LoadMusic(randomSong)
				BattleDialog("[noskip]You hit the button in hope that it'll work...[w:30][func:StartMusic] It did!")
			end
		end
	elseif (ItemID == "CHECK REQS") then
		BattleDialog("[noskip]Checking... Please wait![w:90]\nRequirements check failed.\nSorry, rules are secret ;)")
	end

end
