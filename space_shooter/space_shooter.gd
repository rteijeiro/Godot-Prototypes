extends Node2D

@onready var Meteor := preload("res://space_shooter/meteor/meteor.tscn")
@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.timeout.connect(func() -> void:
		spawn_meteor()
	)

func spawn_meteor() -> void:
	var meteor:Area2D = Meteor.instantiate()
	meteor.position = Vector2(randi() % 1100, randi() % 600)
	get_tree().root.add_child.call_deferred(meteor)
