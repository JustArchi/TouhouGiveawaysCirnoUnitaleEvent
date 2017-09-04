spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 30.0)

function Update()
	t = Time.time - startTime
	if (t < 25) then
		spawntimer = spawntimer + 1
	end

	if spawntimer == 6 then
		local posx = 310
		local posy = math.random(Arena.height, -Arena.height)
		local bullet = CreateProjectile('bullet', posx, posy)
		bullet.SetVar('vely', 0.5 - math.random())
		table.insert(bullets, bullet)

		spawntimer = 0
	end

	for i=#bullets,1,-1 do
		local bullet = bullets[i]
		if (bullet.x < -Arena.width * 2 or bullet.x > Arena.width * 2) or (bullet.y < -Arena.height * 2.5 or bullet.y > Arena.height * 2.5) then
			bullet.Remove()
			table.remove(bullets, i)
		else
			local vely = bullet.GetVar('vely')
			bullet.MoveTo(bullet.x - 3, bullet.y + vely)
		end
	end
end

function OnHit(bullet)
	Player.Hurt(2 * (GetGlobal("INSULT") + 1))
end