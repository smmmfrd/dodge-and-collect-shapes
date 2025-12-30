extends Node2D

func _ready() -> void:
	get_tree().create_timer(0.5).timeout.connect(start_level)

func start_level() -> void:
	print("start it up!")
	# Spawn Collectables
	# Need to get a list of them, and store their locations here and respawn them on level restart.
	
	# Spawn Player
	LevelManager.player_spawn.spawn_player()
	pass
