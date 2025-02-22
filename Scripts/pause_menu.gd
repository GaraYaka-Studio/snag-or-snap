extends Control

func pause_resume() -> void:
	if get_tree().paused:
		$PanelContainer.hide()
		$AnimationPlayer.play_backwards("blur")
		await $AnimationPlayer.animation_finished
		hide()
		get_tree().paused = false
	else:
		get_tree().paused = true
		$PanelContainer.show()
		show()
		$AnimationPlayer.play("blur")

func _ready() -> void:
	hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_resume()

func _on_resume_pressed() -> void:
	pause_resume()

func _on_restart_pressed() -> void:
	pause_resume()
	TransitionScreen.change_scene("res://Scenes/main.tscn")

func _on_start_screen_pressed() -> void:
	get_tree().paused = false
	TransitionScreen.change_scene("res://Scenes/start_screen.tscn")
