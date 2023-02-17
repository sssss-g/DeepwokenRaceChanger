local RaceColors = loadfile("RaceChanger/RaceColors.lua")()
local Faces = loadfile("RaceChanger/RaceAssets/Faces.lua")()


return function (Information)
    local Race = Information.Race
    local Face = Information.Face or RaceColors[Race].DefaultFace
    local Variant = Information.Variant or RaceColors[Race].DefaultVariant

    local extra = {}

    if Information.Chains then
        extra.ChainsOfEternity = true
    end
    if Information.Color then
        extra.Color = Information.Color
    end

    if Information.Halo then
        extra.Halo = Information.Halo
    end
    loadfile("RaceChanger/Secondary.lua")()(game.Players.LocalPlayer.Character, {
        Race = Race,
        Variant = Variant,
        Face = Face,
        Extra = extra
    })
end