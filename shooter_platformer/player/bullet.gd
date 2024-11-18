extends Area2D

var Blast := preload("res://shooter_platformer/player/blast.tscn")

@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

var direction := Vector2.ZERO
var speed := 900

func _ready() -> void:
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)
	body_entered.connect(func(body: Node2D) -> void:
		if body.name == "Level1":
			var blast:Node2D = Blast.instantiate()
			blast.position = global_position
			get_tree().root.add_child(blast)
		queue_free()
	)
	
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
