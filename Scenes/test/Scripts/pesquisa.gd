extends Object
class_name Pesquisa

# Por default na criação, não foi pesquisado, altere no script compra_machine se quiser que seja.
@export var Pesquisado : bool = false 

# Preço, Por default na criação, custa 100 pontos, altere no script compra_machine.
@export var Valor : int = 100

# Nome, Por default na criação, o nome é "Pesquisa Sem Nome" no menu de pesquisa, altere no script compra_machine. 
@export var Nome : String = "Pesquisa Sem Nome"

func toggle_pesquisa():
	Pesquisado = !Pesquisado
