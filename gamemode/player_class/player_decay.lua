-- Decay by Dzakub
-- player_decay.lua
-- purpose: players base class

AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )

local PLAYER = {}

PLAYER.WalkSpeed 			= 200
PLAYER.RunSpeed				= 400
PLAYER.AvoidPlayers			= false

function PLAYER:Loadout()

	self.Player:RemoveAllAmmo()
	
	self.Player:Give( "gmod_tool" )
	self.Player:Give( "gmod_camera" )
	self.Player:Give( "weapon_physgun" )
	
	self.Player:Give( "weapon_fists" )

	self.Player:SwitchToDefaultWeapon()

end

function PLAYER:SetModel()

	BaseClass.SetModel( self )
	
end


function PLAYER:Spawn()

	BaseClass.Spawn( self )

end

player_manager.RegisterClass( "player_decay", PLAYER, "player_default" )