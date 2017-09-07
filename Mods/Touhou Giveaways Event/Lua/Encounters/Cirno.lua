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

SelectedBase64Characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/='

function GetEncodingCharacters(stringTable)
	local b = ""
	for i=1,#stringTable do
		local str = stringTable[i]
		for c in str:gmatch"." do
			if (string.find(b, c) == nil) then
				b = b .. c
			end
		end
	end

	return b
end

--[[
function Encode(data, stringTable)
	local b = GetEncodingCharacters(stringTable)

	return ((data:gsub('.', function(x) 
		local r,b='',x:byte()
		for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
		return r;
	end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
		if (#x < 6) then return '' end
		local c=0
		for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
		return b:sub(c+1,c+1)
	end)..({ '', '==', '=' })[#data%3+1])
end
]]--

function Decode(data, stringTable)
	local b = GetEncodingCharacters(stringTable)

	data = string.gsub(data, '[^'..b..'=]', '')
	return (data:gsub('.', function(x)
		if (x == '=') then return '' end
		local r,f='',(b:find(x)-1)
		for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
		return r;
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if (#x ~= 8) then return '' end
		local c=0
		for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
		return string.char(c)
	end))
end

function DecodeWithState(data, state)
	return Decode(data, {tostring(Counter), tostring(Turn), state, tostring(enemies[1]), SelectedBase64Characters})
end

function DecodeSpecialWithState(data, state)
	return Decode(data, {tostring(Turn), state, tostring(enemies[1]), SelectedBase64Characters})
end

function EncounterStarting()
	Player.name = "konrads6"
	Player.lv = 3
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
				"[noskip][voice:cirno][func:SetSprite,cirno/happy]Cirno![func:StartMusic][w:60][next]",
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
				"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful]Oh, icey... I'm supposed to target this box thing...",
				"[noskip][voice:cirno]...what a weird game.",
				"[noskip][voice:cirno][func:SetSprite,cirno/annoyed]...anyway, erm... [func:SetSprite,cirno/happy]EYE'LL TAKE YOU DOWN!",
				"[func:State,ACTIONSELECT]" -- We're ending dialogue here, don't forget to bump Counter!
			})
			Counter = Counter + 1
		elseif Counter == 3 then
			local giveawayID = DecodeWithState("FBnxQyA=", newState)
			enemies[1].SetVar('currentdialogue', {
				"[voice:cirno][func:SetSprite,cirno/base]I have good news for you!",
				"[voice:cirno][func:SetSprite,cirno/happy]You've just unlocked access to the first giveaway!",
				"[voice:cirno][func:SetSprite,cirno/happy]Here is your prize: " .. giveawayID .. ".",
				"[voice:cirno][func:SetSprite,cirno/wink]But you probably want to keep playing for better ones!",
			})
		elseif Counter == 5 then
			local giveawayID = DecodeWithState("Rg31tNF=", newState)
			enemies[1].SetVar('currentdialogue', {
				"[voice:cirno][func:SetSprite,cirno/base]Stay determined! Here is something to keep you going!",
				"[voice:cirno][func:SetSprite,cirno/surprised]What could " .. giveawayID .. " be?",
				"[voice:cirno][func:SetSprite,cirno/wink]We still have at least 3 more!"
			})
		elseif Counter == 7 then
			local giveawayID = DecodeWithState("HNSlJBA=", newState)
			enemies[1].SetVar('currentdialogue', {
				"[voice:cirno][func:SetSprite,cirno/base]Is it giveaway time yet? Because I have something to give!",
				"[voice:cirno][func:SetSprite,cirno/surprised]Shiny " .. giveawayID .. ".",
				"[voice:cirno][func:SetSprite,cirno/proud]I wish you could die already."
			})
		elseif Counter == 9 then
			local giveawayID = DecodeWithState("aaSCQhA=", newState)
			enemies[1].SetVar('currentdialogue', {
				"[voice:cirno][func:SetSprite,cirno/thoughtful]Stop being so annoying, I'm starting to run out of giveaways.",
				"[voice:cirno][func:SetSprite,cirno/happy]But I need to reward you for your determination: " .. giveawayID .. ".",
				"[voice:cirno][func:SetSprite,cirno/wink]No way you'll survive this!",
			})
		elseif Counter == 11 then
			local giveawayID = DecodeWithState("Pbd3ph1=", newState)
			CurrentPitch = CurrentPitch + 0.1
			enemies[1].SetVar('currentdialogue', {
				"[voice:cirno][func:SetSprite,cirno/proud][func:PauseMusic]I'm proud of you!",
				"[voice:cirno][func:SetSprite,cirno/happy]You've survived long enough to claim the final giveaway!",
				"[voice:cirno][func:SetSprite,cirno/happy]Here is your grand prize: " .. giveawayID,
				"[voice:cirno][func:SetSprite,cirno/happy]I still have something else to tell you...",
				"[voice:cirno][func:SetSprite,cirno/wink][func:UpdateMusicPitch][func:UnpauseMusic]You're not going to survive this one!"
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
	if (CurrentSong != nil) then
		Audio.Pitch(CurrentPitch)
	end
end

function LoadMusic(fileName)
	if (CurrentSong != nil) then
		CurrentSong = fileName;
		Audio.LoadFile(fileName)
		StopMusic()
	end
end

function PauseMusic()
	if (CurrentSong != nil) then
		Audio.Pause()
	end
end

function StartMusic()
	if (CurrentSong != nil) then
		Audio.Play()
	end
end

function StopMusic()
	if (CurrentSong != nil) then
		Audio.Stop()
	end
end

function UnpauseMusic()
	if (CurrentSong != nil) then
		Audio.Unpause()
	end
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
		Misc.ShakeScreen(90, 5, true)
		BattleDialog("[noskip]You opened Pandora's box[w:30]\nYour nickname is now <redacted>.")
		Player.name = "redacted"
	elseif ItemID == "BUNDLE TRASH" then
		BattleDialog("[noskip]You offer Cirno some bundle trash you've been hoarding.[w:15]\nShe's not impressed.")
		CustomAttack = 1
	elseif ItemID == "MUSIC BOX" then
		if (CurrentSong == nil) then
			BattleDialog("[noskip]You broke it for good, it's no use.")
		else
			StopMusic()

			local diceRoll = math.random(7)
			if (diceRoll == 1 or diceRoll == 2) then
				local pitch = math.random() - 0.5

				if (diceRoll == 1) then
					CurrentPitch = CurrentPitch - pitch
				else
					CurrentPitch = CurrentPitch + pitch
				end

				BattleDialog("[noskip]You hit the button in hope that it'll work...[w:30][func:UpdateMusicPitch][func:StartMusic] It malfunctioned!")
			elseif (diceRoll == 7) then
				CurrentSong = nil
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
		if (Player.name == "redacted") and (Insult > 0) then
			local giveawayID = DecodeSpecialWithState("aMK4P2K=", GetCurrentState())
			BattleDialog("[noskip]Checking... Please wait![w:90]\nRequirements check passed.\nGiveaway: " .. giveawayID .. ".")
		else
			BattleDialog("[noskip]Checking... Please wait![w:90]\nRequirements check failed.\nSorry, rules are secret ;)")
		end
	end

end
