extends TileMap

onready var mapscene_GUI = get_node("../GUI")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var loot_area = preload("res://src/assets/RiverLootArea.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	init_river()
	var id = 19
	var river_tile = get_used_cells_by_id(8)
	#print(used_chest_tile)
	#print(map_to_world(used_chest_tile[0]))
	#print(get_cell_autotile_coord(used_chest_tile[0][0], used_chest_tile[0][1]))
	for tile in river_tile:
		#if get_cell_autotile_coord(tile[0], tile[1] == Vector2(0,0) or get_cell_autotile_coord(tile[0],tile[1]) == Vector2(2,0)):
		var loot_area_instance = loot_area.instance()
		loot_area_instance.position = map_to_world(tile)
		
		loot_area_instance.tile = tile
		loot_area_instance.tile_id = id
		
		add_child(loot_area_instance)
	for area in get_tree().get_nodes_in_group("LootAreas"):
		area.connect("body_entered", mapscene_GUI, "OnRiverLootAreaEnter", [area.tile, area.tile_id])
		area.connect("body_exited", mapscene_GUI, "OnRiverLootAreaExit")
# Probably dont need if, just always vector (0,0) for closed chest

func init_river():
		set_cell(-10,0,8)
		set_cell(-9,0,8)
		set_cell(-10,-1,8)
		set_cell(-9,-1,8)
		set_cell(-10,-2,8)
		set_cell(-9,-2,8)
