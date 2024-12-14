extends CharacterBody2D

## The top speed that the ship can achieve.
@export var max_speed := 600.0
## How much speed per second is added when the player presses a movement key.
@export var acceleration := 1200.0
## How much speed per second is lost when the player releases all movement keys.
@export var deceleration := 500.0

# The ship lasers container.
@onready var _lasers: Node2D = $Lasers
# The laser scene.
@onready var Laser := preload("res://space_shooter/ship/laser.tscn")
# The laser sound.
@onready var _laser_sound: AudioStreamPlayer = $LaserSound
# The ship exhaust particles.
@onready var _exhaust: GPUParticles2D = $Exhaust

# Handles ship movement and shooting.
func _physics_process(delta: float) -> void:
	# Sets the ship direction vector from the inputs.
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# Sets the ship velocity considering the input direction.
	if direction.length() > 0.0:
		# Enables the exhaust particles.
		_exhaust.emitting = true
		# Sets the desired velocity to the ship's maximum velocity.
		var desired_velocity := direction * max_speed
		# Moves the ship smoothly towards the maximum velocity.
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
		# Sets the ship rotation smoothly towards the specified direction.
		global_rotation = rotate_toward(global_rotation, direction.orthogonal().angle(), 8.0 * delta)
	else:
		# Disables the exhaust particles.
		_exhaust.emitting = false
		# Slows down the ship smoothly giving the deceleration.
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
		
	move_and_slide()
	
	# Shoots when the shoot action is pressed.
	if Input.is_action_just_pressed("shoot"):
		_shoot()
	
# Handles the ship shooting.
func _shoot() -> void:
	# Sets the shooting for both lasers.
	for laser_marker: Marker2D in _lasers.get_children():
		# Instantiates the laser scene.
		var laser: Area2D = Laser.instantiate()
		# Sets the laser global position to the laser marker global position.
		laser.global_position = laser_marker.global_position
		# Sets the laser global rotation to the laser marker global rotation.
		laser.global_rotation = laser_marker.global_rotation
		# Adds the laser to the root scene.
		get_tree().root.add_child(laser)
		# Plays the laser sound.
		_laser_sound.play()
