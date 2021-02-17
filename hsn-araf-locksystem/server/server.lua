SearchedVehicles = {}

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('hsn-araf-locksystem:addKeys')
AddEventHandler('hsn-araf-locksystem:addKeys',function(plate)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    TriggerClientEvent('hsn-araf-locksystem:client:addKeys',src,plate)
end)

RegisterServerEvent('hsn-araf-locksystem:server:giveKeys')
AddEventHandler('hsn-araf-locksystem:server:giveKeys',function(target,plate)
    local src = source
    local tPlayer = ESX.GetPlayerFromId(target)
    TriggerClientEvent('hsn-araf-locksystem:client:removeKeys',src,plate)
    TriggerClientEvent('hsn-araf-locksystem:client:addKeys',tPlayer.source,plate)
end)

RegisterServerEvent('hsn-araf-locksystem:server:SearchVeh')
AddEventHandler('hsn-araf-locksystem:server:SearchVeh',function(plate)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not SearchedVehicles[plate] then
        SearchedVehicles[plate] = true

        if math.random(1, 100) > 70 then
            local randomItemPull = math.random(1, #Config.HighChanceItems)
            local item = Config.HighChanceItems[randomItemPull]
            local money = math.random(Config.MinMoney, Config.MaxMoney)
            if item ~= Config.Money then
                local amount = math.random(Config.MinItemAmount, Config.MaxItemAmount)
                xPlayer.addInventoryItem(item, amount)
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = _U('found_item', amount, item)} )
            elseif item == Config.Money then
                xPlayer.addInventoryItem(Config.Money, money)
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = _U('found_money', money)} )
            end
        elseif 70 >= math.random(1, 100) and math.random(1, 100) > 40 then
            local randomItemPull = math.random(1, #Config.NormalChanceItems)
            local item = Config.NormalChanceItems[randomItemPull]
            local money = math.random(Config.MinMoney, Config.MaxMoney)
            if item ~= Config.Money then
                local amount = math.random(Config.MinItemAmount, Config.MaxItemAmount)
                xPlayer.addInventoryItem(item, amount)
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = _U('found_item', amount, item)} )
            elseif item == Config.Money then
                xPlayer.addInventoryItem(Config.Money, money)
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = _U('found_money', money)} )
            end
        elseif 40 >= math.random(1, 100) and math.random(1, 100) > 10 then
            local randomItemPull = math.random(1, #Config.LowChanceItems)
            local item = Config.LowChanceItems[randomItemPull]
            local money = math.random(Config.MinMoney, Config.MaxMoney)

            if item ~= Config.Money then
                local amount = math.random(Config.MinItemAmount, Config.MaxItemAmount)
                xPlayer.addInventoryItem(item, amount)
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = _U('found_item', amount, item)} )
            elseif item == Config.Money then
                xPlayer.addInventoryItem(Config.Money, money)
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = _U('found_money', money)} )
            end
        elseif 10 >= math.random(1, 100) then
            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = _U('found_nothing')} )
        end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = _U('vehicle_is_searched')} )
    end
end)

RegisterServerEvent('hsn-araf-locksystem:deleteItem')
AddEventHandler('hsn-araf-locksystem:deleteItem', function(item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeInventoryItem(item, 1)
end)

ESX.RegisterServerCallback('hsn-araf-locksystem:tornavida', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	itemcount = xPlayer.getInventoryItem('tornavida').count
	if itemcount > 0 then
		cb(true)
	else
        cb(false)
	end
end)

ESX.RegisterUsableItem('lockpick', function(source)
    TriggerClientEvent('hsn-araf-locksystem:client:useLockpick', source)
end)

ESX.RegisterServerCallback('hsn-araf-locksystem:getOwnedVehicles', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer ~= nil then
        local plate = MySQL.Async.fetchAll('SELECT plate FROM owned_vehicles WHERE id = @id',
        {
            ['@id'] = xPlayer.identifier
        })

        cb(plate)
    else
        cb(false)
    end
end)
