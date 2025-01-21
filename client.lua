-- Love From " Curse Network "
-- First time I see a Dev this clueless like the Genx anti-cheat one
-- Discord " @1boaziz"




local ShowHealth = true
local ShowName = true
local espCars = true
local ShowLine = true
local ShowESP = false
local ShowDistance = true
local timeESP = 500
local playerSpctateed = 0
local garages = ""


firstSpawn = false
checkScNow = false
local permissions = {players = false, bans = false, logs = false, server = false, admins = false, genx = false}
local GX = {
    checkMenu = true,
    AimEntity = true,
    FreeCamAction = true,
    JumpAction = true,
    SpeedAction = true,
    SpectatorAction = true,
    FlyAction = true,
    VisibleAction = true,
    WeaponsAction = true
}

local options = {
    fly = true,
    menu = true,
    resources = true,
    vis = true,
    jump = true,
    speed = true,
    spectate = true,
    vpn = true,
    proxy = true,
    weapons = true,
    freecam = true
}

local serverData = {
    {on = Genx.optionsAnti.checkMenu[1], off = false, action = "menu", name = "حماية المنيوهات"},
    {on = Genx.optionsAnti.checkClient[1], off = false, action = "files", name = "حماية الملفات"},
    {on = Genx.optionsAnti.Explosion[1], off = false, action = "explode", name = "حماية التفجير"},
    {on = Genx.optionsAnti.spawnCars[1], off = false, action = "cars", name = "حماية السيارات"},
    {on = Genx.optionsAnti.FlyHack[1], off = false, action = "fly", name = "حماية الطيران"},
    {on = Genx.optionsAnti.giveAllWeapons[1], off = false, action = "giveallweapons", name = "حماية اعطاء الكل اسلحة "},
    {on = Genx.optionsAnti.StopResource[1], off = false, action = "resources", name = "حماية الريسورسات"},
    {on = Genx.optionsAnti.ptFxEvent[1], off = false, action = "partc", name = "حماية البارتكل"},
    {on = Genx.optionsAnti.spawnObjects[1], off = false, action = "objects", name = "حماية الاوبجكتات"},
    {on = Genx.optionsAnti.spawnBots[1], off = false, action = "bots", name = "حماية البوتات"},
    {on = Genx.optionsAnti.Visible[1], off = false, action = "vis", name = "حماية الاختفاء"},
    {on = Genx.optionsAnti.Jump[1], off = false, action = "jump", name = "حماية الجمب"},
    {on = Genx.optionsAnti.SpeedHack[1], off = false, action = "speed", name = "حماية السرعة"},
    {on = Genx.optionsAnti.Spectator[1], off = false, action = "spectate", name = "حماية السبكتيت"},
    {on = Genx.optionsAnti.BlackListWeapons, off = false, action = "weapons", name = "حماية الاسلحة الممنوعة"},
    {on = Genx.optionsAnti.VPN[1], off = false, action = "vpn", name = "حماية الفي بي ان"},
    {on = Genx.optionsAnti.PROXY[1], off = false, action = "proxy", name = "حماية البروكسي"},
    {on = Genx.optionsAnti.FreeCam[1], off = false, action = "freecam", name = "حماية الفري كام"},
}

local spawnCarsss = true
local startCheck = false

Citizen.CreateThread(function()
    SetTimeout(5000, function()
        TriggerServerEvent("GetCars")
    end)
end)

RegisterNetEvent("GetCars", function(garagesC, sp)
    garages = garagesC
    spawnCarsss = sp
    startCheck = true
end)

-->> Check Spawn Cars
-------------------------------------------
function IsPlayerNearMarker(marker, distance)
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed, true)
    local markerCoords = vector3(marker[2], marker[3], marker[4])
    local distanceBetween = #(playerCoords - markerCoords)
    return distanceBetween <= distance
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        local checkSpawnC = spawnCarsss
        if checkSpawnC and startCheck then
            local playerNearMarker = false
            local px, py, pz = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
            for _, marker in pairs(garages) do
                if IsPlayerNearMarker(marker, 15) then
                    playerNearMarker = true
                    TriggerServerEvent("Genx:fetchCars", false)
                    break
                end
            end

            if not playerNearMarker then
                TriggerServerEvent("Genx:fetchCars", true)
            end
        end
    end
end)

function IsPlayerNearCoordinates(coords)
    local playerCoords = GetEntityCoords(PlayerPedId(), false)
    local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, coords[1], coords[2], coords[3])
    if distance < 10.0 then
        return true
    else
        return false
    end
end

-->> Get VPN
-------------------------------------------
RegisterNuiCallback('checkInternet', function(data, cb)
    if data.action == "vpn" then
        if Genx.optionsAnti.VPN[1] then
            SetTimeout(5000, function()
                setBanned("استعمال في بي ان", Genx.optionsAnti.VPN[2])
            end)
        end
    elseif data.action == "proxy" then
        if Genx.optionsAnti.PROXY[1] then
            setBanned("استعمال بروكسي", Genx.optionsAnti.PROXY[2])
        end
    end
    cb({})
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    SendNUIMessage({
        type = 'updateData',
        data = serverData
    })
end)

-->> Get Options
-------------------------------------------
RegisterNUICallback('genxOptions', function(data)
    if data.option == "fly" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "menu" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "resources" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "speed" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "spectate" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "spectate" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "freecam" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "vpn" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "vis" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "proxy" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "weapons" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    elseif data.option == "jump" then
        TriggerServerEvent("updateOptions_c", data.option, data.status)
    else
        TriggerServerEvent("updateOptions", data.option, data.status)
    end
end)

RegisterNetEvent('updateOptions_c', function(data)  
    if data.option == "fly" then
        options.fly = data.status
    elseif data.option == "menu" then
        options.menu = data.status
    elseif data.option == "resources" then
        options.resources = data.status
    elseif data.option == "speed" then
        options.speed = data.status
    elseif data.option == "spectate" then
        options.spectate = data.status
    elseif data.option == "spectate" then
        options.jump = data.status
    elseif data.option == "freecam" then
        options.freecam = data.status
    elseif data.option == "vpn" then
        options.vpn = data.status
    elseif data.option == "vis" then
        options.vis = data.status
    elseif data.option == "proxy" then
        options.proxy = data.status
    elseif data.option == "weapons" then
        options.weapons = data.status
    end
end)

