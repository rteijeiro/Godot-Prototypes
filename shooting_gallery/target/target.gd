extends Area2D

var speed


func _ready() -> void:
	speed = randi_range(100, 600)
	

func _physics_process(delta: float) -> void:
	position.x += speed * delta


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		print("CLICKED!!!")
