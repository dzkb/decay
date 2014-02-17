-- Decay by Dzakub
-- charactermenu.lua
-- purpose: handles main character's menu

function createCharacterMenu()

	local Form = vgui.Create( "DFrame" )
	Form:Center()
	Form:SetSize( 600, 450 )
	Form:SetTitle( "Panel postaci" )
	Form:SetVisible( true )
	Form:SetDraggable( true )
	Form:ShowCloseButton( true )
	local icon = vgui.Create( "DModelPanel", Form )
	icon:SetSize( 200,440 )
	icon:SetPos( 10,10 )
	icon:SetCamPos( Vector( 0, -30, 48 ) )
	icon:SetLookAt( Vector( 0, 0, 43 ) )
	icon.Angles = Angle( -2,-60,0 )
	
	function icon:DragMousePress() -- updates mouse press and drag state and position
		self.PressX, self.PressY = gui.MousePos()
		self.Pressed = true
	end

	function icon:DragMouseRelease() self.Pressed = false end

	function icon:LayoutEntity( Entity ) -- handles rotating the model on model panel
		if ( self.bAnimated ) then self:RunAnimation() end

		if ( self.Pressed ) then
			local mx, my = gui.MousePos()
			self.Angles = self.Angles - Angle( 0, ( self.PressX or mx ) - mx, 0 )
			
			self.PressX, self.PressY = gui.MousePos()
		end

		Entity:SetAngles( self.Angles )
	end
	

	icon:SetModel( LocalPlayer():GetModel() )

	Form:MakePopup()
	
end

concommand.Add("charactermenu", createCharacterMenu)

