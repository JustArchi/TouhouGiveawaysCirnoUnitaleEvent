comments = {
	"A wild Cirno appears!"
}

commands = {"Check", "Flatter", "Insult", "Flirt", "Joke", "Question"}

randomdialogue = {
	"[voice:cirno][func:SetSprite,cirno/wink]Too scared to fight,\neh ?", 
	"[voice:cirno][func:SetSprite,cirno/annoyed]C'mon! Show me what\nyou've got, human!", 
	"[voice:cirno][func:SetSprite,cirno/confused]What are you doing ?\n[func:SetSprite,cirno/annoyed]Play with me already!",
	"[voice:cirno][func:SetSprite,cirno/happy]I'll freeze your body\nwhere it stands!\nSoon you'll be nicknamed\n\"Captain Underground\"!",
	"[voice:cirno][func:SetSprite,cirno/happy]PK Freeze!"
}

currentdialogue = {'Eat\nYour\nGreens'}
cancheck = false
--canspare = false

sprite = "cirno/base"
--monstersprite = nil
dialogbubble = "rightlarge"
name = "Cirno"
hp = 999
maxhp = 999
atk = 9
def = 9
xp = 9
gold = 9
--check = nil
unkillable = true
--canmove = true
--posx = 0
--posy = 0
--font = nil
--voice = nil

shotdown = 0
fightCount = 0
insult = false

function HandleAttack(attackstatus)
	if attackstatus == -1 then
		if GetGlobal("SPARE") == true then
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/wink]Hey, what are you\nwaiting for ?"}
		elseif GetGlobal("TURN") >= 7 then
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]Uh ?\nWhy did you hold back ?",
			"[voice:cirno][func:SetSprite,cirno/happy]Come on now!"}
		elseif GetGlobal("INSULT") == 0 then
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]Why are you looking\nat me that way ?"}
			SetGlobal("TURN", 7)
		else
			currentdialogue = {"[voice:cirno]You don't dare to\napproach ?","[voice:cirno]How lame."}
		end
    else
		if GetGlobal("TURN") == 7 then
			SetSprite('cirno/proud')
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/proud]HEHEHE!\nLook at that!\nNOT A SINGLE SCRATCH!\nEye'm the strongest!",
			"[voice:cirno][func:SetSprite,cirno/wink]Hey, come on!\nI know you can hit\nharder!\nDon't hold back on me!"}
			SetGlobal("TURN", 8)
		elseif GetGlobal("TURN") == 8 then
			SetSprite('cirno/proud')
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/wink]Hehe... i knew it!\nYou're the kind of\nperson who is\nconstantly pushing its\nown limits...",
			"[voice:cirno][func:SetSprite,cirno/happy]Now, hit even harder!\nWho cares if you break\nyour knife ?\nIt's just a toy after\nall!"}
			SetGlobal("TURN", 9)
		elseif GetGlobal("TURN") == 9 then
			SetSprite('cirno/surprised')
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]Wow! You're really\ngiving your all!",
			"[voice:cirno][func:SetSprite,cirno/proud]Hehe, of course you\nare.\n[func:SetSprite,cirno/wink]You have no choice\nif you want to stay\nalive, right ?"}
			SetGlobal("TURN", 10)
		elseif GetGlobal("TURN") == 10 then
			SetSprite('cirno/happy')
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]YAY!\nContinue that way,\nbud!"}
			SetGlobal("TURN", 11)
		elseif GetGlobal("TURN") == 11 then
			SetSprite('cirno/happy')
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/proud]Hehehehe...",
			"[voice:cirno][func:SetSprite,cirno/wink]Not bad.\nNot bad at all."}
			SetGlobal("TURN", 12)
		elseif GetGlobal("TURN") == 12 then
			SetSprite('cirno/surprised')
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]Huh ?\nYour knife is already\nbroken ?",
			"[voice:cirno][func:SetSprite,cirno/annoyed]Aww, what a fun killer...[w:10]\n[func:SetSprite,cirno/thoughtful]Dunno where you bought\nit, but it's shit. You\nprobably got broke.",
			"[voice:cirno][func:SetSprite,cirno/happy]But hey! Who cares ?",
			"[voice:cirno][func:SetSprite,cirno/wink]You can't attack, but\nyou can still dodge!\nGet ready for my\n[color:ff0000]Strongest Attack[color:000000]!",
			"[voice:cirno][func:SetSprite,cirno/annoyed]...for real, this time."}
			SetGlobal("FINAL", true)
			SetGlobal("TURN", 13)
		elseif GetGlobal("SPARE") == true then
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/proud]Hey, man...\nThe fight is over.",
			"[voice:cirno][func:SetSprite,cirno/wink]And your knife is\nbroken."}
		elseif GetGlobal("INSULT") == 0 then
			SetSprite('cirno/surprised')
			if fightCount >= 99 then
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/thoughtful]...you're really, REALLY\ndetermined, uh ?",
				"[voice:cirno][func:SetSprite,cirno/proud]But you know, the\ntruth is...\n[func:SetSprite,cirno/wink]Your knife won't really\nhurt me.\nLike, not at all.",
				"[voice:cirno][func:SetSprite,cirno/thoughtful]So, if you're trying\nto kill me...[w:10]\n[func:SetSprite,cirno/wink]Well, you probably\nwon't succeed\nanytime soon."}
			elseif fightCount > 0 then
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/thoughtful]You know...[w:10]\n[func:SetSprite,cirno/wink]You'll definitely break\nyour knife at this rate."}
			else
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]Eeeh ? What are you\ndoing with that knife ?"}
			end
		else
			currentdialogue = {"[voice:cirno]Tss...\nDo you really think a\nKNIFE can do a scratch\nto ME ?\nThink again, weakling."}
		end
		fightCount = (fightCount + 1)
	end
