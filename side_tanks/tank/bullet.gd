extends Area2D

@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var _animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var direction := Vector2.ZERO
var velocity := Vector2(350, 0)
var speed
var bullet_gravity = 980

func _ready() -> void:
	_animated_sprite_2d.hide()
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		pass
		#queue_free()
	)
	body_entered.connect(func(body: Node2D) -> void:
		_explode()
	)

	velocity = direction.normalized() * speed

func _physics_process(delta: float) -> void:
	velocity.y += bullet_gravity * delta
	position += velocity * delta
	rotation = velocity.angle()

func _explode() -> void:
	$Sprite2D.hide()
	velocity = Vector2.ZERO
	bullet_gravity = 0
	_animated_sprite_2d.show()
	_animated_sprite_2d.play("default")
	_animated_sprite_2d.animation_finished.connect(func() -> void:
		queue_free()
	)
	
