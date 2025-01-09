extends Node2D

@onready var Tower := preload("res://2D/tower_defense/towers/tower.tscn")
@onready var Soldier := preload("res://2D/tower_defense/soldiers/soldier.tscn")
@onready var _path_2d: Path2D = %Path2D
@onready var _timer: Timer = %Timer

var mouse_tower: Node2D = null

func _ready() -> void:
	mouse_tower = Tower.instantiate()
	mouse_tower.modulate.a = 0.5
	mouse_tower.hide()
	add_child(mouse_tower)
	mouse_tower.set_physics_process(false)
	
	_timer.timeout.connect(spawn_soldier)
	
func _process(delta: float) -> void:
	
	if mouse_tower != null:
		mouse_tower.global_position = get_global_mouse_position()
		
	if Input.is_action_just_pressed("click"):
		mouse_tower.show()
		
	if Input.is_action_just_released("click"):
		mouse_tower.hide()
		var tower := Tower.instantiate()
		tower.global_position = mouse_tower.global_position
		add_child(tower)
	
func spawn_soldier() -> void:
	var soldier := Soldier.instantiate()
	_path_2d.add_child(soldier)
