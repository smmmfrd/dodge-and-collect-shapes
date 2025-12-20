extends Node

var coll_count := 0
var collected_count := 0

func add_collectable() -> void:
	coll_count += 1

func collectable_collected() -> void:
	collected_count += 1
	if collected_count == coll_count:
		print("All collectables collected.")

func level_completed() -> bool:
	return coll_count == collected_count
