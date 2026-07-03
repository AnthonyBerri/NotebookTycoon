extends Control

@onready var animador: AnimationPlayer = $Janela/MarginContainer2/VBoxContainer/EditArea/MarginContainer/PanelContainer/VBoxContainer/VBoxContainer/HBoxContainer2/PanelContainer/Label/AnimationPlayer

@onready var menuMusic = $AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_3_pressed() -> void:
	get_tree().quit()

func start_music() -> void:
	menuMusic.play()


func _on_button_4_pressed() -> void:
	animador.play("digitar")
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	menuMusic.stop()
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
