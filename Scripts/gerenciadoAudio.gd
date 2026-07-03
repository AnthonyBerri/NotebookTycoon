extends Node

var som_clique: AudioStreamPlayer
var timer_ambiente: Timer

# Lista com os caminhos dos seus arquivos de áudio
# Ajuste os nomes extamente como estão na sua pasta 'Audio'
var lista_de_sons: Array = [
	"res://Audio/magiaz-teclado-371743.mp3",
	"res://Audio/freesound-community-mouse-clicks-mouse-double-clicks-26939_AB55jkN8.mp3"# Só adicione se fizer sentido no loop
]

func _ready() -> void:
	# 1. Configura o player de áudio
	som_clique = AudioStreamPlayer.new()
	add_child(som_clique)
	
	# Controla o volume (Valores negativos deixam mais baixo)
	# -15.0 ou -20.0 dB costuma ser ideal para som de fundo bem sutil
	som_clique.volume_db = -18.0 
	
	# 2. Cria o Timer para controlar o tempo dos sons
	timer_ambiente = Timer.new()
	add_child(timer_ambiente)
	
	# Conecta o alarme do timer para disparar a função de tocar
	timer_ambiente.timeout.connect(_on_timer_timeout)
	
	# Inicia o ciclo iniciando o primeiro som
	_definir_proximo_som()

func _definir_proximo_som() -> void:
	# Escolhe um tempo aleatório entre os sons (ex: entre 0.4 e 1.5 segundos)
	var tempo_espera = randf_range(1.5, 5.0)
	
	timer_ambiente.start(tempo_espera)

func _on_timer_timeout() -> void:
	# Sorteia um dos sons da sua lista para tocar
	var som_sorteado = lista_de_sons.pick_random()
	
	# Carrega e toca apenas se o arquivo existir
	if ResourceLoader.exists(som_sorteado):
		som_clique.stream = load(som_sorteado)
		som_clique.play()
	
	# Reinicia o ciclo com um novo tempo aleatório
	_definir_proximo_som()
