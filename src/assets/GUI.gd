extends CanvasLayer

var action_a_state = "Off"
var tile
var tile_id

var object_type
var tree_loot_node
var path

var tree_stage = 0

var tree_break1 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Breaking_1.png")
var tree_break2 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Breaking_2.png")
var tree_break3 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Breaking_3.png")
var tree_break4 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Broken.png")
var tree_break5 = preload("res://Modeling/results/PIctures/PNGs/Tree1_Logs.png")
var tree_break6 = preload("res://Modeling/results/PIctures/PNGs/Grass.png")

var tree_images = [tree_break1, tree_break2, tree_break3, tree_break4, tree_break5, tree_break6]

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
						else:
							var sprite_node = tree_loot_node.get_parent().get_node("Sprite2")
							sprite_node.set_texture(tree_images[5])
							tree_loot_node.queue_free()
							
							print(tree_loot_node)
							#var n = get_node(path)
							
							print("restart tree")
							tree_stage = 0
					"rock":
						print("Opening the chest")
				#get_node("../Destructables").set_cell(tile[0], tile[1], tile_id, false, false, false, Vector2(0,0))
				pass


func OnLootTreeEnter(node_in, n):
	print("looting")
	tree_loot_node = n
	print(n)
	object_type = "tree"
	action_a_state = "Loot"

	
func OnLootTreeESxit(body):
	action_a_state = "Off"
	print("leaving")
