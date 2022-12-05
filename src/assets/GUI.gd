extends CanvasLayer

var action_a_state = "Off"
var tile
var tile_id

func _process(delta):
	if Input.is_action_just_pressed("Action_a"):
		print("action aa")
		match action_a_state:
			"Off":
				print("Nothing to do")
				pass
			"Loot":
				print("Opening the chest")
				get_node("../Interactables").set_cell(tile[0], tile[1], 20, false, false, false, Vector2(0,0))
				
				pass
	

func OnLootAreaEnter(body, tile_import, tile_id_import):
	tile = tile_import
	tile_id = tile_id_import
	action_a_state = "Loot"
	print("looting")
	
func OnLootAreaExit(body):
	action_a_state = "Off"
	print("leaving")
