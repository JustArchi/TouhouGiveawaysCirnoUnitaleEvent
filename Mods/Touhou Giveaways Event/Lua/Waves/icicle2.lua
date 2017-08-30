spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 20.0)

function Update()
	t = Time.time - startTime
	if (t < 16) then
		spawntimer = spawntimer + 1
	end
    if spawntimer == 8 then
        local posx = math.random(200, 300)
        local posy = 300
        local bullet = CreateProjectile('icicle', posx, posy)
        bullet.SetVar('velx', 4*-math.random())
        bullet.SetVar('vely', 0)
        table.insert(bullets, bullet)
        local posx = math.random(-300, -200)
        local posy = 300
        local bullet = CreateProjectile('icicle', posx, posy)
        bullet.SetVar('velx', 4*math.random())
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
    if spawntimer == 8 then
    	spawntimer = 0
    end
end

function OnHit(bullet)
	Player.Hurt(2*(GetGlobal("INSULT")+1))
end