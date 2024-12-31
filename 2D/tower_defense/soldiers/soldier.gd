class_name Soldier extends PathFollow2D

var speed: float

func _ready() -> void:
	speed = randf_range(80.0, 120.0)
	v_offset = randf_range(-40.0, 40.0)
	
func _physics_process(delta: float) -> void:
	progress += speed * delta
