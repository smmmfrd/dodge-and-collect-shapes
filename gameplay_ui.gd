class_name GameplayUI
extends Control

@onready var level_name_text: RichTextLabel = %"Level Name Text"
@onready var amount_text: RichTextLabel = %"Amount Text"

var collect_text = "%d/%d"
var max_collects := 0

func level_stats(level_name: String, collect_count: int) -> void:
	level_name_text.text = level_name
	max_collects = collect_count
	
	collected_amount_update(0, false)

func collected_amount_update(amount: int, _complete:bool) -> void:
	amount_text.text = collect_text % [amount, max_collects]
