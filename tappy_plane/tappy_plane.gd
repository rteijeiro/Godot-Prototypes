extends Node2D

# The rock scenes array.
@onready var rocks: Array[PackedScene] = [
	preload("res://tappy_plane/rocks/rock_up.tscn"),
	preload("res://tappy_plane/rocks/rock_down.tscn")
]
# The rock spawn timer.
@onready var timer: Timer = $Timer

# Connects the rock spawn timer timeout signal to the spawn function.
func _ready() -> void:
	timer.timeout.connect(spawn_rock)
	
# Handles the rock spawning.
func spawn_rock() -> void:
	# Instantiates a random rock scene.
	var rock:Area2D = rocks.pick_random().instantiate()
	# Sets the rock x position ahead of the player.
	rock.position.x = 1500
	# Checks the rock type and sets the y possition accordingly.
	if rock is RockDown:
		rock.position.y = 119
	elif  rock is RockUp:
		rock.position.y = 361
	
	# Adds the rock scene as a child.
	get_tree().current_scene.add_child(rock)
