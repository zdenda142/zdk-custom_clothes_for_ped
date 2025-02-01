local ox = exports.ox_lib

-- Load ped configurations from a separate config file
local pedConfigs = Config.Peds or {}

-- Function to spawn and customize ped at a specific location
local function spawnCustomPed(pedData)
    local coords = pedData.coords
    local heading = pedData.heading or 0.0

    -- Request the model and wait until it is loaded
    RequestModel(pedData.model)
    while not HasModelLoaded(pedData.model) do
        Wait(10)
    end

    -- Create the ped
    local ped = CreatePed(4, pedData.model, coords.x, coords.y, coords.z, heading, true, false)
    SetEntityAsMissionEntity(ped, true, true)

    -- Set ped behavior flags
    if pedData.invincible then
        SetEntityInvincible(ped, true)
    end

    if pedData.freeze then
        FreezeEntityPosition(ped, true)
    end

    if pedData.ignorePlayer then
        SetBlockingOfNonTemporaryEvents(ped, true)
    end

    -- Apply components (e.g., clothes)
    for _, component in ipairs(pedData.components or {}) do
        SetPedComponentVariation(ped, component.componentId, component.drawableId, component.textureId, 0)
    end

    -- Apply props (e.g., hats, glasses)
    for _, prop in ipairs(pedData.props or {}) do
        if prop.drawableId >= 0 then
            SetPedPropIndex(ped, prop.propId, prop.drawableId, prop.textureId, true)
        else
            ClearPedProp(ped, prop.propId)
        end
    end

    -- Apply appearance settings if present
    if pedData.appearance then
        local appearance = pedData.appearance
        SetPedHeadBlendData(ped, 
            appearance.face.shapeFirst, appearance.face.shapeSecond, 0, 
            appearance.face.skinFirst, appearance.face.skinSecond, 0, 
            1.0, 1.0, 0.0, false)

        SetPedComponentVariation(ped, 2, appearance.hair.style, 0, 0)  -- Hair style
        SetPedHairColor(ped, appearance.hair.colorPrimary, appearance.hair.colorSecondary)
        SetPedEyeColor(ped, appearance.eyeColor)
    end

    -- Create a blip for the ped if enabled in config
    if pedData.blip then
        local blip = AddBlipForEntity(ped)
        SetBlipSprite(blip, pedData.blipSprite or 1)  -- Default sprite is 1 (standard dot)
        SetBlipColour(blip, pedData.blipColor or 2)   -- Default color is 2 (red)
        SetBlipScale(blip, pedData.blipScale or 0.8)   -- Default scale is 0.8
        SetBlipAsShortRange(blip, true)               -- Ensure the blip is only visible when close

        -- Set the name of the blip if provided in the config
        if pedData.blipName then
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(pedData.blipName)
            EndTextCommandSetBlipName(blip)
        end
    end

    SetModelAsNoLongerNeeded(pedData.model)
    print(('Ped spawned at %.2f, %.2f, %.2f'):format(coords.x, coords.y, coords.z))
end

-- Spawn all configured peds
local function spawnAllPeds()
    for _, pedData in ipairs(pedConfigs) do
        spawnCustomPed(pedData)
    end
end

-- Automatically spawn all peds on resource start
CreateThread(function()
    Wait(1000) -- Short delay to ensure everything is loaded
    spawnAllPeds()
end)

-- Command to spawn all peds
RegisterCommand('spawnallpeds', function()
    spawnAllPeds()
end)
