class_name LoadingScreen
extends Control


func show_transition() -> void:
	await trans_rights(true)

func hide_transition() -> void:
	await trans_rights(false)

func trans_rights(show_trans: bool) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 1 if show_trans else 0, 0.5)
	
	await tween.finished
