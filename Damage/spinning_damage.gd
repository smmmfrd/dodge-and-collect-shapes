extends Node2D

const MOVING_DAMAGE = preload("res://Damage/moving_damage.tscn")

@export var count : int = 1

@export var rotation_speed : float = 1.5

var DIRECTIONS = [
	Vector2.UP, Vector2.DOWN, Vector2.RIGHT, Vector2.LEFT
]

func _ready() -> void:
	for i in range(1, count + 1):
		spawn_damages(i)

func spawn_damages(depth: int) -> void:
	for i in range(4):
		var temp : Node2D = MOVING_DAMAGE.instantiate()
		
		temp.global_position =  DIRECTIONS[i] * (16 * depth)
		
		self.add_child(temp)

func _process(delta: float) -> void:
	if LevelManager.paused:
		return
	
	self.rotation += rotation_speed * delta
	if self.rotation > 360:
		self.rotation -= 360