-->> Show Menu
-------------------------------------------
local ShowMenu = false
RegisterCommand(Genx.basicResource.openCommand, function()
    if permissions.players or permissions.bans or permissions.logs or permissions.server or permissions.admins then
        ShowMenu = not ShowMenu
        SetNuiFocus(ShowMenu, ShowMenu)
        SendNUIMessage({
            type = "showMenu"
        })
    end
end)

RegisterKeyMapping(Genx.basicResource.openCommand, "GENX MENU", 'keyboard', Genx.basicResource.openKey) 

RegisterNetEvent("sendNotify", function(type, message, time)
    SendNUIMessage({ type = 'notify', action = type, message = message, time = time})
end)

-->> Permissions
-------------------------------------------
RegisterNetEvent("setPermissions", function(permTypes)
    for _, permType in ipairs(permTypes) do
        if permissions[permType] ~= nil then
            permissions[permType] = true
        end
    end
    SendNUIMessage({ type = 'setPermission', players = permissions.players, bans = permissions.bans, logs = permissions.logs, server = permissions.server, admins = permissions.admins, genx = permissions.genx })
end)

RegisterNetEvent("setPermissions_menu", function(permTypes)
    for _, permType in ipairs(permTypes) do
        if GX[permType] ~= nil then
            GX[permType] = false
        end
    end
end)

-->> NoClip
-------------------------------------------
local noclip = false
local noclip_speed = 5.0
function toggleNoclip()
    noclip = not noclip
    local ped = GetPlayerPed(-1)
    if noclip then
        SetEntityInvincible(ped, true)
        SetEntityVisible(ped, false, false)
        TriggerEvent("sendNotify", "done", "تم تفعيل الطيران", 5000)
        ShowMenu = not ShowMenu
        SetNuiFocus(ShowMenu, ShowMenu)
    else 
        SetEntityInvincible(ped, false)
        SetEntityVisible(ped, true, false)
        TriggerEvent("sendNotify", "error", "تم ايقاف الطيران", 5000)
        ShowMenu = not ShowMenu
        SetNuiFocus(ShowMenu, ShowMenu)
    end
end

local waitClip = 500

function GetPlayerPositionNoClip()
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
    return x,y,z
end

function GetCameraDirection()
    local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
    local pitch = GetGameplayCamRelativePitch()

    local x = -math.sin(heading*math.pi/180.0)
    local y = math.cos(heading*math.pi/180.0)
    local z = math.sin(pitch*math.pi/180.0)

    local len = math.sqrt(x*x+y*y+z*z)
    if len ~= 0 then
        x = x/len
        y = y/len
        z = z/len
    end

    return x,y,z
end

Citizen.CreateThread(function()
    
    while true do
        Citizen.Wait(waitClip)
        if noclip then
            waitClip = 10
            local ped = GetPlayerPed(-1)
            local x, y, z = GetPlayerPositionNoClip()
            local dx, dy, dz = GetCameraDirection()
            local speed = noclip_speed
            SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
            if IsControlPressed(0, 32) then
                x = x + speed * dx
                y = y + speed * dy
                z = z + speed * dz
            end
            if IsControlPressed(0, 269) then
                x = x - speed * dx
                y = y - speed * dy
                z = z - speed * dz
            end
            SetEntityCoordsNoOffset(ped, x, y, z, true, true, true)
        else
            waitClip = 500
        end
    end
end)

-->> Teleport
-------------------------------------------
function GenxTP()
    local waypointBlip = GetFirstBlipInfoId(GetWaypointBlipEnumId())
    ShowMenu = not ShowMenu
    SetNuiFocus(ShowMenu, ShowMenu)
	if DoesBlipExist(waypointBlip) then 

        local blipPos = GetBlipInfoIdCoord(waypointBlip) 

        local z = GetHeightmapTopZForPosition(blipPos.x, blipPos.y)
        local _, gz = GetGroundZFor_3dCoord(blipPos.x, blipPos.y, z, true)

        SetEntityCoords(PlayerPedId(), blipPos.x, blipPos.y, z, true, false, false, false)
        FreezeEntityPosition(PlayerPedId(), true)

        repeat
            Citizen.Wait(50)
            _, gz = GetGroundZFor_3dCoord(blipPos.x, blipPos.y, z, true)
        until gz ~= 0

        SetEntityCoords(PlayerPedId(), blipPos.x, blipPos.y, gz, true, false, false, false)
        FreezeEntityPosition(PlayerPedId(), false)
        TriggerEvent("sendNotify", "done", "تم نقلك للنقطة", 5000)
        startFX()

    else 
        TriggerEvent("sendNotify", "error", "يرجى التحديد بالخريطة اولا", 5000)
    end
end

-->> Fix Car
-------------------------------------------
function FixCar()
    local PlayerFixed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(PlayerFixed) then
        SetVehicleEngineHealth(GetVehiclePedIsIn(PlayerFixed), 9999)
        SetVehiclePetrolTankHealth(GetVehiclePedIsIn(PlayerFixed), 9999)
        SetVehicleFixed(GetVehiclePedIsIn(PlayerFixed))
        TriggerEvent("sendNotify", "done", "تم اصلاح السيارة", 5000)
    else
        TriggerEvent("sendNotify", "error", "يجب ان تكون في سيارة", 5000)
    end
end


RegisterNetEvent("getLists", function(players, bans)
    SendNUIMessage({ type = 'updateLists', players = players, bans = bans})
end)

RegisterNetEvent("getLogs", function(logs)
    SendNUIMessage({ type = 'updateLogs', logs = logs})
end)

RegisterNetEvent("notspectate", function()
    SendNUIMessage({ type = 'notspectate'})
end)

