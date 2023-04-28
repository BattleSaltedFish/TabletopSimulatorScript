--[[
If you're viewing this script as one big ugly file, you're going to have a less
than ideal experience.
Go here for instructions: https://github.com/denis-belanger/TTS_Splendor
--]]

-- Include Files
----#include !\TTS_Splendor\Scripts\global
--// Splendor Scripted + Expandsion //--
-- Scripting by ZeekMaster and the following:
   -- Original scripted game setup and points tracking by Mel from the Splendor - Scripted mod.
   -- Original scritped gem token and card count tracking by Yossarian from the Splendor - Scripted++ mod.
   -- Original scripted counting bowl by MrStump.
   -- Original gem token containers with scripted counts and script for randomly selecting starting player by JuggePugge from the Splendor - Scripted mod.

-- Include Files
----#include !\TTS_Splendor\Scripts\Setup\variables
--// Global constants //--
tp1 = "3 Rubies 1 Diamond"
tp2 = "2 Diamonds"
tp3 = "3 Sapphires 1 Onyx"
tp4 = "5 Emeralds and Noble"
tp5 = "3 Onyx"

--// Global variables //--
interactable = false -- Set the interactibility of components not used to play the game

-- Table for tracking the total points for each player from their zones and the 'Trading Posts' mat
player_points = {
    ["Blue"]   = {["mat_points"] = 0, ["tp_points"] = 0},
    ["White"]  = {["mat_points"] = 0, ["tp_points"] = 0},
    ["Red"]    = {["mat_points"] = 0, ["tp_points"] = 0},
    ["Yellow"] = {["mat_points"] = 0, ["tp_points"] = 0}
}

-- Table for tracking which trading posts have been established by each player
established_trading_posts = {
    ["Blue"]   = {[tp1] = false, [tp2] = false, [tp3] = false, [tp4] = false, [tp5] = false},
    ["White"]  = {[tp1] = false, [tp2] = false, [tp3] = false, [tp4] = false, [tp5] = false},
    ["Red"]    = {[tp1] = false, [tp2] = false, [tp3] = false, [tp4] = false, [tp5] = false},
    ["Yellow"] = {[tp1] = false, [tp2] = false, [tp3] = false, [tp4] = false, [tp5] = false}
}

-- Object GUIDs
game_setup_mat_guid          = "8cdc9e"
standard_table_mat_guid      = "473e0f"
cities_table_mat_guid        = "70915c"
orient_table_mat_guid        = "10771f"
orient_cities_table_mat_guid = "e11789"
trading_posts_mat_guid       = "34ff85"

bag_guids = {
    mats    = "9a1e1c",
    decks   = "ecfa08",
    nobles  = "ee4886",
    cities  = "655960",
    shields = "d7f8fa"
}

token_bag_guids = {
    ["Diamond"]  = "111cd7",
    ["Sapphire"] = "50b282",
    ["Emerald"]  = "51688f",
    ["Ruby"]     = "1bd146",
    ["Onyx"]     = "705dce",
    ["Gold"]     = "01c1ed"
}

stronghold_bag_guids = {
    ["Blue"]   = "ea399c",
    ["White"]  = "61911d",
    ["Red"]    = "6b631d",
    ["Yellow"] = "b1e88c"
}

deck_guids = {
    ["Blue"]   = "c05462",
    ["Yellow"] = "48108b",
    ["Green"]  = "ec3336",
    ["Red3"]   = "0e9845",
    ["Red2"]   = "76a02e",
    ["Red1"]   = "47f1bb"
}

gem_container_guids = {
    ["Diamond"]  = "2ebfea",
    ["Sapphire"] = "325fc4",
    ["Emerald"]  = "02cff8",
    ["Ruby"]     = "f450c1",
    ["Onyx"]     = "38de5d",
    ["Gold"]     = "233391"
}

shield_container_guids = {
    ["Blue"]   = "d385df",
    ["White"]  = "0b2c9f",
    ["Red"]    = "1da440",
    ["Yellow"] = "7171e5"
}

player_mat_guids = {
    ["Blue"]   = "b98faf",
    ["White"]  = "35bd67",
    ["Red"]    = "fe9092",
    ["Yellow"] = "0814ee"
}

point_counter_guids = {
    ["Blue"]   = "a90d51",
    ["White"]  = "bcd9a1",
    ["Red"]    = "028532",
    ["Yellow"] = "5c4474"
}

gem_counter_guids = {
    ["Blue"] = {
        ["Diamond"]  = "f5e0ae",
        ["Sapphire"] = "453480",
        ["Emerald"]  = "44309b",
        ["Ruby"]     = "ea5957",
        ["Onyx"]     = "6956c5",
        ["Gold"]     = "eab3dc"
    },
    ["White"] = {
        ["Diamond"]  = "b25136",
        ["Sapphire"] = "ff59c1",
        ["Emerald"]  = "600cc6",
        ["Ruby"]     = "423516",
        ["Onyx"]     = "a3017b",
        ["Gold"]     = "f43c33"
    },
    ["Red"] = {
        ["Diamond"]  = "d9e7cc",
        ["Sapphire"] = "7cfca3",
        ["Emerald"]  = "86cc35",
        ["Ruby"]     = "322ab6",
        ["Onyx"]     = "db7992",
        ["Gold"]     = "5cf0e9"
    },
    ["Yellow"] = {
        ["Diamond"]  = "ab3da5",
        ["Sapphire"] = "69cf6c",
        ["Emerald"]  = "0fc1f0",
        ["Ruby"]     = "c57961",
        ["Onyx"]     = "6cf826",
        ["Gold"]     = "cf32cf"
    }
}

-- Game props GUIDs
game_prop_guids = {
    antique_table = "8861c8",
    red_felt_top  = "4ee1f2",
    table_strut1  = "363eb6",
    table_strut2  = "555cc6"
}

counting_tray_guids = {
    ["Blue"]   = "171997",
    ["White"]  = "209493",
    ["Red"]    = "67247c",
    ["Yellow"] = "8b3b8c",
}

-- Pre-loaded mats, tokens, and deck GUIDs
pre_load_item_guids = {
    pre_load_standard_table_mat        = "9e748d",
    pre_load_standard_cities_table_mat = "a48d1a",
    pre_load_orient_table_mat          = "8c291c",
    pre_load_orient_cities_table_mat   = "ad172c",
    pre_load_trading_posts_mat         = "143e1a",

    pre_load_diamond  = "652977",
    pre_load_emerald  = "89e34b",
    pre_load_sapphire = "251698",
    pre_load_ruby     = "dace18",
    pre_load_onyx     = "be82d1",
    pre_load_gold     = "6d84ee",

    pre_load_blue_deck   = "366de5",
    pre_load_yellow_deck = "e506bf",
    pre_load_green_deck  = "1c6697",
    pre_load_red3_deck   = "55ee31",
    pre_load_red2_deck   = "e223a9",
    pre_load_red1_deck   = "729357"
}

