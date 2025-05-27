extends Node2D

var pontos := 0

func _on_pontuou():
	pontos += 1
	print("🎯 Ponto marcado:", pontos)
	get_node("UI/PontuacaoLabel").text = str(pontos)


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
	
