extends Control

@onready var animation_player: AnimationPlayer = $Container/AnimationPlayer

func show_transition() -> void:
	#await get_tree().create_timer(1).timeout
	animation_player.play("show")
	await animation_player.animation_finished