-- Scripting zone GUIDs
player_point_zone_guids = {
    ["Blue"]   = "15d12c",
    ["White"]  = "f3126c",
    ["Red"]    = "418b97",
    ["Yellow"] = "5361d0"
}

--// Initialize scritpting zones //--
function initializeZones()
    -- Get the zones over each player mat
    player_point_zones = {}
    for player_color, guid in pairs(player_point_zone_guids) do
        player_point_zones[player_color] = getObjectFromGUID(guid)
    end

    -- Create the tables for the deck, card, and 'Trading Posts' zones
    deck_zones = {}
    card_zones = {}
    trading_posts_zones = {}
end

--// Initialize game objects //--
function initializeObjects()
    -- Get the game setup map and set interactability
    game_setup_mat = initializeObject(game_setup_mat_guid)

    -- Get the rulebooks
    base_rules       = getObjectFromGUID(base_rules_guid)
    expansions_rules = getObjectFromGUID(expansion_rules_guid)

    -- Get the bags used to store all game components and set position and interactability
    bags = {}
    for bag_name, guid in pairs(bag_guids) do
        bags[bag_name] = initializeBag(guid)
    end

    token_bags = {}
    for bag_name, guid in pairs(token_bag_guids) do
        token_bags[bag_name] = initializeBag(guid)
    end

    stronghold_bags = {}
    for bag_name, guid in pairs(stronghold_bag_guids) do
        stronghold_bags[bag_name] = initializeBag(guid)
    end

    -- Get the player mats and counters and set interactability
    player_mats = {}
    for player_color, guid in pairs(player_mat_guids) do
        player_mats[player_color] = initializeObject(guid)
    end

    point_counters = {}
    for player_color, guid in pairs(point_counter_guids) do
        point_counters[player_color] = initializeObject(guid)
    end

    gem_counters = {}
    for player_color, gem_guids in pairs(gem_counter_guids) do
        gem_counters[player_color] = {}
        for gem_name, guid in pairs(gem_guids) do
            gem_counters[player_color][gem_name] = initializeObject(guid)
        end
    end

    -- Get the game props and pre-loaded mats, tokens, and decks and set their interactability
    game_props = {}
    for prop_name, guid in pairs(game_prop_guids) do
        game_props[prop_name] = initializeObject(guid)
    end

    counting_trays = {}
    for player_color, guid in pairs(counting_tray_guids) do
        counting_trays[player_color] = initializeObject(guid)
    end

    pre_load_items = {}
    for item_name, guid in pairs(pre_load_item_guids) do
        pre_load_items[item_name] = initializeObject(guid)
    end

    -- Create the table for the decks
    decks = {}
end

--// Helper function that gets, moves, and locks bags in or out of view (returns bag)
function initializeBag(guid)
    local bag = getObjectFromGUID(guid)
    local color = bag.getColorTint()
    local position = bag.getPosition()

    bag.interactable = interactable
    if interactable then
        color.a = 1
        position.y = 10.00
    else
        color.a = 0
        position.y = -10.00
    end

    bag.setColorTint(color)
    bag.setPosition(position)

    return bag
end

--// Helper function that gets an object and locks it (returns object)
function initializeObject(guid)
    object = getObjectFromGUID(guid)

    if object ~= nil then
        object.interactable = interactable
    end

    return object
end

--// Helper function that saves the necessary variables needed to restore a game in progress //--
function saveGameInProgress()
    -- Exit the function if the game setup mat exists
    if game_setup_mat ~= nil then return end

    local save_data = {
        player_points = player_points,
        established_trading_posts = established_trading_posts,
        deck_zone_parameters = deck_zone_parameters,
        card_zone_parameters = card_zone_parameters,
        trading_posts_zone_parameters = trading_posts_zone_parameters,
        strongholds_expansion_enabled = strongholds_expansion_enabled
    }
    -- Encode the table of saved data as a string
    return JSON.encode(save_data)
end

-- // Helper function that loads the necessary variables to restore a game in progress //--
function loadGameInProgress(script_state)
    -- Exit the function if the game setup mat exists
    if game_setup_mat ~= nil then return end

    -- Exit the function if there is no save data
    if script_state == "" then return end

    -- Decode the string of saved data as a table
    save_data = JSON.decode(script_state)

    player_points = save_data.player_points
    established_trading_posts = save_data.established_trading_posts

    deck_zone_parameters = save_data.deck_zone_parameters
    card_zone_parameters = save_data.card_zone_parameters
    trading_posts_zone_parameters = save_data.trading_posts_zone_parameters
    strongholds_expansion_enabled = save_data.strongholds_expansion_enabled

    createDeckScriptingZones()
    createCardScriptingZones()

    if trading_posts_zone_parameters ~= nil then
        createTradingPostScriptingZones()
    end

    for deck_color, guid in pairs(deck_guids) do
        deck = getObjectFromGUID(guid)
        if deck ~= nil then
            decks[deck_color] = deck
        end
    end

    for player_color, zone in pairs(player_point_zones) do
        Wait.frames(
        function()
            trackTotalGemTokens(zone)
            if strongholds_expansion_enabled then
                player_mats[player_color].editButton({index = 3, label = "●  ●  ●"})
            end
        end,
        2
        )
    end
end

----#include !\TTS_Splendor\Scripts\Setup\variables
----#include !\TTS_Splendor\Scripts\Setup\menu_selection_logic
-- Menu selection states
player_count_setting            = "Auto"
turns_enabled                   = false
music_enabled                   = false
trading_posts_expansion_enabled = false
orient_expansion_enabled        = false
cities_expansion_enabled        = false
strongholds_expansion_enabled   = false

-- Menu button settings
setup_button_color          = {1, 1, 1}
selected_setup_button_color = {0.376, 0.510, 0.133}
setup_button_width          = 2350
setup_button_height         = 600

