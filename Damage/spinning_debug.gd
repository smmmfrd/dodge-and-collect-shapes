@tool
extends Node2D

@export var that_guy : Node2D

var positions = [
	Vector2.UP, Vector2.DOWN, Vector2.RIGHT, Vector2.LEFT
]

var damage_color : Color = Color(1, 0.0, 0.0, 0.38)

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		queue_redraw()

func _draw() -> void:
	if not Engine.is_editor_hint():
		return
	
	for i in range(1, that_guy.count + 1):
		draw_circle(self.position, 16 * i, Color.WHITE, false)
		for j in range(4):
			draw_circle(self.position + (positions[j] * (16 * i)), 8, damage_color)
