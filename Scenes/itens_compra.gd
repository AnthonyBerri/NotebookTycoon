extends Control

@onready var lista = $"../../../PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/ListaCompra"
@onready var botao = $"../../../PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/CompraBtn"
@onready var sound = $"../../../../../AudioStreamPlayer2D"
var item : String

func _on_buy_menu_atualizar_lista(oi: String) -> void:
	botao.visible = true
	item = oi
	
	if(DadosCompra.BaratoPesq):
		lista.add_item("Barato", 0)
		lista.set_item_text(0, "%s barata" % oi)
	if(DadosCompra.MedioPesq):
		lista.add_item("Medio", 1)
		lista.set_item_text(1, "%s mediana" % oi)
	if(DadosCompra.BomPesq):
		lista.add_item("Bom", 2)
		lista.set_item_text(2, "%s boa" % oi)
	
	if (oi == "Armazenamento"):
		lista.set_item_text(0, "%s barato" % oi)
		lista.set_item_text(1, "%s mediano" % oi)
		lista.set_item_text(2, "%s bom" % oi)
		if (DadosCompra.HddRComprado && DadosCompra.BaratoPesq):
			lista.set_item_disabled(0, true)
		if (DadosCompra.HddMComprado && DadosCompra.MedioPesq):
			lista.set_item_disabled(1, true)
		if (DadosCompra.HddBComprado && DadosCompra.BomPesq):
			lista.set_item_disabled(2, true)
			
	elif (oi == "RAM"):
		if (DadosCompra.RamRComprada && DadosCompra.BaratoPesq):
			lista.set_item_disabled(0, true)
		if (DadosCompra.RamMComprada && DadosCompra.MedioPesq):
			lista.set_item_disabled(1, true)
		if (DadosCompra.RamBComprada && DadosCompra.BomPesq):
			lista.set_item_disabled(2, true)
			
	elif (oi == "Placa Mãe"):
		if (DadosCompra.MbrRComprada && DadosCompra.BaratoPesq):
			lista.set_item_disabled(0, true)
		if (DadosCompra.MbrMComprada && DadosCompra.MedioPesq):
			lista.set_item_disabled(1, true)
		if (DadosCompra.MbrBComprada && DadosCompra.BomPesq):
			lista.set_item_disabled(2, true)
			
	elif (oi == "Processador"):
		lista.set_item_text(0, "%s barato" % oi)
		lista.set_item_text(1, "%s mediano" % oi)
		lista.set_item_text(2, "%s bom" % oi)
		if (DadosCompra.CpuRComprada && DadosCompra.BaratoPesq):
			lista.set_item_disabled(0, true)
		if (DadosCompra.CpuMComprada && DadosCompra.MedioPesq):
			lista.set_item_disabled(1, true)
		if (DadosCompra.CpuBComprada && DadosCompra.BomPesq):
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
			sound.play()
		elif (lista.selected == 1 && DadosGlobais.dinheiro >= DadosCompra.HddMPreco):
			DadosCompra.HddMComprado = true
			lista.set_item_disabled(1, true)
			lista.selected = -1
			sound.play()
		elif (lista.selected == 2 && DadosGlobais.dinheiro >= DadosCompra.HddBPreco):
			DadosCompra.HddBComprado = true
			lista.set_item_disabled(2, true)
			lista.selected = -1
			sound.play()
	elif (item == "RAM"):
		if (lista.selected == 0 && DadosGlobais.dinheiro >= DadosCompra.RamRPreco):
			DadosCompra.RamRComprada = true
			lista.set_item_disabled(0, true)
			lista.selected = -1
			sound.play()
		elif (lista.selected == 1 && DadosGlobais.dinheiro >= DadosCompra.RamMPreco):
			DadosCompra.RamMComprada = true
			lista.set_item_disabled(1, true)
			lista.selected = -1
			sound.play()
		elif (lista.selected == 2 && DadosGlobais.dinheiro >= DadosCompra.RamBPreco):
			DadosCompra.RamBComprada = true
			lista.set_item_disabled(2, true)
			lista.selected = -1
			sound.play()
	if (item == "Placa Mãe"):
		if (lista.selected == 0 && DadosGlobais.dinheiro >= DadosCompra.MbrRPreco):
			DadosCompra.MbrRComprada = true
			lista.set_item_disabled(0, true)
			lista.selected = -1
			sound.play()
		elif (lista.selected == 1 && DadosGlobais.dinheiro >= DadosCompra.MbrMPreco):
			DadosCompra.MbrMComprada = true
			lista.set_item_disabled(1, true)
			lista.selected = -1
			sound.play()
		elif (lista.selected == 2 && DadosGlobais.dinheiro >= DadosCompra.MbrBPreco):
			DadosCompra.MbrBComprada = true
			lista.set_item_disabled(2, true)
			lista.selected = -1
			sound.play()
	if (item == "CPU"):
		if (lista.selected == 0 && DadosGlobais.dinheiro >= DadosCompra.CpuRPreco):
			DadosCompra.CpuRComprada = true
			lista.set_item_disabled(0, true)
			lista.selected = -1
			sound.play()
		elif (lista.selected == 1 && DadosGlobais.dinheiro >= DadosCompra.CpuMPreco):
			DadosCompra.CpuMComprada = true
			lista.set_item_disabled(1, true)
			lista.selected = -1
			sound.play()
		elif (lista.selected == 2 && DadosGlobais.dinheiro >= DadosCompra.CpuBPreco):
			DadosCompra.CpuBComprada = true
			lista.set_item_disabled(2, true)
			lista.selected = -1
			sound.play()
