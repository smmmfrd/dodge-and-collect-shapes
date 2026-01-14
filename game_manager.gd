class_name GameManager
extends Node

# TODO: Loading, Level Complete

@onready var ui: Control = %UI

@onready var main_menu: PanelContainer = %"Main Menu"
@onready var game_over: PanelContainer = %"Game Over"

@onready var gameplay_ui: Control = %"Gameplay UI"
@onready var loading_screen: LoadingScreen = %"Loading Screen"

func _ready() -> void:
	# Introduce ourselves
	LevelManager.set_game_manager(self)
	
	gameplay_ui.visible = false
	
	open_menu(main_menu)
	
	# Half a second wait on boot for splash screen
	# TODO - splash screen
	await get_tree().create_timer(0.5).timeout
	
	await hide_loading_screen()

func open_menu(menu : Control = null) -> void:
	for child in ui.get_children():
		child.visible = false
	
	if menu == null:
		ui.visible = false
		return
	
	ui.visible = true
	menu.visible = true

func all_levels_completed() -> void:
	#print("okiley dokily")
	open_menu(game_over)

func _on_start_button_pressed() -> void:
	await show_loading_screen()
	
	open_menu()
	LevelManager.start_new_game()


func _on_close_button_pressed() -> void:
	print("End the game")


func _on_pause_button_pressed() -> void:
	#print("pausing")
	LevelManager.toggle_paused()

func level_started() -> void:
	# The level has begun.
	# Gameplay UI
	gameplay_ui.visible = true
	
	await hide_loading_screen()
	pass

func show_loading_screen() -> void:
	loading_screen.visible = true
	await loading_screen.show_transition()

func hide_loading_screen() -> void:
	await loading_screen.hide_transition()
	loading_screen.visible = false