RegisterNetEvent("screenshot", function()
    SendNUIMessage({ type = 'screenshot'})
end)

RegisterNUICallback('screenshot', function(data)
    TriggerServerEvent("screenshot", data.image) 
end)

RegisterNetEvent("alert", function()
    SendNUIMessage({ type = 'alert'})
end)

-->> Set Banned
-------------------------------------------
function setBanned(data, action)
    SendNUIMessage({ type = 'setBanned', reason = data, action = action})
    SetTimeout(10000, function() while true do end end)
end

RegisterNUICallback('setBanned', function(data)
    TriggerServerEvent("getBanned", data.reason, data.action, data.image, data.ip)
end)


Citizen.CreateThread(function()
    Citizen.Wait(1000)
    TriggerServerEvent("checkPermission")
end)

AddEventHandler('playerSpawned', function()
    SetTimeout(15000, function()
        checkScNow = true
    end)

    firstSpawn = false
    TriggerServerEvent("requestClientResponse")
    if permissions.players or permissions.bans or permissions.logs or permissions.server or permissions.admins then
        TriggerServerEvent("requestPerResponse")
    end
    Citizen.Wait(1000)
    if not firstSpawn then
        SetTimeout(60000, function()
            firstSpawn = true
        end)
        TriggerServerEvent("checkPermission")
        TriggerEvent("sendNotify", "done", "هذا السيرفر محمي بواسطة حماية جنكس", 8000)
    end
end)

-->> Check Menus
------------------------------------------------------------
Citizen.CreateThread(function()
    while Genx.optionsAnti.checkMenu[1] do
        Citizen.Wait(3000)
        if GX.checkMenu and checkScNow and IsPauseMenuActive() ~= 1 then
            if options.menu then
                SendNUIMessage({ type = 'screen'})
            end
        end
    end
end)


RegisterNUICallback('genxV2', function(data)
    if data.type == 'close' then
        ShowMenu = not ShowMenu
        SetNuiFocus(ShowMenu, ShowMenu)
    else
        if permissions.players or permissions.bans or permissions.logs or permissions.server or permissions.admins then
            if data.type == 'ban' then 
                TriggerServerEvent("getNewActions", 'ban', data.player)
            elseif data.type == 'revive' then 
                TriggerServerEvent("getNewActions", 'revive', data.player)
            elseif data.type == 'revive2' then 
                TriggerServerEvent("getNewActions", 'revive2')
            elseif data.type == 'tpto' then 
                TriggerServerEvent("getNewActions", 'tpto', data.player)
            elseif data.type == 'tpme' then 
                TriggerServerEvent("getNewActions", 'tpme', data.player)
            elseif data.type == 'tpadmins' then 
                TriggerServerEvent("getNewActions", 'tpadmins')
            elseif data.type == 'unban' then 
                TriggerServerEvent("getNewActions", 'unban', data.player)
            elseif data.type == 'spectate' then 
                TriggerServerEvent("getNewActions", 'spectate', data.player)
                playerSpctateed = data.player
            elseif data.type == 'alert' then 
                TriggerServerEvent("getNewActions", 'alert', data.player)
            elseif data.type == 'screenshot' then 
                TriggerServerEvent("getNewActions", 'screenshot')
            elseif data.type == 'reviveall' then 
                TriggerServerEvent("getNewActions", 'reviveall')
                TriggerEvent("sendNotify", "done", "تم انعاش الجميع", 5000)
            elseif data.type == 'deleteobjects' then 
                TriggerServerEvent("getNewActions", 'deleteobjects')
            elseif data.type == 'deletepeds' then 
                TriggerServerEvent("getNewActions", 'deletepeds')
            elseif data.type == 'stopchat' then 
                TriggerServerEvent("getNewActions", 'stopchat')
            elseif data.type == 'startchat' then 
                TriggerServerEvent("getNewActions", 'startchat')
            elseif data.type == 'startvoice' then 
                TriggerServerEvent("getNewActions", 'startvoice')
            elseif data.type == 'deletecars' then 
                TriggerServerEvent("getNewActions", 'deletecars')
            elseif data.type == 'refreshbans' then 
                TriggerServerEvent('getLists')
            elseif data.type == 'banScreen' then 
                setBanned("استعمال منيو", Genx.optionsAnti.checkMenu[2])
            elseif data.type == 'noclip' then 
                toggleNoclip()
            elseif data.type == 'tomap' then
                GenxTP()
            elseif data.type == 'weapons' then
                GetAllWeaponsGENX()
            elseif data.type == 'fix' then 
                FixCar()
            elseif data.type == 'stopvoice' then 
                TriggerServerEvent("getNewActions", 'stopvoice')
            elseif data.type == 'skin' then 
                changeSkin(data.skin)
                startFX()
                ShowMenu = not ShowMenu
                SetNuiFocus(ShowMenu, ShowMenu)
            elseif data.type == 'car' then 
                spawnVehicle(data.car)
                ShowMenu = not ShowMenu
                SetNuiFocus(ShowMenu, ShowMenu)
            elseif data.type == 'startesp' then 
                ShowESP = true
                TriggerEvent("sendNotify", "done", "تم تفعيل الرادار", 5000)
            elseif data.type == 'stopesp' then 
                ShowESP = false
                TriggerEvent("sendNotify", "error", "تم ايقاف الرادار", 5000)
            elseif data.type == 'stop_spectate' then
                TriggerServerEvent("getNewActions", 'stop_spectate')
                TriggerServerEvent('genx_watch:sv:stopRendering' , playerSpctateed)
                TriggerServerEvent('genx_watch:sv:stopWatching' , playerSpctateed)
                TriggerEvent("sendNotify", "error", "تم ايقاف المشاهدة", 5000)
            
            end
        else
            setBanned("محاولة العبث بالحماية", "kick")
        end
    end
end)

-->> Get Nearby Players
-------------------------------------------
function GetNearbyPlayers(radius)
    local playerPed = PlayerId()

    for _, playerId in ipairs(GetActivePlayers()) do
        if playerId ~= playerPed then
            local playerCoords = GetEntityCoords(GetPlayerPed(playerId))
            local distance = #(GetEntityCoords(GetPlayerPed(playerPed)) - playerCoords)

            if distance <= radius then
                return true
            end
        end
    end

    return false
