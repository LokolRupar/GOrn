extends Node2D

@onready var anim = $AnimationPlayer
var save_path = "user://savegame.save"

func _ready():
	Music.stop()
	animation()
	
	
	
func animation():
	anim.play("FadeOut")
	await anim.animation_finished




	

func _on_change_scene_body_entered(body):
	if body.name == "Player" or body.name == "Gor":
		GlobalVars.tutorial = true
		get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
		
		

	
