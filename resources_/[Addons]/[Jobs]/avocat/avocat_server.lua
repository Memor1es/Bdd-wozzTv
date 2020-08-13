function closures_avocat_server()
    local listMissions = {}
    local listPersonnelActive = {}
    local acceptMulti = false
    local preFixEventName = 'avocat'

    local CALL_IA_DRIVER = 3
    local CALL_INFO_WAIT = 2
    local CALL_INFO_OK = 1
    local CALL_INFO_NONE = 0

    -- Notifyle changement de status des missions
    function notifyMissionChange(target)
        target = target or -1
        TriggerClientEvent('avocat:MissionChange', target, listMissions)
    end

    function notifyMissionCancel(source)
        TriggerClientEvent('avocat:MissionCancel', source)
    end

    -- Notify le changement de status des missions
    function notifyPersonnelChange(target)
        target = target or -1
        TriggerClientEvent('avocat:personnelChange', target,  getNbPerosnnelActive(), getNbPerosnnelDispo())
     end

    -- Notify un message a tout les personnels
    function notifyAllPersonnel(MESS)
        TriggerClientEvent('avocat:PersonnelMessage', -1, MESS)
    end

    -- Notify un message un personnel
    function notifyPersonnel(source, MESS)
        TriggerClientEvent('avocat:PersonnelMessage', source, MESS)
    end

    -- Notify un message un client
    function notifyClient(source, MESS)
        TriggerClientEvent('avocat:ClientMessage', source, MESS)
    end

    -- Not use || Notify a message a tout le monde
    function notifyAllClient(MESS)
        TriggerClientEvent('avocat:ClientMessage', -1 , MESS)
    end

    -- Notify call status change
    function notifyCallStatus(source, status)
        TriggerClientEvent('avocat:callStatus', source, status)
    end


    function addMission(source, position, type)
        local sMission = listMissions[source]
        if sMission == nil then
          if getNbPerosnnelDispo() == 0 and type == "1 personne" then
            TriggerClientEvent('avocat:callAutoavocat', source, position, type)
            notifyCallStatus(source, CALL_IA_DRIVER)
          else
            listMissions[source] = {
                id = source,
                pos = position,
                acceptBy = {},
                type = type
            }

            notifyClient(source, 'CALL_RECU')
            notifyCallStatus(source, CALL_INFO_WAIT)

            notifyAllPersonnel('MISSION_NEW')
            notifyMissionChange()
          end
        else -- Missions deja en cours
            notifyClient(source, 'CALL_EN_COURS')
        end
    end

    function closeMission(source, missionId)
        if listMissions[missionId] ~= nil then
            for _, v in pairs(listMissions[missionId].acceptBy) do
                if v ~= source then
                    notifyPersonnel(v, 'MISSION_ANNULE')
                    notifyMissionCancel(v)
                end
                setInactivePersonnel(v)
            end
            listMissions[missionId] = nil
            notifyClient(missionId, 'CALL_FINI')
            notifyCallStatus(missionId, CALL_INFO_NONE)
            notifyMissionChange()
            notifyPersonnelChange()
        end
    end

    function personelAcceptMission(source, missionId)
        local sMission = listMissions[missionId]
        if sMission == nil then
            notifyPersonnel(source,'MISSION_INCONNU')
        elseif #sMission.acceptBy ~= 0  and not acceptMulti then
            notifyPersonnel(source, 'MISSION_EN_COURS')
        else
            removeMeccano(source)
            if #sMission.acceptBy >= 1 then
                if sMission.acceptBy[1] ~= source then
                    for _, m in pairs(sMission.acceptBy) do
                        notifyPersonnel(m, 'MISSION_CONCURENCE')
                    end
                    table.insert(sMission.acceptBy, source)
                end
            else
                table.insert(sMission.acceptBy, source)
                notifyClient(sMission.id, 'CALL_ACCEPT')
                notifyPersonnel(source, 'MISSION_ACCEPT')
            end
            TriggerClientEvent('avocat:MissionAccept', source, sMission)
            notifyCallStatus(missionId, CALL_INFO_OK)
            setActivePersonnel(source)
            notifyMissionChange()
            notifyPersonnelChange()
        end
    end

    function removeMeccano(personnelId)
        for _, mission in pairs(listMissions) do
            for k, v in pairs(mission.acceptBy) do
                if v == personnelId then
                    table.remove(mission.acceptBy, k)
                    if #mission.acceptBy == 0 then
                        notifyClient(mission.id, 'CALL_CANCEL')
                        TriggerClientEvent('avocat:callStatus', mission.id, 2)
                        notifyCallStatus(mission.id, CALL_INFO_WAIT)
                        notifyAllPersonnel('MISSION_NEW')
                    end
                    break
                end
            end
        end
        removePersonelService(personnelId)
        notifyPersonnelChange()
    end

    function removeClient(clientId)
        if listMissions[clientId] ~= nil then
            for _, v in pairs(listMissions[clientId].acceptBy) do
                notifyPersonnel(v, 'MISSION_ANNULE')
                notifyMissionCancel(v)
                setInactivePersonnel(v)
            end
            listMissions[clientId] = nil
            notifyCallStatus(clientId, CALL_INFO_NONE)
            notifyMissionChange()
            notifyPersonnelChange()
        end
    end


    --=========================================================================
    --  Gestion des personnels en service & activité
    --=========================================================================

    function addPersonelService(source)
        listPersonnelActive[source] = false
    end

    function removePersonelService(source)
        listPersonnelActive[source] = nil
    end

    function setActivePersonnel(source)
        listPersonnelActive[source] = true

    end

    function setInactivePersonnel(source)
        listPersonnelActive[source] = false
    end

    function getNbPerosnnelActive()
        local dispo = 0
        for _, v in pairs(listPersonnelActive) do
            if v ~= nil then
                dispo = dispo + 1
            end
        end
        return dispo
    end

    function getNbPerosnnelDispo()
        local dispo = 0
        for _, v in pairs(listPersonnelActive) do
            if v == false then
                dispo = dispo + 1
            end
        end
        return dispo
    end

    function getNbPerosnnelBusy()
        local dispo = 0
        for _, v in pairs(listPersonnelActive) do
            if v == true then
                dispo = dispo + 1
            end
        end
        return dispo
    end

    RegisterServerEvent('avocat:PayAutomaticavocat')
    AddEventHandler('avocat:PayAutomaticavocat', function (price)
      TriggerEvent('es:getPlayerFromId', source, function(user)
        user.removeMoney(price)
      end)
    end)

    RegisterServerEvent('avocat:takeService')
    AddEventHandler('avocat:takeService', function ()
        addPersonelService(source)
        notifyPersonnelChange()
    end)

    RegisterServerEvent('avocat:endService')
    AddEventHandler('avocat:endService', function ()
        removeMeccano(source)
        removePersonelService(source)
    end)

    RegisterServerEvent('avocat:requestMission')
    AddEventHandler('avocat:requestMission', function ()
        notifyMissionChange(source)
    end)

    RegisterServerEvent('avocat:requestPersonnel')
    AddEventHandler('avocat:requestPersonnel', function ()
        notifyPersonnelChange(source)
    end)

    RegisterServerEvent('avocat:Call')
    AddEventHandler('avocat:Call', function (posX,posY,posZ,type)
        addMission(source, {posX, posY, posZ}, type)
    end)

    RegisterServerEvent('avocat:CallCancel')
    AddEventHandler('avocat:CallCancel', function ()
        removeClient(source)
    end)

    RegisterServerEvent('avocat:AcceptMission')
    AddEventHandler('avocat:AcceptMission', function (id)
        personelAcceptMission(source, id)
    end)

    RegisterServerEvent('avocat:FinishMission')
    AddEventHandler('avocat:FinishMission', function (id)
        closeMission(source, id)
    end)

    RegisterServerEvent('avocat:cancelCall')
    AddEventHandler('avocat:cancelCall', function ()
        removeClient(source)
    end)

    AddEventHandler('playerDropped', function()
        removeMeccano(source)
        removeClient(source)
    end)

    RegisterServerEvent("SyncAvocat")
    AddEventHandler('SyncAvocat', function(inputText)
        TriggerClientEvent('DisplayAvocat', -1, inputText)
    end)


end

closures_avocat_server()
