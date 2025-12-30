class_name LevelHolder
extends Node2D

var current_level_index := -1
@export var levels : Array[PackedScene]

func _ready() -> void:
	LevelManager.set_level_holder(self)

func next_level() -> bool:
	current_level_index += 1
	if current_level_index >= len(levels):
		return true
	print("Loading Level " + str(current_level_index) + ".")
	# Destroy old level
	for n in self.get_children():
		self.remove_child(n)
		n.queue_free()
	
	# Instantiate next level
	var temp : Node2D = levels[current_level_index].instantiate()
	temp.global_position = self.global_position
	self.add_child(temp)
	
	# TODO
	# Let level manager know we are done (for animations)
	
	return false
