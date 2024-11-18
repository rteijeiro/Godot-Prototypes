extends Sprite2D

func _ready() -> void:
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 255.0, 0.1)
	tween.parallel().tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
	tween.tween_property(self, "scale", Vector2.ZERO, 0.25)
	tween.parallel().tween_property(self, "modulate:a", 0.0, 0.25)
	tween.tween_callback(func() -> void:
		queue_free()
	)
