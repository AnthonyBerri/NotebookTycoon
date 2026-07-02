extends Button

signal janela_fechada

func _on_pressed() -> void:
	janela_fechada.emit()
