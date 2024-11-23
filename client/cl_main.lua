Main = {
    Vehs = {},
    My = nil
}

function Main:StoreVeh()
    if IsPedInAnyVehicle(PlayerPedId(), false) then 
        local pedveh = GetVehiclePedIsIn(PlayerPedId())
        local pedvehplate = GetVehicleNumberPlateText(pedveh)
        local myvehplate = GetVehicleNumberPlateText(self.My)
        if Config.Settings.VehNeedsToBeStoped then 
            if GetEntitySpeed(pedveh) > 1 then 
                self:Notify("You need to stop the vehicle first", 'error', 2500)
                return
            end
        end
        if pedvehplate == myvehplate then
            local vehmodel = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(self.My)))
            TriggerServerEvent('bbv_vehitems:returnitem',vehmodel)
            DeleteVehicle(self.My)
            self.My = nil
            self:Notify("Vehicle Stored", 'error', 2500)
        else
            self:Notify("This is not your vehicle", 'error', 2500)
            return
        end
    end
end

function Main:SpawnVehicle(data)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    model = type(data) == 'string' and GetHashKey(data) or data
    if not IsModelInCdimage(model) then return end
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    isnetworked = isnetworked == nil or isnetworked
    self:LoadModel(model)
    self.Vehs[coords] = CreateVehicle(model, coords.x, coords.y, coords.z - 1, coords.w, false, false)
    self.My = self.Vehs[coords]
    local netid = NetworkGetNetworkIdFromEntity(veh)
    SetVehicleHasBeenOwnedByPlayer(self.Vehs[coords], true)
    SetNetworkIdCanMigrate(netid, true)
    SetVehicleNeedsToBeHotwired(self.Vehs[coords], false)
    SetVehRadioStation(self.Vehs[coords], 'OFF')
    SetVehicleFuelLevel(self.Vehs[coords], 100.0)
    SetModelAsNoLongerNeeded(model)
    SetVehicleOnGroundProperly(self.Vehs[coords])
    TaskWarpPedIntoVehicle(PlayerPedId(), self.Vehs[coords], -1)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(self.Vehs[coords]))
    self:Notify("Spawned Item Vehicle " .. data, 'success', 2500)
    if Config.Settings.CarBlip then
        CarBlips = AddBlipForEntity(self.Vehs[coords])
        SetBlipScale(CarBlips,0.6)
        SetBlipSprite(CarBlips,672)
        SetBlipColour(CarBlips,5)

        SetBlipDisplay(CarBlips, 4)
        SetBlipAsShortRange(CarBlips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('Rental Car')
        EndTextCommandSetBlipName(CarBlips)
    end
    if Config.Settings.MaxOut then Main:MaxOut(ped,self.Vehs[coords]) end
end


function Main:MaxOut(ped,veh)
    if not veh then 
        veh = GetVehiclePedIsIn(ped, false)
    end 
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 0, GetNumVehicleMods(veh, 0) - 1, false)
        SetVehicleMod(veh, 1, GetNumVehicleMods(veh, 1) - 1, false)
        SetVehicleMod(veh, 2, GetNumVehicleMods(veh, 2) - 1, false)
        SetVehicleMod(veh, 3, GetNumVehicleMods(veh, 3) - 1, false)
        SetVehicleMod(veh, 4, GetNumVehicleMods(veh, 4) - 1, false)
        SetVehicleMod(veh, 5, GetNumVehicleMods(veh, 5) - 1, false)
        SetVehicleMod(veh, 6, GetNumVehicleMods(veh, 6) - 1, false)
        SetVehicleMod(veh, 7, GetNumVehicleMods(veh, 7) - 1, false)
        SetVehicleMod(veh, 8, GetNumVehicleMods(veh, 8) - 1, false)
        SetVehicleMod(veh, 9, GetNumVehicleMods(veh, 9) - 1, false)
        SetVehicleMod(veh, 10, GetNumVehicleMods(veh, 10) - 1, false)
        SetVehicleMod(veh, 11, GetNumVehicleMods(veh, 11) - 1, false)
        SetVehicleMod(veh, 12, GetNumVehicleMods(veh, 12) - 1, false)
        SetVehicleMod(veh, 13, GetNumVehicleMods(veh, 13) - 1, false)
        SetVehicleMod(veh, 14, 16, false)
        SetVehicleMod(veh, 15, GetNumVehicleMods(veh, 15) - 2, false)
        SetVehicleMod(veh, 16, GetNumVehicleMods(veh, 16) - 1, false)
        ToggleVehicleMod(veh, 17, true)
        ToggleVehicleMod(veh, 18, true)
        ToggleVehicleMod(veh, 19, true)
        ToggleVehicleMod(veh, 20, true)
        ToggleVehicleMod(veh, 21, true)
        ToggleVehicleMod(veh, 22, true)
        SetVehicleMod(veh, 24, 1, false)
        SetVehicleMod(veh, 25, GetNumVehicleMods(veh, 25) - 1, false)
        SetVehicleMod(veh, 27, GetNumVehicleMods(veh, 27) - 1, false)
        SetVehicleMod(veh, 28, GetNumVehicleMods(veh, 28) - 1, false)
        SetVehicleMod(veh, 30, GetNumVehicleMods(veh, 30) - 1, false)
        SetVehicleMod(veh, 33, GetNumVehicleMods(veh, 33) - 1, false)
        SetVehicleMod(veh, 34, GetNumVehicleMods(veh, 34) - 1, false)
        SetVehicleMod(veh, 35, GetNumVehicleMods(veh, 35) - 1, false)
        SetVehicleMod(veh, 38, GetNumVehicleMods(veh, 38) - 1, true)
        SetVehicleWindowTint(veh, 1)
        SetVehicleTyresCanBurst(veh, false)
        SetVehicleNumberPlateTextIndex(veh, 5)
end

function Main:LoadModel(model)
    if HasModelLoaded(model) then return end
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end

function Main:Notify(txt,tp,time) -- QBCore notify
    if Config.Settings.Framework == "QB" then 
        QBCore.Functions.Notify(txt, tp, time)
    end
    if Config.Settings.Framework == "ESX" then 
        ESX.ShowNotification(txt)
    end
end

RegisterNetEvent('bbv_vehitems:spawnvehicle',function(data)
    Main:SpawnVehicle(data)
end)

RegisterCommand('+storeveh',function(source,args)
    Main:StoreVeh()
end)
RegisterKeyMapping('+storeveh', 'Store Vehicle Item', 'keyboard', 'k')
