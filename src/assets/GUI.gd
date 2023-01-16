extends CanvasLayer

var action_a_state = "Off"
var tile
var tile_id

var object_type
var tree_loot_node
var rock_loot_node
var loot_node

var path

var granite = true
var logs = false

var spade = false


var river_loot_area 

var x
var y


var tree_stage = 0
var rock_stage = 0
var river_stage = 0

var river_cell_ip

var tree_break1 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Breaking_1.png")
var tree_break2 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Breaking_2.png")
var tree_break3 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Breaking_3.png")
var tree_break4 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Broken.png")
var tree_break5 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Logs.png")
var tree_break6 = preload("res://Modeling/results/PIctures/PNGs/Grass.png")
var tree_images = [tree_break1, tree_break2, tree_break3, tree_break4, tree_break5, tree_break6]

var rock_break1 = preload("res://Modeling/results/PIctures/PNGs/Rock1_Breaking.png")
var rock_break2 = preload("res://Modeling/results/PIctures/PNGs/Rock1_Broken.png")
var rock_break3 = preload("res://Modeling/results/PIctures/PNGs/Rock1_Granit.png")
var rock_break4 = preload("res://Modeling/results/PIctures/PNGs/Grass.png")
var rock_images = [rock_break1, rock_break2, rock_break3, rock_break4]

var river_area = preload("res://src/assets/RiverLootArea.tscn")

onready var mapscene_GUI = get_node("../GUI")

func _process(delta):
	if Input.is_action_just_pressed("Action_a"):
		#print("action f")
		match action_a_state:
			"Off":
				print("Nothing to do")
				pass
			"Loot":
				match object_type:
					"Tree":
						tree_loot_node = loot_node
						if tree_stage <= 4:
							
							var sprite_node = tree_loot_node.get_parent().get_node("Sprite2")
							print(tree_loot_node)
							#var n = get_node(path)
							sprite_node.set_texture(tree_images[tree_stage])
							tree_stage += 1
						elif tree_stage == 5:
							var sprite_node = tree_loot_node.get_parent().get_node("Sprite2")
							tree_loot_node.get_parent().get_node("TreeCol").queue_free()
							sprite_node.queue_free()
							tree_loot_node.queue_free()
							
							print(tree_loot_node)
							#var n = get_node(path)

							tree_stage = 6
							logs = true
					"Rock":
						rock_loot_node = loot_node
						if rock_stage <= 2:
							var sprite_node = rock_loot_node.get_parent().get_node("RockSprite")
							#print(rock_loot_node)
							#var n = get_node(path)
							sprite_node.set_texture(rock_images[rock_stage])
							rock_stage += 1
						elif rock_stage == 3:
							var sprite_node = rock_loot_node.get_parent().get_node("RockSprite")
							loot_node.get_parent().get_node("RockCol").queue_free()
							sprite_node.queue_free()
							
							rock_loot_node.queue_free()
							rock_stage = 4
							granite = true
							#print(rock_loot_node)
					"River":
						print("river stage: ", river_stage)
						if not spade:
							print("You need a spade to dig!!")
							
						if spade and river_stage <= 5:

							#if get_node("../Base_ground").get_cell(x,y) == 10 or 9:
							get_node("../Base_ground").update_river(x, y, river_stage)
							river_stage += 1
							#loot_area_instance.tile_region = get_cell_autotile_coord(tile[0], tile[1])
						if river_stage == 6:	
							print("river stage: ", river_stage)
							get_node(str(river_loot_area.get_path()) + "/RiverCo").set_deferred("disabled", true)
							print("Disabled loot area: ",river_loot_area)
							river_stage = 7
							spade = false
					"Boat":
						print("WE are pressing on boat")
						if logs and granite: 
							spade = true
							logs = false
							granite = false
							print("You now have a spade")
						if logs: 
							print("Keeping logs in the boat")
						if granite: 
							print("Keeping granite in the boat")
							
				pass
	
func OnRiverLootAreaEnter(body, tile, loot_area):
	#print("Entering river on tile: ", tile)
	#print("Entering area: ",loot_area)
	
	action_a_state = "Loot"
	object_type = "River"
	print("river stage: ", river_stage)
	#x = tile[0]
	#y = tile[1] - 1
	if river_stage == 0 :
		print("River stage zero!")
		#river_cell_ip = Vector2(x,y)
		x = tile[0]
		y = tile[1] -1
		river_loot_area = loot_area
	if river_stage == 7:
		print("restart river")
		river_stage = 0
			



func OnRiverLootAreaExit(body, loot_area):
	if "River" in str(loot_area):	
		action_a_state = "Off"
	
func OnLootEnter(body, n, type):
	#print("On general enter: ", type)
	object_type = type
	loot_node = n
	action_a_state = "Loot"
	if tree_stage == 6:
		print("restart tree")
		tree_stage = 0
		
	if rock_stage == 4:
		print("restart rock")
		rock_stage = 0
	
	
		
func OnLootExit():
	action_a_state = "Off"
