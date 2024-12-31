extends Area2D

# The meteor textures array.
@export var textures: Array[Texture] = []
# The meteor speed.
@export var speed:= 200

# The meteor sprite.
@onready var _sprite_2d: Sprite2D = $Sprite2D
# The screen visibility notifier.
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

# The meteor direction.
var direction := Vector2.ZERO

# Handles the meteor initial texture and position.
func _ready() -> void:
	# Sets the screen exited signal to remove the meteor when exits the screen.
	visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)
	
	# Sets a random meteor texture.
	_sprite_2d.texture = textures.pick_random()
	
	# Sets a random direction for the meteor.
	var direction_x := randf_range(-1, 1)
	var direction_y := randf_range(-1, 1)
	direction = Vector2(direction_x, direction_y)
	
	# Sets the meteor spawn position depending on the random position.
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

# Handles the meteor movement.
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
