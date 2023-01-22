extends KinematicBody2D
#---------------------------------------------------------------
#These vaiables are for the calculation and transmition of the distance of the boat
var distance = 0
var position_now = Vector2(0, 0)
var startposition = Vector2(0, 0)
var frame = 1;

signal distance_changed(distance)
#---------------------------------------------------------------
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
	
	#---------------------------------------------------------------
	#these part calculates the distance the boat made so far
	#print("frame:  ", frame)
	if frame < 2:
		startposition = get_global_position()
		frame += 1
		
	position_now = get_global_position()
	var entfernt = int((position-startposition).length()/100)
	if distance != entfernt:
		distance = entfernt
		Global.distance_boat = distance
		#print("distance so far: ", distance)
		emit_signal("distance_changed", distance)
	#---------------------------------------------------------------
	# if distance is multople of 5, increase the velocity by 20%
	if distance % 10 == 0:
		velocity = velocity * 1.0008

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
	get_tree().change_scene("res://src/assets/GameOver.tscn")



	

