extends Area2D

signal pontuou

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Bird":
		print("✅ Emitindo pontuação")
		pontuou.emit()
		queue_free()