--// Set the player count based on the selected menu button option //--
function changePlayerCountSetting()
    local button_index = 2
    local button_parameters = {}
    button_parameters.index = button_index
    player_count_setting = game_setup_mat.getButtons()[3].label

    if player_count_setting == "Auto" then
        player_count_setting = "2"
        number_of_players = 2
    elseif player_count_setting == "2" then
        player_count_setting = "3"
        number_of_players = 3
    elseif player_count_setting == "3" then
        player_count_setting = "4"
        number_of_players = 4
    else
        player_count_setting = "Auto"
        number_of_players = -1
    end
    button_parameters.label = player_count_setting
    game_setup_mat.editButton(button_parameters)
end

--// Enable turns if the button is enabled //--
function enableTurns()
    local button_index = 4

    if turns_enabled then
        turns_enabled = false
        game_setup_mat.editButton({index = button_index, label = "Off", color = setup_button_color})
    else
        turns_enabled = true
        game_setup_mat.editButton({index = button_index, label = "On", color = selected_setup_button_color})
    end
end

--// Enable music if the button is enabled //--
function enableMusic()
    local button_index = 6

    if music_enabled then
        music_enabled = false
        game_setup_mat.editButton({index = button_index, label = "Off", color = setup_button_color})
    else
        music_enabled = true
        game_setup_mat.editButton({index = button_index, label = "On", color = selected_setup_button_color})
    end
end

--// Enable the 'Trading Posts' expansion if the button is enabled //--
function enableTradingPostsExpansion()
    local button_index = 8
    local cities_top_button_index = button_index + 3
    local cities_bottom_button_index = button_index + 4

    if trading_posts_expansion_enabled then
        trading_posts_expansion_enabled = false
        game_setup_mat.editButton({index = button_index, color = setup_button_color})
        game_setup_mat.editButton({index = cities_top_button_index, width = setup_button_width, height = setup_button_height})
        game_setup_mat.editButton({index = cities_bottom_button_index, width = 0, height = 0})
    else
        trading_posts_expansion_enabled = true
        game_setup_mat.editButton({index = button_index, color = selected_setup_button_color})
        game_setup_mat.editButton({index = cities_top_button_index, width = 0, height = 0})
        game_setup_mat.editButton({index = cities_bottom_button_index, width = setup_button_width, height = setup_button_height})
    end
end

--// Enable the 'Orient' expansion if the button is enabled //--
function enableOrientExpansion()
    local button_index = 10

    if orient_expansion_enabled then
        orient_expansion_enabled = false
        game_setup_mat.editButton({index = button_index, color = setup_button_color})
    else
        orient_expansion_enabled = true
        game_setup_mat.editButton({index = button_index, color = selected_setup_button_color})
    end
end

--// Enable the 'Cities' expansion if the button is enabled //--
function enableCitiesExpansion()
    local button_index = 11
    local tp_top_button_index = button_index - 3
    local tp_bottom_button_index = button_index - 2

    if cities_expansion_enabled then
        cities_expansion_enabled = false
        game_setup_mat.editButton({index = button_index, color = setup_button_color})
        game_setup_mat.editButton({index = tp_top_button_index, width = setup_button_width, height = setup_button_height})
        game_setup_mat.editButton({index = tp_bottom_button_index, width = 0, height = 0})
    else
        cities_expansion_enabled = true
        game_setup_mat.editButton({index = button_index, color = selected_setup_button_color})
        game_setup_mat.editButton({index = tp_top_button_index, width = 0, height = 0})
        game_setup_mat.editButton({index = tp_bottom_button_index, width = setup_button_width, height = setup_button_height})
    end
end

--// Enable the 'Strongholds' expansion if the button is enabled //--
function enableStrongholdsExpansion()
    local button_index = 13

    if strongholds_expansion_enabled then
        strongholds_expansion_enabled = false
        game_setup_mat.editButton({index = button_index, color = setup_button_color})
    else
        strongholds_expansion_enabled = true
        game_setup_mat.editButton({index = button_index, color = selected_setup_button_color})
    end
end

----#include !\TTS_Splendor\Scripts\Setup\menu_selection_logic
----#include !\TTS_Splendor\Scripts\Setup\object_locations
-- Static object locations
shield_container_placement = {
    positions = {
        ["Blue"]   = {23.84, 1.01, 3.53},
        ["White"]  = {10.50, 1.01, -10.20},
        ["Red"]    = {-10.50, 1.01, -10.20},
        ["Yellow"] = {-23.84, 1.01, 3.53}
    },
    rotation = {0, 180, 0}
}

stronghold_placement = {
    positions = {
        ["Blue"]   = {{25.88, 1.95, 3.55}, {27.25, 1.95, 3.55}, {28.62, 1.95, 3.55}},
        ["White"]  = {{12.65, 1.95, -10.18}, {14.02, 1.95, -10.18}, {15.39, 1.95, -10.18}},
        ["Red"]    = {{-12.65, 1.95, -10.18}, {-14.02, 1.95, -10.18}, {-15.39, 1.95, -10.18}},
        ["Yellow"] = {{-25.88, 1.95, 3.55}, {-27.25, 1.95, 3.55}, {-28.62, 1.95, 3.55}}
    }
}

