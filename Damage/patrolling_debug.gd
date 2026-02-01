@tool
extends Node2D

@export var that_guy : Node2D

const KENNEY_FUTURE_NARROW = preload("res://Assets/Kenney/kenney_ui-pack/Font/Kenney Future Narrow.ttf")

var text_color : Color = Color(1, 0.0, 0.0, 0.38)
var text_offset = (Vector2.UP + Vector2.RIGHT) * 16

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		queue_redraw()

func _draw() -> void:
	if not Engine.is_editor_hint():
		return
	
	var path = that_guy.get_children()
	path.append(that_guy)
	
	for i: int in range(len(path)):
		draw_char(KENNEY_FUTURE_NARROW, path[i].position + text_offset, str(i + 1))
