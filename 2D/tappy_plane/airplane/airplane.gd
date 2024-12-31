class_name Airplane extends CharacterBody2D

# The airplane gravity.
@export var airplane_gravity := 20
# The airplane vertical tap force when left mouse button is pressed.
@export var tap_force := 800

# Handles airplane movement.
func _physics_process(delta: float) -> void:
	# Sets the airplane gravity.
	velocity.y += airplane_gravity
	
	# Sets the vertical tap force when left mouse button is pressed.
	if Input.is_action_just_pressed("click"):
		velocity.y -= tap_force
	
	# Clamps the vertical tap force to a maximum and minimum.
	velocity.y = clamp(velocity.y, -tap_force, tap_force)
	
	# Sets the airplane rotation when there is vertical tap force.
	if velocity.y > 0:
		rotation = rotate_toward(rotation, deg_to_rad(25), 0.5)
	if velocity.y < 0:
		rotation = rotate_toward(rotation, deg_to_rad(-25), 0.5)
		
	move_and_slide()

	# Clamps the airplane vertical position to avoid it to go off the screen.
	if position.y > 450:
		position.y = 450
	if position.y < 0:
		position.y = 0
