extends Node

var game_manager : GameManager

var level_holder : LevelHolder

var player_spawn : PlayerSpawn = null

var coll_count := 0
var collected_count := 0

func set_game_manager(manager: GameManager) -> void:
	game_manager = manager

func start_new_game() -> void:
	#print("Starting new game")
	# Clear out all old game data!
	level_holder.reset()
	
	start_next_level()


func set_level_holder(holder: LevelHolder) -> void:
	level_holder = holder

func set_player_spawn(spawn: PlayerSpawn) -> void:
	player_spawn = spawn

func finish_zone_entered() -> void:
	if not level_completed():
		return
	
	start_next_level()

func start_next_level() -> void:
	#print("Level is finished, transitioning to next.")
	# Complete level animation
	
	# Clear current level data
	reset_collectables()
	player_spawn = null
	
	var levels_complete := level_holder.levels_complete()
	
	if levels_complete:
		#print("All levels completed.")
		game_manager.all_levels_completed()
		return
	
	# Loading screen
	await game_manager.show_loading_screen()
	
	# Load next level
	level_holder.next_level()

func begin_level() -> void:
	# Let the UI update
	await game_manager.level_started()
	
	#await get_tree().create_timer(0.5).timeout
	
	player_spawn.spawn_player()

#region Pausing

var paused: bool = false
func toggle_paused() -> void:
	paused = !paused

#endregion

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

#region Reset Level

func player_collided(player : Node2D) -> void:
	if not player.is_in_group("Player"):
		return
	
	print("Player hit something, starting them over.")
	player.queue_free()
	# Player death feedback.
	
	# Wait a bit...
	await get_tree().create_timer(0.5).timeout
	
	# Begin level again.
	begin_level()

#endregion
