local ply = FindMetaTable("Player")

--using metatables for setting up teams
local teams = {}
teams[0] = {name = "Intruder", color = Vector(1.0, 0, 0), weapons = {"weapon_crowbar", "weapon_357"}}
teams[1] = {name = "Innocent", color = Vector(0, 0, 1.0), weapons = {"weapon_crowbar", "weapon_357"}}

--makes sure a team is set
function ply:SetupTeam(n)
	if(not teams[n]) then return end
	
	--sets team for player
	self:SetTeam(n)
	self:SetPlayerColor(teams[n].color)
	self:SetWalkSpeed(200)
	self:SetRunSpeed(300)
	if(n==0) then self:SetHealth(250) end
	if(n==1) then self:SetHealth(150) end
	self:SetModel("models/code_gs/robber/robberplayer.mdl")
	self:GiveWeapons(n)
	
end

function ply:GiveWeapons(n)
	--removes regular ammo, gives revolver ammo
	self:RemoveAllAmmo()
	self:GiveAmmo(64, "357", true)
	for x, weapon in pairs(teams[n].weapons) do
	--gives player all weapons
		self:Give(weapon)
	end
end