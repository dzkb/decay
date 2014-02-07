-- Decay by Dzakub
-- cl_harvesting.lua
-- purpose: handles players' harvesting feature

local harvesting = false
local validMaterials = {68, 78, 89, 79}

function onKeyPress( ply, key )
	if not harvesting then
		if (key == IN_USE) then -- handles pressing E
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
			if (ply:KeyDown(IN_DUCK)) and (length < 40) and validMaterial then
				ply:ChatPrint("harvesting")
				-- harvesting should begin now
			end
		end
	end
end

hook.Add("KeyPress", "onKeyPressed", onKeyPress)