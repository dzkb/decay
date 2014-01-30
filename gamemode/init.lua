-- Decay by Dzakub
-- init.lua

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "player_class/player_sandbox.lua" )

include( "shared.lua" )
DeriveGamemode("sandbox")

function GM:PlayerSpawn(ply)
	player_manager.SetPlayerClass( ply, "player_decay" )
end