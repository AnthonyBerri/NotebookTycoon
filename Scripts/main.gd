extends Node

@onready var bloco_de_notas_label = $HUD/Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bloco_de_notas_label.text = "Aluguel vence em - " + str(30 - DadosGlobais.dia) + " dias" + "\nValor do aluguel: $ " + str(DadosGlobais.valor_aluguel)
	$AudioStreamPlayer2D.play()
	startMusic()
	
func startMusic() -> void:
	await get_tree().create_timer(4.0).timeout
	$AudioStreamPlayer2D2.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer2/MoneyBg/Money.text = "$ " + str(DadosGlobais.dinheiro)
	$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer2/PointsBg/Points.text = str(DadosGlobais.pontos)
	$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer2/Date.text = str(DadosGlobais.dia) + "/" + str(DadosGlobais.mes) + "/" + str(DadosGlobais.ano)

func _on_dev_btn_2_pressed() -> void:
	var cena_ui = preload("res://Scenes/ProductDevelopment.tscn")
	var instancia_ui = cena_ui.instantiate()
	$HUD.add_child(instancia_ui)
	$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer/DevBtn2.disabled = true
	$HUD.move_child(instancia_ui, 0)
	instancia_ui.janela_fechada.connect(_on_product_development_fechado)
	instancia_ui.scale = Vector2(0.1, 0.1)
	
	instancia_ui.pivot_offset = instancia_ui.size / 2.0 

	var tween = create_tween()

	tween.set_trans(Tween.TRANS_BACK) 
	tween.set_ease(Tween.EASE_OUT)

	tween.tween_property(instancia_ui, "scale", Vector2(1.0, 1.0), 0.3)


func _on_buy_btn_pressed() -> void:
	var cena_ui = preload("res://Scenes/buy_menu.tscn")
	var instancia_ui = cena_ui.instantiate()
	
	instancia_ui.janela_fechada.connect(_on_buy_product_fechado)
	
	
	$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer/BuyBtn.disabled = true
	$HUD.add_child(instancia_ui)
	
	instancia_ui.scale = Vector2(0.1, 0.1)
	
	instancia_ui.pivot_offset = instancia_ui.size / 2.0 

	var tween = create_tween()

	tween.set_trans(Tween.TRANS_BACK) 
	tween.set_ease(Tween.EASE_OUT)

	tween.tween_property(instancia_ui, "scale", Vector2(1.0, 1.0), 0.3)

func _on_rn_d_btn_3_pressed() -> void:
	var cena_ui = preload("res://Scenes/RnDMenu.tscn")
	var instancia_ui = cena_ui.instantiate()
	var signal_script = instancia_ui.get_node("MarginContainer2/VBoxContainer/Titulo/HBoxContainer/Control/HBoxContainer/Button3")
	
	signal_script.janela_fechada.connect(_on_rnd_menu_fechado)
	
	
	$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer/RnDBtn3.disabled = true
	$HUD.add_child(instancia_ui)
	
	instancia_ui.scale = Vector2(0.1, 0.1)
	
	instancia_ui.pivot_offset = instancia_ui.size / 2.0 

	var tween = create_tween()

	tween.set_trans(Tween.TRANS_BACK) 
	tween.set_ease(Tween.EASE_OUT)

	tween.tween_property(instancia_ui, "scale", Vector2(1.0, 1.0), 0.3)


func _on_buy_product_fechado():
	$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer/BuyBtn.disabled = false

func _on_rnd_menu_fechado():
	$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer/RnDBtn3.disabled = false

func _on_product_development_fechado(produziu : bool, grafico : int):
	if(produziu == true && grafico >= 0):
		var cena_graficos = preload("res://Scenes/Graphic.tscn")
		var instancia_ui = cena_graficos.instantiate()
		$HUD.add_child(instancia_ui)
		$HUD.move_child(instancia_ui, 0)
		instancia_ui.janela_fechada.connect(_on_graphic_fechado)
		instancia_ui.mudar_grafico(grafico)
		bloco_de_notas_label.text = "Aluguel vence em - " + str(30 - DadosGlobais.dia) + " dias" + "\nValor do aluguel: $ " + str(DadosGlobais.valor_aluguel)
	elif(produziu == false && grafico < 0):
		$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer/DevBtn2.disabled = false
		
func _on_graphic_fechado():
	$HUD/BBar/MarginContainer/HBoxContainer/HBoxContainer/DevBtn2.disabled = false
		
		
