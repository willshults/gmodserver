

local ply = FindMetaTable("Player")


function ply:SaveStats()
	self:SetPData("Kills", self:GetNWInt("Kills"))
end
function ply:LoadStats()
	--player data. cannot be networked by default, must network yourself
	if(self:GetPData("Kills") == nil ) then
		self:SetPData("Kills", 0)
		self:SetNWInt("Kills", 0)
	
	else
		self:SetNWInt("Kills", self:GetPData("Kills"))
	end
		
	--not saving this value
	if(self:GetPData("RoundsPlayed") == nil ) then
		self:SetPData("RoundsPlayed", 0)
		self:SetNWInt("RoundsPlayed", 0)
	
	else
		self:SetNWInt("RoundsPlayed", self:GetPData("RoundsPlayed"))
	end
end

function ply:AddKills()
	self:SetNWInt("Kills", self:GetNWInt("Kills") + 1)
end
function ply:AddRounds()
	self:SetNWInt("RoundsPlayed", self:GetNWInt("RoundsPlayed") + 1)
end