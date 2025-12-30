class_name PlayerSpawn
extends Marker2D

@export var player_scene : PackedScene


func _ready() -> void:
	LevelManager.new_player_spawn(self)

func spawn_player() -> void:
	var player : Node2D = player_scene.instantiate()
	
	player.global_position = self.global_position
	
	self.get_parent().add_child(player)
