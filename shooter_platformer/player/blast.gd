extends Node2D

# The blast sound.
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Handles blast animation and sound.
func _ready() -> void:
	# Plays the blast sound.
	audio_stream_player.play()
	
	# Creates a tween.
	var tween := create_tween()
	# Animates the alpha property to display the blast sprite, initially hidden.
	tween.tween_property(self, "modulate:a", 255.0, 0.1)
	# Animates in parallel the blast scale initially set to 0.0.
	tween.parallel().tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
	# Animates the blast scale back to 0.0 when the other animation finishes.
	tween.tween_property(self, "scale", Vector2.ZERO, 0.25)
	# Animates in parallel the blast alpha property back to 0.0 to hide it.
	tween.parallel().tween_property(self, "modulate:a", 0.0, 0.25)
	# Sets the tween callback to a lambda function which removes the blast.
	tween.tween_callback(func() -> void:
		queue_free()
	)
	
