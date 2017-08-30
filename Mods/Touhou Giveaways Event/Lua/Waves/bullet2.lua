spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 27.0)

function Update()
	Arena.Resize(300, 150)
	t = Time.time - startTime
	if (t < 22) then
		spawntimer = spawntimer + 1
	end
    if spawntimer == 4 then
        local posx = math.random(-200, 200)
        local posy = 300
        local bullet = CreateProjectile('bullet', posx, posy)
        bullet.SetVar('velx', 0)
        bullet.SetVar('vely', 0)
        table.insert(bullets, bullet)
	end
    
    for i=1,#bullets do
        local bullet = bullets[i]
        local velx = bullet.GetVar('velx')
        local vely = bullet.GetVar('vely')
        local newposx = bullet.x + velx
        local newposy = bullet.y + vely
        vely = vely - 0.05
        bullet.MoveTo(newposx, newposy)
        bullet.SetVar('vely', vely)
    end
    if spawntimer == 4 then
    	spawntimer = 0
    end
end

function OnHit(bullet)
	Player.Hurt(2*(GetGlobal("INSULT")+1))
end