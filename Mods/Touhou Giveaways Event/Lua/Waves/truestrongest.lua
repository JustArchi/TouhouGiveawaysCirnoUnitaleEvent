spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 85.0)
Arena.Resize(600, 350)
final = 0

function Update()
	t = Time.time - startTime
	spawntimer = spawntimer + 1
	if (t < 8) then
		if spawntimer == 100 then
			local posx = Player.x
			local posy = Player.y - 300
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', 0)
			bullet.SetVar('vely', 10)
			bullet.SetVar('creation', Time.time)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 1)
			table.insert(bullets, bullet)

			local posx = Player.x - 150
			local posy = Player.y - 150
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', 5)
			bullet.SetVar('vely', 5)
			bullet.SetVar('creation', Time.time)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 1)
			table.insert(bullets, bullet)

			local posx = Player.x - 300
			local posy = Player.y
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', 10)
			bullet.SetVar('vely', 0)
			bullet.SetVar('creation', Time.time)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 1)
			table.insert(bullets, bullet)

			local posx = Player.x - 150
			local posy = Player.y + 150
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', 5)
			bullet.SetVar('vely', -5)
			bullet.SetVar('creation', Time.time)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 1)
			table.insert(bullets, bullet)

			local posx = Player.x
			local posy = Player.y + 300
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', 0)
			bullet.SetVar('vely', -10)
			bullet.SetVar('creation', Time.time)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 1)
			table.insert(bullets, bullet)

			local posx = Player.x + 150
			local posy = Player.y + 150
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', -5)
			bullet.SetVar('vely', -5)
			bullet.SetVar('creation', Time.time)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 1)
			table.insert(bullets, bullet)

			local posx = Player.x + 300
			local posy = Player.y
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', -10)
			bullet.SetVar('vely', 0)
			bullet.SetVar('creation', Time.time)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 1)
			table.insert(bullets, bullet)

			local posx = Player.x + 150
			local posy = Player.y - 150
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', -5)
			bullet.SetVar('vely', 5)
			bullet.SetVar('creation', Time.time)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 1)
			table.insert(bullets, bullet)

			spawntimer = 0
		end
	elseif (t < 20) then
		if spawntimer >= 2 then
			local posx = math.random(-300, 300)
			local posy = 300
			local bullet = CreateProjectile('icicle', posx, posy)
			bullet.SetVar('velx', 1 - 2*math.random())
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 2)
			bullet.SetVar('type', 2)
			table.insert(bullets, bullet)

			spawntimer = 0
		end
	elseif (t < 35) then
	    if spawntimer == 8 then
			local posx = 300
			local posy = math.random(200, -200)
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', -8)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 3)
			table.insert(bullets, bullet)
		elseif spawntimer == 16 then
			local posx = -300
			local posy = math.random(200, -200)
			local bullet = CreateProjectile('block2', posx, posy)
			bullet.SetVar('velx', 8)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 3)
			table.insert(bullets, bullet)

			spawntimer = 0
		end
	elseif (t < 45) then
		if spawntimer == 20 then
			local posx = 300
			local posy = -300
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)

			local posx = 300
			local posy = -284
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)

			local posx = 300
			local posy = -268
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)

			local posx = 300
			local posy = -252
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -236
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -220
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -204
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -188
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -172
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -156
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -140
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -124
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -108
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -92
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -76
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -60
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -44
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -28
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = -12
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			
		elseif spawntimer == 40 then
		
			local posx = 300
			local posy = 300
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 284
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 268
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 252
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 236
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 220
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 204
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 188
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 172
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 156
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 140
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 124
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 108
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 92
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 76
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 60
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 44
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 28
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			local posx = 300
			local posy = 12
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', -12)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 4)
			table.insert(bullets, bullet)
			spawntimer = 0
		end
	elseif (t < 60) then
		if spawntimer >= 2 then
			local posx = math.random(-300, 300)
			local posy = -300
			local bullet = CreateProjectile('bullet', posx, posy)
			bullet.SetVar('velx', 1 - 2*math.random())
			bullet.SetVar('vely', 6)
			bullet.SetVar('damage', 2)
			bullet.SetVar('type', 5)
			table.insert(bullets, bullet)
			spawntimer = 0
		end
	elseif (t > 64 and t < 66) then
		if final == 0 then
			local posx = -300
			local posy = -300
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -284
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -268
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -252
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -236
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -220
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -204
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -188
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -172
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -156
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			local posx = -300
			local posy = -140
			local bullet = CreateProjectile('laser', posx, posy)
			bullet.SetVar('velx', 2)
			bullet.SetVar('vely', 0)
			bullet.SetVar('damage', 3)
			bullet.SetVar('type', 6)
			table.insert(bullets, bullet)
			final = 1
		end
	elseif (t > 77 and t < 79) then
		if final == 1 then
			Encounter.SetVar("Turn", 14)
			State("ENEMYDIALOGUE")
			final = 2
		end
	end

	for i=#bullets,1,-1 do
		local bullet = bullets[i]
		if bullet.x < -600 or bullet.x > 600 or bullet.y < -600 or bullet.y > 600 then
			bullet.Remove()
			table.remove(bullets, i)
		else
			local velx = bullet.GetVar('velx')
			local vely = bullet.GetVar('vely')
			local newposx = bullet.x + velx
			local newposy = bullet.y + vely

			if bullet.GetVar('type') == 1 then
				if Time.time >= bullet.GetVar('creation') + 0.6 then
					bullet.MoveTo(newposx, newposy)
				end
			elseif bullet.GetVar('type') == 2 then
				vely = vely - 0.06
				bullet.MoveTo(newposx, newposy)
				bullet.SetVar('vely', vely)
			else
				bullet.MoveTo(newposx, newposy)
			end
		end
	end
end

function OnHit(bullet)
	Player.Hurt(bullet.GetVar('damage'))
end