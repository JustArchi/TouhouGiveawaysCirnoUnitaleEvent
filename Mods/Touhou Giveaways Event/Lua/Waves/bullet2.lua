spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 27.0)
Arena.Resize(300, 150)

function Update()
	t = Time.time - startTime
	if (t < 22) then
		spawntimer = spawntimer + 1
	end

	if spawntimer == 4 then
		local posx = math.random(-200, 200)
		local posy = 300
		local bullet = CreateProjectile('bullet', posx, posy)
		bullet.SetVar('velx', 0)
		bullet.SetVar('vely', 0)
		table.insert(bullets, bullet)

		spawntimer = 0
	end

	for i=#bullets,1,-1 do
		local bullet = bullets[i]
		if (bullet.x < -Arena.width * 2 or bullet.x > Arena.width * 2) or (bullet.y < -Arena.height * 2.5 or bullet.y > Arena.height * 2.5) then
			bullet.Remove()
			table.remove(bullets, i)
		else
			local velx = bullet.GetVar('velx')
			local vely = bullet.GetVar('vely')
			local newposx = bullet.x + velx
			local newposy = bullet.y + vely
			vely = vely - 0.05
			bullet.MoveTo(newposx, newposy)
			bullet.SetVar('vely', vely)
		end
	end
end

function OnHit(bullet)
	Player.Hurt(2 * (Encounter.GetVar("Insult") + 1))
end