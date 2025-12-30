extends Node

var level_holder : LevelHolder

var player_spawn : PlayerSpawn = null

var coll_count := 0
var collected_count := 0

func _ready() -> void:
	get_tree().create_timer(0.5).timeout.connect(start_new_game)


func start_new_game() -> void:
	print("Starting new game")
	start_next_level()


func set_level_holder(holder: LevelHolder) -> void:
	level_holder = holder

func finish_zone_entered() -> void:
	if not level_completed():
		return
	
	print("Level is finished, transitioning to next.")
	start_next_level()

func start_next_level() -> void:
	# TODO
	# Ending animation
	
	# Loading screen
	
	# Clear current level data
	reset_collectables()
	player_spawn = null
	
	# Load next level
	var levels_complete := level_holder.next_level()
	
	if not levels_complete:
		return
	
	print("All levels completed.")

func new_player_spawn(spawn: PlayerSpawn) -> void:
	player_spawn = spawn

#region Collectables
func reset_collectables() -> void:
	coll_count = 0
	collected_count = 0

func add_collectable() -> void:
	coll_count += 1

func collectable_collected() -> void:
	collected_count += 1
	if collected_count != coll_count:
		return
	
	print("All collectables collected.")


func level_completed() -> bool:
	return coll_count == collected_count

func clear_level_data() -> void:
	player_spawn = null
#endregion
