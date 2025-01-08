extends Node2D

@export var acceleration: float = 1.0
@export var camera_distance: float = 200.0

@onready var _player: CharacterBody2D = $".."

func _physics_process(delta: float) -> void:
	var move_direction: Vector2 = _player.velocity.normalized()
	var target_position: Vector2 = move_direction * camera_distance
	position = position.lerp(target_position, acceleration * delta)
