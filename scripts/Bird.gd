extends CharacterBody2D

@export var gravity: float = 1000.0
@export var jump_force: float = -350.0

var vivo := true

func _physics_process(delta):
	if not vivo:
		return

	# Aplica gravidade constantemente
	velocity.y += gravity * delta

	# Quando o jogador aperta a tecla "pulo", aplica força para cima
	if Input.is_action_just_pressed("pulo"):
		velocity.y = jump_force

	# Move o personagem verticalmente
	move_and_slide()

func morrer():
	if vivo:
		vivo = false
		velocity = Vector2.ZERO
		set_physics_process(false)
		print("💀 GAME OVER")


func _on_sensor_colisao_body_entered(body: Node2D) -> void:
	print("💡 Colidiu com:", body.name)

	if body.is_in_group("obstaculo"):
		print("💥 Colidiu com obstáculo")
		morrer() # Replace with function body.
