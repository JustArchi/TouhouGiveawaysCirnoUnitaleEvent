Bullet = nil
Encounter.SetVar("wavetimer", 15.0)
SpawnTimer = 0
function Update()
	if (Bullet == nil) then
		local posx = -60
		local posy = Arena.height * 1.2
		Bullet = CreateProjectile('star', posx, posy)
		Bullet.SetVar('velx', (Player.x - posx)/170 - -3)
		Bullet.SetVar('vely', (Player.y - posy)/170 - 1)
		SpawnTimer = 1
	elseif (SpawnTimer > 100) then
		local velx = Bullet.GetVar('velx')
		local vely = Bullet.GetVar('vely')
		-- take IT you know you want the sexy donator star you know you do --
		if (SpawnTimer < 200) then
			multiplier = 1.5
			SpawnTimer = SpawnTimer + 1
		else
			multiplier = 1.1
		end

		local newvelx = velx / multiplier + (Player.x - Bullet.x + math.random(-10, 10))/160
		local newvely = vely / multiplier + (Player.y - Bullet.y + math.random(-10, 10))/160

		local newposx = Bullet.x + velx
		local newposy = Bullet.y + vely
		Bullet.MoveTo(newposx, newposy)
		Bullet.SetVar('vely', newvely)
		Bullet.SetVar('velx', newvelx)
	else
		SpawnTimer = SpawnTimer + 1
	end
end

function OnHit(bullet)
	Player.Hurt(4 * (GetGlobal("INSULT") + 1))
end
