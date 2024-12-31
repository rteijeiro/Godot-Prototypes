extends Area2D

# Handles when duck is shooted using mouse left button.
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		queue_free()
