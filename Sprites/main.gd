extends Node

@onready var btn_criacao = $HUD/BBar/DevBtn2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$HUD/TBar/MoneyBg/Money.text = "$ " + str(DadosGlobais.dinheiro)


func _on_dev_btn_2_pressed() -> void:
	var cena_ui = preload("res://Scenes/ProductDevelopment.tscn")
	var instancia_ui = cena_ui.instantiate()
	$HUD.add_child(instancia_ui)
	$HUD/BBar.hide()
	$HUD.move_child(instancia_ui, 0)
	instancia_ui.janela_fechada.connect(_on_product_development_fechado)


func _on_buy_btn_pressed() -> void:
	var cena_ui = preload("res://Scenes/buy_menu.tscn")
	var instancia_ui = cena_ui.instantiate()
	var signal_script = instancia_ui.get_node("TBar/LeaveMenu")
	
	signal_script.janela_fechada.connect(_on_buy_product_fechado)
	
	
	$HUD/BBar/BuyBtn.disabled = true
	$HUD.add_child(instancia_ui)

func _on_buy_product_fechado():
	
	$HUD/BBar/BuyBtn.disabled = false
	
func _on_product_development_fechado():
	$HUD/BBar.show()
