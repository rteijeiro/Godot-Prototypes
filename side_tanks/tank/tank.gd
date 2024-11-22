extends CharacterBody2D

var _crosshair = preload("res://side_tanks/resources/tank/crosshair184.png")
var Bullet = preload("res://side_tanks/tank/bullet.tscn")

@onready var _turret: Node2D = $Turret
@onready var _muzzle: Marker2D = $Turret/Muzzle

const SPEED = 100.0

func _ready() -> void:
	Input.set_custom_mouse_cursor(_crosshair)

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Turret rotation.
	var mouse_position := get_global_mouse_position()
	var direction_to_mouse := _turret.global_position.direction_to(mouse_position)
	var angle_to_mouse := direction_to_mouse.angle()
	angle_to_mouse = clamp(angle_to_mouse, -PI/2, 0.0)
	_turret.rotation = angle_to_mouse


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_shoot()
			
			
func _shoot() -> void:
	var bullet:Area2D = Bullet.instantiate()
	bullet.position = _muzzle.global_position
	bullet.rotation = _turret.rotation
	bullet.direction = _turret.global_position.direction_to(_muzzle.global_position)
	get_tree().root.add_child(bullet)
	
