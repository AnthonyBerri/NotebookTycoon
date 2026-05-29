extends Panel

@onready var HddBtn = $"Filtros/HddBtn"
@onready var RamBtn = $"Filtros/RamBtn"
@onready var MbrBtn = $"Filtros/MbrBtn"
@onready var CPUBtn = $"Filtros/CPUBtn"
@onready var Filtros = $"Filtros"
@onready var Itens = $"ItensCompra"

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
	Filtros.visible = !comprar
	Itens.visible = comprar

func _on_leave_menu_janela_fechada() -> void:
	janela_fechada.emit()
	queue_free()
