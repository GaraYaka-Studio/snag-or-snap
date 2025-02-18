extends CharacterBody2D

@onready var collision_polygon: CollisionPolygon2D = $Area2D/CollisionPolygon2D
@onready var net: RayCast2D = $Net

const SPEED: float = 300.0

var screen_size: Vector2 = Vector2.ZERO

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	rotate(PI/2)

	var h_direction: float = Input.get_axis("left", "right")

	if h_direction:
		velocity.x = h_direction * SPEED
		position.x = clamp(position.x, 24, screen_size.x - 24)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if net.is_colliding():
		var collided_mob: Piranha = net.get_collider()
		if collided_mob and collided_mob is RigidBody2D:
			collided_mob.hide()
			if collided_mob.has_method("set_deferred"):
				collided_mob.set_deferred("disabled", true)

func _on_body_entered(_body: Node2D) -> void:
	hide()
	collision_polygon.set_deferred("disabled", true)
	Engine.set_time_scale(0.5)
	TransitionScreen.change_scene("res://Scenes/start_screen.tscn")
