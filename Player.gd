extends KinematicBody

export var speed := 7.0
export var jump_strength := 20.0
export var gravity := 50.0

var _velocity := Vector3.ZERO
var _snap_vector := Vector3.DOWN

func _physics_process(delta: float) -> void:
		var moving_direction := Vector3.ZERO
		moving_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		moving_direction.z = Input.get_action_strength("back") - Input.get_action_strength("foward")
		
		_velocity.x = moving_direction.x * speed
		_velocity.z = moving_direction.z * speed
		_velocity.y -= gravity * delta
		
		var has_landed := is_on_floor() and _snap_vector == Vector3.ZERO
		var is_jumping := is_on_floor() and Input.is_action_just_pressed("jump")
		
		if is_jumping:
			_velocity.y = jump_strength
			_snap_vector = Vector3.ZERO
		elif has_landed:
			_snap_vector = Vector3.DOWN
		_velocity = move_and_slide_with_snap(_velocity, _snap_vector, Vector3.UP, true)

# this is a test
# to teach github commands		
	
	
