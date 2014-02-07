-- Decay by Dzakub
-- cl_harvesting.lua
-- purpose: handles players' harvesting feature

-- harvesting player should keep IN_USE key pressed until the harvesting is done
-- it's supposed to prevent players from randomly getting stuck because of random
-- pressing the key.

local harvesting = false
local validMaterials = {68, 78, 89, 79}

sound.Add({
	name = "harvest_loop",
	channel = 0,
	volume = 1.0,
	sound = "physics/body/body_medium_scrape_smooth_loop1.wav"
})

function onKeyPress( ply, key )
	if not harvesting then
		if (key == IN_USE) and (not ply:KeyDown(IN_ATTACK)) then -- handles pressing E, restrict harvesting with physgun/guns shooting
			local traceData = util.GetPlayerTrace(ply, ply:GetAimVector())
			local result = util.TraceLine(traceData) -- tracing line to get material type (looking for ground suitable for harvesting)
			local length = result.Fraction * 16384 -- fraction is the % of max 16k units that can be traced
			MsgN("--")
			MsgN(length) 
			MsgN(result.MatType)
			if result.HitWorld then MsgN("World has been hit.") end
			MsgN("--")
			local validMaterial = false
			for k,v in pairs(validMaterials) do
				if result.MatType == v then
					validMaterial = true
				end
			end
			if (ply:KeyDown(IN_DUCK)) and (length < 40) and validMaterial then -- harvesting begins here
				ply:ChatPrint("harvesting")
				ply:Freeze(true)
				ply:Lock()
				-- sound.Play("harvest_loop", ply:GetPos(), 75, 100, 0.75) -- this shit ain't workin' yet
				-- timer.Simple(2, function() ply:StopSound("physics/body/body_medium_scrape_smooth_loop1.wav") end)
			end
		end
	end
end

hook.Add("KeyPress", "onKeyPressed", onKeyPress)

function onKeyRelease( ply, key )
	if harvesting then -- this won't evecute if the harvesting is already done
		if (key == IN_USE) then -- handles releasing E
			-- cancel harvesting here
			ply:Freeze(false)
			ply:UnLock()
		end
	end
end

hook.Add("KeyRelease", "onKeyReleased", onKeyRelease)
