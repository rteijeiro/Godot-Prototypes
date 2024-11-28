class_name RockUp extends Area2D

@export var speed := 5

func _physics_process(delta: float) -> void:
	
	position.x -= speed
	
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body is Airplane:
			queue_free()
