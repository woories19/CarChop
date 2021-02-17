-- Mechanic Repairing Player's Car

-- Spawn Ped
Citizen.CreateThread(function()
    modelHash = GetHashKey("mp_m_waremech_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
       	Wait(1)
    end
     
end)
-- Mechanic 1
function createNPC()

    local target = GetVehiclePedIsIn(PlayerPedId(), false)
    local coords = GetOffsetFromEntityInWorldCoords(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1.5, 1.7, 0.5)
    local heading = GetEntityHeading(GetVehiclePedIsIn(PlayerPedId(), false))
    created_ped = CreatePed(5, modelHash , coords.x, coords.y, coords.z - 1, heading + 270.0, true, true)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
    --------------
    RequestAnimDict("mini")
    RequestAnimDict("mini@repair")
    while (not HasAnimDictLoaded("mini@repair")) do
        Citizen.Wait(0) 
    end
    TaskPlayAnim(created_ped,"mini@repair","fixing_a_player",1.0,-1.0, 5000, 0, 1, true, true, true)
end
-- Mechanic 2
function createNPC1()

    local target = GetVehiclePedIsIn(PlayerPedId(), false)
    local coords = GetOffsetFromEntityInWorldCoords(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.5, -1.0, 0.5)
    local heading = GetEntityHeading(GetVehiclePedIsIn(PlayerPedId(), false))
    created_ped1 = CreatePed(5, modelHash , coords.x, coords.y, coords.z - 1, heading + 90.0, true, true)
    SetEntityInvincible(created_ped1, true)
    SetBlockingOfNonTemporaryEvents(created_ped1, true)
    --------------
    RequestAnimDict("mini")
    RequestAnimDict("mini@repair")
    while (not HasAnimDictLoaded("mini@repair")) do
        Citizen.Wait(0) 
    end
    TaskPlayAnim(created_ped1,"mini@repair","fixing_a_ped",1.0,-1.0, 5000, 0, 1, true, true, true)
end
-- Mechanic 3
function createNPC2()

    local target = GetVehiclePedIsIn(PlayerPedId(), false)
    local coords = GetOffsetFromEntityInWorldCoords(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1.5, -1.3, 0.5)
    local heading = GetEntityHeading(GetVehiclePedIsIn(PlayerPedId(), false))
    created_ped2 = CreatePed(5, modelHash , coords.x, coords.y, coords.z - 1, heading + 270.0, true, true)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    --------------
    RequestAnimDict("mini")
    RequestAnimDict("mini@repair")
    while (not HasAnimDictLoaded("mini@repair")) do
        Citizen.Wait(0) 
    end
    TaskPlayAnim(created_ped2,"mini@repair","fixing_a_ped",1.0,-1.0, 5000, 0, 1, true, true, true)
end
-- Delete Peds
function dp()
    DeleteEntity(created_ped)
    DeleteEntity(created_ped1)
    DeleteEntity(created_ped2)
end
-- Alert Message
function alert() 
    TriggerEvent('chat:addMessage', {
        color = { 0, 255, 0},
        multiline = true,
        args = {"System", "Parts Stolen"}
    })
end
-- Doors Fall Off
function breakcar()
    SetVehicleDoorBroken(GetVehiclePedIsIn(PlayerPedId()), 0, false)
    SetVehicleDoorBroken(GetVehiclePedIsIn(PlayerPedId()), 1, false)
    SetVehicleDoorBroken(GetVehiclePedIsIn(PlayerPedId()), 2, false)
    SetVehicleDoorBroken(GetVehiclePedIsIn(PlayerPedId()), 3, false)
    SetVehicleDoorBroken(GetVehiclePedIsIn(PlayerPedId()), 4, false)
    SetVehicleDoorBroken(GetVehiclePedIsIn(PlayerPedId()), 5, false)
    SetVehicleTyreBurst(GetVehiclePedIsIn(PlayerPedId()), 0, true, 1000)
    SetVehicleTyreBurst(GetVehiclePedIsIn(PlayerPedId()), 1, true, 1000)
    SetVehicleTyreBurst(GetVehiclePedIsIn(PlayerPedId()), 2, true, 1000)
    SetVehicleTyreBurst(GetVehiclePedIsIn(PlayerPedId()), 3, true, 1000)
    SetVehicleTyreBurst(GetVehiclePedIsIn(PlayerPedId()), 4, true, 1000)
    SetVehicleTyreBurst(GetVehiclePedIsIn(PlayerPedId()), 5, true, 1000)
    SetVehicleTyreBurst(GetVehiclePedIsIn(PlayerPedId()), 6, true, 1000)
    SetVehicleTyreBurst(GetVehiclePedIsIn(PlayerPedId()), 7, true, 1000)
    SetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId()), -4000)
end

RegisterNetEvent("mech:stealparts")
AddEventHandler("mech:stealparts", function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    FreezeEntityPosition(veh, true)
    createNPC()
    createNPC1()
    createNPC2()
    Citizen.Wait(7000)
    alert()
    breakcar()
    dp()
    FreezeEntityPosition(veh, false)
end)