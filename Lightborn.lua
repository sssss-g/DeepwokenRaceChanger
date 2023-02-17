

return function(character, variant, information)
    print(information.Halo)
    if not information.Halo or information.Halo == "Head" then
        local Halo = game:GetObjects(getsynasset("RaceChanger/RaceAssets/Halo.rbxm"))[1]
        Halo.Parent = character
        Halo.Weld.Part0 = character.Head
        if information.Color then
            Halo.Color = information.Color
        end
        Halo:SetAttribute("ScriptBuilt", true)
    elseif information.Halo == "Arms" then
        local Halo = game:GetObjects(getsynasset("RaceChanger/RaceAssets/HaloArms.rbxm"))[1]
        Halo.Parent = character
        Halo.Weld.Part0 = character["Right Arm"]
        if information.Color then
            Halo.Color = information.Color
        end
        Halo:SetAttribute("ScriptBuilt", true)

        local Halo = game:GetObjects(getsynasset("RaceChanger/RaceAssets/HaloArms.rbxm"))[1]
        Halo.Parent = character
        Halo.Weld.Part0 = character["Left Arm"]
        if information.Color then
            Halo.Color = information.Color
        end
        Halo:SetAttribute("ScriptBuilt", true)
    elseif information.Halo == "Neck" then
        local Halo = game:GetObjects(getsynasset("RaceChanger/RaceAssets/HaloNeck.rbxm"))[1]
        Halo.Parent = character
        Halo.Weld.Part0 = character.Head
        if information.Color then
            Halo.Color = information.Color
        end
        Halo:SetAttribute("ScriptBuilt", true)
    end
end