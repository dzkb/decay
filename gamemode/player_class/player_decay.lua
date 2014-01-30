
DEFINE_BASECLASS( "player_default" )

local PLAYER = {}


function PLAYER:Loadout()

	self.Player:RemoveAllAmmo()
	
	self.Player:Give( "gmod_tool" )
	self.Player:Give( "gmod_camera" )
	self.Player:Give( "weapon_physgun" )
	
	self.Player:Give( "weapon_fists" )

	self.Player:SwitchToDefaultWeapon()

end

function PLAYER:Spawn()

	BaseClass.Spawn( self )

end

player_manager.RegisterClass( "player_decay", PLAYER, "player_default" )