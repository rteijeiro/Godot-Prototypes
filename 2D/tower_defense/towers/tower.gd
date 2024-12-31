class_name Tower extends Area2D

@export var rotation_speed := 2

@onready var _cannon: Sprite2D = $Cannon
@onready var Bullet := preload("res://2D/tower_defense/towers/bullet.tscn")
@onready var _muzzle: Marker2D = %Muzzle
@onready var _shooting_timer: Timer = $ShootingTimer

var target: Area2D = null

func _ready() -> void:
	_shooting_timer.timeout.connect(shoot)
	
func _physics_process(delta: float) -> void:
	for area in get_overlapping_areas():
		if target == null:
			target = area
	
	if target != null:
		var desiderd_rotation := global_position.direction_to(target.global_position).angle() + PI / 2
		_cannon.rotation = rotate_toward(_cannon.rotation, desiderd_rotation, rotation_speed * delta)
		if _shooting_timer.is_stopped():
			_shooting_timer.start()
	
func shoot() -> void:
	if target != null:
		# Instantiates the bullet scene.
		var bullet:Area2D = Bullet.instantiate()
		# Sets the bullet position to the muzzle global position.
		bullet.global_position = _muzzle.global_position
		# Sets the bullet direction to the target global position.
		bullet.direction = _muzzle.global_position.direction_to(target.global_position)
		# Adds the bullet scene to the root scene.
		get_tree().root.add_child(bullet)
