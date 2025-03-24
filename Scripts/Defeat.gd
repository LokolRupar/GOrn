extends Node2D


# Screen when a player dies
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
