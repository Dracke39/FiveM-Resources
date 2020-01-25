local blacklistedModels = {
	"model_name",
}

local turnEngineOn = true

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local veh = GetVehiclePedIsIn(ped)
		if DoesEntityExist(veh) then
			disableAirControl(ped, veh)
			disableVehicleRoll(ped, veh)
		end
	end
end)

function resetVehicle(veh)
	DisableControlAction(0, 59)
	DisableControlAction(0, 60)
	SetVehicleOnGroundProperly(veh)
	SetVehicleEngineOn(veh,turnEngineOn)
end

function disableAirControl(ped, veh)
	if not IsThisModelBlacklisted(veh) then
		if IsPedSittingInAnyVehicle(ped) then
			if GetPedInVehicleSeat(veh, -1) == ped then
				if IsEntityInAir(veh) then
					DisableControlAction(0, 59)
					DisableControlAction(0, 60)
				end
			end
		end
	end
end

function disableVehicleRoll(ped, veh)
	local roll = GetEntityRoll(veh)
	if not IsThisModelBlacklisted(veh) then
		if GetPedInVehicleSeat(veh, -1) == ped then
			if (roll > 75.0 or roll < -75.0) then
				DisableControlAction(2,59,true)
				DisableControlAction(2,60,true)
				if not IsEntityInAir(veh) and GetEntitySpeed(veh) < 0.15 then
					destroyPedsVehicle(ped)
				end
			end
		end
	end
end

function IsThisModelBlacklisted(veh)
	local model = GetEntityModel(veh)
	for i = 1, #blacklistedModels do
		if model == GetHashKey(blacklistedModels[i]) then
			return true
		end
	end
	return false
end

function destroyPedsVehicle(ped)
	local veh = GetVehiclePedIsIn(ped)
	DisableControlAction(0, 59)
	DisableControlAction(0, 60)
	--SetVehicleEngineOn(veh, false)
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end