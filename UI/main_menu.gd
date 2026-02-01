extends PanelContainer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start") && self.visible && get_parent().visible:
		LevelManager.game_manager._on_start_button_pressed()
