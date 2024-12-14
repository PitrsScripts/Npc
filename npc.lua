CreateThread(function()
    -- Pevně nastavené údaje o NPC, bez použití configu
    local Peds = {
        -- EMS
        { coords = { x = 299.8427, y = -583.0869, z = 43.2608 }, heading = 67.1787, modelHash = -839953400, animationDict = "anim@heists@heist_corona@single_team", animationName = "single_team_loop_boss" },
        { coords = { x = 298.6837, y = -586.2682, z = 43.2609 }, heading = 68.9341, modelHash = -839953400, animationDict = "anim@heists@heist_corona@single_team", animationName = "single_team_loop_boss" },

        -- ROCKWOOD
        { coords = { x = -509.1595, y = 7367.1216, z = 12.8353 }, heading = 258.1313, modelHash = -839953400, animationDict = "anim@heists@heist_corona@single_team", animationName = "single_team_loop_boss" },
        { coords = { x = -508.6638, y = 7362.6104, z = 12.8290 }, heading = 323.2325, modelHash = -839953400, animationDict = "anim@heists@heist_corona@single_team", animationName = "single_team_loop_boss" },

        -- CLOTHING
        { coords = { x = 621.2434, y = 2754.0154, z = 42.0883 }, heading = 93.6024, modelHash = 2842568196, animationDict = "anim@heists@heist_corona@single_team", animationName = "single_team_loop_boss" },
        { coords = { x = 1200.6750, y = 2707.3081, z = 38.2249 }, heading = 84.1853, modelHash = 2842568196, animationDict = "anim@heists@heist_corona@single_team", animationName = "single_team_loop_boss" },

        -- LSPD
        { coords = { x = 433.2931, y = -985.7781, z = 30.7112 }, heading = 86.0869, modelHash = -839953400, animationDict = "anim@heists@heist_corona@single_team", animationName = "single_team_loop_boss" },
        { coords = { x = 433.6565, y = -978.3370, z = 30.7110 }, heading = 87.8472, modelHash = -839953400, animationDict = "anim@heists@heist_corona@single_team", animationName = "single_team_loop_boss" },

        -- Elektrarna
        { coords = { x = 2659.9719, y = 1642.3765, z = 24.8711 }, heading = 89.8041, modelHash = 3613962792, animationDict = "anim@heists@heist_corona@single_team", animationName = "single_team_loop_boss" },

        -- Banka Paleto
        { coords = { x = -110.8145, y = 6470.0117, z = 31.6341 }, heading = 218.7357, modelHash = 0x2799EFD8, animationDict = "", animationName = "" }
    }

    -- Pro každé NPC v seznamu vytvoříme NPC ve hře
    for _, v in pairs(Peds) do
        addNPC(v.coords.x, v.coords.y, v.coords.z, v.heading, v.modelHash, v.animationDict, v.animationName)
    end
end)

function addNPC(x, y, z, heading, modelHash, animationDict, animationName)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(15)
    end

    local ped = CreatePed(4, modelHash, x, y, z - 1, heading, false, true)
    SetEntityHeading(ped, heading)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    -- Požádáme o načtení animace
    RequestAnimDict(animationDict)
    while not HasAnimDictLoaded(animationDict) do
        Wait(15)
    end

    -- Spustíme animaci
    TaskPlayAnim(ped, animationDict, animationName, 8.0, -8.0, -1, 49, 0, false, false, false)
end
