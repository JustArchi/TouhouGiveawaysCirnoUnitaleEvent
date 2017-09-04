spawntimer = 0
Encounter.SetVar("wavetimer", 999999999)
Arena.Resize(16, 16)

function Update()
	spawntimer = spawntimer + 1
	if spawntimer == 15 then
		local posx = Player.x
		local posy = Player.y
		local bullet = CreateProjectile('block', posx, posy)

		spawntimer = 0
	end
end

function OnHit(bullet)
	Player.hp = 0
end