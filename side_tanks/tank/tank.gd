extends CharacterBody2D

var Bullet = preload("res://side_tanks/tank/bullet.tscn")

@onready var _turret: Node2D = $Turret
@onready var _muzzle: Marker2D = $Turret/Muzzle
@onready var _line_2d: Line2D = $Line2D

const SPEED := 100.0
var max_points := 250
var bullet_speed := 800
var can_shoot := false


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
	var direction_to_mouse := _muzzle.global_position.direction_to(mouse_position)
	var angle_to_mouse := direction_to_mouse.angle()
	angle_to_mouse = clamp(angle_to_mouse, -PI/2, 0.0)
	_turret.rotation = angle_to_mouse
	
	# Aim and shoot.
	if Input.is_action_pressed("click"):
		can_shoot = true
		_line_2d.show()
		update_trajectory(delta)
		
	if Input.is_action_just_released("click"):
		if can_shoot:
			can_shoot = false
			_line_2d.hide()
			_shoot()
			
func _shoot() -> void:
	var bullet:Area2D = Bullet.instantiate()
	bullet.position = _muzzle.global_position
	bullet.rotation = _turret.rotation
	bullet.direction = _turret.global_position.direction_to(_muzzle.global_position)
	bullet.speed = bullet_speed
	get_tree().root.add_child(bullet)
	

func update_trajectory(delta):
	_line_2d.clear_points()
	var target_position = to_local(_muzzle.global_position)
	var target_velocity = _muzzle.global_transform.x * bullet_speed
	for i in max_points:
		_line_2d.add_point(target_position)
		target_velocity.y += get_gravity().y * delta
		target_position += target_velocity * delta
		if target_position.y > 0:
			break
