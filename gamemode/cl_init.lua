-- Decay by Dzakub
-- cl_init.lua

DeriveGamemode("sandbox")


-- overrides
function GM:ContextMenuOpen()

	GAMEMODE:SuppressHint( "OpeningContext" )
	GAMEMODE:AddHint( "ContextClick", 20 )

	return false
end

function GM:AddGamemodeToolMenuTabs( )
	spawnmenu.AddToolTab( "Main", 		"#spawnmenu.tools_tab", "icon16/wrench.png" )
end

--------------
-- Used to draw hands properly
--------------
function GM:PostDrawViewModel( vm, ply, weapon )

  if ( weapon.UseHands || !weapon:IsScripted() ) then
    local hands = LocalPlayer():GetHands()
    if ( IsValid( hands ) ) then hands:DrawModel() end

  end

end

--