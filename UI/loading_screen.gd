class_name LoadingScreen
extends Control

@onready var transition_player: AnimationPlayer = $"ColorRect/Transition Player"

func show_transition() -> void:
	await play_animation("show")

func hide_transition() -> void:
	await play_animation("hide")

func play_animation(animation: String) -> void:
	transition_player.play(animation)
	await transition_player.animation_finished
