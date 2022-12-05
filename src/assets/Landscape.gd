extends Node2D

onready var camera = $Camera2D
onready var player = $player

func _ready():
	pass
	
func _process(delta):
	camera.set_position(player.get_position())
