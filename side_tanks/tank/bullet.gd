extends Area2D

@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

var direction := Vector2.ZERO
var velocity := Vector2(350, 0)
var speed := 800

func _ready() -> void:
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)
	body_entered.connect(func(body: Node2D) -> void:
		queue_free()
	)

	velocity = direction.normalized() * speed

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()
