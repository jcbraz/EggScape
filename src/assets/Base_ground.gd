extends TileMap

var height = 200;
var width = 20;

var nr_dirt = 600
var nr_trees = 10

var nr_rocks = 20

var grass_id = 10
var dirt_id = 9
var river_id = 4

var rng = RandomNumberGenerator.new()

var river_stages = [0, 1, 2, 3, 6, 4, 8]

onready var mapscene_GUI = get_node("../GUI")

var loot_area = preload("res://src/assets/RiverLootArea.tscn")


func _ready():
	make_dirt();
	init_river();


func make_dirt():
	for d in nr_dirt: 
		rng.randomize()
		var x = rng.randf_range(-width, 0)
		var y = rng.randf_range(-height, 0)
		set_cell(x,y,dirt_id)

func init_river():

	set_cell(-10,0,river_id)
	set_cell(-9,0,river_id)
	set_cell(-10,-1,river_id)
	set_cell(-9,-1,river_id)
	set_cell(-10,-2,river_id)
	set_cell(-9,-2,river_id)
	var v = [-9, -10]
	for i in v:
		set_cell(i,-3,river_id)

		var tile_cell = Vector2(i, -3)
		var loot_area_instance = loot_area.instance()
		loot_area_instance.position = map_to_world(tile_cell)
		
		add_child(loot_area_instance)

		loot_area_instance.connect("body_entered", mapscene_GUI, "OnRiverLootAreaEnter", [Vector2(i, -3), loot_area_instance])
		loot_area_instance.connect("body_exited", mapscene_GUI, "OnRiverLootAreaExit", [loot_area_instance])
		
"""func make_trees():
	for t in range(nr_trees): 
		var name = "tree_scene" + str(t)
		name = preload("res://src/assets/item_screens/Tree.tscn")

		$YSorting.add_child(name.instance(), true)	
		
func make_rocks():
	for r in range(nr_rocks): 
		var name = "rock_scene" + str(r)
		name = preload("res://src/assets/item_screens/Rock.tscn")
		$YSorting.add_child(name.instance(), true)
"""	
	
"""func river():
	var river_tile = get_used_cells_by_id(0)
	var id = 0
	var offset = Vector2(20,20)
	for tile in river_tile:
		#if get_cell_autotile_coord(tile[0], tile[1] == Vector2(0,0) or get_cell_autotile_coord(tile[0],tile[1]) == Vector2(2,0)):
		var loot_area_instance = loot_area.instance()
		loot_area_instance.position = map_to_world(tile)
		
		loot_area_instance.tile = tile
		loot_area_instance.tile_id = id
		
		#loot_area_instance.tile_region = get_cell_autotile_coord(tile[0], tile[1])

		add_child(loot_area_instance)
		#print("Child count: ",get_child_count())
	for area in get_tree().get_nodes_in_group("LootAreas"):
		area.connect("body_entered", mapscene_GUI, "OnRiverLootAreaEnter", [area.tile])
		area.connect("body_exited", mapscene_GUI, "OnRiverLootAreaExit")"""

func update_river(x, y, river_stage):
	print("update x: ", x)
	print("update y: ", y)
	set_cell(x, y, river_stages[river_stage], false, false, false, Vector2(0,0))

	if river_stage == 5:
		var loot_area_instance = loot_area.instance()
		loot_area_instance.position = map_to_world(Vector2(x,y))
		add_child(loot_area_instance)
		
		loot_area_instance.connect("body_entered", mapscene_GUI, "OnRiverLootAreaEnter", [Vector2(x,y), loot_area_instance])
		loot_area_instance.connect("body_exited", mapscene_GUI, "OnRiverLootAreaExit", [loot_area_instance])
	
func _process(delta):

	pass
