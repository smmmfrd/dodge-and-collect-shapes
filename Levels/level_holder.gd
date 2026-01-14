class_name LevelHolder
extends Node2D

var current_level_index := -1
@export var levels : Array[PackedScene]

func _ready() -> void:
	LevelManager.set_level_holder(self)

func reset() -> void:
	current_level_index = -1

func next_level() -> void:
	# Destroy old level
	clear_old_level(self)
	
	current_level_index += 1
	if current_level_index >= len(levels):
		return
	#print("Loading Level " + str(current_level_index) + ".")
	
	# Instantiate next level
	var temp : Node2D = levels[current_level_index].instantiate()
	temp.global_position = self.global_position
	#self.add_child()
	call_deferred("add_child", temp)
	
	# Let manager know we are done.
	LevelManager.begin_level()

func levels_complete() -> bool:
	return current_level_index == len(levels) - 1

func clear_old_level(level: Node) -> void:
	for n in level.get_children():
		n.queue_free()
