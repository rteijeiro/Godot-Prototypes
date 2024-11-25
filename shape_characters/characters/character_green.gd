class_name CharacterGreen extends Character

func _ready() -> void:
	super._ready()
	body.texture = bodies.pick_random()
	left_hand.texture = hands.pick_random()
	right_hand.texture = hands.pick_random()
