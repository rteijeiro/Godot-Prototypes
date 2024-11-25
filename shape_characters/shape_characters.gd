extends Node2D

@onready var CharacterBlue := preload("res://shape_characters/characters/character_blue.tscn")
@onready var CharacterGreen := preload("res://shape_characters/characters/character_green.tscn")
@onready var CharacterPink := preload("res://shape_characters/characters/character_pink.tscn")
@onready var CharacterPurple := preload("res://shape_characters/characters/character_purple.tscn")
@onready var CharacterRed := preload("res://shape_characters/characters/character_red.tscn")
@onready var CharacterYellow := preload("res://shape_characters/characters/character_yellow.tscn")

func _ready() -> void:
	var blue_character:Character = CharacterBlue.instantiate()
	blue_character.position = Vector2(200, 200)
	get_tree().current_scene.add_child(blue_character)

	var green_character:Character = CharacterGreen.instantiate()
	green_character.position = Vector2(400, 200)
	get_tree().current_scene.add_child(green_character)

	var pink_character:Character = CharacterPink.instantiate()
	pink_character.position = Vector2(600, 200)
	get_tree().current_scene.add_child(pink_character)

	var purple_character:Character = CharacterPurple.instantiate()
	purple_character.position = Vector2(200, 400)
	get_tree().current_scene.add_child(purple_character)

	var red_character:Character = CharacterRed.instantiate()
	red_character.position = Vector2(400, 400)
	get_tree().current_scene.add_child(red_character)
	
	var yellow_character:Character = CharacterYellow.instantiate()
	yellow_character.position = Vector2(600, 400)
	get_tree().current_scene.add_child(yellow_character)
