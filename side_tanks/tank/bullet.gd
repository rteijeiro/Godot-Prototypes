extends Area2D

# The screen visibility notifier node.
@onready var _visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
# The animated sprite node.
@onready var _animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# The bullet direction.
var direction := Vector2.ZERO
# The bullet velocity.
var velocity := Vector2(350, 0)
# The bullet speed.
var speed: float
# The bullet gravity.
var bullet_gravity := 980

# Sets the bullet visibility and collision signals.
func _ready() -> void:
	# Hides the bullet explosion animation.
	_animated_sprite_2d.hide()
	# Sets the screen exited signal to a lambda function that removes the
	# bullet when exits the screen.
	_visible_on_screen_notifier_2d.screen_exited.connect(func() -> void:
		queue_free()
	)
	# Connects the body entered signal to the explode function.
	body_entered.connect(func(body: Node2D) -> void:
		_explode()
	)
	# Sets the bulllet velocity.
	velocity = direction.normalized() * speed

# Handles the bullet movement and rotation.
func _physics_process(delta: float) -> void:
	# Sets the bullet movement on the y axis considering the gravity.
	velocity.y += bullet_gravity * delta
	# Sets the bullet position giving the velocity.
	position += velocity * delta
	# Sets the bullet rotation giving the velocity angle.
	rotation = velocity.angle()

# Handles the bullet explosion.
func _explode() -> void:
	# Hides the bullet sprite.
	$Sprite2D.hide()
	# Stops the bullet setting its velocity to zero.
	velocity = Vector2.ZERO
	# Sets the bullet gravity to zero.
	bullet_gravity = 0
	# Shows the explosion animation.
	_animated_sprite_2d.show()
	# Plays the explosion animation.
	_animated_sprite_2d.play("default")
	# Removes the bullet scene when the explosion animation is finished.
	_animated_sprite_2d.animation_finished.connect(func() -> void:
		queue_free()
	)
	
