extends Node2D

@export var SPEED := 100
@export var damage_area : Node2D
@export var path_node : Node2D

var current_step := 0

var path = []

func _ready() -> void:
	path.append_array(path_node.get_children())
	path.append(path_node)

func _process(delta: float) -> void:
	if LevelManager.paused:
		return
	
	var damage_velocity = damage_area.global_position.move_toward(path[current_step].global_position, delta * SPEED)
	damage_area.global_position = damage_velocity
	
	if damage_area.global_position.distance_to(path[current_step].global_position) == 0:
		current_step = (current_step + 1) % len(path)
