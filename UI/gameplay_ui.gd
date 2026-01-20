class_name GameplayUI
extends Control

@onready var level_name_text: RichTextLabel = %"Level Name Text"
@onready var amount_text: RichTextLabel = %"Amount Text"

var effect_duration = 0.25


var collect_text = "%d/%d"
var animated_collect_text = "[greentint][wave amp=-36 freq=10]%d[/wave][/greentint]/%d"
var max_collects := 0


func level_stats(level_name: String, collect_count: int) -> void:
	level_name_text.text = level_name
	max_collects = collect_count
	
	amount_text.text = collect_text % [0, max_collects]

func collected_amount_update(amount: int, _complete:bool) -> void:
	amount_text.text = animated_collect_text % [amount, max_collects]
	
	await get_tree().create_timer(effect_duration).timeout
	
	amount_text.text = collect_text % [amount, max_collects]
