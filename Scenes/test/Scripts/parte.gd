extends Node

# Por default na criação, não foi comprado, altere no inspetor se quiser que seja.
@export var Comprado : bool = false 

# Preço, Por default na criação, custa $100, altere no inspetor.
@export var Valor : int = 100

# Nome, Por default na criação, o nome é "Peça Sem Nome" na loja e montagem, altere no inspetor. 
@export var Nome : String = "Peça Sem Nome"

func toggle_compra():
	Comprado = !Comprado