--// Define dynamic zone and object locations relative to the table mat //--
function createTableMatObjectLocations()
    -- Name and positions for table mats
    local table_mat_name      = table_mat.getName()
    local table_mat_offsets_z = {["Standard Mat"] = 0, ["Orient Mat"] = -1.44}
    local table_mat_position  = {x = table_mat.getPosition().x, y = table_mat.getPosition().y, z = table_mat.getPosition().z + table_mat_offsets_z[table_mat_name]}
    table_mat_rotation  = table_mat.getRotation()

    -- Positions for deck zones on table mat
    local deck_zone_positions_x = {-10.39, 11.42}
    local deck_zone_positions_y = {0.2, 0.25, 0.29, 0.16} -- y positions relative to the mat's y position
    local deck_zone_positions_z = {5.39, 1.23, -2.93}
    local deck_zone_offsets_x   = {["Standard Mat"] = 0, ["Orient Mat"] = -1.06}
    local deck_zone_scale       = {2.8, 1.0, 3.9}

    deck_zone_parameters = {
        positions = {
            ["Blue"]   = {x = deck_zone_positions_x[1] + table_mat_position.x + deck_zone_offsets_x[table_mat_name], y = deck_zone_positions_y[1] + table_mat_position.y, z = deck_zone_positions_z[1] + table_mat_position.z},
            ["Yellow"] = {x = deck_zone_positions_x[1] + table_mat_position.x + deck_zone_offsets_x[table_mat_name], y = deck_zone_positions_y[2] + table_mat_position.y, z = deck_zone_positions_z[2] + table_mat_position.z},
            ["Green"]  = {x = deck_zone_positions_x[1] + table_mat_position.x + deck_zone_offsets_x[table_mat_name], y = deck_zone_positions_y[3] + table_mat_position.y, z = deck_zone_positions_z[3] + table_mat_position.z}
        },
        rotation = {0, 180, 180},
        scale = deck_zone_scale
    }

    if table_mat_name == "Orient Mat" then
        deck_zone_parameters.positions["Red3"] = {x = deck_zone_positions_x[2] + table_mat_position.x, y = deck_zone_positions_y[4] + table_mat_position.y, z = deck_zone_positions_z[1] + table_mat_position.z}
        deck_zone_parameters.positions["Red2"] = {x = deck_zone_positions_x[2] + table_mat_position.x, y = deck_zone_positions_y[4] + table_mat_position.y, z = deck_zone_positions_z[2] + table_mat_position.z}
        deck_zone_parameters.positions["Red1"] = {x = deck_zone_positions_x[2] + table_mat_position.x, y = deck_zone_positions_y[4] + table_mat_position.y, z = deck_zone_positions_z[3] + table_mat_position.z}
    end

    -- Positions for deck and card zones on table mat
    local card_zone_positions_x = {-6.98, -3.8, -0.66, 2.49, 4.84, 8.0}
    local card_zone_position_y  = 0.61 -- y position relative to the mat's y position
    local card_zone_positions_z = deck_zone_positions_z
    local card_zone_offsets_x   = deck_zone_offsets_x
    local card_zone_scale       = deck_zone_scale

    card_zone_parameters = {
        positions = {
            ["Blue"] = {
                ["Scripting Zone #1"] = {x = card_zone_positions_x[1] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[1] + table_mat_position.z},
                ["Scripting Zone #2"] = {x = card_zone_positions_x[2] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[1] + table_mat_position.z},
                ["Scripting Zone #3"] = {x = card_zone_positions_x[3] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[1] + table_mat_position.z},
                ["Scripting Zone #4"] = {x = card_zone_positions_x[4] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[1] + table_mat_position.z}
            },
            ["Yellow"] = {
                ["Scripting Zone #1"] = {x = card_zone_positions_x[1] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[2] + table_mat_position.z},
                ["Scripting Zone #2"] = {x = card_zone_positions_x[2] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[2] + table_mat_position.z},
                ["Scripting Zone #3"] = {x = card_zone_positions_x[3] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[2] + table_mat_position.z},
                ["Scripting Zone #4"] = {x = card_zone_positions_x[4] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[2] + table_mat_position.z}
            },
            ["Green"] = {
                ["Scripting Zone #1"] = {x = card_zone_positions_x[1] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[3] + table_mat_position.z},
                ["Scripting Zone #2"] = {x = card_zone_positions_x[2] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[3] + table_mat_position.z},
                ["Scripting Zone #3"] = {x = card_zone_positions_x[3] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[3] + table_mat_position.z},
                ["Scripting Zone #4"] = {x = card_zone_positions_x[4] + table_mat_position.x + card_zone_offsets_x[table_mat_name], y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[3] + table_mat_position.z}
            }
        },
        rotation = table_mat_rotation,
        scale = card_zone_scale
    }

    if table_mat_name == "Orient Mat" then
        card_zone_parameters.positions["Red3"] = {
            ["Scripting Zone #1"] = {x = card_zone_positions_x[6] + table_mat_position.x, y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[1] + table_mat_position.z},
            ["Scripting Zone #2"] = {x = card_zone_positions_x[5] + table_mat_position.x, y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[1] + table_mat_position.z}
        }

        card_zone_parameters.positions["Red2"] = {
            ["Scripting Zone #1"] = {x = card_zone_positions_x[6] + table_mat_position.x, y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[2] + table_mat_position.z},
            ["Scripting Zone #2"] = {x = card_zone_positions_x[5] + table_mat_position.x, y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[2] + table_mat_position.z}
        }

        card_zone_parameters.positions["Red1"] = {
            ["Scripting Zone #1"] = {x = card_zone_positions_x[6] + table_mat_position.x, y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[3] + table_mat_position.z},
            ["Scripting Zone #2"] = {x = card_zone_positions_x[5] + table_mat_position.x, y = card_zone_position_y + table_mat_position.y, z = card_zone_positions_z[3] + table_mat_position.z}
        }
    end

    -- Positions for noble tiles on table mat
    local noble_postions_x = {["Standard Mat"] = {8.58, 6.78, 10.4, 6.78, 10.4}, ["Orient Mat"] = {-3.67, -0.06, 3.55, -7.28, 7.16}}
    local noble_postion_y  = 0.61 -- y positions relative to the mat's y position
    local noble_postions_z = {["Standard Mat"] = {3.54, 0, 0, -3.55, -3.55}, ["Orient Mat"] = {9.05, 9.05, 9.05, 9.05, 9.05}}

    noble_tile_placement = {
        positions = {
            ["Noble #1"] = {x = noble_postions_x[table_mat_name][1] + table_mat_position.x, y = noble_postion_y + table_mat_position.y, z = noble_postions_z[table_mat_name][1] + table_mat_position.z},
            ["Noble #2"] = {x = noble_postions_x[table_mat_name][2] + table_mat_position.x, y = noble_postion_y + table_mat_position.y, z = noble_postions_z[table_mat_name][2] + table_mat_position.z},
            ["Noble #3"] = {x = noble_postions_x[table_mat_name][3] + table_mat_position.x, y = noble_postion_y + table_mat_position.y, z = noble_postions_z[table_mat_name][3] + table_mat_position.z},
            ["Noble #4"] = {x = noble_postions_x[table_mat_name][4] + table_mat_position.x, y = noble_postion_y + table_mat_position.y, z = noble_postions_z[table_mat_name][4] + table_mat_position.z},
            ["Noble #5"] = {x = noble_postions_x[table_mat_name][5] + table_mat_position.x, y = noble_postion_y + table_mat_position.y, z = noble_postions_z[table_mat_name][5] + table_mat_position.z}
        },
        rotation = table_mat_rotation
    }

    -- Positions for city tiles on table mat
    local city_postions_x = {["Standard Mat"] = {8.58, 8.58, 8.58}, ["Orient Mat"] = {-6.01, -0.06, 5.89}}
    local city_postion_y  = 0.10 -- y positions relative to the mat's y position
    local city_postions_z = {["Standard Mat"] = {3.50, 0.0, -3.50}, ["Orient Mat"] = {9.05, 9.05, 9.05}}

    city_tile_placement = {
        positions = {
            ["City #1"] = {x = city_postions_x[table_mat_name][1] + table_mat_position.x, y = city_postion_y + table_mat_position.y, z = city_postions_z[table_mat_name][1] + table_mat_position.z},
            ["City #2"] = {x = city_postions_x[table_mat_name][2] + table_mat_position.x, y = city_postion_y + table_mat_position.y, z = city_postions_z[table_mat_name][2] + table_mat_position.z},
            ["City #3"] = {x = city_postions_x[table_mat_name][3] + table_mat_position.x, y = city_postion_y + table_mat_position.y, z = city_postions_z[table_mat_name][3] + table_mat_position.z}
        },
        rotation = table_mat_rotation
    }

    -- Positions for gem containers on table mat
    local gem_container_positions_x = {-6.60, -3.96, -1.32, 1.32, 3.96, 6.60}
    local gem_container_position_y  = 0.16 -- y positions relative to the mat's y position
    local gem_container_position_z  = -6.23

    gem_container_placement = {
        positions = {
            ["Diamond"]  = {x = gem_container_positions_x[1] + table_mat_position.x, y = gem_container_position_y + table_mat_position.y, z = gem_container_position_z + table_mat_position.z},
            ["Sapphire"] = {x = gem_container_positions_x[2] + table_mat_position.x, y = gem_container_position_y + table_mat_position.y, z = gem_container_position_z + table_mat_position.z},
            ["Emerald"]  = {x = gem_container_positions_x[3] + table_mat_position.x, y = gem_container_position_y + table_mat_position.y, z = gem_container_position_z + table_mat_position.z},
            ["Ruby"]     = {x = gem_container_positions_x[4] + table_mat_position.x, y = gem_container_position_y + table_mat_position.y, z = gem_container_position_z + table_mat_position.z},
            ["Onyx"]     = {x = gem_container_positions_x[5] + table_mat_position.x, y = gem_container_position_y + table_mat_position.y, z = gem_container_position_z + table_mat_position.z},
            ["Gold"]     = {x = gem_container_positions_x[6] + table_mat_position.x, y = gem_container_position_y + table_mat_position.y, z = gem_container_position_z + table_mat_position.z}
        },
        rotation = table_mat_rotation
    }
