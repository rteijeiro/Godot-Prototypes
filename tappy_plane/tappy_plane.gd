extends Node2D

@onready var rocks: Array[PackedScene] = [
	preload("res://tappy_plane/rocks/rock_up.tscn"),
	preload("res://tappy_plane/rocks/rock_down.tscn")
]
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.timeout.connect(spawn_rock)
	

func spawn_rock() -> void:
	var rock:Area2D = rocks.pick_random().instantiate()
	rock.position.x = 1500
	if rock is RockDown:
		rock.position.y = 119
	elif  rock is RockUp:
		rock.position.y = 361
		
	get_tree().current_scene.add_child(rock)
