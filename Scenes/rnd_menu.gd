extends Panel

@onready var BaratoBtn = $"Research/Barato"
@onready var BaratoPts = $"Research/Barato/Pontos"
@onready var MedioBtn = $"Research/Medio"
@onready var MedioPts = $"Research/Medio/Pontos"
@onready var BomBtn = $"Research/Bom"
@onready var BomPts = $"Research/Bom/Pontos"

signal janela_fechada()

func _ready() -> void: 
	calc_preco()
	toggle_btns()

func pesquisar(qual: int) -> void:
	if(qual == 0 && DadosCompra.BaratoPreco <= DadosGlobais.pontos && DadosCompra.BaratoPesq == false):
		DadosCompra.BaratoPesq = true
		DadosGlobais.pontos -= DadosCompra.BaratoPreco
	elif(qual == 1 && DadosCompra.MedioPreco <= DadosGlobais.pontos && DadosCompra.MedioPesq == false && DadosCompra.BaratoPesq == true):
		DadosCompra.MedioPesq = true
		DadosGlobais.pontos -= DadosCompra.MedioPreco
	elif(qual == 2 && DadosCompra.BomPreco <= DadosGlobais.pontos && DadosCompra.BomPesq == false && DadosCompra.MedioPesq == true):
		DadosCompra.BomPesq = true
		DadosGlobais.pontos -= DadosCompra.BomPreco
	
	toggle_btns()

func toggle_btns() -> void:
	BaratoBtn.disabled = DadosCompra.BaratoPesq
	MedioBtn.disabled = DadosCompra.MedioPesq
	BomBtn.disabled = DadosCompra.BomPesq

func calc_preco() -> void:
	BaratoPts.text = "%s" % DadosCompra.BaratoPreco
	MedioPts.text = "%s" % DadosCompra.MedioPreco
	BomPts.text = "%s" % DadosCompra.BomPreco

func _on_barato_pressed() -> void:
	pesquisar(0)

func _on_medio_pressed() -> void:
	pesquisar(1)

func _on_bom_pressed() -> void:
	pesquisar(2)

func _on_leave_menu_janela_fechada() -> void:
	janela_fechada.emit()
	queue_free()
