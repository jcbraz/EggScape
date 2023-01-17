extends StaticBody2D
onready var mapscene_GUI = get_node("../../../../GUI")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var width = 20
var heigth = 60 
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	#rng.randomize()
	#print(self)
	#var xt = rng.randf_range(-width, 0)
	#var yt = rng.randf_range(-heigth, 0)
	#self.position += Vector2(xt*146, yt*256)



	

	pass

#x: 256, y: 146
# TODO: Find a way to place the rocks on one exact tile. Do the same for river and trees. 
# Da er resten plankekjøring
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
