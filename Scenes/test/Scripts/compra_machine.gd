extends Node

@onready var pesquisas : Array = listar_pesquisas()

func _ready():
	print(pesquisas)

func listar_pesquisas() -> Array:
	var pesq : Array = get_children()
	
	return pesq
