extends Node2D

@export var SPEED := 1

@export var damage_area : Area2D

@export var target_location : Marker2D

var heading_out := true

func _process(delta: float) -> void:
	if LevelManager.paused:
		return
	
	go_to(delta, target_location.global_position if heading_out else self.global_position)

func go_to(delta: float, location: Vector2) -> void:
	var damage_velocity = damage_area.global_position.move_toward(location, delta * SPEED)
	damage_area.global_position = damage_velocity
	
	if damage_area.global_position.distance_to(location) == 0:
		heading_out = not heading_out
