CreateThread(function()
    local Peds = {
       -- { coords = { x = , y = , z = }, heading = , modelHash = , animationDict = "", animationName = "" },
       -- { coords = { x = , y = , z   }, heading = , modelHash = , animationDict = "", animationName = "" },
       -- { coords = { x = , y = , z   }, heading = , modelHash = , animationDict = "", animationName = "" },
            

    }

 
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


    if animationDict ~= nil and animationDict ~= "" and animationName ~= nil and animationName ~= "" then
        RequestAnimDict(animationDict)
        while not HasAnimDictLoaded(animationDict) do
            Wait(15)
        end
        TaskPlayAnim(ped, animationDict, animationName, 8.0, -8.0, -1, 49, 0, false, false, false)
    end
end
