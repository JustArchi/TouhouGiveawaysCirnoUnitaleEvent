spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 17.0)
Arena.Resize(150, 320)

function Update()
	t = Time.time - startTime
	if (t < 15) then
		spawntimer = spawntimer + 1
	end

	if spawntimer == 40 then
		local posy = 150
		local posx = -67
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = 150
		local posx = -51
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = 150
		local posx = -35
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = 150
		local posx = -19
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = 150
		local posx = -3
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = 67
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = 51
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = 35
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = 19
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = 3
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		if (t >= 15) then
			spawntimer = 0
		end
	elseif spawntimer == 80 then
		local posy = 150
		local posx = 67
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = 150
		local posx = 51
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = 150
		local posx = 35
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = 150
		local posx = 19
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = 150
		local posx = 3
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', -4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = -67
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = -51
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = -35
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = -19
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		local posy = -150
		local posx = -3
		local bullet = CreateProjectile('laser2', posx, posy)
		bullet.SetVar('vely', 4)
		bullet.SetVar('velx', 0)
		table.insert(bullets, bullet)

		spawntimer = 0
	end

	for i=#bullets,1,-1 do
		local bullet = bullets[i]
		if (bullet.y < -150 or bullet.y > 150) then
			bullet.Remove()
			table.remove(bullets, i)
		else
			local velx = bullet.GetVar('velx')
			local vely = bullet.GetVar('vely')
			local newposx = bullet.x + velx
			local newposy = bullet.y + vely
			bullet.MoveTo(newposx, newposy)
		end
	end
end

function OnHit(bullet)
	Player.Hurt(3 * (Encounter.GetVar("Insult") + 1))
end