end

-->> Loops
-------------------------------------------
local countSPAM = 0
local countSPAMFly = 0
local countSPAMSPEED = 0
local ANTISPAMFREE = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local player = PlayerId()
        if firstSpawn then
            if player and player ~= -1 then
                local _ped = GetPlayerPed(-1) 
                local isNer = GetNearbyPlayers(3)

                -->> Free Cam
                if Genx.optionsAnti.FreeCam[1] and options.freecam then
                    if GX.FreeCamAction then
                        local camcoords = (GetEntityCoords(_ped) - GetFinalRenderedCamCoord())
                        if not isNer and not IsEntityOnScreen(PlayerPedId()) and not IsCinematicIdleCamRendering() and not IsCinematicCamActive() and not IsCinematicCamRendering() and not IsCutscenePlaying() and not IsCutsceneActive() then
                            if (camcoords.x > 9) or (camcoords.y > 9) or (camcoords.z > 9) or (camcoords.x < -9) or (camcoords.y < -9) or (camcoords.z < -9) then
                                if not IsPedInAnyVehicle(PlayerPedId(), 1) or not IsPedInAnyVehicle(_ped, true) then

                                    ANTISPAMFREE = ANTISPAMFREE + 1
                                    SetTimeout(10000, function()
                                        ANTISPAMFREE = 0
                                    end)
                                    if ANTISPAMFREE > 2 then
                                        setBanned("الفري كام", Genx.optionsAnti.FreeCam[2])
                                        break
                                    end
                                end
                            end
                        end
                    end
                end

                -->> Jump
                if Genx.optionsAnti.Jump[1] then
                    if GX.JumpAction and options.jump then
                        if IsPedJumping(PlayerPedId()) then
                            local m = 0
                            repeat
                                Citizen.Wait(0)
                                m=m+1
                                local h = IsPedJumping(PlayerPedId())
                            until not h
                            if m > 250 then
                                if not isNer then
                                    local ped = GetPlayerPed(-1)
                                    local health = GetEntityHealth(ped)
                                    if health <= 120 then
                                        return
                                    else
                                        setBanned("القفز الممنوع", Genx.optionsAnti.Jump[2])
                                        break
                                    end
                                end
                            end
                        else
                            Citizen.Wait(500)
                        end
                    end
                end

                -->> Speed Hack
                if Genx.optionsAnti.SpeedHack[1] then
                    if GX.SpeedAction and options.speed then
                        if not IsPedInAnyPlane(_ped) and not IsPedInAnyVehicle(PlayerPedId(), 1)  and not IsPedInAnyHeli(_ped) then
                            if GetEntitySpeed(PlayerPedId()) > 10 then
                                if not isNer and not IsPedInAnyVehicle(_ped, true) and not IsPedFalling(_ped) and not IsPedInParachuteFreeFall(_ped) and not IsPedJumpingOutOfVehicle(_ped) and not IsPedRagdoll(_ped) and not IsEntityAttached(_ped) then
                                    local aboveground =  GetEntityHeightAboveGround(_ped)
                                    if tonumber(aboveground) > tonumber("20") then
                                        return
                                    else
                                        countSPAMSPEED = countSPAMSPEED + 1
                                        SetTimeout(10000, function()
                                            countSPAMSPEED = 0
                                        end)
                                        if countSPAMSPEED > 2 then
                                            setBanned("السرعة الفائقة", Genx.optionsAnti.SpeedHack[2])
                                            break
                                        end
                                    end
                                end
                                Wait(300)
                            end
                        end
                    end
                end

                -->> Spectator Hack
                if Genx.optionsAnti.Spectator[1] then
                    if GX.SpectatorAction and options.spectate then
                        local isInSpectatorMode = NetworkIsInSpectatorMode()
                        if isInSpectatorMode then
                            setBanned("السبكتيت", Genx.optionsAnti.Spectator[2])
                            break
                        end
                    end
                end

                -->> FlyHack
                if Genx.optionsAnti.FlyHack[1] then
                    if GX.FlyAction and options.fly then
                        local aboveground =  GetEntityHeightAboveGround(_ped)
                        if tonumber(aboveground) > tonumber("25") then
                            if not isNer and not IsPedInAnyVehicle(_ped, false) and not IsPedInParachuteFreeFall(_ped) and not IsPedFalling(_ped) and not IsEntityAttached(_ped) and not IsPedSwimming(_ped) and not IsPedSwimmingUnderWater(_ped) and not IsPlayerDead(_ped) then
                                countSPAMFly = countSPAMFly + 1
                                SetTimeout(5000, function()
                                    countSPAMFly = 0
                                end)
                                if countSPAMFly > 2 then
                                    if GetNearbyPlayers(2) then
                                        return
                                    else
                                        setBanned("الطيران", Genx.optionsAnti.FlyHack[2])
                                        break
                                    end
                                end
                            end
                        end
                    end
                end

                -->> Visible
                if Genx.optionsAnti.Visible[1] then
                    if GX.VisibleAction and options.vis then
                        local _entityalpha = GetEntityAlpha(_ped)
                        if not isNer and not IsEntityVisible(_ped) or not IsEntityVisibleToScript(_ped) or _entityalpha <= 150  and not IsPlayerDead(_ped) then
                            if not IsPedInAnyVehicle(_ped, false) then
                                local ped = GetPlayerPed(-1)
                                local health = GetEntityHealth(ped)
                                if health <= 120 then
                                    return
                                else
                                    Citizen.Wait(1000)
                                    countSPAM = countSPAM + 1
                                    SetTimeout(8000, function()
                                        countSPAM = 0
                                    end)
                                    if countSPAM > 3 then
                                        if GetNearbyPlayers(2) then
                                            return
                                        else
                                            setBanned("الاختفاء", Genx.optionsAnti.Visible[2])
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

            end
        end
    end
