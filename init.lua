local S = minetest.get_translator("mcl_blackstone")

stairs = {}

--nodes






local mod_screwdriver = minetest.get_modpath("screwdriver") ~= nil
local on_rotate
if mod_screwdriver then
	on_rotate = screwdriver.rotate_3way
end
local alldirs = {{x=0,y=0,z=1}, {x=1,y=0,z=0}, {x=0,y=0,z=-1}, {x=-1,y=0,z=0}, {x=0,y=-1,z=0}, {x=0,y=1,z=0}}

--Blocks

minetest.register_node("mcl_blackstone:blackstone", {
	description = S("Blackstone"),
	tiles = {"mcl_blackstone.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})

minetest.register_node("mcl_blackstone:basalt_polished", {
	description = S("Polished Basalt"),
	tiles = {"mcl_blackstone_basalt_top_polished.png", "mcl_blackstone_basalt_top_polished.png", "mcl_blackstone_basalt_side_polished.png"},
	paramtype2 = "facedir",
	on_place = mcl_util.rotate_axis,
	on_rotate = on_rotate,
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})


minetest.register_node("mcl_blackstone:basalt", {
	description = S("Basalt"),
	tiles = {"mcl_blackstone_basalt_top.png", "mcl_blackstone_basalt_top.png", "mcl_blackstone_basalt_side.png"},
	paramtype2 = "facedir",
	on_place = mcl_util.rotate_axis,
	on_rotate = on_rotate,
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})



minetest.register_node("mcl_blackstone:blackstone_polished", {
	description = S("Polished Blackstone"),
	tiles = {"mcl_blackstone_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})


minetest.register_node("mcl_blackstone:blackstone_chiseled_polished", {
	description = S("Chiseled Polished Blackstone"),
	tiles = {"mcl_blackstone_chiseled_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})


minetest.register_node("mcl_blackstone:blackstone_brick_polished", {
	description = S("Polished Blackstone Bricks"),
	tiles = {"mcl_blackstone_polished_bricks.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})

minetest.register_node("mcl_blackstone:quartz_brick", {
	description = S("Quartz Bricks"),
	tiles = {"mcl_backstone_quartz_bricks.png"},
	is_ground_content = false,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})
--[[
minetest.register_node("mcl_blackstone:chain", {
	description = S("Chain"),
	drawtype = "plantlike",
	_doc_items_longdesc = S(""),
	_doc_items_hidden = false,
	paramtype2 = "facedir",
	on_place = mcl_util.rotate_axis,
	on_rotate = on_rotate,
	tiles = {"mcl_blackstone_chain.png"},
	inventory_image = "mcl_blackstone_chain_inv.png",
	wield_image = "mcl_blackstone_chain_inv.png",
	selection_box = {
		type = "fixed",
		fixed = {{ -2/16, -8/16, -2/16, 2/16, 8/16, 2/16 }},
	},
	paramtype = "light",
	paramtype2 = "color",
	walkable = false,
	is_ground_content = true,
	groups = {pickaxey=2,deco_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 2,
	_mcl_hardness = 1,
})
]]--

--slabs/stairs

mcl_stairs.register_stair_and_slab_simple("blackstone", "mcl_blackstone:blackstone", "Blackstone Stair", "Blackstone Slab", "Double Blackstone Slab")


mcl_stairs.register_stair_and_slab_simple("blackstone_polished", "mcl_blackstone:blackstone_polished", "Polished Blackstone Stair", "Polished Blackstone Slab", "Polished Double Blackstone Slab")


mcl_stairs.register_stair_and_slab_simple("blackstone_chiseled_polished", "mcl_blackstone:blackstone_chiseled_polished", "Polished Chiseled Blackstone Stair", "Chiseled Polished Blackstone Slab", "Double Polished Chiseled Blackstone Slab")


mcl_stairs.register_stair_and_slab_simple("blackstone_brick_polished", "mcl_blackstone:blackstone_brick_polished", "Polished Blackstone Brick Stair", "Polished Blackstone  Brick Slab", "Double Polished Blackstone Brick Slab")

--Wall

mcl_walls.register_wall("mcl_blackstone:wall", S("Blackstone Wall"), "mcl_blackstone:blackstone")


--Redstone Things
--[[
mesecon.register_pressure_plate(
	"mcl_blackstone:pressure_plate_blackstone",
	S("Blackstone Pressure Plate"),
	{"mcl_blackstone.png"},
	{"mcl_blackstone.png"},
	"mcl_blackstone.png",
	nil,
	{{"mcl_blackstone:blackstone", "mcl_blackstone:blackstone"}},
--	mcl_sounds.node_sound_stone_defaults(),
	{pickaxey=1, material_stone=1},
	{ player = true, mob = true },
	S("A Blackstone pressure plate is a redstone component which supplies its surrounding blocks with redstone power while a player or mob stands on top of it. It is not triggered by anything else."))


mesecon.register_button(
	"stone",
	S("Blacktone Button"),
	"mcl_blackstone.png",
	"mcl_blackstone:blackstone",
--	mcl_sounds.node_sound_stone_defaults(),
	{material_stone=1,handy=1,pickaxey=1,cracky=3},
	1,
	false,
	(""),
	"mesecons_button_push")
]]--
--lavacooling


minetest.register_abm({
	label = "Lava cooling (basalt)",
	nodenames = {"group:lava"},
	neighbors = {"mcl_core:ice"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local water = minetest.find_nodes_in_area({x=pos.x-1, y=pos.y-1, z=pos.z-1}, {x=pos.x+1, y=pos.y+1, z=pos.z+1}, "mcl_core:ice")

		local lavatype = minetest.registered_nodes[node.name].liquidtype

		for w=1, #water do
			local waternode = minetest.get_node(water[w])
			local watertype = minetest.registered_nodes[waternode.name].liquidtype
			if water[w].y < pos.y and water[w].x == pos.x and water[w].z == pos.z then
				minetest.set_node(water[w], {name="mcl_blackstone:basalt"})
			elseif lavatype == "flowing" and water[w].y == pos.y and (water[w].x == pos.x or water[w].z == pos.z) then
				minetest.set_node(pos, {name="mcl_blackstone:basalt"})
			elseif lavatype == "flowing" and water[w].y > pos.y and water[w].x == pos.x and water[w].z == pos.z then
				minetest.set_node(pos, {name="mcl_blackstone:basalt"})
			end
		end
	end,
})


minetest.register_abm({
	label = "Lava cooling (blackstone)",
	nodenames = {"group:lava"},
	neighbors = {"mcl_core:packed_ice"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local water = minetest.find_nodes_in_area({x=pos.x-1, y=pos.y-1, z=pos.z-1}, {x=pos.x+1, y=pos.y+1, z=pos.z+1}, "mcl_core:packed_ice")

		local lavatype = minetest.registered_nodes[node.name].liquidtype

		for w=1, #water do
			local waternode = minetest.get_node(water[w])
			local watertype = minetest.registered_nodes[waternode.name].liquidtype
			if water[w].y < pos.y and water[w].x == pos.x and water[w].z == pos.z then
				minetest.set_node(water[w], {name="mcl_blackstone:blackstone"})
			elseif lavatype == "flowing" and water[w].y == pos.y and (water[w].x == pos.x or water[w].z == pos.z) then
				minetest.set_node(pos, {name="mcl_blackstone:blackstone"})
			elseif lavatype == "flowing" and water[w].y > pos.y and water[w].x == pos.x and water[w].z == pos.z then
				minetest.set_node(pos, {name="mcl_blackstone:blackstone"})
			end
		end
	end,
})

--crafting



minetest.register_craft({
	output = 'mcl_blackstone:blackstone_polished 4',
	recipe = {
		{'mcl_blackstone:blackstone','mcl_blackstone:blackstone'},
		{'mcl_blackstone:blackstone','mcl_blackstone:blackstone'},
	}
})

minetest.register_craft({
	output = 'mcl_blackstone:basalt_polished 4',
	recipe = {
		{'mcl_blackstone:basalt','mcl_blackstone:basalt'},
		{'mcl_blackstone:basalt','mcl_blackstone:basalt'},
	}
})

minetest.register_craft({
	output = 'mcl_blackstone:blackstone_chiseled_polished 2',
	recipe = {
		{'mcl_blackstone:blackstone_polished'},
		{'mcl_blackstone:blackstone_polished'},
	}
})
minetest.register_craft({
	output = 'mcl_blackstone:blackstone_brick_polished 4',
	recipe = {
		{'mcl_blackstone:blackstone_polished','mcl_blackstone:blackstone_polished'},
		{'mcl_blackstone:blackstone_polished','mcl_blackstone:blackstone_polished'},
	}
})


minetest.register_craft({
	output = 'mcl_tools:pick_stone',
	recipe = {
		{'mcl_blackstone:blackstone', 'mcl_blackstone:blackstone', 'mcl_blackstone:blackstone'},
		{'', 'mcl_core:stick', ''},
		{'', 'mcl_core:stick', ''},
	}
})


minetest.register_craft({
	output = 'mcl_tools:axe_stone',
	recipe = {
		{'mcl_blackstone:blackstone', 'mcl_blackstone:blackstone'},
		{'mcl_blackstone:blackstone', 'mcl_core:stick'},
		{'', 'mcl_core:stick'},
	}
})


minetest.register_craft({
	output = 'mcl_tools:axe_stone',
	recipe = {
		{'mcl_blackstone:blackstone', 'mcl_blackstone:blackstone'},
		{'mcl_core:stick',  'mcl_blackstone:blackstone'},
		{'', 'mcl_core:stick'},
	}
})


minetest.register_craft({
	output = 'mcl_tools:shovel_stone',
	recipe = {
		{'mcl_blackstone:blackstone'},
		{'mcl_core:stick'},
		{'mcl_core:stick'},
	}
})


minetest.register_craft({
	output = 'mcl_tools:sword_stone',
	recipe = {
		{'mcl_blackstone:blackstone'},
		{'mcl_blackstone:blackstone'},
		{'mcl_core:stick'},
	}
})


minetest.register_craft({
	output = "mcl_farming:hoe_stone",
	recipe = {
		{"mcl_blackstone:blackstone", "mcl_blackstone:blackstone"},
		{"", "mcl_core:stick"},
		{"", "mcl_core:stick"}
	}
})
minetest.register_craft({
	output = "mcl_farming:hoe_stone",
	recipe = {
		{"mcl_blackstone:blackstone", "mcl_blackstone:blackstone"},
		{"mcl_core:stick", ""},
		{"mcl_core:stick", ""}
	}
})

minetest.register_craft({
	output = "mcl_furnaces:furnace",
	recipe = {
		{"mcl_blackstone:blackstone", "mcl_blackstone:blackstone", "mcl_blackstone:blackstone"},
		{"mcl_blackstone:blackstone", "",			   "mcl_blackstone:blackstone"},
		{"mcl_blackstone:blackstone", "mcl_blackstone:blackstone", "mcl_blackstone:blackstone"}
	}
})




minetest.register_craft({
	output = 'mcl_core:packed_ice',
	recipe = {
		{'mcl_core:ice','mcl_core:ice'},
		{'mcl_core:ice','mcl_core:ice'},
	}
})

minetest.register_craft({
	output = 'mcl_blackstone:quartz_brick 4',
	recipe = {
		{'mcl_nether:quartz_block','mcl_nether:quartz_block'},
		{'mcl_nether:quartz_block','mcl_nether:quartz_block'},
	}
})

--Generating


local specialstones = { "mcl_blackstone:blackstone", "mcl_blackstone:basalt" }
for s=1, #specialstones do
	local node = specialstones[s]
	minetest.register_ore({
		ore_type       = "blob",
		ore            = node,
		wherein        = {"mcl_nether:netherrack"},
		clust_scarcity = 8*8*8,
		clust_num_ores = 28,
		clust_size     = 3,
		y_min          = mcl_vars.mg_nether_min,
		y_max          = mcl_vars.mg_nether_max,
	})
	minetest.register_ore({
		ore_type       = "blob",
		ore            = node,
		wherein        = {"mcl_nether:netherrack"},
		clust_scarcity = 8*8*8,
		clust_num_ores = 40,
		clust_size     = 5,
		y_min          = mcl_vars.mg_nether_min,
		y_max          = mcl_vars.mg_nether_max,
	})
end


--This is in progress

--[[
local specialstones = { "mcl_blackstone:blackstone"}
for s=1, #specialstones do
	local node = specialstones[s]
	minetest.register_ore({
		ore_type       = "blob",
		ore            = node,
		wherein        = {"mcl_blackstone:basalt"},
		clust_scarcity = 8*8*8,
		clust_num_ores = 28,
		clust_size     = 3,
		y_min          = mcl_vars.mg_nether_min,
		y_max          = mcl_vars.mg_nether_max,
	})
	minetest.register_ore({
		ore_type       = "blob",
		ore            = node,
		wherein        = {"mcl_blackstone:basalt"},
		clust_scarcity = 8*8*8,
		clust_num_ores = 40,
		clust_size     = 5,
		y_min          = mcl_vars.mg_nether_min,
		y_max          = mcl_vars.mg_nether_max,
	})
end






--Biomes



	minetest.register_biome({
		name = "Basalt_Deltas",
		node_filler = "mcl_blackstone:basalt",
		node_stone = "mcl_blackstone:basalt",
		node_water = "air",
		node_river_water = "air",
		y_min = mcl_vars.mg_nether_min,
		node_riverbed = "mcl_core:lava_source",
		depth_riverbed = 2,
		y_max = mcl_vars.mg_nether_max + 80,
		humidity_point = 36,
		heat_point = 100,
		humidity_point = 0,
		_mcl_biome_type = "hot",
		_mcl_palette_index = 12,
	})



	-- Magma blocks
	minetest.register_ore({
		ore_type       = "blob",
		ore            = "mcl_nether:magma",
		wherein         = {"mcl_blackstone:basalt", "mcl_core:stone"},
		clust_scarcity = 8*8*8,
		clust_num_ores = 45,
		clust_size     = 6,
		y_min          = mcl_worlds.layer_to_y(23, "nether"),
		y_max          = mcl_worlds.layer_to_y(37, "nether"),
	})
	minetest.register_ore({
		ore_type       = "blob",
		ore            = "mcl_nether:magma",
		wherein        = {"mcl_blackstone:basalt"},
		clust_scarcity = 10*10*10,
		clust_num_ores = 65,
		clust_size     = 8,
		y_min          = mcl_worlds.layer_to_y(23, "nether"),
		y_max          = mcl_worlds.layer_to_y(37, "nether"),
	})

	-- Glowstone
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "mcl_nether:glowstone",
		wherein         = {"mcl_blackstone:basalt", "mcl_core:stone"},
		clust_scarcity  = 26 * 26 * 26,
		clust_size      = 5,
		y_min           = mcl_vars.mg_lava_nether_max + 10,
		y_max           = mcl_vars.mg_nether_max,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.1,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Gravel (Nether)
	minetest.register_ore({
		ore_type        = "sheet",
		ore             = "mcl_core:gravel",
		wherein         = {"mcl_blackstone:basalt", "mcl_core:stone"},
		column_height_min = 1,
		column_height_max = 1,
		column_midpoint_factor = 0,
		y_min           = mcl_worlds.layer_to_y(63, "nether"),
		-- This should be 65, but for some reason with this setting, the sheet ore really stops at 65. o_O
		y_max           = mcl_worlds.layer_to_y(65+2, "nether"),
		noise_threshold = 0.2,
		noise_params    = {
			offset = 0.0,
			scale = 0.5,
			spread = {x = 20, y = 20, z = 20},
			seed = 766,
			octaves = 3,
			persist = 0.6,
		},
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_nether:nether_lava_source",
		wherein         = {"mcl_blackstone:basalt", "mcl_core:stone"},
		clust_scarcity = 500,
		clust_num_ores = 1,
		clust_size     = 1,
		y_min           = mcl_vars.mg_nether_min,
		y_max           = mcl_vars.mg_lava_nether_max + 1,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_nether:nether_lava_source",
		wherein         = {"mcl_blackstone:basalt", "mcl_core:stone"},
		clust_scarcity = 1000,
		clust_num_ores = 1,
		clust_size     = 1,
		y_min           = mcl_vars.mg_lava_nether_max + 2,
		y_max           = mcl_vars.mg_lava_nether_max + 12,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_nether:nether_lava_source",
		wherein         = {"mcl_blackstone:basalt", "mcl_core:stone"},
		clust_scarcity = 2000,
		clust_num_ores = 1,
		clust_size     = 1,
		y_min           = mcl_vars.mg_lava_nether_max + 13,
		y_max           = mcl_vars.mg_lava_nether_max + 48,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_nether:nether_lava_source",
		wherein         = {"mcl_blackstone:basalt", "mcl_core:stone"},
		clust_scarcity = 3500,
		clust_num_ores = 1,
		clust_size     = 1,
		y_min           = mcl_vars.mg_lava_nether_max + 49,
		y_max           = mcl_vars.mg_nether_max,
	})


local specialstones = { "mcl_nether:netherrack"}
for s=1, #specialstones do
	local node = specialstones[s]
	minetest.register_ore({
		ore_type       = "blob",
		ore            = node,
		wherein        = {"mcl_blackstone:basalt"},
		clust_scarcity = 8*8*8,
		clust_num_ores = 28,
		clust_size     = 3,
		y_min          = mcl_vars.mg_nether_min,
		y_max          = mcl_vars.mg_nether_max,
	})
	minetest.register_ore({
		ore_type       = "blob",
		ore            = node,
		wherein        = {"mcl_blackstone:basalt"},
		clust_scarcity = 8*8*8,
		clust_num_ores = 40,
		clust_size     = 5,
		y_min          = mcl_vars.mg_nether_min,
		y_max          = mcl_vars.mg_nether_max,
	})
end

]]--

