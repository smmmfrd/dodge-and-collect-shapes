class_name GameManager
extends Node

# TODO: Game Launched, Paused, Loading

@onready var ui: Control = %UI

@onready var main_menu: PanelContainer = %"Main Menu"
@onready var game_over: PanelContainer = %"Game Over"

func _ready() -> void:
	# Introduce ourselves
	LevelManager.set_game_manager(self)
	open_menu(main_menu)

func open_menu(menu : Control = null) -> void:
	for child in ui.get_children():
		child.visible = false
	
	if menu == null:
		return
	menu.visible = true

func all_levels_completed() -> void:
	print("okiley dokily")
	open_menu(game_over)

func _on_start_button_pressed() -> void:
	print("Begin the game")
	main_menu.visible = false
	open_menu()
	LevelManager.start_new_game()


func _on_close_button_pressed() -> void:
	print("End the game")
