extends CharacterBody2D

# The bullet scene.
var Bullet = preload("res://2D/side_tanks/tank/bullet.tscn")

# The turret node.
@onready var _turret: Node2D = $Turret
# The muzzle node used to spawn bullets.
@onready var _muzzle: Marker2D = $Turret/Muzzle
# The line2d node used to paint the bullet trajectory.
@onready var _line_2d: Line2D = $Line2D

# The bullet movement speed.
@export var speed := 100.0
# The maximum number of line2d points to represent the bullet trajectory.
var max_points := 250
# The bullet speed.
var bullet_speed := 800
# Checks if a bullet is still being shooted to avoid to shoot multiple bullets.
var can_shoot := false

# Handles tank movement, turret rotation and bullet shooting.
func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	# Moves the tank to the selected direction using the corresponding speed.
	if direction:
		velocity.x = direction * speed
	else:
		# Stops the tank smoothly.
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

	# Gets the mouse global position.
	var mouse_position := get_global_mouse_position()
	# Gets the direction from the muzzle to the global mouse position.
	var direction_to_mouse := _muzzle.global_position.direction_to(mouse_position)
	# Gets the mouse position angle.
	var angle_to_mouse := direction_to_mouse.angle()
	# Limits the angle to 90 degrees so it doesn't go over the top of the tank.
	angle_to_mouse = clamp(angle_to_mouse, -PI/2, 0.0)
	# Sets the turret rotation to the mouse position angle.
	_turret.rotation = angle_to_mouse
	
	# Enables the aiming trajectory and shooting when left mouse button
	# is pressed.
	if Input.is_action_pressed("click"):
		# Enables shooting to avoid multiple shooting.
		can_shoot = true
		# Displays the aiming trajectory.
		_line_2d.show()
		# Updates the aiming trajectory.
		update_trajectory(delta)
	
	# Shoots the bullet and disables shooting when left mouse button
	# is released.
	if Input.is_action_just_released("click"):
		# Shoots a bullet when shooting is enabled.
		if can_shoot:
			# Disables shooting to avoid multiple shooting.
			can_shoot = false
			# Hides the aiming trajectory.
			_line_2d.hide()
			# Shoots the bullet.
			_shoot()
			
# Handles bullet shooting.
func _shoot() -> void:
	# Instantiates the bullet scene.
	var bullet:Area2D = Bullet.instantiate()
	# Sets the bullet position to the muzzle global position.
	bullet.position = _muzzle.global_position
	# Sets the bullet rotation to the turret rotation.
	bullet.rotation = _turret.rotation
	# Sets the bullet direction to the turret direction through the muzzle
	# global position.
	bullet.direction = _turret.global_position.direction_to(_muzzle.global_position)
	# Sets the bullet speed.
	bullet.speed = bullet_speed
	# Adds the bullet to the root scene.
	get_tree().root.add_child(bullet)
	
# Handles the trajectory updates.
func update_trajectory(delta):
	# Removes the previous trajectory line points.
	_line_2d.clear_points()
	# Transforms the muzzle global position to a local position.
	var target_position := to_local(_muzzle.global_position)
	# Calculates the target velocity giving the bullet speed on the x axis.
	var target_velocity := _muzzle.global_transform.x * bullet_speed
	# Creates the trajectory line points giving the maximum number of points.
	for i in max_points:
		# Creates a line point on the target position.
		_line_2d.add_point(target_position)
		# Sets the target velocity in the y axis considering the gravity.
		target_velocity.y += get_gravity().y * delta
		# Updates the target position giving the target velocity.
		target_position += target_velocity * delta
		# Ends the trajectory calculation when it reaches the ground.
		if target_position.y > 0:
			break
