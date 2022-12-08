extends Node2D

onready var camera = $Camera2D
onready var player = $Base_ground/YSorting/player


func _ready():
	pass
	
func _process(delta):
	camera.set_position(player.get_position())
