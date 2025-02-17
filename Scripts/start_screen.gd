extends Control

func _ready() -> void:
	Engine.set_time_scale(1.0)

func _on_start_pressed() -> void:
	TransitionScreen.change_scene("res://Scenes/main.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
