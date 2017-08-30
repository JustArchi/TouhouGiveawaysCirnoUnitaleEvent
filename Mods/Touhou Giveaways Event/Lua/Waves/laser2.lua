spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 17.0)

function SpawnLazerA(posx)
	local bullet = CreateProjectile('laser2', posx, 150)
		bullet.SetVar('velx', -4)
		bullet.SetVar('vely', 0)
	table.insert(bullets, bullet)
end
function SpawnLazerB(posx)
	local bullet = CreateProjectile('laser2', posx, -150)
		bullet.SetVar('velx', 4)
		bullet.SetVar('vely', 0)
	table.insert(bullets, bullet)
end


function Update()
	Arena.Resize(150, 320)
	t = Time.time - startTime
	if (t < 15) then
		spawntimer = spawntimer + 1
	end
	if spawntimer == 40 then
		for i=-67, -3, 16 do
			SpawnLazerA(i)
		end
		for i= 67, 3, -16 do
			SpawnLazerB(i)
		end
		if (t >= 15) then
			spawntimer = 0
		end
		
	elseif spawntimer == 80 then
		for i= 67, 3, -16 do
			SpawnLazerB(i)
		end
		for i=-67, -3, 16 do
			SpawnLazerA(i)
		end
		
		
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
