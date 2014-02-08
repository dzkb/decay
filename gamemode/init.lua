-- Decay by Dzakub
-- init.lua
-- purpose: none (jk lol)

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_harvesting.lua" )

AddCSLuaFile( "shared.lua" )

AddCSLuaFile( "player_class/player_decay.lua" )
AddCSLuaFile( "vgui/charactermenu.lua" )

include( "shared.lua" )
DeriveGamemode("sandbox")

function GM:PlayerSpawn(ply)
	player_manager.SetPlayerClass( ply, "player_decay" )
	player_manager.OnPlayerSpawn( ply )
	player_manager.RunClass( ply, "Spawn" )
	
	ply:RemoveAllAmmo()
	ply:Give( "gmod_tool" )
	ply:Give( "gmod_camera" )
	ply:Give( "weapon_physgun" )
	ply:Give( "decay_fists" )
	ply:SwitchToDefaultWeapon()

	ply:SetModel('models/player/group01/male_07.mdl')
	
	local oldhands = ply:GetHands()
	if ( IsValid( oldhands ) ) then oldhands:Remove() end

	local hands = ents.Create( "gmod_hands" )
		if ( IsValid( hands ) ) then
			ply:SetHands( hands )
			hands:SetOwner( ply )

			-- Which hands should we use?
			local cl_playermodel = ply:GetInfo( "cl_playermodel" )
			local info = player_manager.TranslatePlayerHands( cl_playermodel )
		if ( info ) then
			hands:SetModel( info.model )
			hands:SetSkin( info.skin )
			hands:SetBodyGroups( info.body )
		end

		-- Attach them to the viewmodel
		local vm = ply:GetViewModel( 0 )
		hands:AttachToViewmodel( vm )

		vm:DeleteOnRemove( hands )
		ply:DeleteOnRemove( hands )

		hands:Spawn()
	end
end
