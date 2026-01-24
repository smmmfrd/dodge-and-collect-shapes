extends Area2D

const SHOOTING_PARTICLES = preload("res://Entities/shooting_particles.tscn")

var contained: Node2D

func _on_body_entered(body: Node2D) -> void:
	LevelManager.finish_zone_entered(self)
	contained = body

func _on_body_exited(_body: Node2D) -> void:
	contained = null

func finished() -> void:
	print("oh boy oh boy")
