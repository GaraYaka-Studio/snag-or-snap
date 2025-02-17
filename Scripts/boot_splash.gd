extends ColorRect

func _ready() -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	TransitionScreen.change_scene("res://Scenes/start_screen.tscn")
