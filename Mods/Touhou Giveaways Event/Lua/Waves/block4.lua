spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 25.0)
Arena.Resize(600, 350)

function Update()
	t = Time.time - startTime
	if (t < 23) then
		spawntimer = spawntimer + 1
	end

	if spawntimer == 120 then
		local posx = Player.x
		local posy = Player.y - 300
		local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('velx', 0)
		bullet.SetVar('vely', 10)
		bullet.SetVar('creation', Time.time)
		table.insert(bullets, bullet)

		local posx = Player.x - 150
		local posy = Player.y - 150
		local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('velx', 5)
		bullet.SetVar('vely', 5)
		bullet.SetVar('creation', Time.time)
		table.insert(bullets, bullet)

		local posx = Player.x - 300
		local posy = Player.y
		local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('velx', 10)
		bullet.SetVar('vely', 0)
		bullet.SetVar('creation', Time.time)
		table.insert(bullets, bullet)

		local posx = Player.x - 150
		local posy = Player.y + 150
		local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('velx', 5)
		bullet.SetVar('vely', -5)
		bullet.SetVar('creation', Time.time)
		table.insert(bullets, bullet)

		local posx = Player.x
		local posy = Player.y + 300
		local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('velx', 0)
		bullet.SetVar('vely', -10)
		bullet.SetVar('creation', Time.time)
		table.insert(bullets, bullet)

		local posx = Player.x + 150
		local posy = Player.y + 150
		local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('velx', -5)
		bullet.SetVar('vely', -5)
		bullet.SetVar('creation', Time.time)
		table.insert(bullets, bullet)

		local posx = Player.x + 300
		local posy = Player.y
		local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('velx', -10)
		bullet.SetVar('vely', 0)
		bullet.SetVar('creation', Time.time)
		table.insert(bullets, bullet)

		local posx = Player.x + 150
		local posy = Player.y - 150
		local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('velx', -5)
		bullet.SetVar('vely', 5)
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
			if Time.time >= bullet.GetVar('creation') + 0.6 then
				local velx = bullet.GetVar('velx')
				local vely = bullet.GetVar('vely')
				local newposx = bullet.x + velx
				local newposy = bullet.y + vely
				bullet.MoveTo(newposx, newposy)
			end
		end
	end
end

function OnHit(bullet)
	Player.Hurt(3 * (GetGlobal("INSULT") + 1))
end