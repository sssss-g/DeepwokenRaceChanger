

return function(character, variant, information)
    
    local Masks = game:GetObjects(getsynasset("RaceChanger/RaceAssets/Vesperian.rbxm"))[1]
    local Mask
    if variant == "Primal" then
        Mask = Masks.Primal:Clone()
        Mask.Parent = character
        Mask.Weld.Part0 = character.Head
        Mask.Name = "VespMask"
    else
        Mask = Masks.Basic:Clone()
        Mask.Parent = character
        Mask.Weld.Part0 = character.Head
        Mask.Name = "VespMask"
    end
    Mask:SetAttribute("ScriptBuilt", true)
end