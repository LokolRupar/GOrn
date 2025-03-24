extends Node

var save = "user://savegame.save"


func save_game():
	var file = FileAccess.open(save, FileAccess.WRITE)
	file.store_var(GlobalVars.tutorial)
	file.store_var(GlobalVars.level1)
	file.store_var(GlobalVars.level2)
	file.store_var(GlobalVars.level3)
	file.store_var(GlobalVars.level3_1)
	
	
func _on_save_pressed():
	save_game()
