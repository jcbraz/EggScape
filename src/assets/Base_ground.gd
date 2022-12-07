extends TileMap

var height = 60;
var width = 20;

func _ready():
	make_grass();
	# make_dirt():


func make_grass():
	for x in width: 
		for y in height: 
			set_cell(-x,-y,2)
