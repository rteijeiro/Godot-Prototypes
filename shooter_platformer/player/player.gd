extends CharacterBody2D

var Bullet := preload("res://shooter_platformer/player/bullet.tscn")
var _crosshair := preload("res://shooter_platformer/player/crosshair184.png")

const SPEED := 300.0
const JUMP_VELOCITY := -400.0
const COOLDOWN := 0.25

var _shooting := false

@onready var _sprite_2d: Sprite2D = $Sprite2D
@onready var _hands: Node2D = $Hands
@onready var _muzzle: Marker2D = $Hands/Muzzle
@onready var _shoot_audio: AudioStreamPlayer = $ShootAudio

func _ready() -> void:
	Input.set_custom_mouse_cursor(_crosshair)
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("shoot") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("click") and !_shooting:
		_shoot()
		_shoot_audio.play()
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		_sprite_2d.flip_h = 0 if direction == 1 else 1
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var mouse_position := get_global_mouse_position()
	var direction_to_mouse := _hands.global_position.direction_to(mouse_position)
	var angle_to_mouse := direction_to_mouse.angle()
	_hands.rotation = angle_to_mouse
	_hands.scale.y = -1.0 if angle_to_mouse > PI/2 or angle_to_mouse < -PI/2 else 1.0


func _shoot() -> void:
	if !_shooting:
		var bullet:Area2D = Bullet.instantiate()
		bullet.position = _muzzle.global_position
		var mouse_position := get_global_mouse_position()
		var direction_to_mouse := _hands.global_position.direction_to(mouse_position)
		bullet.direction = direction_to_mouse
		bullet.rotation = direction_to_mouse.angle()
		get_tree().root.add_child(bullet)
		_shooting = true
		
	var timer := get_tree().create_timer(COOLDOWN)
	timer.timeout.connect(func() -> void:
		_shooting = false
	)
	