end

--// Define dynamic zone locations relative to the 'Trading Posts' mat //--
function createTradingPostsMatZoneLocations()
    local tp_mat_position = {x = trading_posts_mat.getPosition().x, y = trading_posts_mat.getPosition().y, z = trading_posts_mat.getPosition().z}

    local tp_zone_positions_x = {-10.54, -5.19, 0.22, 5.70, 10.80}
    local tp_zone_position_y  = 0.49 -- y positions relative to the mat's y position
    local tp_zone_position_z  = 0.84 -- z positions relative to the mat's z position
    local tp_zone_scale       = {4.4, 0.85, 4.4}

    trading_posts_zone_parameters = {
        positions = {
            [tp1] = {x = tp_zone_positions_x[1] + tp_mat_position.x, y = tp_zone_position_y + tp_mat_position.y, z = tp_zone_position_z + tp_mat_position.z},
            [tp2] = {x = tp_zone_positions_x[2] + tp_mat_position.x, y = tp_zone_position_y + tp_mat_position.y, z = tp_zone_position_z + tp_mat_position.z},
            [tp3] = {x = tp_zone_positions_x[3] + tp_mat_position.x, y = tp_zone_position_y + tp_mat_position.y, z = tp_zone_position_z + tp_mat_position.z},
            [tp4] = {x = tp_zone_positions_x[4] + tp_mat_position.x, y = tp_zone_position_y + tp_mat_position.y, z = tp_zone_position_z + tp_mat_position.z},
            [tp5] = {x = tp_zone_positions_x[5] + tp_mat_position.x, y = tp_zone_position_y + tp_mat_position.y, z = tp_zone_position_z + tp_mat_position.z}
        },
        rotation = trading_posts_mat.getRotation(),
        scale = tp_zone_scale
    }
end

----#include !\TTS_Splendor\Scripts\Setup\object_locations
----#include !\TTS_Splendor\Scripts\Setup\create_scripting_zones
--// Get or create the scripting zones for decks //--
function createDeckScriptingZones()
    for color, position in pairs(deck_zone_parameters.positions) do
        local zone_name = color .. " Deck Scripting Zone"
        local scripting_zone = getScriptingZone(zone_name) or spawnObject({
            type  = "ScriptingTrigger",
            sound = false
        })
        scripting_zone.setName(zone_name)
        scripting_zone.setPosition(position)
        scripting_zone.setRotation(deck_zone_parameters.rotation)
        scripting_zone.setScale(deck_zone_parameters.scale)
        scripting_zone.setTags({"Card"})
        deck_zones[color] = scripting_zone
    end
end


--// Get or create the scripting zones for cards //--
function createCardScriptingZones()
    for color, zones in pairs(card_zone_parameters.positions) do
        card_zones[color] = {}
        for zone_name, position in pairs(zones) do
            local full_zone_name = color .. " Card " .. zone_name
            local scripting_zone = getScriptingZone(full_zone_name) or spawnObject({
                type  = "ScriptingTrigger",
                sound = false
            })
            scripting_zone.setName(full_zone_name)
            scripting_zone.setPosition(position)
            scripting_zone.setRotation(card_zone_parameters.rotation)
            scripting_zone.setScale(card_zone_parameters.scale)
            scripting_zone.setTags({"Card"})
            table.insert(card_zones[color], scripting_zone)
        end
    end
end

function createTradingPostScriptingZones()
    for zone_name, position in pairs(trading_posts_zone_parameters.positions) do
        local scripting_zone = getScriptingZone(zone_name) or spawnObject({
            type  = "ScriptingTrigger",
            sound = false
        })
        scripting_zone.setName(zone_name)
        scripting_zone.setPosition(position)
        scripting_zone.setRotation(trading_posts_zone_parameters.rotation)
        scripting_zone.setScale(trading_posts_zone_parameters.scale)
        scripting_zone.setTags({"Blue Shield", "White Shield", "Red Shield", "Yellow Shield"})
        trading_posts_zones[zone_name] = scripting_zone
    end
end

--// Get a scripting zone by name if it exists //--
function getScriptingZone(zone_name)
    for _, object in ipairs(getAllObjects()) do
        if object.type == "Scripting" and object.getName() ~= nil then
            if string.match(object.getName(), zone_name) ~= nil then
                return object
            end
        end
    end
end

