Config = {}
Config.Debug = true

QBCore = exports['qb-core']:GetCoreObject()  -- uncomment if you use QBCore
-- ESX = exports["es_extended"]:getSharedObject() -- uncomment if you use ESX

Config.Settings = {
    Framework = "QB", -- Framework
    CarBlip = true, -- Blip for your car
    MaxOut = true, -- full tunning or not
    StoreVehKey = 'j', -- keybind for storing the vehicle (can be changed from the game keybinds)
    VehNeedsToBeStoped = true, -- if set to true the vehicle needs to be stoped before it can be stored
}

Config.Items = {
    -- Template = ['item_name'] = "vehicle_model" --
    ['car_elegy'] = 'elegy',
    ['car_t20'] = 't20',
}