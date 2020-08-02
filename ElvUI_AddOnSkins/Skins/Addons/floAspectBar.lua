local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")
local AS = E:GetModule("AddOnSkins")
local AB = E:GetModule("ActionBars")

if not AS:IsAddonLODorEnabled("FloAspectBar") then return end

-- FloAspectBar 3.3.0.16
-- https://www.curseforge.com/wow/addons/flo-aspect-bar/files/399320

S:AddCallbackForAddon("FloAspectBar", "FloAspectBar", function(frame)
	if not E.private.addOnSkins.FloAspectBar then return end

	if FLO_CLASS_NAME == "HUNTER" then
		local frame = _G[frame]
		FloLib_ShowBorders(frame)

		local function toggleBorders(self)
			if (self == frame) and self.globalSettings.borders then
				self:SetTemplate("Transparent")
				if self.settings and self.settings.color then
					self:SetBackdropBorderColor(unpack(self.settings.color))
				end
			else
				FloLib_HideBorders(self)
			end
		end

		if not S:IsHooked("FloLib_ShowBorders") then
			S:SecureHook("FloLib_ShowBorders", toggleBorders)
		end

		frame:SetClampedToScreen(true)

		for i = 1, frame:GetNumChildren() do
			local child = select(i, frame:GetChildren())
			if child then
				if child:IsObjectType("CheckButton") then
					AB:StyleButton(child)
				end
			end
		end
	end
end)