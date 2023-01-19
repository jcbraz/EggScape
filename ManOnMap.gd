extends KinematicBody2D


var speed = 500
var velocity = Vector2()
var has_axe = false
var has_shovel = false
var has_logs = false
var has_picaxe = false
var has_ore = false

onready var _animated_sprite = $AnimatedSprite

func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 5
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 5
	if Input.is_action_pressed('ui_down'):
		velocity.y += 5
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 5
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	return move_and_collide(velocity * delta)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is StaticBody2D:
			print("Collided with static body")

func  _process(delta):
	if Global.activate_animation:
		if Global.object_type == "Tree":
			if Input.is_action_pressed('ui_right'):
				_animated_sprite.play("logs_right_up")
			if Input.is_action_pressed('ui_left'):
				_animated_sprite.play("logs_left_down")
			if Input.is_action_pressed('ui_down'):
				_animated_sprite.play("logs_right_down")
			if Input.is_action_pressed('ui_up'):
				_animated_sprite.play("logs_left_up")
		elif Global.object_type == "Rock":
			if Input.is_action_pressed('ui_right'):
				_animated_sprite.play("ore_right_up")
			if Input.is_action_pressed('ui_left'):
				_animated_sprite.play("ore_left_down")
			if Input.is_action_pressed('ui_down'):
				_animated_sprite.play("ore_right_down")
			if Input.is_action_pressed('ui_up'):
				_animated_sprite.play("ore_left_up")
	elif !Global.activate_animation:
		if Global.nr_spade > 0:
			if Input.is_action_pressed('ui_right'):
				_animated_sprite.play("shovel_right_up")
			if Input.is_action_pressed('ui_left'):
				_animated_sprite.play("shovel_left_down")
			if Input.is_action_pressed('ui_down'):
				_animated_sprite.play("shovel_right_down")
			if Input.is_action_pressed('ui_up'):
				_animated_sprite.play("shovel_left_up")
		else:
			if Input.is_action_pressed('ui_right'):
				_animated_sprite.play("walk_right_up")
			if Input.is_action_pressed('ui_left'):
				_animated_sprite.play("walk_left_down")
			if Input.is_action_pressed('ui_down'):
				_animated_sprite.play("walk_right_down")
			if Input.is_action_pressed('ui_up'):
				_animated_sprite.play("walk_left_up")
			
	