end

function StartMusic()
	Audio.Play()
end

function StopMusic()
	Audio.Stop()
end

function LoadMusic(filename)
	Audio.LoadFile(filename)
end

function PauseMusic()
	Audio.Pause()
end

function HandleCustomCommand(command)
	if command == "CHECK" then
		if GetGlobal("INSULT") == 0 then
			if GetGlobal("SPARE") == true then
				BattleDialog({"CIRNO 9 ATK 9 DEF\n[func:SetSprite,cirno/happy]You should come with her now."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/wink]Listen to the check\noption, for once."}
			elseif GetGlobal("TURN") >= 7 then
				BattleDialog({"CIRNO 9 ATK 9 DEF\n[func:SetSprite,cirno/annoyed]She must be really bored to\nplay with you like that..."})
				currentdialogue = {"[voice:cirno]OH, YOU, SHUT UP![w:10]\nWhat are you even\nuseful for anyway ?"}
			elseif fightCount > 0 then
				BattleDialog({"CIRNO 9 ATK 9 DEF\n[func:SetSprite,cirno/proud]Her ice body renders her\ninvulnerable to attack. Somehow."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]That's because eye'm\nthe strongest!"}
			else
				BattleDialog({"CIRNO 9 ATK 9 DEF\n[func:SetSprite,cirno/proud]The strongest fairy.\n[func:SetSprite,cirno/annoyed]...or so she says."})
				currentdialogue = {"[voice:cirno]Why are you looking at\nmy stats ?"}
			end
		else
			BattleDialog({"CIRNO 9 ATK 9 DEF\nNow she really seems to want\nyou dead."})
			currentdialogue = {"[voice:cirno]No shit Sherlock."}
		end
    elseif command == "FLATTER" then
		if GetGlobal("INSULT") > 0 then
			BattleDialog({"You try to flatter Cirno.\nShe don't listen to you."})
			currentdialogue = {"[voice:cirno]You won't get away\nwith this. DIE!"}
		else
			if GetGlobal("TURN") == 0 then
				BattleDialog({"You tell Cirno you find her\npatterns deadly."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]Oh, really ?", "[voice:cirno][func:SetSprite,cirno/proud]Hehe, of course they\nare!\nI'm the strongest fairy\nafter all!"}
				SetGlobal("TURN", 1)
			elseif GetGlobal("TURN") == 1 then
				BattleDialog({"You tell Cirno she's the most\npowerful being you've faced\nin the whole game."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]HEHEHE YES, THAT'S\nRIGHT!\nEye'm the strongest!"}
				SetGlobal("TURN", 2)
			elseif GetGlobal("TURN") == 2 then
				BattleDialog({"You tell Cirno you've seen\nevery timeline, and she's\nby far the strongest character."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/proud]HEHEHEHEHE...", "[voice:cirno][func:SetSprite,cirno/thoughtful]...i don't get it."}
				SetGlobal("TURN", 3)
			else
				BattleDialog({"Seems like you've already\nflattered her enough."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]EYE'M THE STRONGEST!"}
			end
		end
    elseif command == "INSULT" then
		if insult == true then
			BattleDialog({"You were about to insult Cirno\nagain, but you realized it was\na bad idea."})
		elseif GetGlobal("TURN") >= 7 then
			BattleDialog({"You insult Cirno.\nBut she's too busy FIGHTing to\npay attention."})
		else
			if GetGlobal("INSULT") == 0 then
				BattleDialog({"You tell Cirno she's ugly.\nShe doesn't seem to share your\nopinion."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/annoyed]Hey!\nYou take that back!"}
				SetGlobal("INSULT", 1)
			elseif GetGlobal("INSULT") == 1 then
				BattleDialog({"You tell Cirno she's dumb.\nNow she seems really angry."})
				currentdialogue = {"[voice:cirno]Alright you won,\nPREPARE TO DIE!"}
				SetGlobal("INSULT", 2)
			elseif GetGlobal("INSULT") == 2 then
				BattleDialog({"You tell Cirno she's weak.\nYou feel like you've just done\na huge mistake."})
				currentdialogue = {"[voice:cirno]Oh really ?",
				"[noskip][voice:cirno][func:SetSprite,cirno/proud][func:StopMusic]...heh. You really WANT\nme to kill you, don't\nyou ?",
				"[noskip][voice:cirno]Alright then...\n[func:SetSprite,cirno/wink]Goodbye!"}
				SetGlobal("DUNKED", true)
			end
		end
    elseif command == "FLIRT" then
		if GetGlobal("TURN") >= 7 then
			BattleDialog({"You try to flirt with Cirno, but\nit still doesn't work."})
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]I don't understand...",
			"[voice:cirno][func:SetSprite,cirno/thoughtful]...humans are weird."}
		elseif GetGlobal("INSULT") == 0 then
			BattleDialog({"You try to flirt with Cirno, but\nit doesn't seem to work well."})
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]Eeh, what ?"}
		else
			BattleDialog({"You try to flirt with Cirno, but\nit doesn't seem to work well."})
			currentdialogue = {"[voice:cirno]What are you even\ntalking about ?"}
		end
	elseif command == "JOKE" then
		if GetGlobal("TURN") >= 7 then
			BattleDialog({"You tell Cirno a joke extremely\neasy to get.\nShe get it."})
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/thoughtful]...wow, do all humans\nhave your sense of\nhumor ?",
			"[voice:cirno][func:SetSprite,cirno/happy]Because it's great!"}
		elseif GetGlobal("INSULT") == 0 then
			BattleDialog({"You tell Cirno a joke about ice.\nShe doesn't seem to get it."})
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/annoyed]Of course i get it!",
			"[voice:cirno][func:SetSprite,cirno/thoughtful]...i don't get it."}
		else
			BattleDialog({"You tell Cirno you were just\nkidding. As weird as it may\nseem, it seems to work."})
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/surprised]Oh, you were joking!",
			"[voice:cirno][func:SetSprite,cirno/proud]Hehe, i knew it!\n[func:SetSprite,cirno/happy]Nobody would seriously\nsay that kind of things\nto me!",
			"[voice:cirno][func:SetSprite,cirno/wink]...okay, you have a\nweird sense of humor,\nbut i forgive you.",
			"[voice:cirno][func:SetSprite,cirno/base]This time."}
			SetGlobal("INSULT", 0)
			insult = true
		end
	elseif command == "QUESTION" then
		if GetGlobal("INSULT") == 0 then
			if GetGlobal("TURN") < 3 then
				BattleDialog({"You ask Cirno what she prefer\nbetween a giant douche and\na turd sandwich."})
				currentdialogue = {"[noskip][voice:cirno][func:SetSprite,cirno/thoughtful][func:PauseMusic]...", 
				"[noskip][voice:cirno].[w:4].[w:4].",
				"[noskip][voice:cirno].[w:10].[w:10].",
				"[noskip][voice:cirno][func:SetSprite,cirno/base][func:StartMusic]...i don't get it."}
			elseif GetGlobal("TURN") == 3 then
				BattleDialog({"You ask Cirno the secret of her\npower."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]Hum ?[w:10]\n[func:SetSprite,cirno/happy]Oh, but it's simple!",
				"[voice:cirno][func:SetSprite,cirno/thoughtful]...i don't know."}
				SetGlobal("TURN", 4)
			elseif GetGlobal("TURN") == 4 then
				BattleDialog({"You ask Cirno where she came\nfrom."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/thoughtful]Hum...[w:10]\nI think it's a parallel\nuniverse or something...\nIt's called Gensokyo.",
				"[voice:cirno][func:SetSprite,cirno/base]...you should ask to\nYukari, she's the one\nwho brought me here![w:10]\n[func:SetSprite,cirno/thoughtful]In one of her weird\nportals...",
				"[voice:cirno][func:SetSprite,cirno/happy]Hey, you know what ?\n[func:SetSprite,cirno/wink]Maybe after the fight,\nYukari will accept to\nsend you to Gensokyo!"}
				SetGlobal("TURN", 5)
			elseif GetGlobal("TURN") == 5 then
				BattleDialog({"You ask Cirno who Yukari is."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/thoughtful]Hum... she's some kind\nof weird youkai...\n[func:SetSprite,cirno/base]She's nice, even if\nshe can be scary\nsometimes.",
				"[voice:cirno][func:SetSprite,cirno/proud]But of course, she's\nfar from being as\nstrong as me.",
				"[voice:cirno][func:SetSprite,cirno/base]...i think."}
				SetGlobal("TURN", 6)
			elseif GetGlobal("TURN") == 6 then
				BattleDialog({"You ask Cirno why she is still\nFIGHTing."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/surprised]Eeeeh ?\nIsn't it obvious ?",
				"[voice:cirno][func:SetSprite,cirno/happy]It's fun!",
				"[voice:cirno][func:SetSprite,cirno/wink]Come on now!\nFIGHT me, and give all\nyou have!"}
				SetGlobal("TURN", 7)
			else
				BattleDialog({"You don't have any question to\nask her anymore."})
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]What are you waiting\nfor ?",
				"[voice:cirno][func:SetSprite,cirno/happy]FIGHT me!"}
			end
		else
			BattleDialog({"You ask Cirno a question.\nShe doesn't answer you."})
			currentdialogue = {"[voice:cirno]Just die already!"}
		end
	end
end

function beaten()
	Audio.Stop()
	canspare = true
end

function die()
	Kill()
end