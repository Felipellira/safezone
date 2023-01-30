local currentBlockers = {}
local isInsideZone = false

Citizen.CreateThread(function()
    for i = 1,#Config.Safezones do
        CurrentZone = Config.Safezones[i]
        local Polyzone = PolyZone:Create(CurrentZone.Coords,CurrentZone.Options)
        AddSafezoneProperties(Polyzone,CurrentZone.Blockers)
    end
end)

local function AddSafezoneProperties(zone,blockers)
    zone:onPlayerInOut(function(isPointInside,point)
        currentBlockers = blockers
        isInsideZone = isPointInside
    end)
end

Citizen.CreateThread(function()
    while true do
        Sleep = 500
        if isInsideZone then
            Sleep = 0
            if currentBlockers.Sprint then
                DisableControlAction(0,21,true)
            end
            if currentBlockers.Attack then
                DisableControlAction(0,263,true)
                DisableControlAction(0,264,true)
                DisableControlAction(0,257,true)
                DisableControlAction(0,140,true)
                DisableControlAction(0,141,true)
                DisableControlAction(0,142,true)
                DisableControlAction(0,143,true)
                DisableControlAction(0,24,true)
            end
            if currentBlockers.Drive then
                DisableControlAction(0,71,true)
                DisableControlAction(0,72,true)
                DisableControlAction(0,63,true)
                DisableControlAction(0,64,true)
            end
            if currentBlockers.Weapon then
                local ped = PlayerPedId()
                local unarmedHash = GetHashKey("WEAPON_UNARMED")
                if GetSelectedPedWeapon(ped) ~= unarmedHash then
                    SetCurrentPedWeapon(ped,unarmedHash,true)
                end
            end
        end
        Citizen.Wait(Sleep)
    end
end)



