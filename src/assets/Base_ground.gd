extends TileMap

var height = 60;
var width = 20;

var nr_dirt = 200
var nr_trees = 40

var rng = RandomNumberGenerator.new()
#var tree_scene = preload("res://src/assets/item_screens/Tree.tscn")

func _ready():
	randomize()
	make_grass();
	make_dirt();
	make_trees();


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
	
	
	
func make_trees():

	for t in range(nr_trees): 
		rng.randomize()
		var name = "tree_scene" + str(t)
		name = preload("res://src/assets/item_screens/Tree.tscn")
		#print(name.instance())
		var xt = rng.randf_range(-width, 0)
		var yt = rng.randf_range(-height, 0)

		$YSorting.add_child(name.instance(), true)
		
		#print(name.instance().position)


	
