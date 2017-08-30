spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 28.0)

function Update()
	t = Time.time - startTime
	if (t >= 24) then
		State("ENEMYDIALOGUE")
	end
	if (t < 20) then
		spawntimer = spawntimer + 1
	end
    if spawntimer == 4 then
        local posx = math.random(-50, 50)
        local posy = Arena.height*1.2
        local bullet = CreateProjectile('icicle', posx, posy)
        bullet.SetVar('velx', 2.5 - 5*math.random(0))
        bullet.SetVar('vely', 0)
        table.insert(bullets, bullet)
	end
    
    for i=1,#bullets do
        local bullet = bullets[i]
        local velx = bullet.GetVar('velx')
        local vely = bullet.GetVar('vely')
        local newposx = bullet.x + velx
        local newposy = bullet.y + vely
        vely = vely - 0.04
        bullet.MoveTo(newposx, newposy)
        bullet.SetVar('vely', vely)
    end
    if spawntimer == 4 then
    	spawntimer = 0
    end
end

function OnHit(bullet)
	Player.Hurt(9)
end