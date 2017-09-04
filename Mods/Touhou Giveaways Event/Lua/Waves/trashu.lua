spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 3.0)
counter = 1
function Update()
	t = Time.time - startTime
	if counter == 1 then
	local posx = 60
	local posy = Arena.height * 1.2
	local bullet = CreateProjectile('BundleTrash', posx, posy)
	bullet.SetVar('velx', 0)
	bullet.SetVar('vely', 0)
	table.insert(bullets, bullet)
	counter = 2
	end
	for i=#bullets,1,-1 do
		local bullet = bullets[i]
		if (bullet.x < -Arena.width * 2 or bullet.x > Arena.width * 2) or (bullet.y < -Arena.height * 2.5 or bullet.y > Arena.height * 2.5) then
			bullet.Remove()
			table.remove(bullets, i)
		elseif t <=1 then
			local newposx = bullet.x + .1
			local newposy = bullet.y
			bullet.SetVar('velx', (Player.x - newposx)/25)
			bullet.SetVar('vely', -5 + (Player.y - newposy)/25)
			bullet.MoveTo(newposx, newposy)
		elseif t <=2 then
			local newposx = bullet.x - .1
			local newposy = bullet.y
			bullet.MoveTo(newposx, newposy)
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
	Player.Hurt(1)
end
