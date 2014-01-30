-- Decay by Dzakub
-- cl_init.lua

DeriveGamemode("sandbox")

function GM:ContextMenuOpen()

	GAMEMODE:SuppressHint( "OpeningContext" )
	GAMEMODE:AddHint( "ContextClick", 20 )

	return false
end
