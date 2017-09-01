music = "cirno"
encountertext = "A wild Cirno appears !"
nextwaves = {"nothing"}
wavetimer = 6.0
arenasize = {200, 130}

SetGlobal("DUNKED", false)
SetGlobal("FINAL", false)
SetGlobal("SPARE", false)
SetGlobal("INSULT", 0)
SetGlobal("TURN", 0)

enemies = {
"cirno"
}

enemypositions = {
{0, 0}
}

possible_attacks = {"icicle1", "icicle2", "block1", "block2", "block3", "block4", "bullet1", "bullet2", "bullet3", "laser1", "laser2"}

function EncounterStarting()
	Player.name = "konrads6"
	Player.lv = 1
	Player.hp = 20
	Inventory.AddCustomItems({"Snowman", "BundleTrash"}, {0, 3})
	Inventory.SetInventory({"Snowman", "BundleTrash"})
	State("ENEMYDIALOGUE")
	Audio.Stop()
end

function EnemyDialogueStarting()
	if GetGlobal("COUNTER") == 0 then
		enemies[1].SetVar('currentdialogue', {
		"[noskip][voice:cirno]Humans.",
		"[noskip][voice:cirno][func:SetSprite,cirno/proud]I heard that some of\nyou were SO smart the\nlast time we did this.\nChecking the HTML for\nthe link to the gibs\ninstead of fighting.",
		"[noskip][voice:cirno][func:SetSprite,cirno/base]...but.[w:10]\nNO ONE IS SMARTER\nTHAN ME !",
		"[noskip][voice:cirno]Because EYE !",
		"[noskip][voice:cirno][func:SetSprite,cirno/happy]Cirno ![func:StartMusic]",
		"[noskip][voice:cirno]The strongest of ALL\nthe fairies !",
		"[noskip][voice:cirno]WILL DEFEAT YOU HERE\nAND NOW !",
		"[noskip][voice:cirno]Have a taste of my\n[color:ff0000]Strongest Attack[color:000000] ![func:SetSprite,cirno/proud]"})
	elseif GetGlobal("COUNTER") == 1 then
		enemies[1].SetVar('currentdialogue', {
		"[noskip][voice:cirno][func:SetSprite,cirno/wink]Hehe...",
		"[noskip][voice:cirno][func:SetSprite,cirno/surprised]Wait, you're still\nalive ?!",
		"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful]Oh, i see...\nI'm supposed to target\nthis box thing...",
		"[noskip][voice:cirno]...what a weird game.",
		"[noskip][voice:cirno][func:SetSprite,cirno/annoyed]...anyway, erm...\n[func:SetSprite,cirno/happy]EYE'LL TAKE YOU DOWN !",
		"[func:State,ACTIONSELECT]"
		})
		SetGlobal("COUNTER", GetGlobal("COUNTER") + 1)
	elseif GetGlobal("COUNTER") == 4 then
		enemies[1].SetVar('currentdialogue', {
		"[noskip][voice:cirno][func:SetSprite,cirno/wink]1st letter is X"
		})
	elseif GetGlobal("COUNTER") == 5 then
		enemies[1].SetVar('currentdialogue', {
		"[noskip][voice:cirno][func:SetSprite,cirno/wink]2nd letter is X"
		})
	elseif GetGlobal("COUNTER") == 6 then
		enemies[1].SetVar('currentdialogue', {
		"[noskip][voice:cirno][func:SetSprite,cirno/wink]3rd letter is X"
		})
	elseif GetGlobal("COUNTER") == 7 then
		enemies[1].SetVar('currentdialogue', {
		"[noskip][voice:cirno][func:SetSprite,cirno/wink]4th letter is X"
		})
	elseif GetGlobal("COUNTER") == 8 then
		enemies[1].SetVar('currentdialogue', {
		"[noskip][voice:cirno][func:SetSprite,cirno/wink]Last letter is X"
		})
	elseif GetGlobal("TURN") == 14 then
		enemies[1].SetVar('currentdialogue', {
		"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful][func:beaten]Huff... puff...",
		"[noskip][voice:cirno][func:SetSprite,cirno/proud]Hehehe...\n[func:SetSprite,cirno/wink]You're not the kind of\nperson that will die\neasily, right ?",
		"[noskip][voice:cirno][func:SetSprite,cirno/proud]Even my deadliest\nattack didn't take you\ndown...\nI'm impressed.",
		"[noskip][voice:cirno][func:SetSprite,cirno/base]Alright, you won, i\nguess.\nI'm too lazy to FIGHT\nmore.",
		"[noskip][voice:cirno][func:SetSprite,cirno/wink]Hey, since the fight is\nover... maybe Yukari will\naccept to send you to\nGensokyo ?\nIt's a nice place.",
		"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful]...we'll have to convince\nher, though.",
		"[noskip][voice:cirno][func:SetSprite,cirno/base]Anyway, why don't you\ncome along ?"})
		SetGlobal("TURN", 15)
		SetGlobal("SPARE", true)
	end
