spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 14.0)

function Update()
	t = Time.time - startTime
	if (t < 5) then
			spawntimer = spawntimer + 1
		if spawntimer == 2 then
			local posx = math.random(-1200, -50)
			local posy = math.random(150, 1500)
			local bullet = CreateProjectile('block2', posx, posy)
			table.insert(bullets, bullet)
			spawntimer = 0
		end
	else
		Arena.Resize(500, 200)
		for i=1,#bullets do
			local bullet = bullets[i]
			bullet.MoveTo(bullet.x + 3, bullet.y - 3)
		end
	end
end

function OnHit(bullet)
	Player.Hurt(3*(GetGlobal("INSULT")+1))
end