end)

-->> Weapons Blacklist
-------------------------------------------
local listWeapons = {
    "WEAPON_KNIFE","WEAPON_KNUCKLE","WEAPON_NIGHTSTICK","WEAPON_HAMMER","WEAPON_BAT","WEAPON_GOLFCLUB","WEAPON_CROWBAR","WEAPON_BOTTLE","WEAPON_DAGGER","WEAPON_HATCHET","WEAPON_MACHETE","WEAPON_FLASHLIGHT","WEAPON_SWITCHBLADE","WEAPON_PROXMINE","WEAPON_BZGAS","WEAPON_SMOKEGRENADE","WEAPON_MOLOTOV","WEAPON_FIREEXTINGUISHER","WEAPON_PETROLCAN","WEAPON_HAZARDCAN","WEAPON_SNOWBALL","WEAPON_FLARE","WEAPON_BALL","WEAPON_REVOLVER","WEAPON_POOLCUE","WEAPON_PIPEWRENCH","WEAPON_PISTOL","WEAPON_PISTOL_MK2","WEAPON_COMBATPISTOL","WEAPON_APPISTOL","WEAPON_PISTOL50","WEAPON_SNSPISTOL","WEAPON_HEAVYPISTOL","WEAPON_VINTAGEPISTOL","WEAPON_STUNGUN","WEAPON_FLAREGUN","WEAPON_MARKSMANPISTOL","WEAPON_MICROSMG","WEAPON_MINISMG","WEAPON_SMG","WEAPON_SMG_MK2","WEAPON_ASSAULTSMG","WEAPON_MG","WEAPON_COMBATMG","WEAPON_COMBATMG_MK2","WEAPON_COMBATPDW","WEAPON_GUSENBERG","WEAPON_MACHINEPISTOL","WEAPON_ASSAULTRIFLE","WEAPON_ASSAULTRIFLE_MK2","WEAPON_CARBINERIFLE","WEAPON_CARBINERIFLE_MK2","WEAPON_ADVANCEDRIFLE","WEAPON_SPECIALCARBINE","WEAPON_BULLPUPRIFLE","WEAPON_COMPACTRIFLE","WEAPON_PUMPSHOTGUN","WEAPON_SWEEPERSHOTGUN","WEAPON_SAWNOFFSHOTGUN","WEAPON_BULLPUPSHOTGUN","WEAPON_ASSAULTSHOTGUN","WEAPON_MUSKET","WEAPON_HEAVYSHOTGUN","WEAPON_DBSHOTGUN","WEAPON_SNIPERRIFLE","WEAPON_HEAVYSNIPER","WEAPON_HEAVYSNIPER_MK2","WEAPON_MARKSMANRIFLE","WEAPON_GRENADELAUNCHER","WEAPON_GRENADELAUNCHER_SMOKE","WEAPON_RPG","WEAPON_MINIGUN","WEAPON_FIREWORK","WEAPON_RAILGUN","WEAPON_HOMINGLAUNCHER","WEAPON_GRENADE","WEAPON_STICKYBOMB","WEAPON_COMPACTLAUNCHER","WEAPON_SNSPISTOL_MK2","WEAPON_REVOLVER_MK2","WEAPON_DOUBLEACTION","WEAPON_SPECIALCARBINE_MK2","WEAPON_BULLPUPRIFLE_MK2","WEAPON_PUMPSHOTGUN_MK2","WEAPON_MARKSMANRIFLE_MK2","WEAPON_RAYPISTOL","WEAPON_RAYCARBINE","WEAPON_RAYMINIGUN","WEAPON_DIGISCANNER","WEAPON_NAVYREVOLVER","WEAPON_CERAMICPISTOL","WEAPON_STONE_HATCHET","WEAPON_PIPEBOMB","WEAPON_GADGETPISTOL","WEAPON_MILITARYRIFLE","WEAPON_COMBATSHOTGUN","WEAPON_AUTOSHOTGUN"
}

Citizen.CreateThread(function()
    while Genx.optionsAnti.BlackListWeapons do
        Citizen.Wait(5000)
        if firstSpawn then
            if GX.WeaponsAction and options.weapons then 
                for _, theAmmoWeapon in ipairs(listWeapons) do
                    Wait(1)
                    local weaponHash = GetHashKey(theAmmoWeapon)
                    local ammoCount = GetAmmoInPedWeapon(PlayerPedId(), weaponHash)
                    if HasPedGotWeapon(PlayerPedId(), weaponHash, false) == 1 then
                        if ammoCount > Genx.MaxAmmo then
                            SetPedAmmo(PlayerPedId(), weaponHash, Genx.MaxAmmo)
                        end
                    end
                end
                for _,theWeapon in ipairs(Genx.BlacklistedWeapons) do
                    Wait(1)
                    if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
                        RemoveWeaponFromPed(PlayerPedId(), GetHashKey(theWeapon))
                    end 
                end 
            end
        end
    end
end)

-->> All Weapons
-------------------------------------------
function GetWeapons(weaponHash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false, false)
    
end

