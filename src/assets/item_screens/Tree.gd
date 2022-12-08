extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var width = 20
var heigth = 60 
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	print(self)
	var xt = rng.randf_range(-width*256, 0)
	var yt = rng.randf_range(-heigth*148, 0)

	self.position += Vector2(xt, yt)

	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
