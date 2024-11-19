extends CharacterBody2D

@onready var _animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var _engine_sound: AudioStreamPlayer = $EngineSound

## The top speed that the car can achieve.
@export var max_speed := 1500.0
## How much speed per second is added when the player presses a movement key.
@export var acceleration := 1200.0
## How much speed per second is lost when the player releases all movement keys.
@export var deceleration := 100.0

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	var desired_velocity := Vector2(direction * max_speed, 0)
	if desired_velocity.x < 0.0:
		desired_velocity.x = 0.0
	
	if direction:
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	
	if velocity.x < 50:
		_animated_sprite_2d.play("stop")
		_engine_sound.stop()
	else:
		_animated_sprite_2d.play("run")
		_engine_sound.play()

	if velocity.x > 0.0:
		var steering := Input.get_axis("move_up", "move_down")
		velocity.y = steering * velocity.x * 0.1
		
	_animated_sprite_2d.speed_scale = velocity.x / max_speed
	
	position.y = clamp(position.y, 65, 190)
	
	move_and_slide()