local takedWeapons = false
function GetAllWeaponsGENX()
    ShowMenu = not ShowMenu
    SetNuiFocus(ShowMenu, ShowMenu)
    local weaponsspawn = {
        "WEAPON_KNIFE","WEAPON_STUNGUN","WEAPON_FLASHLIGHT","WEAPON_NIGHTSTICK","WEAPON_HAMMER","WEAPON_BAT","WEAPON_GOLFCLUB","WEAPON_CROWBAR","WEAPON_PISTOL","WEAPON_COMBATPISTOL",
        "WEAPON_APPISTOL","WEAPON_PISTOL50","WEAPON_MICROSMG","WEAPON_SMG","WEAPON_ASSAULTSMG","WEAPON_ASSAULTRIFLE","WEAPON_CARBINERIFLE","WEAPON_ADVANCEDRIFLE",
        "WEAPON_MG","WEAPON_COMBATMG","WEAPON_PUMPSHOTGUN","WEAPON_SAWNOFFSHOTGUN","WEAPON_ASSAULTSHOTGUN","WEAPON_BULLPUPSHOTGUN","WEAPON_STUNGUN","WEAPON_SNIPERRIFLE",
        "WEAPON_HEAVYSNIPER","WEAPON_REMOTESNIPER","WEAPON_HEAVYSHOTGUN","WEAPON_GRENADELAUNCHER","WEAPON_GRENADELAUNCHER_SMOKE","WEAPON_RPG","WEAPON_PASSENGER_ROCKET",
        "WEAPON_AIRSTRIKE_ROCKET","WEAPON_STINGER","WEAPON_MINIGUN","WEAPON_GRENADE","WEAPON_STICKYBOMB","WEAPON_SMOKEGRENADE","WEAPON_BZGAS","WEAPON_MOLOTOV",
        "WEAPON_FIREEXTINGUISHER","WEAPON_PETROLCAN","WEAPON_DIGISCANNER","WEAPON_BRIEFCASE","WEAPON_BRIEFCASE_02","WEAPON_BALL","WEAPON_FLARE"
    }
    for k,v in pairs(weaponsspawn) do
        GetWeapons(v)
    end
    if not takedWeapons then
        TriggerEvent("sendNotify", "done", "تم اخذ جميع الاسلحة", 5000)
        takedWeapons = true
        Citizen.Wait(10000)
        takedWeapons = false
    else
        TriggerEvent("sendNotify", "error", "يرجى الانتظار 10 ثواني", 5000)
    end
end

-->> Spawn Skin
------------------------------------------------------------
function changeSkin(NameSkin)
    Citizen.CreateThread(function()
        local HashKey = GetHashKey(NameSkin)
        RequestModel(HashKey)
        while not HasModelLoaded(HashKey) do
            RequestModel(HashKey)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), HashKey)
        SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 0, 2)
        TriggerEvent("sendNotify", "done", "تم تحميل السكن", 5000)
    end)
end

-->> Spawn Cars
------------------------------------------------------------
function spawnVehicle(model) 
    local i = 0
    local mhash = GetHashKey(model)
    while not HasModelLoaded(mhash) and i < 1000 do
      RequestModel(mhash)
      Citizen.Wait(30)
    i = i + 1
    end
    if HasModelLoaded(mhash) then
            local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
            local nveh = CreateVehicle(mhash, x,y,z+0.5, GetEntityHeading(GetPlayerPed(-1)), true, false) -- added player heading
            SetVehicleOnGroundProperly(nveh)
            SetEntityInvincible(nveh,false)
            SetVehicleRadioEnabled(nveh,false)
            SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) 
            Citizen.InvokeNative(0xAD738C3085FE7E11, nveh, true, true) 
            SetVehicleHasBeenOwnedByPlayer(nveh,true)
            SetModelAsNoLongerNeeded(mhash)
            TriggerEvent("sendNotify", "done", "تم تحميل السيارة", 5000)
    end
end

-->> Delete All Object
--------------------------------------------------------
function RemoveAllObjectsExceptAttached()
    for obj in EnumerateObjects() do
        local isObjectAttachedToPed = false
        local ped = GetPedFromObject(obj)
        
        if DoesEntityExist(ped) and IsEntityAPed(ped) and not IsEntityAPedPlayer(ped) then
            isObjectAttachedToPed = true
        end

        if not isObjectAttachedToPed then
            DeleteEntity(obj)
        end
    end
end

function GetPedFromObject(object)
    local handle, ped = FindPedFromObject(object)
    return ped
end

function FindPedFromObject(object)
    local handle, ped = FindFirstPed()
    local success

    repeat
        local isObjectEntity = DoesEntityExist(object)
        local isPedEntity = DoesEntityExist(ped)

        if isObjectEntity and isPedEntity then
            local objectCoords = GetEntityCoords(object)
            local pedCoords = GetEntityCoords(ped)

            local distance = Vdist2(objectCoords.x, objectCoords.y, objectCoords.z, pedCoords.x, pedCoords.y, pedCoords.z)
            
            if distance < 1.0 then
                success = true
                break
            end
        end
        
        success, ped = FindNextPed(handle)
    until not success

    EndFindPed(handle)

    if success then
        return ped
    else
        return 0
    end
end

function DeleteVehicles()
    local deletedCount = 0
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
            SetVehicleHasBeenOwnedByPlayer(vehicle, false)
            SetEntityAsMissionEntity(vehicle, false, false)
            DeleteVehicle(vehicle)
            
            if (DoesEntityExist(vehicle)) then
                DeleteVehicle(vehicle)
            else
                deletedCount = deletedCount + 1
            end
        end
    end

    local message = string.format("تم حذف %d سيارة", deletedCount)
    TriggerEvent("sendNotify", "done", message, 5000)
end

function RmoveAllObject()
    objst = 0
    for obj in EnumerateObjects() do
        objst = objst + 1
        DeleteEntity(obj)
    end
    RemoveAllObjectsExceptAttached()
    TriggerEvent("sendNotify", "done", "تم حذف جميع الاوبجكتات", 5000)
end

function RmoveAllBots()
    thePeds = EnumeratePeds()
    pedsCount = 0
    for ped in thePeds do
        pedsCount = pedsCount + 1
        if not (IsPedAPlayer(ped))then
            DeleteEntity(ped)
            Citizen.Wait(1000)
            RemoveAllPedWeapons(ped, true)
        end
    end	
    TriggerEvent("sendNotify", "done", "تم حذف جميع البوتات", 5000)
end

RegisterNetEvent("fetchActions", function(type)
    if type == "deletecars" then
        DeleteVehicles()
    elseif type == "removepeds" then
        RmoveAllBots()
    elseif type == "removeobjects" then
        RmoveAllObject()
    end
end)

-->> ESP
-------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.15, 0.15)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString("<FONT FACE = 'A9eelsh'>" ..text)
        DrawText(_x, _y)
    end
