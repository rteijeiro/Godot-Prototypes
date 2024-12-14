extends Area2D

# The blast scene.
var Blast := preload("res://shooter_platformer/player/blast.tscn")

# The screen visibility notifier used to remove the bullets when they leave the screen. 
@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

# The bullet direction which is set to point to the mouse direction
# when the bullet is instantiated.
var direction := Vector2.ZERO

## The bullet speed.
@export var speed := 900

# Handles the screen exited and body entered signals.
func _ready() -> void:
	# Removes the bullet when it leaves the screen.
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)
	
	# Handles the bullet collisions.
	body_entered.connect(func(body: Node2D) -> void:
		# Removes the bullet when it collides with the map and
		# generates a blast.
		if body.name == "Level1":
			# Instantiates the blast scene.
			var blast:Node2D = Blast.instantiate()
			# Sets the blast position to the bullet global position.
			blast.position = global_position
			# Adds the blast to the root scene.
			get_tree().root.add_child(blast)
			# Removes the bullet.
			queue_free()
	)

# Handles the bullet movement.
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
