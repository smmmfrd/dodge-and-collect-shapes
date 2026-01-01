extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("Player collided with a damage area.")
		LevelManager.player_collided(body)
