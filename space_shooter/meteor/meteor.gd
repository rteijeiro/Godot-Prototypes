extends Area2D

@export var textures: Array[Texture] = []
@export var speed:= 200

@onready var _sprite_2d: Sprite2D = $Sprite2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

var direction := Vector2.ZERO


func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)
	
	_sprite_2d.texture = textures[randi() % 4]
	
	var direction_x := randf_range(-1, 1)
	var direction_y := randf_range(-1, 1)
	direction = Vector2(direction_x, direction_y)
	
	var random_start := randi_range(0, 1)
	
	if direction_x > 0:
		if direction_y > 0:
			position = Vector2(randf_range(0, get_viewport_rect().size.x / 2), randf_range(0, get_viewport_rect().size.y / 2))
		else:
			position = Vector2(randf_range(0, get_viewport_rect().size.x / 2), randf_range(get_viewport_rect().size.y, get_viewport_rect().size.y / 2))
	else:
		if direction_y > 0:
			position = Vector2(randf_range(get_viewport_rect().size.x, get_viewport_rect().size.x / 2), randf_range(0, get_viewport_rect().size.y / 2))
		else:
			position = Vector2(randf_range(get_viewport_rect().size.x, get_viewport_rect().size.x / 2), randf_range(get_viewport_rect().size.y, get_viewport_rect().size.y / 2))


func _physics_process(delta: float) -> void:
	position += direction * speed * delta
