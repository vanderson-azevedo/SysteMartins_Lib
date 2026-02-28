Framework = {}

local function DetectFramework()
    if Config.Framework ~= 'auto' then
        return Config.Framework
    end
    
    if GetResourceState('creative') == 'started' then
        return 'CreativeV5'
    elseif GetResourceState('vrp') == 'started' then
        return 'CreativeV3'
    elseif GetResourceState('qb-core') == 'started' then
        return 'Qcore'
    elseif GetResourceState('qbx-core') == 'started' then
        return 'Qbox'
    end

    return nil
end

Framework.Name = DetectFramework()

print("^6==========================================================^7")
print("^4[SysteMartins]^7 Site: ^5https://systemartins.com.br^7")
print("^4[SysteMartins]^7 Discord: ^5https://discord.systemartins.com.br^7")
print("^6==========================================================^7")
print('^4[SyteMartins_Lib]^7 Framework detectado: ^3' .. (Framework.Name or 'Nenhum') .. '^7')
print("^6==========================================================^7")

local remoteVersionUrl = "https://systemartins.com.br/Stm_Versao.json"
local originalname = "SysteMartins_Lib"
local scriptName = GetCurrentResourceName()
local localVersion = GetResourceMetadata(scriptName, 'version', 0) or "0.0.0"

if (scriptName ~= originalname) then
    print("^6==========================================================^7")
    print("^4[SysteMartins]^7 Site: ^5https://systemartins.com.br^7")
    print("^4[SysteMartins]^7 Discord: ^5https://discord.systemartins.com.br^7")
    print("^6==========================================================^7")
    print("^4[SysteMartins]^1 O NOME DO SEU RESOURCE ^3"..scriptName.."^1 ESTA INCORRETO!^7")
    print("^4[SysteMartins]^1 RENOMEIE O RESOURCE PARA ^2"..originalname.."^1 E REINICIE O SERVIDOR.^7")
    print("^6==========================================================^7")
    return;
end

function verificarVersao()
    PerformHttpRequest(remoteVersionUrl, function(code, data)
        if code == 200 and data then
            local success, remoteData = pcall(json.decode, data)
            if success and remoteData and remoteData[originalname] and remoteData[originalname].Versao then
                local remoteVersion = remoteData[originalname].Versao

                print("^6==========================================================^7")
                print("^4[SysteMartins]^7 Versao Local: ^3v"..localVersion.." ^7| Versao Disponivel: ^2v"..remoteVersion)
                print("^4[SysteMartins]^7 Site: ^5https://systemartins.com.br^7")
                print("^4[SysteMartins]^7 Discord: ^5https://discord.systemartins.com.br^7")
                print("^6==========================================================^7")

            if compararVersao(localVersion, remoteVersion) then
                print("^4[SysteMartins]^1 A VERSAO LOCAL DO ^3"..scriptName.."^1 ESTA DESATUALIZADA!^7")
                print("^4[SysteMartins]^1 FACA JA O DOWNLOAD DA NOVA VERSAO PELO ^5[ https://github.com/vanderson-azevedo/SysteMartins_Lib ]^7")
            else
                print("^4[SysteMartins]^7 SUA VERSAO ^3"..scriptName.."^7 ESTA ^2ATUALIZADA^7, OBRIGADO PELA PREFRENCIA.^7")
            end
                print("^6==========================================================^7")
            end
        end
    end)
end

