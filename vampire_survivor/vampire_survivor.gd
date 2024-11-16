extends Node2D

@onready var Zombie := preload("res://vampire_survivor/zombie/zombie.tscn")
@onready var _survivor: CharacterBody2D = $Survivor
@onready var _timer: Timer = $Timer

func _ready() -> void:
	_timer.timeout.connect(func() -> void:
		_spawn_zombie()
	)
	
	
func _spawn_zombie() -> void:
	var zombie:CharacterBody2D = Zombie.instantiate()
	zombie.player = _survivor
	zombie.velocity = _survivor.global_position.normalized()
	get_tree().root.add_child(zombie)
