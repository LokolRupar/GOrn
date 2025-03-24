extends Node

@onready var pause_menu = $"../Pause/PauseMenu"
var game_paused: bool = false
var save_path = "user://savegame.save"
@onready var Player = $"../Player"
@onready var Gor = $"../Gor"

func _ready():
	pass
		

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
	
	
	if game_paused == true:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()




func _on_resume_pressed():
	game_paused = !game_paused


func _on_return_pressed():
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")



