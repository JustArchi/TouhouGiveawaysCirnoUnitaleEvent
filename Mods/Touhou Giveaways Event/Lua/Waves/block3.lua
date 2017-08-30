spawntimer = 0
bullets = {}
startTime = Time.time
Encounter.SetVar("wavetimer", 17.0)

function Update()
	t = Time.time - startTime
	if (t < 14) then
		spawntimer = spawntimer + 1
	end
    if spawntimer == 15 then
        local posx = -250
        local posy = math.random(Arena.height, -Arena.height)
        local bullet = CreateProjectile('block2', posx, posy)
		bullet.SetVar('creation', Time.time)
        table.insert(bullets, bullet)
	end
    
    for i=1,#bullets do
        local bullet = bullets[i]
		if Time.time >= bullet.GetVar('creation') + 0.4 then
			bullet.MoveTo(bullet.x + 5, bullet.y)
		end
    end
    if spawntimer == 15 then
    	spawntimer = 0
    end
end

function OnHit(bullet)
	Player.Hurt(3*(GetGlobal("INSULT")+1))
end