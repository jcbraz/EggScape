extends KinematicBody2D


var speed = 250
var velocity = Vector2()

onready var mapscene_GUI = get_node("../GUI")


func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is StaticBody2D:
			print("Collided with static body")



