extends CanvasLayer

signal granite_changed(nr_granite)
signal logs_changed(nr_logs)
var nr_spade = Global.nr_spade
signal spade_changed(nr_spade)

var action_a_state = "Off"
var tile
var tile_id

var tree_loot_node
var rock_loot_node
var loot_node

var path

var nr_granite = 0
var nr_logs = 0


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
				match Global.object_type:
					"Tree":
						if Global.holding:
							print("Your hands are full, go load of in the boat")
						else:
						#tree_loot_node = loot_node
							if tree_stage <= 4:
								
								var sprite_node = loot_node.get_parent().get_node("Sprite2")
								print(loot_node)
								#var n = get_node(path)
								sprite_node.set_texture(tree_images[tree_stage])
								tree_stage += 1
							elif tree_stage == 5:
								var sprite_node = loot_node.get_parent().get_node("Sprite2")
								loot_node.get_parent().get_node("TreeCol").queue_free()
								sprite_node.queue_free()
								loot_node.queue_free()
								
								print(loot_node)
								#var n = get_node(path)

								tree_stage = 6
								nr_logs += 1
								emit_signal("logs_changed", nr_logs)
								Global.activate_animation = true
								Global.holding = true
					"Rock":
						if Global.holding:
							print("Your hands are full, go load of in the boat")
							
						else:
							if rock_stage <= 2:
								var sprite_node = loot_node.get_parent().get_node("RockSprite")
								#print(rock_loot_node)
								#var n = get_node(path)
								sprite_node.set_texture(rock_images[rock_stage])
								rock_stage += 1
							elif rock_stage == 3:
								var sprite_node = loot_node.get_parent().get_node("RockSprite")
								loot_node.get_parent().get_node("RockCol").queue_free()
								sprite_node.queue_free()
								
								loot_node.queue_free()
								rock_stage = 4
								nr_granite += 1
								emit_signal("granite_changed", nr_granite)
								Global.activate_animation = true
								Global.holding = true
					"River":
						print("river stage: ", river_stage)
						if not nr_spade:
							print("You need a spade to dig!!")
							
						if nr_spade and river_stage <= 5:

							#if get_node("../Base_ground").get_cell(x,y) == 10 or 9:
							get_node("../Base_ground").update_river(x, y, river_stage)
							river_stage += 1
							#loot_area_instance.tile_region = get_cell_autotile_coord(tile[0], tile[1])
						if river_stage == 6:	
							print("river stage: ", river_stage)
							#get_node(str(river_loot_area.get_path()) + "/RiverCo").set_deferred("disabled", true)
							get_node(str(river_loot_area.get_path()) + "/RiverCo").queue_free()
							print("Disabled loot area: ",river_loot_area)
							river_stage = 0
							nr_spade -= 1
							Global.nr_spade = nr_spade
							emit_signal("spade_changed", nr_spade)
							print("OFF AND RESTART")
							action_a_state = "Off"
					"Boat":
						print("WE are pressing on boat")
						
						if nr_logs > 0 and nr_granite > 0: 
							nr_logs -= 1
							emit_signal("logs_changed", nr_logs)
							nr_granite -= 1
							emit_signal("granite_changed", nr_granite)
							nr_spade += 2
							Global.nr_spade = nr_spade
							emit_signal("spade_changed", nr_spade)
							print("You now have spade: ", nr_spade)
							print("Nr of logs left: ", nr_logs)
							print("Nr of granite left: ", nr_granite)

						Global.holding = false
						Global.activate_animation = false
						print("Your hands are free")		
				pass
	

func _send(): #will send the updated Nr of granite, logs and spades tot he interface to update the counter
	emit_signal("granite_changed", nr_granite)
	emit_signal("logs_changed", nr_logs)
	emit_signal("spade_changed", nr_spade)

func OnRiverLootAreaEnter(body, tile, loot_areai):

	if "boat" in str(body):
		print("Boat is close to edge")
		get_node("../Base_ground/YSorting/boat").boat_crashing()
	else:
		print(body)
		action_a_state = "Loot"
		Global.object_type = "River"
		print("river stage: ", river_stage)

		if river_stage == 0 :
			print("River stage zero!")
			#river_cell_ip = Vector2(x,y)
			x = tile[0]
			y = tile[1] -1
			river_loot_area = loot_areai

func OnRiverLootAreaExit(body, loot_area):
	if "River" in str(loot_area):	
		action_a_state = "Off"
	
func OnLootEnter(body, n, type):
	#print("On general enter: ", type)
	if "player" in str(body):
		Global.object_type = type
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
