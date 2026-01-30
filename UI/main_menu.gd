extends PanelContainer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start") && self.visible:
		LevelManager.game_manager._on_start_button_pressed()
