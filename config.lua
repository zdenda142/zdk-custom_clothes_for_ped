Config = {}

Config.Peds = {
    {
        model = 'mp_m_freemode_01',  -- The model of the ped (this is for a male character in the freemode model)
        coords = vec3(-1036.3, -2734.26, 19.17),  -- Coordinates where the ped will spawn (x, y, z positions)
        heading = 0.0,  -- The heading (rotation) of the ped when it spawns (0.0 is facing North)
        invincible = true,  -- If set to true, the ped will be invincible (it cannot be killed)
        freeze = true,  -- If true, the ped will be frozen in place and cannot move
        ignorePlayer = true,  -- If true, the ped will ignore the player and will not react to the player
        components = {  -- The components define the ped's clothing and appearance
            {componentId = 3, drawableId = 15, textureId = 0},  -- Torso (Shirt) - componentId 3 refers to the torso, drawableId 15 is a shirt style, and textureId 0 refers to the default texture
            {componentId = 4, drawableId = 201, textureId = 0}, -- Pants - componentId 4 refers to the pants, drawableId 201 is a specific pants style, and textureId 0 refers to the default texture
            {componentId = 6, drawableId = 15, textureId = 0}, -- Shoes - componentId 6 refers to shoes, drawableId 15 is the shoe style, and textureId 0 refers to the default texture
            {componentId = 8, drawableId = 15, textureId = 0}, -- Undershirt - componentId 8 refers to the undershirt, drawableId 15 is a specific undershirt style, and textureId 0 is the default texture
            {componentId = 11, drawableId = 50, textureId = 0}, -- Top - componentId 11 refers to a top layer of clothing (e.g., jacket), drawableId 50 is a specific style, and textureId 0 is the default texture
            {componentId = 7, drawableId = 10, textureId = 0}, -- Arms - componentId 7 refers to arms, drawableId 10 is a sleeve style, and textureId 0 is the default texture
            {componentId = 9, drawableId = 5, textureId = 0}    -- Gloves - componentId 9 refers to gloves or wristwear, drawableId 5 is the style, and textureId 0 is the default texture
        },
        props = {  -- The props section is for additional accessories like hats, glasses, etc.
            {propId = 0, drawableId = 25, textureId = 0},  -- Hat - propId 0 refers to hats, drawableId 25 is a specific hat style, and textureId 0 refers to the default texture
            {propId = 1, drawableId = -1, textureId = 0}   -- Glasses (none) - propId 1 refers to glasses, drawableId -1 means no glasses, and textureId 0 means no texture is applied
        },
        appearance = {  -- The appearance section defines the ped's facial features, hair, and eyes
            face = {  -- Facial features
                shapeFirst = 21,  -- Shape of the first part of the face (like the jaw or cheekbones)
                shapeSecond = 22, -- Shape of the second part of the face (e.g., nose, eyes)
                skinFirst = 0,    -- Skin color tone for the first part of the face
                skinSecond = 0    -- Skin color tone for the second part of the face
            },
            hair = {  -- Hair style and color
                style = 2,         -- Hair style, with different numbers representing various styles
                colorPrimary = 5,  -- Primary hair color (0-63, where 5 is a specific color)
                colorSecondary = 3 -- Secondary hair color (for highlights or two-tone styles)
            },
            eyeColor = 4  -- Eye color (e.g., 4 is green eyes)
        },
        blip = true,  -- If set to true, a blip will be created on the map for the ped
        blipSprite = 1,  -- The blip sprite (icon) to be used on the map; 1 is a default dot
        blipColor = 2,   -- The color of the blip (2 is red)
        blipScale = 0.8, -- The scale (size) of the blip on the map
        blipName = "Ped 1"  -- The name of the blip (the text that will appear when the player hovers over the blip)
    },
    -- {
    --     model = 'mp_m_freemode_01',
    --     coords = vec3(-1036.3, -2734.26, 20.17),
    --     heading = 0.0,
    --     invincible = true,
    --     freeze = true,
    --     ignorePlayer = true,
    --     components = {
    --         {componentId = 3, drawableId = 15, textureId = 0},  -- Torso
    --         {componentId = 4, drawableId = 201, textureId = 0}, -- Pants
    --         {componentId = 6, drawableId = 15, textureId = 0}, -- Shoes
    --         {componentId = 8, drawableId = 15, textureId = 0}, -- Undershirt
    --         {componentId = 11, drawableId = 50, textureId = 0},-- Top
    --         {componentId = 7, drawableId = 10, textureId = 0}, -- Arms
    --         {componentId = 9, drawableId = 5, textureId = 0}    -- Gloves
    --     },
    --     props = {
    --         {propId = 0, drawableId = 25, textureId = 0},  -- Hat
    --         {propId = 1, drawableId = -1, textureId = 0}   -- Glasses (none)
    --     },
    --     appearance = {
    --         face = {shapeFirst = 21, shapeSecond = 22, skinFirst = 0, skinSecond = 0},
    --         hair = {style = 2, colorPrimary = 5, colorSecondary = 3},
    --         eyeColor = 4 -- Green eyes
    --     },
    --     blip = true,  -- Show a blip on the map
    --     blipSprite = 1,  -- Blip sprite icon
    --     blipColor = 2,   -- Blip color
    --     blipScale = 0.8, -- Blip size
    --     blipName = "Ped 1"  -- Blip name
    -- },
    -- Add other peds below as needed
}


