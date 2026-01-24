extends Area2D

@export var shooting_particles : PackedScene

var breach_position: Vector2

func _on_body_entered(body: Node2D) -> void:
	breach_position = body.global_position
	LevelManager.finish_zone_entered(self)

func _on_body_exited(_body: Node2D) -> void:
	breach_position = Vector2.ZERO

func finished() -> void:
	var temp : Node2D = shooting_particles.instantiate()
	
	temp.global_position = breach_position
	temp.global_rotation = (breach_position - self.global_position).angle()
	
	LevelManager.level_holder.add_child(temp)
	temp.emitting = true
	await get_tree().create_timer(temp.lifetime).timeout
