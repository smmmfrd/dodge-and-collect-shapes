extends Area2D

var breach_position: Vector2

func _on_body_entered(_body: Node2D) -> void:
	LevelManager.finish_zone_entered()
