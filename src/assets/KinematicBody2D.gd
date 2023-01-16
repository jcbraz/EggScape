extends KinematicBody2D


var speed = 50
var velocity = Vector2()
var direction = Vector2(45, 45)
onready var mapscene_GUI = get_node("../../../GUI")
var count = 0
#onready var sprite_node = get_node("Sprite")


func _physics_process(delta):
	count += 1
	velocity = Vector2(10, -6)
	move_and_collide(velocity * delta)
	if count > 100:
		print("Count reached")
		count = 0
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is StaticBody2D:
			print("Collided with static body")
	



