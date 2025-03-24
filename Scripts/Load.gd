extends Node

var save_path = "user://savegame.save"

func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(GlobalVars.tutorial)
	file.close()
	
func _on_save_pressed():
	save_game()
	
	
func load_game():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		GlobalVars.tutorial = file.get_var(GlobalVars.tutorial)
		file.close()
	else:
		GlobalVars.tutorial = 0



func _on_load_2_pressed():
	load_game()
