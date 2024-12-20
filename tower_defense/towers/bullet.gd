extends Area2D

# The screen visibility notifier.
@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

# The bullet direction.
var direction := Vector2.ZERO
# The bullet speed.
var speed := 900

# Handles the screen exited and body entered signals.
func _ready() -> void:
	# Removes the bullet when it leaves the screen/
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)
	# Removes the bullet and the colliding body.
	area_entered.connect(func(area: Node2D) -> void:
		area.queue_free()
		queue_free()
	)

# Handles the bullet movement.
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	
