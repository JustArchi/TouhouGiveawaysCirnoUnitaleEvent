spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 17.0)

function Update()
	Arena.Resize(150, 320)
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
		
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if bullet.isactive then
			local vely = bullet.GetVar('vely')
			local velx = bullet.GetVar('velx')
			local newposy = bullet.y + vely
			local newposx = bullet.x + velx
			bullet.MoveTo(newposx, newposy)
			if bullet.y <= -151 or bullet.y >= 151 then
				 bullet.Remove()
			end
		end
	end
	if spawntimer == 80 then
    	spawntimer = 0
    end
end

function OnHit(bullet)
	Player.Hurt(3*(GetGlobal("INSULT")+1))
end