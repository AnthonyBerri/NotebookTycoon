extends Node

@onready var PesquisaBarata : Pesquisa
@onready var PesquisaMedia : Pesquisa
@onready var PesquisaBoa : Pesquisa

func _ready():
	iniciar_pesquisas()
	

func iniciar_pesquisas():
	# Pesquisa Barata
	PesquisaBarata.Nome = "Barato"
	PesquisaBarata.Valor = 0
	PesquisaBarata.Pesquisado = true

func iniciar_partes():
	# Pesquisa Barata
	var HDDBarato : Parte
	HDDBarato.nome = "HDD Barato"
	HDDBarato.valor = 50
	HDDBarato.comprado = true
	HDDBarato
