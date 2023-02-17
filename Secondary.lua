local ObjectsToHide = {
	"CanorHair";
	"GremorHorns";
	"CapraSkull";
	"KhanCirclet";
	"KhanHair",
	"LightbornCirclet";
	"ChainsOfEternity";
	"VespMask"
}

local DecalsToIgnore = {
	"Sclera";
	"DGFace";
	"Lashes";
}

local BodyParts = {
	"Head";
	"Torso";
	"Right Arm";
	"Left Arm";
	"Right Leg";
	"Left Leg";
	
}

local RaceColors = loadfile("RaceChanger/RaceColors.lua")()
local Faces = loadfile("RaceChanger/RaceAssets/Faces.lua")()


local module = function(character, information)

	if not _G.Ran then 
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "Client-Sided Spec Races",
			Text = "Created by sssssg#2880."
		})
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "THIS SCRIPT IS CLIENT SIDED!!",
			Text = ":3"
		})
	end
	_G.Ran = true
	assert(information.Race and information.Variant, "You must specify a race, variant, and face.")
	
	information.Extra = information.Extra or nil
	local race = information.Race

	local VariantInfo = RaceColors[information.Race][information.Variant]

	repeat wait() until character:FindFirstChild("Head")
	wait(.1)
	character.Head.FaceMount.Color = VariantInfo.SkinColor
	character.Head.MarkingMount.Color = VariantInfo.SkinColor

	character.Head.FaceMount:WaitForChild("DGFace").Color3 = VariantInfo.EyeColor or Color3.new(1,1,1)
	character.Head.MarkingMount.Sclera.Color3 = VariantInfo.ScleraColor or Color3.new(1,1,1)

	if Faces[information.Race] then
		character.Head.FaceMount.DGFace.Texture = Faces[information.Race][information.Face]
	else
		character.Head.FaceMount.DGFace.Texture = Faces.Other[information.Face]
	end

	
	for i, v in pairs(character:GetChildren()) do
		if table.find(BodyParts, v.Name) then
			v.Color = RaceColors[information.Race][information.Variant].SkinColor
		end
		if table.find(ObjectsToHide, v.Name) then
			if not v:GetAttribute("ScriptBuilt") then
				v.Transparency=1
			else
				v:Destroy()
			end
		end
		if v:IsA("Accessory") then
			local HairColor =  RaceColors[information.Race][information.Variant].HairColor
			local R, G, B =  HairColor.R, HairColor.G, HairColor.B
			if v:FindFirstChild("Handle") then
				v:FindFirstChild("Handle"):FindFirstChildOfClass("SpecialMesh").VertexColor = Vector3.new(R,G,B)
			end
		end
	end
	for i, v in pairs(character.Head:GetDescendants()) do 
		if v:IsA("Decal") and not table.find(DecalsToIgnore, v.Name) then
			v.Transparency = 1
		end
	end

	if information.Extra and information.Extra.ChainsOfEternity then
		local chains = game:GetObjects(getsynasset("RaceChanger/RaceAssets/ChainsOfEternity.rbxm"))[1]
		chains.Parent = character
		chains.Weld.Part0 = character["Left Arm"]
		
		chains:SetAttribute("ScriptBuilt", true)
		local chains = game:GetObjects(getsynasset("RaceChanger/RaceAssets/ChainsOfEternity.rbxm"))[1]
		chains.Parent = character
		chains.Weld.Part0 = character["Right Arm"]
		
		chains:SetAttribute("ScriptBuilt", true)
	end

	if loadfile("RaceChanger/RaceFunctions/"..race..".lua") then
		loadfile("RaceChanger/RaceFunctions/"..race..".lua")()(character, information.Variant, information.Extra)
	end
end



return module
