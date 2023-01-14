extends CanvasLayer

var action_a_state = "Off"
var tile
var tile_id

var object_type
var tree_loot_node
var rock_loot_node
var path

var tree_stage = 0
var rock_stage = 0

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


func _process(delta):
	if Input.is_action_just_pressed("Action_a"):
		print("action f")
		match action_a_state:
			"Off":
				print("Nothing to do")
				pass
			"Loot":
				match object_type:
					"tree":
						if tree_stage <= 4:
							var sprite_node = tree_loot_node.get_parent().get_node("Sprite2")
							print(tree_loot_node)
							#var n = get_node(path)
							sprite_node.set_texture(tree_images[tree_stage])
							tree_stage += 1
						elif tree_stage == 5:
							var sprite_node = tree_loot_node.get_parent().get_node("Sprite2")
							sprite_node.queue_free()
							
							tree_loot_node.queue_free()
							
							print(tree_loot_node)
							#var n = get_node(path)

							tree_stage = 6
					"rock":
						if rock_stage <= 2:
							var sprite_node = rock_loot_node.get_parent().get_node("RockSprite")
							print(rock_loot_node)
							#var n = get_node(path)
							sprite_node.set_texture(rock_images[rock_stage])
							rock_stage += 1
						elif rock_stage == 3:
							var sprite_node = rock_loot_node.get_parent().get_node("RockSprite")
							sprite_node.queue_free()
							
							rock_loot_node.queue_free()
							rock_stage = 4
							
							print(rock_loot_node)

				#get_node("../Destructables").set_cell(tile[0], tile[1], tile_id, false, false, false, Vector2(0,0))
				pass


func OnLootTreeEnter(node_in, n):
	print("looting")
	tree_loot_node = n
	print(n)
	object_type = "tree"
	action_a_state = "Loot"
	if tree_stage == 6:
		print("restart tree")
		tree_stage = 0
	
	
func OnLootTreeESxit(body):
	action_a_state = "Off"
	print("leaving")
	
	
func OnLootRockEnter(node_in, n):
	print("looting")
	rock_loot_node = n
	print(n)
	object_type = "rock"
	action_a_state = "Loot"
	if rock_stage == 4:
		print("restart rock")
		rock_stage = 0
	
	
func OnLootRockESxit(body):
	action_a_state = "Off"
	print("leaving")
