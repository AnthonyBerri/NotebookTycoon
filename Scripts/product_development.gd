extends Control

@onready var placa_mae_options = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/OptionButton
@onready var processador_options = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/OptionButton2
@onready var ram_options = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/OptionButton3
@onready var armazenamento_options = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/OptionButton4

@onready var custo_uni_label = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/SpinBox
@onready var preco_prod = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/SpinBox
@onready var prob_label = $Janela/MarginContainer2/VBoxContainer/Stats/MarginContainer/PanelContainer/MarginContainer/Label
@onready var lucro_label = $Janela/MarginContainer2/VBoxContainer/Stats/MarginContainer/Panel2/PanelContainer2/MarginContainer2/Label2

@onready var btb_produzir = $Janela/MarginContainer2/VBoxContainer/Stats/MarginContainer/Panel/Button4

signal janela_fechada(produziu : bool, grafico : int)

var custo_total = 0

var grafico

func _ready() -> void:
	atualizar_pecas_compradas()
	atualizar_status_producao()

func _on_produzir_button_pressed():
	var pm_id = placa_mae_options.selected
	var p_id = processador_options.selected
	var rm_id = ram_options.selected
	var az_id = armazenamento_options.selected
	
	var custo_base = 150
	var custo_total_por_peca = 0
	for index in [pm_id, p_id, rm_id, az_id]:
		custo_total_por_peca += custo_base * (index + 1)

	var lucro_unitario = preco_prod.value - custo_total_por_peca

	var prob_final = calcular_probabilidade([pm_id, p_id, rm_id, az_id])
	
	# 3. Joga os dados da Sorte (RNG)
	var sorte = randi_range(1, 100)
	var resultado_do_grafico = 0
	var multiplicador_vendas = 0.0
	
	if sorte <= prob_final:
		resultado_do_grafico = 2 
		multiplicador_vendas = 1.0 
	elif sorte <= (prob_final + 20): 
		resultado_do_grafico = 1 
		multiplicador_vendas = 0.4 
	else:
		resultado_do_grafico = 0
		multiplicador_vendas = 0.1
		
	var clientes_potenciais = prob_final * 10 
	
	var unidades_vendidas = clientes_potenciais * multiplicador_vendas
	var lucro_final_do_lote = unidades_vendidas * lucro_unitario
	
	DadosGlobais.dinheiro += lucro_final_do_lote
	
	DadosGlobais.pontos += (resultado_do_grafico * 10) + 5
	
	DadosGlobais.avancar_tempo(7)
	
	#print("Clientes Potenciais: ", clientes_potenciais)
	#print("Unidades Vendidas: ", unidades_vendidas)
	#print("Lucro Entrando na Conta: $", lucro_final_do_lote)
	
	janela_fechada.emit(true, resultado_do_grafico)
	queue_free()

func _on_qualquer_peca_item_selected():
	atualizar_status_producao()

func atualizar_status_producao():
	var custo_base = 150
	#custo_total = custo_base * quantidade_spinbox.value
	
	custo_uni_label.text = formatar_dinheiro_tycoon(custo_total)

func formatar_dinheiro_tycoon(valor: float) -> String:
	var sufixos = ["", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc"]
	var index = 0
	var valor_reduzido = float(valor)
	
	while valor_reduzido >= 1000.0 and index < sufixos.size() - 1:
		valor_reduzido /= 1000.0
		index += 1
		
	if index == 0:
		return "$ %d" % valor_reduzido
	else:
		return "$ %.1f%s" % [valor_reduzido, sufixos[index]]

func atualizar_pecas_compradas():
	if (DadosCompra.HddRComprado == false): 
		armazenamento_options.set_item_disabled(0, true)
		armazenamento_options.selected = -1
	if (DadosCompra.HddMComprado == false): armazenamento_options.set_item_disabled(1, true)
	if (DadosCompra.HddBComprado == false): armazenamento_options.set_item_disabled(2, true)
	
	if (DadosCompra.RamRComprada == false): 
		ram_options.set_item_disabled(0, true)
		ram_options.selected = -1
	if (DadosCompra.RamMComprada == false): ram_options.set_item_disabled(1, true)
	if (DadosCompra.RamBComprada == false): ram_options.set_item_disabled(2, true)
	
	if (DadosCompra.MbrRComprada == false): 
		placa_mae_options.set_item_disabled(0, true)
		placa_mae_options.selected = -1
	if (DadosCompra.MbrMComprada == false): placa_mae_options.set_item_disabled(1, true)
	if (DadosCompra.MbrBComprada == false): placa_mae_options.set_item_disabled(2, true)
	
	if (DadosCompra.CpuRComprada == false): 
		processador_options.set_item_disabled(0, true)
		processador_options.selected = -1
	if (DadosCompra.CpuMComprada == false): processador_options.set_item_disabled(1, true)
	if (DadosCompra.CpuBComprada == false): processador_options.set_item_disabled(2, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var pm_id = placa_mae_options.selected
	var p_id = processador_options.selected
	var rm_id = ram_options.selected
	var az_id = armazenamento_options.selected
	
	atualizar_status_producao_index([pm_id, p_id, rm_id, az_id])
	
func atualizar_status_producao_index(indexes: Array[int]):
	var custo_base = 150
	var custo_total_por_peca = 0
	for index in indexes:
		custo_total_por_peca += custo_base * (index + 1)
		
	custo_uni_label.text = formatar_dinheiro_tycoon(custo_total_por_peca)
		 
	custo_total = (int(preco_prod.value) - custo_total_por_peca)
	lucro_label.text = "Lucro/produto: [" + formatar_dinheiro_tycoon(custo_total) + "]"
	if(custo_total_por_peca > preco_prod.value):
		preco_prod.value = int(custo_uni_label.text)
		
	var probabilidade = calcular_probabilidade(indexes)
	prob_label.text = "Probabilidade de sucesso: [" + str(probabilidade) + "%]"
	
func calcular_probabilidade(indexes: Array[int]) -> int:
	var chance: int = 30 
	
	var max_tier = 0
	var min_tier = 2
	
	for tier in indexes:
		chance += tier * 15
		
		if tier > max_tier: max_tier = tier
		if tier < min_tier: min_tier = tier
		
	var diferenca = max_tier - min_tier
	if diferenca == 2:
		chance -= 35
	elif diferenca == 1:
		chance -= 10
		
	return clamp(chance, 0, 100)


func _on_button_3_pressed() -> void:
	janela_fechada.emit(false, -1)
	queue_free()


func _on_spin_box_value_changed(value: float) -> void:
	if(int(custo_uni_label.text) > value):
		preco_prod.value = int(custo_uni_label.text)
