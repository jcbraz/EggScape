extends KinematicBody2D


var velocity = Vector2(5, -3)
var direction = Vector2(45, 45)
#onready var mapscene_GUI = get_node("../../../GUI")
var count = 0
var boat_nr = 0
	
var boat1 = preload("res://Modeling/results/PIctures/PNGs/Boat1.png")
var boat2 = preload("res://Modeling/results/PIctures/PNGs/Boat2.png")
var boat3 = preload("res://Modeling/results/PIctures/PNGs/Boat3.png")
var boat4 = preload("res://Modeling/results/PIctures/PNGs/Boat4.png")
var boat5 = preload("res://Modeling/results/PIctures/PNGs/Boat5.png")
var boat6 = preload("res://Modeling/results/PIctures/PNGs/Boat6.png")
var boat7 = preload("res://Modeling/results/PIctures/PNGs/Boat7.png")
var boat8 = preload("res://Modeling/results/PIctures/PNGs/Boat8.png")
#onready var sprite_node = get_node("Sprite")
var boat_images = [boat1, boat2, boat3, boat4, boat5, boat6, boat7, boat8]

func _physics_process(delta):
	count += 1
	#velocity = Vector2(10, -6)
	move_and_collide(velocity * delta)
	if count > 20:

		count = 0
		if boat_nr != 7:
			boat_nr += 1
		else: 
			boat_nr = 0
		var sprite_node = get_node("Sprite")
		sprite_node.set_texture(boat_images[boat_nr])
		
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is StaticBody2D:
			print("Collided with static body")
	
func boat_crashing():
	print("Boat is crashing!")
	velocity = Vector2(0,0)

func _ready():
	$Timer.start(5)

# increase the speed of the boat every 10 seconds
func _on_Timer_timeout():
	velocity = Vector2(velocity.x + 1000, velocity.y)
	$Timer.start(5)


	

