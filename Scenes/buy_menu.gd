extends Panel

@onready var HddBtn = $"Filtros/HddBtn"
@onready var RamBtn = $"Filtros/RamBtn"
@onready var MbrBtn = $"Filtros/MbrBtn"
@onready var CPUBtn = $"Filtros/CPUBtn"
@onready var Filtros: Array = [
		$Filtros/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/ListaCompra,
		$Filtros/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/CompraBtn
	] 
@onready var Itens : Array = [
	$Filtros/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HddBtn,
	$Filtros/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/RamBtn,
	$Filtros/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/MbrBtn,
	$Filtros/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/CPUBtn,
	$Filtros/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/LockBtn,
	$Filtros/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/LockBtn2,
	$Filtros/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/LockBtn3,
]

signal atualizar_lista(oi: String)
signal janela_fechada()

func _on_hdd_btn_pressed() -> void:
	toggle_btns(true)
	atualizar_lista.emit("Armazenamento")

func _on_ram_btn_pressed() -> void:
	toggle_btns(true)
	atualizar_lista.emit("RAM")

func _on_mbr_btn_pressed() -> void:
	toggle_btns(true)
	atualizar_lista.emit("Placa Mãe")

func _on_cpu_btn_pressed() -> void:
	toggle_btns(true)
	atualizar_lista.emit("Processador")

func _on_voltar_pressed() -> void:
	toggle_btns(false)

func toggle_btns(comprar: bool) -> void: # true para sumir os filtros e comprar, false pro contrário
	for Filtro in Filtros:
		Filtro.visible = comprar
	for Item in Itens:
		Item.visible = !comprar

func _on_leave_menu_janela_fechada() -> void:
	janela_fechada.emit()
	queue_free()
