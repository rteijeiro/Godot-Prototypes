extends Area2D

var sprites := [
	preload("res://side_racing/resources/obstacles/ambulance.png"),
	preload("res://side_racing/resources/obstacles/buggy.png"),
	preload("res://side_racing/resources/obstacles/bus.png"),
	preload("res://side_racing/resources/obstacles/bus_school.png"),
	preload("res://side_racing/resources/obstacles/firetruck.png"),
	preload("res://side_racing/resources/obstacles/hotdog.png"),
	preload("res://side_racing/resources/obstacles/police.png"),
	preload("res://side_racing/resources/obstacles/sports_convertible.png"),
	preload("res://side_racing/resources/obstacles/sports_red.png"),
	preload("res://side_racing/resources/obstacles/suv.png"),
	preload("res://side_racing/resources/obstacles/taxi.png"),
	preload("res://side_racing/resources/obstacles/transport.png"),
	preload("res://side_racing/resources/obstacles/truck.png"),
	preload("res://side_racing/resources/obstacles/truckcabin.png"),
	preload("res://side_racing/resources/obstacles/trucktank.png"),
	preload("res://side_racing/resources/obstacles/vendor.png"),
	preload("res://side_racing/resources/obstacles/vintage.png"),
]

var speed := 0
var min_speed := 500
var max_speed := 1500

@onready var _sprite_2d: Sprite2D = $Sprite2D
@onready var _collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

func _ready() -> void:
	_sprite_2d.texture = sprites[randi_range(0, 16)]
	_collision_shape_2d.shape = RectangleShape2D.new()
	_collision_shape_2d.shape.extents = Vector2(_sprite_2d.texture.get_width() * 1.5, _sprite_2d.texture.get_height() / 3)
	_collision_shape_2d.position.y = _sprite_2d.texture.get_height()
	speed = randi_range(min_speed, max_speed)
	
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)
	
func _physics_process(delta: float) -> void:
	position.x += speed * delta

	body_entered.connect(func(body: Node2D) -> void:
		body.velocity = Vector2.ZERO
	)
