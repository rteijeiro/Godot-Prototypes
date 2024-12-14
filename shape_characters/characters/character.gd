## Generic class for characters.
class_name Character extends Node2D

# Exported array to store the different body textures.
@export var bodies: Array[Texture2D]
# Exported array to store the different hand textures.
@export var hands: Array[Texture2D]

# Array to store the different face textures.
var faces = [
	preload("res://shape_characters/resources/characters/faces/face_a.png"),
	preload("res://shape_characters/resources/characters/faces/face_b.png"),
	preload("res://shape_characters/resources/characters/faces/face_c.png"),
	preload("res://shape_characters/resources/characters/faces/face_d.png"),
	preload("res://shape_characters/resources/characters/faces/face_e.png"),
	preload("res://shape_characters/resources/characters/faces/face_f.png"),
	preload("res://shape_characters/resources/characters/faces/face_g.png"),
	preload("res://shape_characters/resources/characters/faces/face_h.png"),
	preload("res://shape_characters/resources/characters/faces/face_i.png"),
	preload("res://shape_characters/resources/characters/faces/face_j.png"),
	preload("res://shape_characters/resources/characters/faces/face_k.png"),
	preload("res://shape_characters/resources/characters/faces/face_l.png"),
]

# The face sprite.
@onready var face: Sprite2D = $Face
# The body sprite.
@onready var body: Sprite2D = $Body
# The left hand sprite.
@onready var left_hand: Sprite2D = $Hands/LeftHand
# The right hand sprite.
@onready var right_hand: Sprite2D = $Hands/RightHand

# Sets up the character textures randomly.
func _ready() -> void:
	# Picks a random face texture from the faces array.
	face.texture = faces.pick_random()
	# Picks a random body texture from the bodies array.
	body.texture = bodies.pick_random()
	# Picks a random hand texture from the hands array.
	left_hand.texture = hands.pick_random()
	# Picks a random hand texture from the hands array.
	right_hand.texture = hands.pick_random()
