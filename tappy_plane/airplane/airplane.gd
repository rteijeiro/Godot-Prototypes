class_name Airplane extends CharacterBody2D

@export var airplane_gravity := 20
@export var tap_force := 800

func _physics_process(delta: float) -> void:
	velocity.y += airplane_gravity
	
	if Input.is_action_just_pressed("click"):
		velocity.y -= tap_force
		
	velocity.y = clamp(velocity.y, -tap_force, tap_force)
	
	if velocity.y > 0:
		rotation = rotate_toward(rotation, deg_to_rad(25), 0.5)
	
	if velocity.y < 0:
		rotation = rotate_toward(rotation, deg_to_rad(-25), 0.5)
		
	move_and_slide()

	if position.y > 450:
		position.y = 450
		
	if position.y < 0:
		position.y = 0
