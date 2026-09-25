extends Object
class_name Parte

# Por default na criação, não foi comprado, altere no inspetor se quiser que seja.
@export var comprado : bool = false 

# Preço, Por default na criação, custa $100, altere no inspetor.
@export var valor : int = 100

# Nome, Por default na criação, o nome é "Peça Sem Nome" na loja e montagem, altere no inspetor. 
@export var nome : String = "Peça Sem Nome"

var pesquisa_pai : Pesquisa

func toggle_compra():
	comprado = !comprado
