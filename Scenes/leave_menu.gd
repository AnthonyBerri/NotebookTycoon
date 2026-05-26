extends Button

@onready var parent = $"../"

func _on_pressed() -> void:
	parent.visible = false
