extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var width = 60
var heigth = 20 
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	print(self)
	var xt = rng.randf_range(-width, 0)
	var yt = rng.randf_range(-heigth, 0)
	print(self.position)
	self.position = Vector2(xt*148, yt*256)
	print(self.position)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