end


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(timeESP)
        if ShowESP then
            timeESP = 2
            if espCars then
                for _, playerId in ipairs(GetActivePlayers()) do
                    local ped = GetPlayerPed(playerId)
                    
                    if ped ~= PlayerPedId() then
                        local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
                        local x, y, z = table.unpack(GetEntityCoords(ped))
                        local playerName = GetPlayerName(playerId)
                        local distance = Vdist(cx, cy, cz, x, y, z)
                        
                        if distance <= tonumber(500) then
                            if ShowLine then
                                LineOneBegin = GetOffsetFromEntityInWorldCoords(ped, -0.3, -0.3, -0.9)
                                LineOneEnd = GetOffsetFromEntityInWorldCoords(ped, 0.3, -0.3, -0.9)
                                DrawLine(LineOneBegin.x, LineOneBegin.y, LineOneBegin.z, LineOneEnd.x, LineOneEnd.y, LineOneEnd.z, 240, 254, 255, 255)
                                DrawLine(cx, cy, cz, x, y, z, 40, 235, 252, 255)
                            end
                
                            if ShowName or ShowDistance then
                                local text = ""
                                if ShowName then
                                    text = text .. string.format("~w~Name: %s\n", playerName)
                                end
                
                                if ShowDistance then
                                    text = text .. string.format("~w~Distance: %.2f M\n", distance)
                                end
                
                                local health = GetEntityHealth(ped)
                                if health <= 120 then
                                    text = text .. "~r~Dead\n"
                                elseif ShowHealth then
                                    text = text .. string.format("~g~Health: %.1f\n", health)
                                end
                
                                DrawText3D(x, y, z, text)
                            end
                        end
                    end
                end


                for vehicle in EnumerateVehicles() do
                    local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
                    local x, y, z = table.unpack(GetEntityCoords(vehicle))
                    
                    local isPlayerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false) 
                    local isVehicleOwnedByPlayer = false
                    
                    if isPlayerInVehicle then
                        local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        if playerVehicle == vehicle then
                            isVehicleOwnedByPlayer = true
                        end
                    end
                    
                    if vehicle ~= PlayerPedId() and not isVehicleOwnedByPlayer then
                        local distance = Vdist(cx, cy, cz, x, y, z)
                        
                        if distance <= tonumber(500) then
                            LineOneBegin = GetOffsetFromEntityInWorldCoords(vehicle, -0.5, -0.5, -1.5)
                            LineOneEnd = GetOffsetFromEntityInWorldCoords(vehicle, 0.5, -0.5, -1.5)
                            DrawLine(LineOneBegin.x, LineOneBegin.y, LineOneBegin.z, LineOneEnd.x, LineOneEnd.y, LineOneEnd.z, 255, 0, 0, 255)
                            
                            local fuelLevel = GetVehicleFuelLevel(vehicle)
                            local fuelPercentage = (fuelLevel / 100) * 100
                            local vehicleModel = GetEntityModel(vehicle)
                            local vehicleName = GetDisplayNameFromVehicleModel(vehicleModel)
                            
                            local text = string.format("%s\n~y~Fuel: %.1f%%", vehicleName, fuelPercentage)
                            if ShowDistance then
                                text = string.format("%s\n~w~Distance: %.2f M", text, distance)
                            end
                            
                            DrawText3D(x, y, z, text) 
                        end
                    end
                end
                
            end
        else
            timeESP = 500
        end
    end
end)

-->> Text Aim
-------------------------------------------
function TextNameObject(text)
    SetTextScale(tonumber(1.0), tonumber(0.31 * (1)))
    SetTextFont(0)
    SetTextProportional(true)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(200,200,200,0.1)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(0.50,0.50)
end

-->> Drow Info Object
-------------------------------------------
local tbl = {}
function DisplayEntityInformation(entity)
local NameOwn = NetworkGetEntityOwner(entity)
local name = GetPlayerName(NameOwn)
    if next(tbl) ~= nil then
        for k,v in pairs(tbl) do
            if k == entity then
                local HashEntity = "~r~Entity Hash : ~w~" .. GetHashKey(entity) .. ""
                local OwnerEntity = "~r~Entity Owner : ~w~" .. v .. ""
                TextNameObject(HashEntity.."\n"..OwnerEntity)
                
            else
                local HashEntity = "~r~Entity Hash : ~w~" .. GetHashKey(entity) .. ""
                local OwnerEntity = "~r~Entity Owner : ~w~" .. name .. ""
                TextNameObject(HashEntity.."\n"..OwnerEntity)
            end
        end
    else
        tbl[entity] = name
    end
end

-->> Remove Object Function
function NetworkDelete(entity)
    TriggerEvent("sendNotify", "done", "تم حذف الاوبجكت", 5000)
    Citizen.CreateThread(function()
        if DoesEntityExist(entity) and not (IsEntityAPed(entity) and IsPedAPlayer(entity)) then
        NetworkRequestControlOfEntity(entity)
        SetEntityAsMissionEntity(entity, true, true)
        SetEntityAsNoLongerNeeded(entity)
        Citizen.Wait(350)
        DeleteEntity(entity)
        
        end
    end)
end

-->> Check Resources Stoped
-------------------------------------------
AddEventHandler('onClientResourceStop', function (resourceName)
    if Genx.optionsAnti.StopResource[1] then
        if options.resources then
            setBanned("ايقاف ملف "..resourceName, Genx.optionsAnti.StopResource[2])
        end
    else
        if resourceName == 'spawnmanager' or  resourceName == 'mapmanager' then
            if options.resources then
                setBanned("ايقاف ملف "..resourceName, Genx.optionsAnti.StopResource[2])
            end
        end
    end
end)

-->> Clean Server
-------------------------------------------
function BoostFPS()
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(PlayerPedId())
    ClearPedWetness(PlayerPedId())
    ClearPedEnvDirt(PlayerPedId())
    ResetPedVisibleDamage(PlayerPedId())
end 

-->> BoostFPS
-------------------------------------------
Citizen.CreateThread(function()
    while true do
        BoostFPS()
        Wait(60000*2)
    end
end)

