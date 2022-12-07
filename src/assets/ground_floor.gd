extends TileMap

var width = 2;
var height = 10;

func _ready():
	make_grass();
	# make_dirt():


func make_grass():
	for x in width: 
		for y in height: 
			set_cell(x,y,2)
