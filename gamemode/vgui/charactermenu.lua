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
	Form:MakePopup()

end

concommand.Add("charactermenu", showCharacterMenu)