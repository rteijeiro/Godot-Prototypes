extends CharacterBody2D

## The top speed that the ship can achieve.
@export var max_speed := 600.0
## How much speed per second is added when the player presses a movement key.
@export var acceleration := 1200.0
## How much speed per second is lost when the player releases all movement keys.
@export var deceleration := 500.0

var direction := Vector2.ZERO
@onready var _lasers: Node2D = $Lasers
@onready var Laser := preload("res://space_shooter/ship/laser.tscn")
@onready var _laser_sound: AudioStreamPlayer = $LaserSound
@onready var _exhaust: GPUParticles2D = $Exhaust

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction.length() > 0.0:
		_exhaust.emitting = true
		var desired_velocity := direction * max_speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
		global_rotation = rotate_toward(global_rotation, direction.orthogonal().angle(), 8.0 * delta)
	else:
		_exhaust.emitting = false
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
		
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		_shoot()
	
	
func _shoot() -> void:
	for laser_marker: Marker2D in _lasers.get_children():
		var laser: Area2D = Laser.instantiate()
		laser.global_position = laser_marker.global_position
		laser.global_rotation = laser_marker.global_rotation
		#laser.transform = laser_marker.transform
		get_tree().root.add_child(laser)
		_laser_sound.play()
