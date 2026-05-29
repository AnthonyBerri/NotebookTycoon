extends Node

var dinheiro: float = 35000.0
var pontos: int = 0

var dia: int = 1
var mes: int = 1
var ano: int = 1998
var valor_aluguel: float = 9000.0

func avancar_tempo(dias_gastos: int) -> void:
	dia += dias_gastos

	while dia > 30:
		dia -= 30
		mes += 1
		
		dinheiro -= valor_aluguel
		#print("Fim do mês! Aluguel cobrado: -$", valor_aluguel, " | Saldo: $", dinheiro)
		
		if mes > 12:
			mes = 1
			ano += 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
