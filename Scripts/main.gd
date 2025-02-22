extends Node2D

@export var mob_scene: PackedScene

@onready var mob_spawn: PathFollow2D = $"Mob Elements/Mob Path/Mob Spawn"
@onready var mob_timer: Timer = $"Mob Elements/Mob Timer"

func _ready() -> void:
	mob_timer.start()

func _on_mob_timer_timeout() -> void:
	mob_spawn.progress_ratio = randf()

	var mob: Node = mob_scene.instantiate()
	add_child(mob)
	mob.position = mob_spawn.position

	var direction: float = mob_spawn.rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	var velocity: Vector2 = Vector2(randf_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = velocity.rotated(direction)
