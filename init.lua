AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "teams.lua" )
AddCSLuaFile( "playerdata.lua" )
AddCSLuaFile( "roundsystem.lua" )
AddCSLuaFile( "cl_hud.lua" )

include( "shared.lua" )
include( "teams.lua" )
include( "playerdata.lua" )
include( "roundsystem.lua" )
include( "cl_hud.lua" )

util.AddNetworkString("f4menu")

function GM:PlayerInitialSpawn(ply)
	ply:LoadStats()
	timer.Simple(10, function() PrintMessage(HUD_PRINTTALK, "Welcome to Assimilation. Please read the rules to get started") end)
	
	
end

local timer = timer

--on initialize
function GM:Initialize()
	MsgN("Assimilation in progress")
	RunConsoleCommand("mp_friendlyfire", "1")

end

--on spawn
function GM:PlayerSpawn(ply)
	
	--setting up model hands
	ply:SetupHands()
	if(roundIsActive == true) then
		--kills player on spawn
		ply:KillSilent()
		return
	else
	
		ply:SetupTeam(math.random(0,1))
		RoundStart()
	end
end

function GM:PlayerDeath(ply)
	RoundCheck()
	ply:AddRounds()
end

--spawns player if round is active, does not let player spawn if false
function GM:PlayerDeathThink(ply)
	if(roundIsActive == false) then
		ply:Spawn()
		return true
		
	else
		return false
	end
	
end

function GM:PlayerDisconnected(ply)
	ply:SaveStats()
	RoundCheck()
end

--just a function to get hand models for the player
function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

end

function GM:PlayerCanSeePlayersChat(text, teamOnly, listener, talker)
	local distance = listener:GetPos():Distance(talker:GetPos())
	if distance < 200 then
		return true
	end

end

function GM:PlayerCanHearPlayersVoice(listenervoice, talkervoice)
	local distance2 = listenervoice:GetPos():Distance(talkervoice:GetPos())
	if distance2 < 200 then
		return true
	end
end

function GM:PlayerHurt(victim, attacker)

end
--f1 keypress
function GM:ShowHelp(ply)
	
end
--f2
function GM:ShowTeam(ply)
	
end
--f3
function GM:ShowSpare1(ply)
	
end
--f4


function GM:ShowSpare2(ply)
	net.Start("f4menu")
	net.Send(ply)
end

function GM:KeyPress(ply, key)
	--if(key==

end