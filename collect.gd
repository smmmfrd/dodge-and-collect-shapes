class_name Collectable
extends Area2D

func _ready() -> void:
	LevelManager.add_collectable()

func _on_body_entered(_body: Node2D) -> void:
	LevelManager.collectable_collected()
	queue_free()
