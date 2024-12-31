extends CharacterBody2D

var speed := 100
@export var player:CharacterBody2D

func _ready() -> void:
	
	if velocity.x > 0:
		if velocity.y > 0:
			position = Vector2(randf_range(0, get_viewport_rect().size.x / 2), randf_range(0, get_viewport_rect().size.y / 2))
		else:
			position = Vector2(randf_range(0, get_viewport_rect().size.x / 2), randf_range(get_viewport_rect().size.y, get_viewport_rect().size.y / 2))
	else:
		if velocity.y > 0:
			position = Vector2(randf_range(get_viewport_rect().size.x, get_viewport_rect().size.x / 2), randf_range(0, get_viewport_rect().size.y / 2))
		else:
			position = Vector2(randf_range(get_viewport_rect().size.x, get_viewport_rect().size.x / 2), randf_range(get_viewport_rect().size.y, get_viewport_rect().size.y / 2))


func _physics_process(_delta: float) -> void:
	velocity = global_position.direction_to(player.global_position) * speed
	rotation = velocity.angle()
	move_and_slide()
