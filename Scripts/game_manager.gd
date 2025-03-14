extends Node

@export var score: int = 0

@onready var score_label: Label = $Score
@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:
	if player and not player.is_connected("caught", update_score):
		player.connect("caught", update_score)

func update_score() -> void:
	score += 1
	score_label.text = str(score)
