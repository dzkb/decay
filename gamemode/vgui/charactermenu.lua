-- Decay by Dzakub
-- charactermenu.lua

local Form = vgui.Create( "DFrame" )
Form:Center() -- Position form on your monitor
Form:SetSize( 300, 150 ) -- Size form
Form:SetTitle( "Panel postaci" ) -- Form set name
Form:SetVisible( true ) -- Form rendered ( true or false )
Form:SetDraggable( false ) -- Form draggable
Form:ShowCloseButton( true ) -- Show buttons panel
Form:MakePopup()