end

function EnemyDialogueEnding()
	if GetGlobal("COUNTER") >= 2 then
		if GetGlobal("SPARE") == true then
			enemies[1].SetVar('comments', {"Cirno is sparing you."})
		elseif GetGlobal("TURN") >= 7 then
			enemies[1].SetVar('comments', {"Looks like she's having fun."})
		elseif GetGlobal("INSULT") == 0 then
			enemies[1].SetVar('comments', {
			"Eye'm the strongest !",
			"Cirno seems proud of herself.",
			"Smells like ice.",
			"Cirno.",
			"9.",
			"You'll get no sympathy from her.\n...well, not for now.",
			"The area is frozen now.\nThat's her attack.",
			"It's cold in there...",
			"You can feel ice crawling on\nyour back.",
			"She seems to think it's a game."})
		else
			enemies[1].SetVar('comments', {"Seems like you pissed her off."})
		end
	end
	if GetGlobal("INSULT") > 0 then
		enemies[1].SetVar('currentdialogue', {"[voice:cirno]What are you doing,\nstanding here like a\nsnowman ?\nGet out."})
	elseif GetGlobal("SPARE") == true then
		enemies[1].SetVar('currentdialogue', {"[voice:cirno][func:SetSprite,cirno/confused]What are you doing ?\n[func:SetSprite,cirno/happy]C'mere !"})
		enemies[1].SetVar('commands', {"Check"})
		enemies[1].Call("SetSprite","cirno/base")
	elseif GetGlobal("TURN") >= 7 then
		enemies[1].SetVar('currentdialogue', {"[voice:cirno][func:SetSprite,cirno/happy]Don't be scared,\nFIGHT me !\n[func:SetSprite,cirno/wink]I promise i won't\nhurt you."})
		enemies[1].Call("SetSprite","cirno/happy")
	else
		if GetGlobal("COUNTER") > 0 then
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
    elseif GetGlobal("COUNTER") == 0 then
	enemies[1].SetVar('comments', {"A wild Cirno appears !"})
	nextwaves = {"strongest"}
	elseif GetGlobal("COUNTER") == 1 then
	nextwaves = {"nothing"}
	elseif GetGlobal("COUNTER") == 2 then
	nextwaves = {"icicle1"}
	elseif GetGlobal("COUNTER") == 3 then
	nextwaves = {"block1"}
	elseif GetGlobal("COUNTER") == 4 then
	nextwaves = {"block2"}
	elseif GetGlobal("COUNTER") == 5 then
	nextwaves = {"bullet1"}
	elseif GetGlobal("COUNTER") == 6 then
	nextwaves = {"icicle1"}
	elseif GetGlobal("COUNTER") == 7 then
	nextwaves = {"laser1"}
	elseif GetGlobal("COUNTER") == 8 then
	nextwaves = {"bullet2"}
	elseif GetGlobal("COUNTER") == 9 then
    nextwaves = {"block3"}
    elseif GetGlobal("COUNTER") == 10 then
    nextwaves = {"icicle2"}
    elseif GetGlobal("COUNTER") == 11 then
    nextwaves = {"bullet3"}
    elseif GetGlobal("COUNTER") == 12 then
    nextwaves = {"laser2"}
    elseif GetGlobal("COUNTER") == 13 then
    nextwaves = {"block4"}
    else
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
    end
	SetGlobal("COUNTER", GetGlobal("COUNTER") + 1)
end

function DefenseEnding()
    encountertext = RandomEncounterText()
end

function HandleSpare()
	State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
	if ItemID == "SNOWMAN" then  --TODO find the other sprites for snowman so I can have it get smaller and smaller
		Player.Heal(15)
		BattleDialog("You take a bite\n out of the snowman[w:2]")
		enemies[1].SetVar('currentdialogue', {
		"[voice:cirno][func:SetSprite,cirno/surprised]You...\n[w:2][func:SetSprite,cirno/confused]You ate...\n[w:3]You ate my friend!\n[func:SetSprite,cirno/annoyed]"})
	elseif ItemID == "BUNDLETRASH" then
		BattleDialog("You offer Cirno some bundle trash you've been hoarding\n[func:SetSprite,cirno/confused][w:3]She ignores it")
	end

end
