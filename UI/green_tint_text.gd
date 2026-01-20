#@tool
extends RichTextEffect
class_name GreenTint

var bbcode := "greentint";

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	var start_color = Color.WHITE
	var time = char_fx.elapsed_time * 4
	char_fx.color = start_color.lerp(Color("#00e6bf"), time)
	return true
