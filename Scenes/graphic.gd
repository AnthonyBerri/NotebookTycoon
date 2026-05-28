extends Control

@onready var Ruim = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Panel/Ruim
@onready var Medio = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Panel/Medio
@onready var Bom = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Panel/Bom

signal grafico(qual: int)

func _on_grafico(qual: int) -> void:
	# 0 Ruim, 1 Medio, 2 Bom
	match qual:
		0:
			Ruim.visible = true
			Medio.visible = false
			Bom.visible = false
		1:
			Ruim.visible = false
			Medio.visible = true
			Bom.visible = false
		2:
			Ruim.visible = false
			Medio.visible = false
			Bom.visible = true
