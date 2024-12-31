class_name RockDown extends Area2D

# The rock speed.
@export var speed := 5

# Handles the rock movement and collisions.
func _physics_process(delta: float) -> void:
	# Moves the rock horizontally.
	position.x -= speed
	# Gets the colliding bodies.
	var bodies = get_overlapping_bodies()
	# Checks if it collided with the airplane.
	for body in bodies:
		# Removes the rock when colliding with the airplane.
		if body is Airplane:
			queue_free()
