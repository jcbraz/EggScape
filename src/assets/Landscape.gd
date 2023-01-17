extends Node2D

onready var camera = $Camera2D
onready var player = $Base_ground/YSorting/player
onready var boat = $Base_ground/YSorting/boat
var offset = Vector2(-200, -1000)

func _ready():
	pass
	
func _process(delta):

	camera.set_position(boat.get_position() + offset)

#x: 256, y: 146
