extends RigidBody2D

@export var player_scene: PackedScene

@export var min_speed: float = 150.0
@export var max_speed: float = 250.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.play()

	var piranha_types: Array = animated_sprite.sprite_frames.get_animation_names()
	animated_sprite.animation = piranha_types[randi() % piranha_types.size()]

func _on_visible_on_screen_notifier_screen_exited() -> void:
	queue_free()
