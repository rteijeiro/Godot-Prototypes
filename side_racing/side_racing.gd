extends Node2D

var music = [
	preload("res://side_racing/resources/music/DavidKBD - Pink Bloom Pack - 05 - Western Cyberhorse.ogg"),
	preload("res://side_racing/resources/music/DavidKBD - Pink Bloom Pack - 06 - Diamonds on The Ceiling.ogg")
]

@onready var _car: CharacterBody2D = $Car
@onready var _audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var _timer: Timer = $Timer
@onready var Obstacle := preload("res://side_racing/obstacle/obstacle.tscn")

func _ready() -> void:
	_audio_stream_player.stream = music[randi_range(0, 1)]
	_audio_stream_player.play()

	_timer.timeout.connect(func() -> void:
		var obstacle := Obstacle.instantiate()
		obstacle.position = Vector2(_car.global_position.x + 1500, randi_range(65, 190))
		add_child(obstacle)
	)
