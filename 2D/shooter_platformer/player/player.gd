extends CharacterBody2D

# The bullet scene.
var Bullet := preload("res://2D/shooter_platformer/player/bullet.tscn")
# The crosshair icon.
var _crosshair := preload("res://2D/shooter_platformer/player/crosshair184.png")

## The player speed.
@export var speed := 300.0
## The player jump velocity.
@export var jump_velocity := -400.0
## The weapon cooldown time.
@export var cooldown := 0.25

# Monitors when player is shooting for cooldown.
var _shooting := false

# The player sprite used to flip it horizontally when moving left or right.
@onready var _sprite_2d: Sprite2D = $Sprite2D
# The player hands container used to rotate the weapon when moving the mouse.
@onready var _hands: Node2D = $Hands
# The weapon muzzle used to instantiate the projectile the correct position.
@onready var _muzzle: Marker2D = $Hands/Muzzle
# The shoot sound.
@onready var _shoot_audio: AudioStreamPlayer = $ShootAudio

# Sets the crosshair icon as the mouse pointer.
func _ready() -> void:
	Input.set_custom_mouse_cursor(_crosshair)

# Controls player movement and shooting.
func _physics_process(delta: float) -> void:
	# Adds the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handles player jump.
	if Input.is_action_just_pressed("shoot") and is_on_floor():
		velocity.y = jump_velocity

	# Shoots a new projectile when weapon is ready and plays shoot sound.
	if Input.is_action_pressed("click") and !_shooting:
		_shoot()
		_shoot_audio.play()
		
	# Gets the input direction and handles the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	
	# Handles player movement.
	if direction:
		# Faces the sprite to the direction movement.
		_sprite_2d.flip_h = 0 if direction == 1 else 1
		# Sets the player horizontal movement.
		velocity.x = direction * speed
	else:
		# Slows down the player when there is no movement.
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
	# The mouse global position.
	var mouse_position := get_global_mouse_position()
	# The normalized vector pointing from the hands to the mouse position.
	var direction_to_mouse := _hands.global_position.direction_to(mouse_position)
	# The angle of the mouse direction vector.
	var angle_to_mouse := direction_to_mouse.angle()
	# Sets the hands rotation to the mouse direction angle.
	_hands.rotation = angle_to_mouse
	# Flips the hands to make the weapon face the correct direction.
	_hands.scale.y = -1.0 if angle_to_mouse > PI/2 or angle_to_mouse < -PI/2 else 1.0

# Handles the player shooting.
func _shoot() -> void:
	# Only shoots a new projectile when the weapon is cooled down.
	if !_shooting:
		# The instantiated bullet scene.
		var bullet:Area2D = Bullet.instantiate()
		# Sets the bullet position to the muzzle global position.
		bullet.position = _muzzle.global_position
		# The mouse global position.
		var mouse_position := get_global_mouse_position()
		# The normalized vector pointing from the hands to the mouse position.
		var direction_to_mouse := _hands.global_position.direction_to(mouse_position)
		# Sets the bullet direction to the mouse direction vector.
		bullet.direction = direction_to_mouse
		# Sets the bullet rotation to the mouse direction vector angle.
		bullet.rotation = direction_to_mouse.angle()
		# Adds the bullet to the root scene.
		get_tree().root.add_child(bullet)
		
		# Activates the weapon cooling time.
		_shooting = true
		# Creates a timer to deactivate the weapon cooling time.
		var timer := get_tree().create_timer(cooldown)
		# Connects the timer timeout signal to a lambda function which disables
		# the colling down.
		timer.timeout.connect(func() -> void:
			_shooting = false
		)
	
