extends Node2D

@export var speed: float = 100.0

func _process(delta):
	position.x -= speed * delta

	if position.x < -400:
		queue_free()
