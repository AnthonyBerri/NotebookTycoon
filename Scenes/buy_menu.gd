extends Panel

@onready var HddBtn = $"Filtros/HddBtn"
@onready var RamBtn = $"Filtros/RamBtn"
@onready var MbrBtn = $"Filtros/MbrBtn"
@onready var CPUBtn = $"Filtros/CPUBtn"
@onready var Filtros = $"Filtros"
@onready var Itens = $"ItensCompra"

func _on_hdd_btn_pressed() -> void:
	toggle_btns(true)

func _on_ram_btn_pressed() -> void:
	toggle_btns(true)

func _on_mbr_btn_pressed() -> void:
	toggle_btns(true)

func _on_cpu_btn_pressed() -> void:
	toggle_btns(true)

func _on_voltar_pressed() -> void:
	toggle_btns(false)

func toggle_btns(comprar: bool) -> void:
	Filtros.visible = !comprar
	Itens.visible = comprar
