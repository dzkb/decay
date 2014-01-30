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

--
