extends Control

@onready var lista = $ListaCompra
@onready var botao = $CompraBtn
var item : String

func _on_buy_menu_atualizar_lista(oi: String) -> void:
	botao.visible = true
	item = oi
	
	lista.set_item_text(0, "%s barata" % oi)
	lista.set_item_text(1, "%s mediana" % oi)
	lista.set_item_text(2, "%s ruim" % oi)
	
	if (oi == "Armazenamento"):
		lista.set_item_text(0, "Armazenamento barato")
		lista.set_item_text(1, "Armazenamento mediano") # Usa pronome diferente, sei lá
		if (DadosCompra.HddRComprado == true):
			lista.set_item_disabled(0, true)
		if (DadosCompra.HddMComprado == true):
			lista.set_item_disabled(1, true)
		if (DadosCompra.HddBComprado == true):
			lista.set_item_disabled(2, true)
			
	elif (oi == "RAM"):
		if (DadosCompra.RamRComprada == true):
			lista.set_item_disabled(0, true)
		if (DadosCompra.RamMComprada == true):
			lista.set_item_disabled(1, true)
		if (DadosCompra.RamBComprada == true):
			lista.set_item_disabled(2, true)
			
	elif (oi == "Placa Mãe"):
		if (DadosCompra.MbrRComprada == true):
			lista.set_item_disabled(0, true)
		if (DadosCompra.MbrMComprada == true):
			lista.set_item_disabled(1, true)
		if (DadosCompra.MbrBComprada == true):
			lista.set_item_disabled(2, true)
			
	elif (oi == "Processador"):
		if (DadosCompra.CpuRComprada == true):
			lista.set_item_disabled(0, true)
		if (DadosCompra.CpuMComprada == true):
			lista.set_item_disabled(1, true)
		if (DadosCompra.CpuBComprada == true):
			lista.set_item_disabled(2, true)
			
	else:
		botao.visible = false
		assert(false, "Erro: Lista %s não existe" % oi)

func _on_button_pressed() -> void:
	# TODO: Deus me perdoe, estou prestes a pecar.
	if (item == "Armazenamento"):
		if (lista.selected == 0 && DadosGlobais.dinheiro >= DadosCompra.HddRPreco):
			DadosCompra.HddRComprado = true
			lista.set_item_disabled(0, true)
			lista.selected = -1
		elif (lista.selected == 1 && DadosGlobais.dinheiro >= DadosCompra.HddMPreco):
			DadosCompra.HddMComprado = true
			lista.set_item_disabled(1, true)
			lista.selected = -1
		elif (lista.selected == 2 && DadosGlobais.dinheiro >= DadosCompra.HddBPreco):
			DadosCompra.HddBComprado = true
			lista.set_item_disabled(2, true)
			lista.selected = -1
	elif (item == "RAM"):
		if (lista.selected == 0 && DadosGlobais.dinheiro >= DadosCompra.RamRPreco):
			DadosCompra.RamRComprada = true
			lista.set_item_disabled(0, true)
			lista.selected = -1
		elif (lista.selected == 1 && DadosGlobais.dinheiro >= DadosCompra.RamMPreco):
			DadosCompra.RamMComprada = true
			lista.set_item_disabled(1, true)
			lista.selected = -1
		elif (lista.selected == 2 && DadosGlobais.dinheiro >= DadosCompra.RamBPreco):
			DadosCompra.RamBComprada = true
			lista.set_item_disabled(2, true)
			lista.selected = -1
	if (item == "Placa Mãe"):
		if (lista.selected == 0 && DadosGlobais.dinheiro >= DadosCompra.MbrRPreco):
			DadosCompra.MbrRComprada = true
			lista.set_item_disabled(0, true)
			lista.selected = -1
		elif (lista.selected == 1 && DadosGlobais.dinheiro >= DadosCompra.MbrMPreco):
			DadosCompra.MbrMComprada = true
			lista.set_item_disabled(1, true)
			lista.selected = -1
		elif (lista.selected == 2 && DadosGlobais.dinheiro >= DadosCompra.MbrBPreco):
			DadosCompra.MbrBComprada = true
			lista.set_item_disabled(2, true)
			lista.selected = -1
	if (item == "CPU"):
		if (lista.selected == 0 && DadosGlobais.dinheiro >= DadosCompra.CpuRPreco):
			DadosCompra.CpuRComprada = true
			lista.set_item_disabled(0, true)
			lista.selected = -1
		elif (lista.selected == 1 && DadosGlobais.dinheiro >= DadosCompra.CpuMPreco):
			DadosCompra.CpuMComprada = true
			lista.set_item_disabled(1, true)
			lista.selected = -1
		elif (lista.selected == 2 && DadosGlobais.dinheiro >= DadosCompra.CpuBPreco):
			DadosCompra.CpuBComprada = true
			lista.set_item_disabled(2, true)
			lista.selected = -1
