extends StaticBody2D

onready var mapscene_GUI = get_node("../../../../GUI")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var width = 20
var heigth = 60 
var rng = RandomNumberGenerator.new()

var level = 1
var i = 0
var x_positions = [-500, 0, 30, 600, 400, 700, 70, 800, 1000, 1300]
var y_positions = [-200, -600, 0, -400, -700, -20, 100, -350, -800]
# Called when the node enters the scene tree for the first time.
func _ready():

	rng.randomize()
	print(self)
	var xt = rng.randf_range(-width, 0)
	var yt = rng.randf_range(-heigth, 0)
	self.position += Vector2(x_positions[i], y_positions[i])
	if i < 10:
		i += 1
	else:
		i = 0
	pass





# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
