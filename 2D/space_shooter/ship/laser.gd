extends Area2D

## The speed that the laser can achieve.
@export var speed := 1000
# The screen visibility notifier node.
@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

# Sets the screen exited signal to remove the laser when exits the screen.
func _ready() -> void:
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)

# Handles the laser movement.
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
