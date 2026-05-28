extends Button

@onready var parent = $"../../"

signal janela_fechada

func _on_pressed() -> void:
	janela_fechada.emit()
	
	parent.queue_free()
