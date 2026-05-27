extends Node

@onready var btn_criacao = $HUD/BBar/DevBtn2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dev_btn_2_pressed() -> void:
	var cena_ui = preload("res://Scenes/ProductDevelopment.tscn")
	var instancia_ui = cena_ui.instantiate()
	$HUD.add_child(instancia_ui)
	$HUD/BBar.hide()
	$HUD.move_child(instancia_ui, 0)
