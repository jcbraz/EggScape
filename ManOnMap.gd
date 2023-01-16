extends KinematicBody2D


var speed = 500
var velocity = Vector2()
var is_moving = false;

onready var mapscene_GUI = get_node("../../../GUI")
onready var animation_play = get_node("AnimationPlayer")

func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_just_pressed('ui_right'):
		velocity.x += 5
		animation_play.play("walk_right")
	if Input.is_action_just_pressed('ui_left'):
		velocity.x -= 5
		animation_play.play("walk_left_down")
	if Input.is_action_just_pressed('ui_down'):
		velocity.y += 5
		animation_play.play("walk_right_up")
	if Input.is_action_just_pressed('ui_up'):
		velocity.y -= 5
		animation_play.play(("walk_left_up"))
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
	
	if velocity.length() > 0:
		is_moving = true
	else:
		is_moving = false
		
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is StaticBody2D:
			print("Collided with static body")

	

