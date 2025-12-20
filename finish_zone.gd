extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	if LevelManager.level_completed():
		print("Level is finished!")
	else:
		print("Get back out there!")
