Framework = {}

local function DetectFramework()
    if Config.Framework ~= 'auto' then
        return Config.Framework
    end
    
    if GetResourceState('creative') == 'started' then
        return 'CreativeV3'
    elseif GetResourceState('vrp') == 'started' then
        return 'CreativeV5'
    elseif GetResourceState('qb-core') == 'started' then
        return 'Qbcore'
    elseif GetResourceState('qbx-core') == 'started' then
        return 'Qbox'
    end
    
    return nil
end

Framework.Name = DetectFramework()

function Framework.GetCore()
    if Framework.Name == 'CreativeV3' or Framework.Name == 'CreativeV5' then
        return Tunnel, Proxy
    elseif Framework.Name == 'Qbcore' then
        return exports['qb-core']:GetCoreObject()
    elseif Framework.Name == 'Qbox' then
        return exports['qbx-core']:GetCoreObject()
    end
end
