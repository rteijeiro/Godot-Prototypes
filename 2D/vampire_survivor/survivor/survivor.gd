extends CharacterBody2D

## The top speed that the survivor can achieve.
@export var max_speed := 300.0

# The crosshair sprite for the mouse pointer.
var _crosshair := preload("res://2D/vampire_survivor/resources/crosshair184.png")
# The bullet scene.
var Bullet := preload("res://2D/vampire_survivor/survivor/bullet.tscn")
# The player direction.
var direction := Vector2.ZERO
# The muzzle node.
@onready var _muzzle: Marker2D = $Muzzle

# Sets the mouse pointer to the crosshair sprite.
func _ready() -> void:
	Input.set_custom_mouse_cursor(_crosshair)
	
# Handles the player movement and aiming.
func _physics_process(_delta: float) -> void:
	# Gets the player direction from the input vector.
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Sets the player velocity.
	velocity = direction * max_speed
	move_and_slide()
	# Rotates the player to the mouse global position.
	look_at(get_viewport().get_mouse_position())
	
# Handles the player unhlandled inputs.
func _unhandled_input(event: InputEvent) -> void:
	# Shoots when mouse left button is pressed.
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_shoot()

# Handles the player shooting.
func _shoot() -> void:
	# Instantiates the bullet scene.
	var bullet:Area2D = Bullet.instantiate()
	# Sets the bullet position to the muzzle global position.
	bullet.position = _muzzle.global_position
	# Sets the bullet direction to the player rotation angle.
	bullet.direction = Vector2.from_angle(rotation)
	# Adds the bullet scene to the root scene.
	get_tree().root.add_child(bullet)
	
