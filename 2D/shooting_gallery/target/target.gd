extends Area2D

## The target speed.
@export var speed: float

# Sets the target initial speed randomly.
func _ready() -> void:
	speed = randi_range(100, 600)
	
# Handles the target movement.
func _physics_process(delta: float) -> void:
	position.x += speed * delta

# Handles when a target is shooted using the left mouse button.
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		queue_free()
