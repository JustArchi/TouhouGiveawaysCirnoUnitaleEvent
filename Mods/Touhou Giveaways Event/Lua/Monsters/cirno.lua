comments = {
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
}

commands = {"Check", "Flatter", "Insult", "Flirt", "Joke", "Question"}

randomdialogue = {
	"[voice:cirno][func:SetSprite,cirno/wink]Too scared to fight, eh?", 
	"[voice:cirno][func:SetSprite,cirno/annoyed]C'mon! Show me what you've got, human!", 
	"[voice:cirno][func:SetSprite,cirno/confused]What are you doing? [func:SetSprite,cirno/annoyed]Play with me already!",
	"[voice:cirno][func:SetSprite,cirno/happy]I'll freeze your body where it stands! You're no match for me!",
	"[voice:cirno][func:SetSprite,cirno/happy]PK Freeze!"
}

currentdialogue = {"EYE AM THE STRONGEST!"}
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

FightCount = 0
Insult = false

function HandleAttack(attackstatus)
	if attackstatus == -1 then
		if Encounter.GetVar("Spare") == true then
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/wink]Hey, what are you waiting for?"
			}
		elseif Encounter.GetVar("Turn") >= 7 then
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/confused]Uh? Why did you hold back?",
				"[voice:cirno][func:SetSprite,cirno/happy]Come on now!"
			}
		elseif Encounter.GetVar("Insult") == 0 then
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/confused]Why are you looking at me that way?"
			}

			Encounter.SetVar("Turn", 7)
		else
			currentdialogue = {
				"[voice:cirno]You don't dare to approach?","[voice:cirno]How lame."
			}
		end
    else
		if Encounter.GetVar("Turn") == 7 then
			SetSprite('cirno/proud')
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/proud]HEHEHE! Look at that! NOT A SINGLE SCRATCH! Eye'm the strongest!",
				"[voice:cirno][func:SetSprite,cirno/wink]Hey, come on! I know you can hit harder! Don't hold back on me!"
			}

			Encounter.SetVar("Turn", 8)
		elseif Encounter.GetVar("Turn") == 8 then
			SetSprite('cirno/proud')
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/wink]Hehe... i knew it! You're the kind of person who is constantly pushing its own limits...",
				"[voice:cirno][func:SetSprite,cirno/happy]Now, hit even harder! Who cares if you break your knife? It's just a toy after all!"
			}

			Encounter.SetVar("Turn", 9)
		elseif Encounter.GetVar("Turn") == 9 then
			SetSprite('cirno/surprised')
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/happy]Wow! You're really giving your all!",
				"[voice:cirno][func:SetSprite,cirno/proud]Hehe, of course you are. [func:SetSprite,cirno/wink]You have no choice if you want to stay alive, right?"
			}

			Encounter.SetVar("Turn", 10)
		elseif Encounter.GetVar("Turn") == 10 then
			SetSprite('cirno/happy')
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/happy]YAY! Continue that way, bud!"
			}

			Encounter.SetVar("Turn", 11)
		elseif Encounter.GetVar("Turn") == 11 then
			SetSprite('cirno/happy')
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/proud]Hehehehe...",
				"[voice:cirno][func:SetSprite,cirno/wink]Not bad. Not bad at all."
			}

			Encounter.SetVar("Turn", 12)
		elseif Encounter.GetVar("Turn") == 12 then
			SetSprite('cirno/surprised')
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/confused]Huh? Your knife is already broken?",
				"[voice:cirno][func:SetSprite,cirno/annoyed]Aww, what a fun killer...[w:10] [func:SetSprite,cirno/thoughtful]Dunno where you bought it, but it's shit. You probably got broke.",
				"[voice:cirno][func:SetSprite,cirno/happy]But hey! Who cares?",
				"[voice:cirno][func:SetSprite,cirno/wink]You can't attack, but you can still dodge! Get ready for my [color:ff0000]Strongest Attack[color:000000]!",
				"[voice:cirno][func:SetSprite,cirno/annoyed]...for real, this time."
			}

			Encounter.SetVar("Final", true)
			Encounter.SetVar("Turn", 13)
		elseif Encounter.GetVar("Spare") == true then
			currentdialogue = {
				"[voice:cirno][func:SetSprite,cirno/proud]Hey, man... The fight is over.",
				"[voice:cirno][func:SetSprite,cirno/wink]And your knife is broken."
			}
		elseif Encounter.GetVar("Insult") == 0 then
			SetSprite('cirno/surprised')
			if FightCount >= 99 then
				currentdialogue = {
					"[voice:cirno][func:SetSprite,cirno/thoughtful]...you're really, REALLY determined, uh?",
					"[voice:cirno][func:SetSprite,cirno/proud]But you know, the truth is... [func:SetSprite,cirno/wink]Your knife won't really hurt me. Like, not at all.",
					"[voice:cirno][func:SetSprite,cirno/thoughtful]So, if you're trying to kill me...[w:10] [func:SetSprite,cirno/wink]Well, you probably won't succeed anytime soon."
				}
			elseif FightCount > 0 then
				currentdialogue = {
					"[voice:cirno][func:SetSprite,cirno/thoughtful]You know...[w:10] [func:SetSprite,cirno/wink]You'll definitely break your knife at this rate."
				}
			else
				currentdialogue = {
					"[voice:cirno][func:SetSprite,cirno/confused]Eeeh? What are you doing with that knife?"
				}
			end
		else
			currentdialogue = {
				"[voice:cirno]Tss... Do you really think a KNIFE can do a scratch to ME? Think again, weakling."
			}
		end

		FightCount = (FightCount + 1)
	end
