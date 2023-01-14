extends TileMap

var height = 60;
var width = 20;

var nr_dirt = 200
var nr_trees = 40
var nr_rocks = 20

var rng = RandomNumberGenerator.new()


func _ready():
	randomize()
	make_grass();
	make_dirt();
	init_river();
	make_trees();
	make_rocks();


func make_grass():
	for x in width: 
		for y in height: 
			set_cell(-x,-y,2)
	print("mtw")		
	print(map_to_world(Vector2(60,20)))


func make_dirt():
	for d in nr_dirt: 
		rng.randomize()
		var x = rng.randf_range(-width, 0)
		var y = rng.randf_range(-height, 0)
		set_cell(x,y,1)


func init_river():
		set_cell(-10,0,0)
		set_cell(-9,0,0)
		set_cell(-10,-1,0)
		set_cell(-9,-1,0)
		set_cell(-10,-2,0)
		set_cell(-9,-2,0)


func make_trees():
	for t in range(nr_trees): 
		var name = "tree_scene" + str(t)
		name = preload("res://src/assets/item_screens/Tree.tscn")
		$YSorting.add_child(name.instance(), true)
		

func make_rocks():
	for t in range(nr_rocks): 
		var name = "rock_scene" + str(t)
		name = preload("res://src/assets/item_screens/Rock.tscn")
		$YSorting.add_child(name.instance(), true)
	
