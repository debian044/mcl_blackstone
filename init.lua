local S = minetest.get_translator("mcl_blackstone")

stairs = {}

mesecons_button = {}


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
	description = S("Chieseled Polished Blackstone"),
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

--slabs/stairs

mcl_stairs.register_slab("blackstone", "mcl_blackstone:blackstone",
		{pickaxey=2},
		{"mcl_blackstone.png"},
		S("Blackstone Slab"),
		nil, nil, nil,
		S("Double Blackstone Slab"))
mcl_stairs.register_stair("blackstone", "mcl_blackstone:blackstone",
		{pickaxey=2},
		{"mcl_blackstone.png"},
		S("Blackstone Stairs"),
		nil, 6, nil,
		"woodlike")

mcl_stairs.register_slab("blackstone_polished", "mcl_blackstone:blackstone_polished",
		{pickaxey=2},
		{"mcl_blackstone_polished.png"},
		S("Polished Blackstone Slab"),
		nil, nil, nil,
		S("Double Polished Blackstone Slab"))
mcl_stairs.register_stair("blackstone_polished", "mcl_blackstone:blackstone_polished",
		{pickaxey=2},
		{"mcl_blackstone_polished.png"},
		S("Polished Blackstone Stairs"),
		nil, 6, nil,
		"woodlike")


mcl_stairs.register_slab("blackstone_brick_polished", "mcl_blackstone:blackstone_brick_polished",
		{pickaxey=2},
		{"mcl_blackstone_polished_bricks.png"},
		S("Polished Blackstone Brick Slab"),
		nil, nil, nil,
		S("Double Polished Blackstone Brick Slab"))
mcl_stairs.register_stair("blackstone_brick_polished", "mcl_blackstone:blackstone",
		{pickaxey=2},
		{"mcl_blackstone_polished_bricks.png"},
		S("Polished Blackstone Brick Stairs"),
		nil, 6, nil,
		"woodlike")






--Wall

mcl_walls.register_wall("mcl_blackstone:wall", S("Blackstone Wall"), "mcl_blackstone:blackstone")





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

