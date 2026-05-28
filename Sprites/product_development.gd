extends Control

@onready var placa_mae_options = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/OptionButton
@onready var processador_options = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/OptionButton2
@onready var ram_options = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/OptionButton3
@onready var armazenamento_options = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/OptionButton4

@onready var quantidade_spinbox = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/SpinBox

@onready var prob_label = $Janela/MarginContainer2/VBoxContainer/Stats/MarginContainer/PanelContainer/MarginContainer/Label
@onready var total_label = $Janela/MarginContainer2/VBoxContainer/Stats/MarginContainer/Panel2/PanelContainer2/MarginContainer2/Label2

@onready var btb_produzir = $Janela/MarginContainer2/VBoxContainer/Stats/MarginContainer/Panel/Button4

signal janela_fechada

var custo_total = 0

func _ready() -> void:
	atualizar_status_producao()

func _on_produzir_button_pressed():
	var quantidade = quantidade_spinbox.value
	DadosGlobais.dinheiro -= custo_total
	print("Iniciando fabricação de ", quantidade, " notebooks!")

func _on_qualquer_peca_item_selected(index):
	atualizar_status_producao()

func atualizar_status_producao():
	var custo_base = 150
	custo_total = custo_base * quantidade_spinbox.value
	
	total_label.text = "Dinheiro gasto/prod: [$" + formatar_dinheiro_tycoon(custo_total) + "]"

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
		 
	custo_total = custo_total_por_peca * quantidade_spinbox.value
	total_label.text = "Dinheiro gasto/prod: [$" + formatar_dinheiro_tycoon(custo_total) + "]"
	

func _on_button_3_pressed() -> void:
	janela_fechada.emit()
	queue_free()