----#include !\TTS_Splendor\Scripts\Setup\create_scripting_zones
----#include !\TTS_Splendor\Scripts\Setup\configure_players
--// Select the starting player form the list of available players if any //--
function selectStartingPlayer()
    local starting_player_color = nil
    if #seated_players > 0 then
        local starting_player_number = math.random(1, #seated_players)
        starting_player_color = seated_players[starting_player_number]
        broadcastToAll(Player[starting_player_color].steam_name .. " is the starting player!", Color.fromString(starting_player_color))
    end
    return starting_player_color
end

--// Set the turn order for the players relative to the starting player //--
function setTurnOrder(starting_player_color)
    Turns.type = 2
    if starting_player_color == "Red" then
        turn_order = {"Red", "Yellow", "Blue", "White"}
    elseif starting_player_color == "Yellow" then
        turn_order = {"Yellow", "Blue", "White", "Red"}
    elseif starting_player_color == "Blue" then
        turn_order = {"Blue", "White", "Red", "Yellow"}
    else
        turn_order = {"White", "Red", "Yellow", "Blue"}
    end
    Turns.order = turn_order
end

--// Checks whether the number of players is sufficient to start the game //--
function checkPlayerCount()
    seated_players = getSeatedPlayers()
    if player_count_setting == "Auto" then
        number_of_players = #seated_players

        if number_of_players < 2 then
            broadcastToAll("Insufficient number of players to start the game!\nPlease wait for additional seated players before starting.", Color.fromString("Orange"))
        else
            startGame()
        end
    else
        startGame()
    end
end

----#include !\TTS_Splendor\Scripts\Setup\configure_players
----#include !\TTS_Splendor\Scripts\Setup\game_setup
--// Setup the table mat and place all necessary components //--
function startGame()
    print("Starting a new " .. number_of_players .. "-player game...")

    -- Remove the game setup mat
    bags.mats.putObject(game_setup_mat)

    -- Place a table mat based on the selected
    if orient_expansion_enabled then
        -- Use the custom 'Orient Cities' mat if both expansions are enabled, otherwise use the 'Orient' mat
        if cities_expansion_enabled then
            table_mat_guid = orient_cities_table_mat_guid
        else
            table_mat_guid = orient_table_mat_guid
        end
        table_mat = bags.mats.takeObject({
            guid     = table_mat_guid,
            position = {0.0, 0.96, 1.44},
            rotation = {0, 180, 0},
            smooth   = false,
        })
    else
        -- Use the 'Cities' mat if the expansion is enabled, otherwise us the standard mat
        if cities_expansion_enabled then
            table_mat_guid = cities_table_mat_guid
        else
            table_mat_guid = standard_table_mat_guid
        end
        -- Place the table mat
        table_mat = bags.mats.takeObject({
            guid     = table_mat_guid,
            position = {0, 0.96, 0},
            rotation = {0, 180, 0},
            smooth   = false,
        })
    end

    -- Lock the table mat
    table_mat.setLock(true)
    -- Create the locations for nobles, cities, coins and decks/card zones
    createTableMatObjectLocations()
    -- Crete the scripting zones for the decks and cards relative to the table mat
    createDeckScriptingZones()
    createCardScriptingZones()

    -- Place the 'Trading Posts' mat if the expansion is selected
    if trading_posts_expansion_enabled then
        local trading_posts_mat_parameters = {
            guid     = trading_posts_mat_guid,
            position = {0, 1, 11.62},
            rotation = {0, 180, 0},
            smooth   = false,
        }
        if orient_expansion_enabled then
            trading_posts_mat_parameters.position = {0, 1, 14.5}
        end
        -- Place the 'Trading Posts' mat
        trading_posts_mat = bags.mats.takeObject(trading_posts_mat_parameters)
        -- Lock the 'Trading Posts' mat
        trading_posts_mat.setLock(true)
        -- Create the locations for 'Trading Posts' zones
        createTradingPostsMatZoneLocations()
        -- Crete the scripting zones for the 'Trading Posts' mat
        createTradingPostScriptingZones()
    end

    -- Place decks into corresponding zones if they exist
    for deck_color, _ in pairs(deck_zones) do
        placeDeck(deck_color)
    end

    -- Place 'Cities' if the expansion is enabled, otherwise place nobles
    if cities_expansion_enabled then
        -- Shuffle the city tiles
        bags.cities.shuffle()
        -- Place the city tiles
        for i = 1, 3 do
            bags.cities.takeObject({
                position = city_tile_placement.positions["City #" .. i],
                rotation = city_tile_placement.rotation,
                smooth   = false,
                flip     = randomBoolean()
            })
        end
    else
        -- Shuffle the noble tiles
        bags.nobles.shuffle()
        -- Place the noble tiles
        for i = 1, number_of_players + 1 do
            bags.nobles.takeObject({
                position = noble_tile_placement.positions["Noble #" .. i],
                rotation = noble_tile_placement.rotation,
                smooth   = false,
                flip     = true
            })
        end
    end

    -- Place the gem token containers
    for gem_name, _ in pairs(gem_container_guids) do
        placeGemContainer(gem_name)
    end

    -- Place the gem tokens
    for i = 1, 5 do
        placeGemToken("Gold")
    end

    if number_of_players == 2 then
        j = 4
    elseif number_of_players == 3 then
        j = 5
    else
        j = 7
    end

    for i = 1, j do
        placeGemToken("Diamond")
        placeGemToken("Sapphire")
        placeGemToken("Emerald")
        placeGemToken("Ruby")
        placeGemToken("Onyx")
    end

    -- Place the coat of arms containers if the 'Trading Posts' expansion is enabled
    if trading_posts_expansion_enabled then
        for player_color, _ in pairs (shield_container_guids) do
            placeShieldContainer(player_color)
        end
    end

    -- Place the strongholds if the expansion is enabled
    if strongholds_expansion_enabled then
        for player_color, _ in pairs (shield_container_guids) do
            for i = 1, 3 do
                placeStronghold(player_color, i)
            end
        end
    end

    -- Place the cards
    for card_color, _ in pairs(card_zones) do
        placeCards(card_color)
    end

    -- Set the turn order relative to the starting player
    setTurnOrder(selectStartingPlayer())
    -- Enable turns if the option is enabled
    Turns.enable = turns_enabled

    -- Start playing music if the option is enabled
    if music_enabled then
        Wait.condition(
            function()
                -- Start the music player
                MusicPlayer.play()
            end,
            function() -- Condition function
                -- Wait for everyone to finish loading the audioclip
                return MusicPlayer.loaded
            end
        )
    end
end

--// Place a deck into a scripting zone//--
function placeDeck(deck_color)
    local bag      = bags.decks
    local guid     = deck_guids[deck_color]
    local position = deck_zones[deck_color].getPosition()
    local rotation = deck_zones[deck_color].getRotation()

    deck = placeContainer(bag, guid, position, rotation)
    deck.shuffle()
    deck.setLock(true)
    decks[deck_color] = deck
end

--// Place a gem container //--
function placeGemContainer(gem_name)
    local bag      = token_bags[gem_name]
    local guid     = gem_container_guids[gem_name]
    local position = gem_container_placement.positions[gem_name]
    local rotation = gem_container_placement.rotation

    -- Take the gem container from the bag, place it, then lock it
    local gem_container = placeContainer(bag, guid, position, rotation)
    gem_container.setLock(true)
end

--// Place a coat of arms containter //--
function placeShieldContainer(player_color)
    local bag      = bags.shields
    local guid     = shield_container_guids[player_color]
    local position = shield_container_placement.positions[player_color]
    local rotation = shield_container_placement.rotation

    -- Place the container then lock it
    local shield_container = placeContainer(bag, guid, position, rotation)
    shield_container.setLock(true)
end

--// Helper function that takes a container object from a container and places it //--
function placeContainer(bag, guid, position, rotation)
    return bag.takeObject({
        guid     = guid,
        position = position,
        rotation = rotation,
        smooth   = false
    })
end

--// Place a gem token //--
function placeGemToken(gem_name)
    local bag      = token_bags[gem_name]
    local position = {gem_container_placement.positions[gem_name].x, gem_container_placement.positions[gem_name].y + 0.3, gem_container_placement.positions[gem_name].z}
    local smooth   = false
    local flip     = false

    placeObject(bag, position, smooth, flip)
end

--// Place cards into scripting zones //--
function placeCards(card_color)
    local bag      = decks[card_color]
    local smooth   = true
    local flip     = true

    for i = 1, #card_zones[card_color] do
        local position = card_zones[card_color][i].getPosition()
        placeObject(bag, position, smooth, flip)
    end
end

--// Place a stronghold //--
function placeStronghold(player_color, index)
    local bag      = stronghold_bags[player_color]
    local position = stronghold_placement.positions[player_color][index]
    local smooth   = false
    local flip     = false

    placeObject(bag, position, smooth, flip)
    player_mats[player_color].editButton({index = 3, label = "●  ●  ●"})
end

--// Helper function that takes an object from a container and places it //--
function placeObject(bag, position, smooth, flip)
    return bag.takeObject({
        position = position,
        smooth   = smooth,
        flip     = flip
    })
end

--//  Helper function that generates a random boolean //--
function randomBoolean()
    random_number = math.random(0, 1)
    return random_number ~= 0
end

----#include !\TTS_Splendor\Scripts\Setup\game_setup
----#include !\TTS_Splendor\Scripts\Setup\score_count_tracking
--// Count the number of gem cards and coins in a player's zone //--
function countGem(zone, object)
    -- Exit the function if the zone is nil
    if zone == nil then return end
    -- Exit the function if the zone doesn't have a name
    if zone.getName() == nil then return end
    -- Exit the function if the zone isn't a player's point zone
    if string.match(zone.getName(), "Player Point Zone") == nil then return end

    -- Get the player color from the name of the player's point zone
    local player_color = split(zone.getName(), " ")[1]

    -- Exit the function if the object is nil
    if object == nil then return end
    -- Exit the function if the object doesn't have a name
    if object.getName() == nil then return end
    -- Exit the function if the object's name doesn't contain a gem name
    if not findKeyInTable(object.getName(), gem_counters[player_color]) then return end

    -- Get the gem name from the object name
    local gem_name = split(object.getName(), " ")[1]
    -- Set the default card and gem counts
    local cards = 0
    local gems = 0

    -- Count the gem cards and coins in the zone
    for i = 1, #zone.getObjects() do
        -- Exit the loop if there are no objects in the zone
        if #zone.getObjects() == 0 then break end

        local object_in_zone = zone.getObjects()[i]
        -- Only count objects having names containing the same gem name as the object
        if string.match(object_in_zone.getName(), gem_name) ~= nil then
            -- Increment the card count if the object name contains 'card', otherwise increment the coin count
            if string.match(object_in_zone.getName(), "card") ~= nil or string.match(object_in_zone.getName(), "Card") ~= nil then
                -- Increment the card count by 2 if the card is a double gem card, otherwise increment by 1
                if string.match(object_in_zone.getName(), "Double") ~= nil then
                    cards = cards + 2
                else
                    cards = cards + 1
                end
            else
                -- Increment the coin count by 2 if the coin is a double coin card, otherwise incement by 1
                if object_in_zone.getDescription() == "$$" then
                    gems = gems + 2
                else
                    gems = gems + 1
                end
            end
        end
    end

    -- Set the card and gem counts; if the gem name is gold, only set the coin count
    local counts = cards .. "/" .. gems + cards
    if gem_name == "Gold" then
        counts = tostring(gems)
    end

    -- Update the gem counter for the corresponding player
    gem_counters[player_color][gem_name].TextTool.setValue(counts)
end

--// Count the number of gem tokens in a player's zone //--
function trackTotalGemTokens(zone)
    -- Exit the function if the zone is nil
    if zone == nil then return end
    -- Exit the function if the zone doesn't have a name
    if zone.getName() == nil then return end
    -- Exit the function if the zone isn't a player's point zone
    if string.match(zone.getName(), "Player Point Zone") == nil then return end

    -- Get the player color from the name of the player's point zone
    local player_color = split(zone.getName(), " ")[1]

    -- Set the default count for gems
    local gems = 0

    if #zone.getObjects() ~= 0 then
        for _, object in ipairs(zone.getObjects()) do
            if string.match(object.getName(), "Token") ~= nil and string.match(object.getName(), "Tokens") == nil then
                gems = gems + 1
            end
        end
    end

    if player_mats[player_color].getButtons() == nil then return end

    player_mats[player_color].editButton({index = 1, label = "Tokens: " .. gems})
    local button_color = {0, 0, 0}
    if gems > 10 then
        button_color = {0.784, 0.22, 0.153} -- Custom red color
    end
    player_mats[player_color].editButton({index = 2, color = button_color})
end

--// Helper funtion to trigger the tracking of points from object owned scripts //--
function triggerTrackPoints(object)
    -- Exit the function if the object is nil
    if object == nil then return end
    -- Exit the function if the object isn't in a zone
    if #object.getZones() == 0 then return end

    for _, zone in ipairs(object.getZones()) do
        if string.match(zone.getName(), "Player Point Zone") ~= nil then
            trackPoints(zone, object)
            break
        end
    end
end

--// Calcutlate the total points for cards and nobles in a player's zone //--
function trackPoints(zone, object)
    -- Exit the function if the zone is nil
    if zone == nil then return end
    -- Exit the function if the zone doesn't have a name
    if zone.getName() == nil then return end
    -- Exit the function if the zone isn't a player's point zone
    if string.match(zone.getName(), "Player Point Zone") == nil then return end

    -- Get the player color from the name of the player's point zone
    local player_color = split(zone.getName(), " ")[1]

    -- Exit the function if the object is nil
    if object == nil then return end
    -- Exit the function if the object doesn't have a description
    if object.getDescription() == nil then return end

    -- Set the default count for points
    local points = 0

    -- Determine if a trading post has been established by a player
    if #zone.getObjects() ~= 0 then
        for i = 1, #zone.getObjects() do
            local object = zone.getObjects()[i]
            if tonumber(object.getDescription()) ~= nil then
                points = points + tonumber(object.getDescription())
            end
        end
    end
    player_points[player_color]["mat_points"] = points
    updatePointsCounter(player_color)
end

--// Calculate the total points for established trading posts //--
function trackTradingPostPoints(zone, object)
    -- Exit the funciton if the zone is nil
    if zone == nil then return end
    -- Exit the function if the zone doesn't have a name
    if zone.getName() == nil then return end
    -- Exit the function if the zone isn't a 'Trading Posts' zone
    if not findKeyInTable(zone.getName(), trading_posts_zones) then return end
    -- Exit the funciton if the object is nil
    if object == nil then return end
    -- Exit the function if the object doesn't have a name
    if object.getName() == nil then return end
    -- Exit the function if the object isn't a coat of arms
    if string.match(object.getName(), "Coat of Arms") == nil then return end

    -- Get the player color from the name of the coat of arms token
    local player_color = split(object.getName(), " ")[1]
    -- Set the default established state for a trading post
    local established = false

    -- Determine if a trading post has been established by a player
    if #zone.getObjects() ~= 0 then
        for i = 1, #zone.getObjects() do
            if string.match(zone.getObjects()[i].getName(), player_color .. " Coat of Arms") ~= nil then
                established = true
                break
            end
        end
    end

    -- Track the established state of a player's trading post
    established_trading_posts[player_color][zone.getName()] = established

    -- Update the points from a players established trading posts
    local etp = established_trading_posts[player_color]
    local points = 0
    local count = 0

    if etp[tp1] then
        count = count + 1
    end
    if etp[tp2] then
        count = count + 1
    end
    if etp[tp3] then
        count = count + 1
    end
    if etp[tp4] then
        count = count + 1
        points = points + 5
    end
    if etp[tp5] then
        count = count + 1
        points = points + count
    end

    -- Track the total points for a player's established trading posts
    player_points[player_color]["tp_points"] = points
    -- Update the total points counter for a player
    updatePointsCounter(player_color)
end

--// Update a player't total points from the player's zone and trading posts mat //--
function updatePointsCounter(player_color)
    -- Exit the function if the point counters haven't been populated
    if point_counters == nil then return end

    points = player_points[player_color]["mat_points"] + player_points[player_color]["tp_points"]
    point_counters[player_color].Counter.setValue(points)
end

--// Dummy function for disabled buttons //--
function doNothing() end

----#include !\TTS_Splendor\Scripts\Setup\score_count_tracking
----#include !\TTS_Splendor\Scripts\Helpers\split_string
--// Helper functions that splits strings by delimiter (returns table) //--
function split(string, delimiter)
    local result = {};
    for match in (string..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

----#include !\TTS_Splendor\Scripts\Helpers\split_string
----#include !\TTS_Splendor\Scripts\Helpers\find_key_in_table
--// Helper function that checks if the table contains the specifid key (returns boolean) //--
function findKeyInTable(key, table)
    local found = false
    for k, _ in pairs(table) do
        if string.match(key, k) ~= nil then
            found = true
            break
        end
    end
    return found
end

----#include !\TTS_Splendor\Scripts\Helpers\find_key_in_table
----#include !\TTS_Splendor\Scripts\Helpers\prevent_card_stacking
-- Prevent cards from stacking in a player's point zone
prevent_card_stacking = true

--[[
    Check if any cards in the player area are stacked, and if so, split them up.

    So here's a weird one. I need to lock out TTS from doing weird stuff when
    you create a 2-card deck from two individual cards. Otherwise it does REALLY
    weird stuff (calls functions twice when drawing a card, etc.)

    It doesn't do this if you drop a card onto an existing deck, only when you
    create a new deck from 2 cards...

    If you know how to fix it so that I don't have to use a mutex, please let me know.
]]--

function preventCardStacking(container)
    -- Exit the function if the container isn't a deck
    if container.name ~= "Deck" then return end
    -- Exit the funciton if card stacking prevention is disabled
    if not prevent_card_stacking then return end

    -- Temporatily disable card stacking prevention while the stack is spread apart
    prevent_card_stacking = false
    -- Wait for the cards to stack before spreading apart the deck
    Wait.time(
        function()
            for _, zone in ipairs(container.getZones()) do
                if string.match(zone.getName(), "Player Point Zone") ~= nil then
                    container.takeObject({
                        position = {container.getPosition().x, container.getPosition().y + 1, container.getPosition().z - 0.8},
                        smooth   = true,
                        top      = true
                    })
                    break
                end
            end
            prevent_card_stacking = true
        end, 0.5, 0
    )
end

----#include !\TTS_Splendor\Scripts\Helpers\prevent_card_stacking

--// Triggers when the game (and all objects it contains) has finished loading //--
function onLoad(script_state)
    initializeZones()
    initializeObjects()
    loadGameInProgress(script_state)
end

--// Triggers when a game in progress is being saved //--
function onSave()
    return saveGameInProgress()
end

--// Triggers when an object enters a zone //--
function onObjectEnterZone(zone, object)
    trackTotalGemTokens(zone)
    trackPoints(zone, object)
    trackTradingPostPoints(zone, object)
    countGem(zone, object)
end

--// Triggers when an object leaves a zone //--
function onObjectLeaveZone(zone, object)
    trackTotalGemTokens(zone)
    trackPoints(zone, object)
    trackTradingPostPoints(zone, object)
    countGem(zone, object)
end

--// Triggers when an object enters a container //--
function onObjectEnterContainer(container, _)
    preventCardStacking(container)
end

----#include !\TTS_Splendor\Scripts\global