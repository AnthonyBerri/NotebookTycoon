extends Node

@onready var pesquisas : Array = listar_pesquisas()

func listar_pesquisas() -> Array:
	return get_children(false)
