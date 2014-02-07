-- Decay by Dzakub
-- cl_init.lua
-- purpose: clientside init

include("cl_harvesting.lua")
include("vgui/charactermenu.lua")

DeriveGamemode("sandbox")


-- overrides
function GM:ContextMenuOpen()

	GAMEMODE:SuppressHint( "OpeningContext" )
	GAMEMODE:AddHint( "ContextClick", 20 )

	return false
end

function GM:AddGamemodeToolMenuTabs( ) -- this needs to be fixed
	spawnmenu.AddToolTab( "Main", 		"#spawnmenu.tools_tab", "icon16/wrench.png" )
end

--------------
-- Used to draw hands properly
--------------
function GM:PostDrawViewModel( vm, ply, weapon )

  if ( weapon.UseHands or (not weapon:IsScripted()) ) then
    local hands = LocalPlayer():GetHands()
    if ( IsValid( hands ) ) then hands:DrawModel() end

  end

end

--

function GM:Initialize()
	
end 