extends Node2D

# The crosshair icon sprite.
@onready var _crosshair := preload("res://shooting_gallery/resources/stall/crosshair_outline_large.png")
# The target scene.
@onready var Target := preload("res://shooting_gallery/target/target.tscn")
# The target spawn timer.
@onready var _timer: Timer = $Timer
# The targets node container.
@onready var targets: Node2D = $Targets
# The front ducks node container.
@onready var front_ducks: Node2D = $FrontDucks
# The back ducks node container.
@onready var back_ducks: Node2D = $BackDucks

# Handles the mouse pointer sprite and spawn timer timeout connection.
func _ready() -> void:
	Input.set_custom_mouse_cursor(_crosshair)
	_timer.connect("timeout", _spawn_targets)
	
# Spawns a new target.
func _spawn_targets() -> void:
	# Instantiates the target scene.
	var target:Area2D = Target.instantiate()
	# Sets the target position to 0.0
	target.position.x = 0.0
	# Adds the target to the targets container.
	targets.add_child(target)
