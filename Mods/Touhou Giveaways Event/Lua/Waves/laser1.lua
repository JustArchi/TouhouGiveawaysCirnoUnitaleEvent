spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 17.0)

function SpawnLazerA(posy, posx=190)
	local bullet = CreateProjectile('laser', posx, posy)
        bullet.SetVar('velx', -4)
        bullet.SetVar('vely', 0)
	table.insert(bullets, bullet)
end
function SpawnLazerB(posy, posx=190)
	local bullet = CreateProjectile('laser', posx, posy)
        bullet.SetVar('velx', 4)
        bullet.SetVar('vely', 0)
	table.insert(bullets, bullet)
end

function Update()
	Arena.Resize(400, 150)
	t = Time.time - startTime
	if (t < 15) then
		spawntimer = spawntimer + 1
	end
	if spawntimer == 40 then
		for i= -67, -3, 16 do
			 SpawnLazerA(i)
		end
		for i= 67, 3, -16 do
			 SpawnLazerB(i)
		end
		SpawnLazerB(-13)
		
		if (t >= 15) then
			spawntimer = 0
		end
		
	elseif spawntimer == 80 then
		for i= 67, 3, -16 do
			 SpawnLazerB(i)
		end
		SpawnLazerB(-13)
		for i= -67, -3, 16 do
			 SpawnLazerA(i)
		end
		
		
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if bullet.isactive then
			local velx = bullet.GetVar('velx')
			local vely = bullet.GetVar('vely')
			local newposx = bullet.x + velx
			local newposy = bullet.y + vely
			bullet.MoveTo(newposx, newposy)
			if bullet.x <= -191 or bullet.x >= 191 then
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
