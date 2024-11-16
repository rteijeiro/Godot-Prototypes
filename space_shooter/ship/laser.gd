extends Area2D

## The speed that the laser can achieve.
@export var speed := 1000

@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

func _ready() -> void:
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)


func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
