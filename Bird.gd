extends CharacterBody2D

@export var gravity: float = 1000.0
@export var jump_force: float = -350.0

func _physics_process(delta):
	# Aplica gravidade constantemente
	velocity.y += gravity * delta

	# Quando o jogador aperta a tecla "pulo", aplica força para cima
	if Input.is_action_just_pressed("pulo"):
		velocity.y = jump_force

	# Move o personagem verticalmente
	move_and_slide()
