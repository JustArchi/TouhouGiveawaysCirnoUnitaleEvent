bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 15.0)
Starting = true
function Update()
	t = Time.time - startTime


	if Starting then
		local posx = -60
		local posy = Arena.height * 1.2
		local bullet = CreateProjectile('star', posx, posy)
		bullet.SetVar('velx', (Player.x - posx)/170 - -3)
		bullet.SetVar('vely', (Player.y - posy)/170 - 1)
		table.insert(bullets, bullet)

		Starting = false
	end

	for i=#bullets,1,-1 do
		local bullet = bullets[i]
		if (bullet.x < -Arena.width * 2 or bullet.x > Arena.width * 2) or (bullet.y < -Arena.height * 2.5 or bullet.y > Arena.height * 2.5) then
			bullet.Remove()
			table.remove(bullets, i)
		else
			local velx = bullet.GetVar('velx')
			local vely = bullet.GetVar('vely')
			-- take IT you know you want the sexy donator star you know you do --
			local newvelx = velx/1.1 + (Player.x - bullet.x + math.random(-10, 10))/160
			local newvely = vely/1.1 + (Player.y - bullet.y + math.random(-10, 10))/160
			local newposx = bullet.x + velx
			local newposy = bullet.y + vely
			bullet.MoveTo(newposx, newposy)
			bullet.SetVar('vely', newvely)
			bullet.SetVar('velx', newvelx)
		end
	end
end

function OnHit(bullet)
	Player.Hurt(4 * (GetGlobal("INSULT") + 1))
end
