spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 17.0)

function Update()
	t = Time.time - startTime
	if (t < 14) then
		spawntimer = spawntimer + 1
	end

	if spawntimer == 15 then
		local posx = -250
		local posy = math.random(Arena.height, -Arena.height)
		local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('creation', Time.time)
		table.insert(bullets, bullet)

		spawntimer = 0
	end

	for i=#bullets,1,-1 do
		local bullet = bullets[i]
		if (bullet.x < -Arena.width * 2 or bullet.x > Arena.width * 2) or (bullet.y < -Arena.height * 2.5 or bullet.y > Arena.height * 2.5) then
			bullet.Remove()
			table.remove(bullets, i)
		else
			if Time.time >= bullet.GetVar('creation') + 0.4 then
				bullet.MoveTo(bullet.x + 5, bullet.y)
			end
		end
	end
end

function OnHit(bullet)
	Player.Hurt(3 * (GetGlobal("INSULT") + 1))
end