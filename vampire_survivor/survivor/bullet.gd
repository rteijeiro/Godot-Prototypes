extends Area2D

@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

var direction := Vector2.ZERO
var speed := 900

func _ready() -> void:
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)
	body_entered.connect(func(body: Node2D) -> void:
		body.queue_free()
		queue_free()
	)

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	
