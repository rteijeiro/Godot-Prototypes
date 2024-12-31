extends Node2D

# The meteor scene.
@onready var Meteor := preload("res://2D/space_shooter/meteor/meteor.tscn")
# The meteor spawn timer.
@onready var timer: Timer = $Timer

# Sets the meteor spawn when the timer times out.
func _ready() -> void:
	timer.timeout.connect(func() -> void:
		spawn_meteor()
	)

# Handles the meteor spawning.
func spawn_meteor() -> void:
	# Instantiates the meteor scene.
	var meteor:Area2D = Meteor.instantiate()
	# Sets the meteor position to a random position in the screen.
	meteor.position = Vector2(randi() % 1100, randi() % 600)
	# Adds the meteor to the root scene.
	get_tree().root.add_child.call_deferred(meteor)
