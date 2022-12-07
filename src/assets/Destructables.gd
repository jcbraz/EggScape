extends TileMap

onready var mapscene_GUI = get_node("../GUI")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var loot_area = preload("res://src/assets/LootAreas/TreeLootArea.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var id = 4
	var full_tree = get_used_cells_by_id(id)

	for tile in full_tree:
		#var loot_area_instance = loot_area.instance()
		#loot_area_instance.position = map_to_world(tile)
		print(tile)
		#loot_area_instance.tile = tile
		#loot_area_instance.tile_id = id
		
		#add_child(loot_area_instance)
		
	#for area in get_tree().get_nodes_in_group("LootAreas"):
		#area.connect("body_entered", mapscene_GUI, "OnLootAreaEnter", [area.tile, area.tile_id])
		#area.connect("body_exited", mapscene_GUI, "OnLootAreaExit")
# Probably dont need if, just always vector (0,0) for closed chest
