
include("teams.lua")

function RoundStart()
	local Alive = 0
	for k,v in pairs(player.GetAll() ) do
		if(v:Alive()) then
			Alive = Alive + 1
		end
	end
	--if there are players alive and there is more than one player
	if(Alive>=table.Count(player.GetAll()) && table.Count(player.GetAll()) > 1) then
		roundIsActive = true
		print("Round start")
	end
	
	RoundCheck()
	
end

function RoundCheck()
	print("Round active" .. tostring(roundIsActive))
	if(roundIsActive == false) then
		return
	end
	--if its true
	timer.Create("checkdelay", 1, 1, function()
		local intruderAlive = 0
		local innoAlive = 0
		for k,v in pairs(team.GetPlayers(0)) do
		if(v:Alive()) then
			intruderAlive = intruderAlive+1
		end
		end
		for k,v in pairs(team.GetPlayers(1)) do
		if(v:Alive()) then
			innoAlive = innoAlive+1
		end
		end
		
		if(intruderAlive == 0) then
			EndRound("Innocent")
		elseif(innocentAlive == 0 && intruderAlive >= 1) then
			EndRound("Intruder")
		end
	end)
end
function EndRound(w)
	print(w .. "s are the round winner. Restarting in 5...")
	PrintMessage(HUD_PRINTTALK, w .. "s are the round winner. Restarting in 5...")
	timer.Create("roundending", 5, 1, function()
		game.CleanUpMap(false, {})
		for t, v in pairs(player.GetAll()) do
		--if youre alive, youre dead
			if(v:Alive()) then
				v:SetupHands()
				v:StripWeapons()
				v:KillSilent()
			end
			
		end
		roundIsActive = false
	end)
end
--function DeathCheck(ply)
	--if(team.GetPlayers(0) == 