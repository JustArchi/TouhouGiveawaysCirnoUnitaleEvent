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
	elseif (spawntimer < 2) then
		spawntimer = 2
		Arena.Resize(500, 200)
	else
		for i=#bullets,1,-1 do
			local bullet = bullets[i]
			if (bullet.x < -Arena.width * 6 or bullet.x > Arena.width * 6) or (bullet.y < -Arena.height * 7.5 or bullet.y > Arena.height * 7.5) then
				bullet.Remove()
				table.remove(bullets, i)
			else
				bullet.MoveTo(bullet.x + 3, bullet.y - 3)
			end
		end
	end
end

function OnHit(bullet)
	Player.Hurt(3 * (Encounter.GetVar("Insult") + 1))
end