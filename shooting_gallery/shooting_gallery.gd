extends Node2D

@onready var Target = preload("res://shooting_gallery/target/target.tscn")
@onready var _timer: Timer = $Timer
@onready var targets: Node2D = $Targets
@onready var front_ducks: Node2D = $FrontDucks
@onready var back_ducks: Node2D = $BackDucks

func _ready() -> void:
	_timer.connect("timeout", _spawn_targets)
	
	
func _spawn_targets() -> void:
	var target:Area2D = Target.instantiate()
	target.position.x = 0
	targets.add_child(target)
