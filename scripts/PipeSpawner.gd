extends Node2D

@export var pipe_scene: PackedScene
@export var spawn_interval: float = 7.0
@export var pipe_speed: float = 100.0
@export var vertical_range: float = 150.0

var time_since_last_spawn := 0.0

func _process(delta):
	time_since_last_spawn += delta

	if time_since_last_spawn >= spawn_interval:
		spawn_pipe_pair()
		time_since_last_spawn = 0.0

func spawn_pipe_pair():
	var pipe_instance = pipe_scene.instantiate()
	get_parent().add_child(pipe_instance)

	# Posição inicial fora da tela
	pipe_instance.position.x = 1000
	pipe_instance.position.y = randf_range(-vertical_range, vertical_range)

	# Aplica script de movimento
	pipe_instance.set_script(preload("res://scripts/PipeMover.gd"))
	pipe_instance.speed = pipe_speed

	# Conecta o sinal de pontuação, se a ZonaDePontuacao existir
	if pipe_instance.has_node("ZonaDePontuacao"):
		var zona = pipe_instance.get_node("ZonaDePontuacao")
		zona.connect("pontuou", Callable(get_parent(), "_on_pontuou"))
