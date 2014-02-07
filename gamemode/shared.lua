-- Decay by Dzakub
-- shared.lua
-- purpose: shared functions & basic GM info

include( "player_class/player_decay.lua" )

DEFINE_BASECLASS( "gamemode_base" )
GM.Name = "Decay"
GM.Author = "Dzakub"
GM.Email = "dzakub@gmail.com"
GM.Website = "http://dzakub.com"

function GM:Initialize()

end 

-- overrides

function GM:CanDrive( pl, ent )
	return false
end

--
