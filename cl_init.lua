include( "shared.lua" )

hook.Add("HUDPaint", "HUDIdent", function()
	
	draw.RoundedBox(5, 0, 960-150, 400, 40, Color(120,120,120,240))
end)

net.Recieve("f4menu", function()
	if(!frame) then
		local frame = vgui.Create("DFrame")
		frame:SetSize(1000,720)
		frame:Center()
		frame:SetVisible(true)
		frame:MakePopup()
		frame:SetDeleteOnClose(true)
	end
end)