-- Função para comparar versões (retorna true se versão remota é maior)
function compararVersao(localVer, remoteVer)
    local lv, rv = {}, {}

    for num in string.gmatch(localVer, "[0-9]+") do
        table.insert(lv, tonumber(num))
    end
    for num in string.gmatch(remoteVer, "[0-9]+") do
        table.insert(rv, tonumber(num))
    end

    for i = 1, math.max(#lv, #rv) do
        local l = lv[i] or 0
        local r = rv[i] or 0
        if r > l then
            return true
        elseif r < l then
            return false
        end
    end
    return false
end

-- Chamar a verificação ao iniciar o recurso
CreateThread(function()
    Wait(3000)
    verificarVersao()
end)

function Framework.GetCore()
    if Framework.Name == 'CreativeV3' or Framework.Name == 'CreativeV5' then
        return Tunnel, Proxy
    elseif Framework.Name == 'Qcore' then
        return exports['qb-core']:GetCoreObject()
    elseif Framework.Name == 'Qbox' then
        return exports['qbx-core']:GetCoreObject()
    end
end

-- FUNÇÕES UNIFICADAS
function Framework.Passport(source)
    if Framework.Name == 'CreativeV5' then
        return vRP.Passport(source)
    elseif Framework.Name == 'CreativeV3' then
        return vRP.getUserId(source)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayer(source)
        return Player and Player.PlayerData.citizenid
    end
end

function Framework.Identity(Passport)
    if Framework.Name == 'CreativeV5' then
        local Identity = vRP.Identity(Passport)
        return Identity and (Identity.name .. " " .. Identity.name2) or "Desconhecido"
    elseif Framework.Name == 'CreativeV3' then
        local Identity = vRP.userIdentity(Passport)
        return Identity and (Identity.name .. " " .. Identity.lastname) or "Desconhecido"
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and (Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname) or "Desconhecido"
    end
end

function Framework.GetBank(Passport)
    if Framework.Name == 'CreativeV5' then
        return vRP.Identity(Passport).bank
    elseif Framework.Name == 'CreativeV3' then
        return vRP.userIdentity(Passport).bank
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.PlayerData.money.bank or 0
    end
end

function Framework.GetMoney(Passport)
    if Framework.Name == 'CreativeV5' then
        return vRP.ItemAmount(Passport,Config.MonetaryItem,Amount)
    elseif Framework.Name == 'CreativeV3' then
        return vRP.tryGetInventoryItem(Passport,Config.MonetaryItem,Amount)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.PlayerData.money.cash or 0
    end
end

function Framework.PaymentBank(Passport, Amount) -- Cobrança pelo banco.
    if Framework.Name == 'CreativeV5' or Framework.Name == 'CreativeV3' then
        return vRP.PaymentBank(Passport, amount)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.Functions.RemoveMoney('bank', Amount)
    end
end

function Framework.PaymentMoney(Passport, Amount) -- Cobrança por item / carteira / maos
    if Framework.Name == 'CreativeV5' then 
        return vRP.PaymentMoney(Passport, amount)
    elseif Framework.Name == 'CreativeV3' then
        local consultItem = vRP.getInventoryItemAmount(Passport,Config.MonetaryItem)
        return parseInt(consultItem[1]) or 0
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.Functions.RemoveMoney('bank', Amount)
    end
end

function Framework.PaymentFull(Passport, Amount) -- Cobrança Banco ou Mãos.
    if Framework.Name == 'CreativeV5' then
        return vRP.PaymentFull(Passport, Amount)
    elseif Framework.Name == 'CreativeV3' then
        return vRP.paymentFull(Passport, Amount)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.Functions.RemoveMoney('bank', Amount)
    end
end

function Framework.AddBank(Passport, Amount) -- Adicionar Dinheiro ao Banco.
    if Framework.Name == 'CreativeV5' or Framework.Name == 'CreativeV3' then
        return vRP.AddBank(Passport, Amount)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.Functions.AddMoney('bank', Amount)
    end
end

function Framework.AddMoney(Passport, Amount) -- Adicionar Dinheiro a Mão.
    if Framework.Name == 'CreativeV5' then
        return vRP.GiveItem(Passport, Config.MonetaryItem, Amount)
    elseif Framework.Name == 'CreativeV3' then
        return vRP.generateItem(Passport, Config.MonetaryItem, Amount, true)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.Functions.AddMoney('bank', Amount)
    end
end

function Framework.GiveItem(Passport, Item, Amount) -- Adicionar Item na mão.
    if Framework.Name == 'CreativeV5' then
        return vRP.GiveItem(Passport, Item, Amount)
    elseif Framework.Name == 'CreativeV3' then
        return vRP.generateItem(Passport, Item, Amount, true)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.Functions.AddItem(Item, Amount)
    end
end

function Framework.GetItemAmount(Passport, Item) -- Verificar quantidade de Items.
    if Framework.Name == 'CreativeV5' or Framework.Name == 'CreativeV3' then
        return vRP.GetItemAmount(Passport, Item)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.Functions.GetItemByName(Item).amount or 0
    end
end

function Framework.HasPermission(Passport, Permission, Level)
    if Framework.Name == 'CreativeV5' then
        return vRP.HasPermission(Passport, Permission, Level)
    elseif Framework.Name == 'CreativeV3' then
        return vRP.hasPermission(Passport, Permission)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local Player = Framework.GetCore().Functions.GetPlayerByCitizenId(Passport)
        return Player and Player.PlayerData.job.name == Permission
    end
end

function Framework.NumPermission(Permission)
    if Framework.Name == 'CreativeV5' then
        return vRP.NumPermission(Permission)
    elseif Framework.Name == 'CreativeV3' then
        return vRP.numPermission(Permission)
    elseif Framework.Name == 'Qcore' or Framework.Name == 'Qbox' then
        local count = 0
        for _, Player in pairs(Framework.GetCore().Functions.GetPlayers()) do
            if Player.PlayerData.job.name == Permission then
                count = count + 1
            end
        end
        return count
    end
end

function Framework.ServerNotify(Source, Type, Message, Time)
    TriggerClientEvent("Notify", Source, Type, Message, "Restaurante", Time)
end