end

function UpdateMusicPitch()
	if (Encounter.GetVar("CurrentSong") != nil) then
		Audio.Pitch(Encounter.GetVar("CurrentPitch"))
	end
end

function LoadMusic(fileName)
	if (Encounter.GetVar("CurrentSong") != nil) then
		Encounter.SetVar("CurrentSong", fileName)
		Audio.LoadFile(fileName)
		StopMusic()
	end
end

function PauseMusic()
	if (Encounter.GetVar("CurrentSong") != nil) then
		Audio.Pause()
	end
end

function StartMusic()
	if (Encounter.GetVar("CurrentSong") != nil) then
		Audio.Play()
	end
end

function StopMusic()
	if (Encounter.GetVar("CurrentSong") != nil) then
		Audio.Stop()
	end
end

function UnpauseMusic()
	if (Encounter.GetVar("CurrentSong") != nil) then
		Audio.Unpause()
	end
end

function HandleCustomCommand(command)
	if command == "CHECK" then
		if Encounter.GetVar("Insult") == 0 then
			if Encounter.GetVar("Spare") == true then
				BattleDialog("CIRNO 9 ATK 9 DEF [func:SetSprite,cirno/happy]You should come with her now.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/wink]Listen to the check option, for once."}
			elseif Encounter.GetVar("Turn") >= 7 then
				BattleDialog("CIRNO 9 ATK 9 DEF [func:SetSprite,cirno/annoyed]She must be really bored to play with you like that...")
				currentdialogue = {"[voice:cirno]OH, YOU, SHUT UP![w:10] What are you even useful for anyway?"}
			elseif FightCount > 0 then
				BattleDialog("CIRNO 9 ATK 9 DEF [func:SetSprite,cirno/proud]Her ice body renders her invulnerable to attack. Somehow.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]That's because eye'm the strongest!"}
			else
				BattleDialog("CIRNO 9 ATK 9 DEF [func:SetSprite,cirno/proud]The strongest fairy. [func:SetSprite,cirno/annoyed]...or so she says.")
				currentdialogue = {"[voice:cirno]Why are you looking at me like that?"}
			end
		else
			BattleDialog("CIRNO 9 ATK 9 DEF Now she really seems to want you dead.")
			currentdialogue = {"[voice:cirno]No shit Sherlock."}
		end
    elseif command == "FLATTER" then
		if Encounter.GetVar("Insult") > 0 then
			BattleDialog("You try to flatter Cirno. She don't listen to you.")
			currentdialogue = {"[voice:cirno]You won't get away with this. DIE!"}
		else
			if Encounter.GetVar("Turn") == 0 then
				BattleDialog("You tell Cirno you find her patterns deadly.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]Oh, really?", "[voice:cirno][func:SetSprite,cirno/proud]Hehe, of course they are! I'm the strongest fairy after all!"}
				Encounter.SetVar("Turn", 1)
			elseif Encounter.GetVar("Turn") == 1 then
				BattleDialog("You tell Cirno she's the most powerful being you've faced in the whole game.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]HEHEHE YES, THAT'S RIGHT! Eye'm the strongest!"}
				Encounter.SetVar("Turn", 2)
			elseif Encounter.GetVar("Turn") == 2 then
				BattleDialog("You tell Cirno you've seen every timeline, and she's by far the strongest character.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/proud]HEHEHEHEHE...", "[voice:cirno][func:SetSprite,cirno/thoughtful]...i don't get it."}
				Encounter.SetVar("Turn", 3)
			else
				BattleDialog("Seems like you've already flattered her enough.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/happy]EYE'M THE STRONGEST!"}
			end
		end
    elseif command == "INSULT" then
		if Insult == true then
			BattleDialog("You were about to insult Cirno again, but you realized it was a bad idea.")
		elseif Encounter.GetVar("Turn") >= 7 then
			BattleDialog("You insult Cirno. But she's too busy FIGHTing to pay attention.")
		else
			if Encounter.GetVar("Insult") == 0 then
				BattleDialog("You tell Cirno she's ugly. She doesn't seem to share your opinion.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/annoyed]Hey! You take that back!"}
				Encounter.SetVar("Insult", 1)
			elseif Encounter.GetVar("Insult") == 1 then
				BattleDialog("You tell Cirno she's dumb. Now she seems really angry.")
				currentdialogue = {"[voice:cirno]Alright you won, PREPARE TO DIE!"}
				Encounter.SetVar("Insult", 2)
			elseif Encounter.GetVar("Insult") == 2 then
				BattleDialog("You tell Cirno she's weak. You feel like you've just done a huge mistake.")
				currentdialogue = {"[voice:cirno]Oh really?",
				"[voice:cirno][func:SetSprite,cirno/proud][func:StopMusic]...heh. You really WANT me to kill you, don't you?",
				"[voice:cirno]Alright then... [func:SetSprite,cirno/wink]Goodbye!"}
				Encounter.SetVar("Dunked", true)
			end
		end
    elseif command == "FLIRT" then
		if Encounter.GetVar("Turn") >= 7 then
			BattleDialog("You try to flirt with Cirno, but it still doesn't work.")
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]I don't understand...",
			"[voice:cirno][func:SetSprite,cirno/thoughtful]...humans are weird."}
		elseif Encounter.GetVar("Insult") == 0 then
			BattleDialog("You try to flirt with Cirno, but it doesn't seem to work well.")
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]Eeh, what?"}
		else
			BattleDialog("You try to flirt with Cirno, but it doesn't seem to work well.")
			currentdialogue = {"[voice:cirno]What are you even talking about?"}
		end
	elseif command == "JOKE" then
		if Encounter.GetVar("Turn") >= 7 then
			BattleDialog("You tell Cirno a joke extremely easy to get. She get it.")
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/thoughtful]...wow, do all humans have your sense of humor?",
			"[voice:cirno][func:SetSprite,cirno/happy]Because it's great!"}
		elseif Encounter.GetVar("Insult") == 0 then
			BattleDialog("You tell Cirno a joke about ice. She doesn't seem to get it.")
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/annoyed]Of course i get it!",
			"[voice:cirno][func:SetSprite,cirno/thoughtful]...i don't get it."}
		else
			BattleDialog("You tell Cirno you were just kidding. As weird as it may seem, it seems to work.")
			currentdialogue = {"[voice:cirno][func:SetSprite,cirno/surprised]Oh, you were joking!",
			"[voice:cirno][func:SetSprite,cirno/proud]Hehe, i knew it! [func:SetSprite,cirno/happy]Nobody would seriously say that kind of things to me!",
			"[voice:cirno][func:SetSprite,cirno/wink]...okay, you have a weird sense of humor, but i forgive you.",
			"[voice:cirno][func:SetSprite,cirno/base]This time."}
			Encounter.SetVar("Insult", 0)
			Insult = true
		end
	elseif command == "QUESTION" then
		if Encounter.GetVar("Insult") == 0 then
			if Encounter.GetVar("Turn") < 3 then
				BattleDialog("You ask Cirno what she prefer between a giant douche and a turd sandwich.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/thoughtful][func:PauseMusic]...", 
				"[voice:cirno].[w:4].[w:4].",
				"[voice:cirno].[w:10].[w:10].",
				"[voice:cirno][func:SetSprite,cirno/base][func:UnpauseMusic]...i don't get it."}
			elseif Encounter.GetVar("Turn") == 3 then
				BattleDialog("You ask Cirno the secret of her power.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]Hum?[w:10] [func:SetSprite,cirno/happy]Oh, but it's simple!",
				"[voice:cirno][func:SetSprite,cirno/thoughtful]...i don't know."}
				Encounter.SetVar("Turn", 4)
			elseif Encounter.GetVar("Turn") == 4 then
				BattleDialog("You ask Cirno where she came from.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/thoughtful]Hum...[w:10] I think it's a parallel universe or something... It's called Gensokyo.",
				"[voice:cirno][func:SetSprite,cirno/base]...you should ask to Yukari, she's the one who brought me here![w:10] [func:SetSprite,cirno/thoughtful]In one of her weird portals...",
				"[voice:cirno][func:SetSprite,cirno/happy]Hey, you know what? [func:SetSprite,cirno/wink]Maybe after the fight, Yukari will accept to send you to Gensokyo!"}
				Encounter.SetVar("Turn", 5)
			elseif Encounter.GetVar("Turn") == 5 then
				BattleDialog("You ask Cirno who Yukari is.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/thoughtful]Hum... she's some kind of weird youkai... [func:SetSprite,cirno/base]She's nice, even if she can be scary sometimes.",
				"[voice:cirno][func:SetSprite,cirno/proud]But of course, she's far from being as strong as me.",
				"[voice:cirno][func:SetSprite,cirno/base]...i think."}
				Encounter.SetVar("Turn", 6)
			elseif Encounter.GetVar("Turn") == 6 then
				BattleDialog("You ask Cirno why she is still FIGHTing.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/surprised]Eeeeh? Isn't it obvious?",
				"[voice:cirno][func:SetSprite,cirno/happy]It's fun!",
				"[voice:cirno][func:SetSprite,cirno/wink]Come on now! FIGHT me, and give all you have!"}
				Encounter.SetVar("Turn", 7)
			else
				BattleDialog("You don't have any question to ask her anymore.")
				currentdialogue = {"[voice:cirno][func:SetSprite,cirno/confused]What are you waiting for?",
				"[voice:cirno][func:SetSprite,cirno/happy]FIGHT me!"}
			end
		else
			BattleDialog("You ask Cirno a question. She doesn't answer you.")
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