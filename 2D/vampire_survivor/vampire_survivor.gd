extends Node2D

# The zombie scene.
@onready var Zombie := preload("res://2D/vampire_survivor/zombie/zombie.tscn")
# The survivor node.
@onready var _survivor: CharacterBody2D = $Survivor
# The zombie spawning timer.
@onready var _timer: Timer = $Timer

# Connects the zombie spawn timer timeout signal with the spawn function.
func _ready() -> void:
	_timer.timeout.connect(func() -> void:
		_spawn_zombie()
	)
	
# Handles the zombie spawning.
func _spawn_zombie() -> void:
	# Instantiates the zombie scene.
	var zombie:CharacterBody2D = Zombie.instantiate()
	# Sets the zombie target to the player.
	zombie.player = _survivor
	# Sets the zombie velocity to the player global position.
	zombie.velocity = _survivor.global_position.normalized()
	# Adds the zombie to eh root scene.
	get_tree().root.add_child(zombie)
