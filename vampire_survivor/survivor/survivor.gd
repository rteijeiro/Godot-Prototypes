extends CharacterBody2D

## The top speed that the survivor can achieve.
@export var max_speed := 300.0

var _crosshair := preload("res://vampire_survivor/resources/crosshair184.png")
var Bullet := preload("res://vampire_survivor/survivor/bullet.tscn")
var direction := Vector2.ZERO

@onready var _muzzle: Marker2D = $Muzzle

func _ready() -> void:
	Input.set_custom_mouse_cursor(_crosshair)
	
	
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * max_speed
	
	move_and_slide()
	look_at(get_viewport().get_mouse_position())
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_shoot()

func _shoot() -> void:
	var bullet:Area2D = Bullet.instantiate()
	bullet.position = _muzzle.global_position
	bullet.direction = Vector2.from_angle(rotation)
	get_tree().root.add_child(bullet)
	
