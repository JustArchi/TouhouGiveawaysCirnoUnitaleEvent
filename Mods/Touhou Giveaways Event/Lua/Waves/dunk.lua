spawntimer = 0
bullets = {}
Encounter.SetVar("wavetimer", 999999999)
Arena.Resize(20, 20)

function Update()
	spawntimer = spawntimer + 1
	if spawntimer == 15 then
		local posx = Player.x
		local posy = Player.y
		local bullet = CreateProjectile('block', posx, posy)
		table.insert(bullets, bullet)
	end
    if spawntimer == 100 then
    	spawntimer = 0
    end
end

function OnHit(bullet)
	Player.hp = 0
end