class_name Character extends Node2D

@export var bodies: Array[Texture2D]
@export var hands: Array[Texture2D]

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

@onready var face: Sprite2D = $Face
@onready var body: Sprite2D = $Body
@onready var left_hand: Sprite2D = $Hands/LeftHand
@onready var right_hand: Sprite2D = $Hands/RightHand

func _ready() -> void:
	face.texture = faces.pick_random()
	body.texture = bodies.pick_random()
	left_hand.texture = hands.pick_random()
	right_hand.texture = hands.pick_random()