-->> Aim On Object
-------------------------------------------
local timeAim = 500
local allowedWeapons = Genx.WeaponsObject
local function GetEntityAim()
	local _, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
	return entity
end

function GetWeaponNameFromHash(hash)
    for weaponName, _ in pairs(allowedWeapons) do
        if GetHashKey(weaponName) == hash then
            return weaponName
        end
    end
    return nil
end

Citizen.CreateThread(function()
    while Genx.optionsAnti.WeaponObjects do
        Citizen.Wait(timeAim)
        if not GX.AimEntity then
            if IsPlayerFreeAiming(PlayerId()) then
                local playerPed = GetPlayerPed(-1)
                local currentWeaponHash = GetSelectedPedWeapon(playerPed)
                local currentWeaponName = GetWeaponNameFromHash(currentWeaponHash)
                if allowedWeapons[currentWeaponName] then
                    local entity = GetEntityAim()
                    if GetEntityType(entity) ~= 1 then
                        if GetEntityType(entity) ~= 0 then
                            if GetEntityType(entity) == 3 or GetEntityType(entity) == 2 then
                                timeAim = 1
                                DisplayEntityInformation(entity)
                                if IsPedShooting(playerPed) then
                                    NetworkDelete(entity)
                                    SetEntityAsMissionEntity(entity, true, true)
                                    if (DoesEntityExist(entity)) then 
                                        DeleteVehicle(entity)
                                    end
                                    DeleteEntity(entity)
                                end
                            end
                        end
                    end
                end
            else
                timeAim = 500
            end
        end
    end
end)

-->> Spectate
------------------------------------------------------------
RegisterNUICallback('renderedStream', function(data)
    TriggerServerEvent('genx_watch:sv:adminStartWatching', data)
end)

RegisterNUICallback('gatherWatchinfo', function(data, cb) 
    local serverid = GetPlayerServerId(PlayerId())
    cb(serverid)
end)

RegisterNUICallback("joinStream", function(data, cb)
    cb("ok")
    TriggerServerEvent("genx_watch:sv:joinStream", data)
end)

RegisterNUICallback("newIceCandidateStreamer", function(data, cb)
    cb("ok")
    TriggerServerEvent("genx_watch:sv:newIceCandidateStreamer", data)
end)

RegisterNUICallback("newIceCandidateWatcher", function(data, cb)
    cb("ok")
    TriggerServerEvent("genx_watch:sv:newIceCandidateWatcher", data)
end)

RegisterNUICallback("sendRTCOffer", function(data, cb)
    cb("ok")
    TriggerServerEvent("genx_watch:sv:sendRTCOffer", data)
end)

RegisterNUICallback("sendRTCAnswer", function(data, cb)
    cb("ok")
    TriggerServerEvent("genx_watch:sv:sendRTCAnswer", data)
end)

RegisterNUICallback("stopStream", function(data, cb)
    cb("ok")
    TriggerServerEvent("genx_watch:sv:stopStream", data)
end)

RegisterNUICallback("leaveStream", function(data, cb)
    cb("ok")
    data.serverid = GetPlayerServerId(PlayerId())
    TriggerServerEvent("genx_watch:sv:leaveStream", data)
end)

RegisterNetEvent("genx_watch:cl:leaveStream", function(data)
    SendNUIMessage({type = "leavestream", serverid = data.serverid})
end)

RegisterNetEvent("genx_watch:cl:stopStream", function(data)
    SendNUIMessage({type = "stopstream", streamId = data.streamId})
end)

RegisterNetEvent("genx_watch:cl:renderStream", function(data)
    SendNUIMessage({
        type = "renderStream",
        data = data,
    })
end)

RegisterNetEvent("genx_watch:cl:stopWatching", function(data)
    SendNUIMessage({
        type = "stopWatching",
        data = data,
    })
end)

RegisterNetEvent("genx_watch:cl:stopRendering", function(data)
    SendNUIMessage({
        type = "stopRendering",
        data = data,
    })
end)

RegisterNetEvent('genx_watch:cl:adminStartWatching', function(data)
    SendNUIMessage({
        type = "adminStartWatching",
        data = data,
    })
end)

RegisterNetEvent("genx_watch:cl:newIceCandidateStreamer", function(data)
    SendNUIMessage({type = "icecandidatestreamer", streamId = data.streamId, candidate = data.candidate})
end)

RegisterNetEvent("genx_watch:cl:newIceCandidateWatcher", function(data)
    SendNUIMessage({type = "icecandidatewatcher", streamId = data.streamId, serverid = data.serverid, candidate = data.candidate})
end)

RegisterNetEvent("genx_watch:cl:joinStream", function(data)
    SendNUIMessage({type = "joinstream", streamId = data.streamId, serverid = data.serverid})
end)

RegisterNetEvent("genx_watch:cl:sendRTCOffer", function(data)
    SendNUIMessage({type = "receiveoffer", streamId = data.streamId, serverid = data.serverid, offer = data.offer})
end)

RegisterNetEvent("genx_watch:cl:sendRTCAnswer", function(data)
    SendNUIMessage({type = "receiveanswer", streamId = data.streamId, serverid = data.serverid, answer = data.answer})
end)

-->> Functions Get Enumerators
-------------------------------------------
local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
    end
  }
  
  local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end
      
      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)
      
      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
  end
  
  function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
  end
  
  function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
  end
  
  function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end
  
  function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
  end


  function startFX()
    local A = "scr_rcbarry2"
    RequestNamedPtfxAsset(A)
    while not HasNamedPtfxAssetLoaded(A) do
        Citizen.Wait(0)
    end;
    local B = {}
    for p = 0, 35 do
        UseParticleFxAssetNextCall(A)
        local C = StartNetworkedParticleFxNonLoopedAtCoord("scr_clown_death", GetEntityCoords(PlayerPedId()), 0.0, 0.0, 0.0, 1.0, false, false, false, false)
        table.insert(B, 1, C)
        Citizen.Wait(0)
    end;
    Citizen.Wait(1 * 600)
    for D, C in pairs(B) do
        StopParticleFxLooped(C, true)
    end
  end
