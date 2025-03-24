extends Node2D

@onready var anim = $AnimationPlayer
var save_path = "user://savegame.save"

func _ready():
	levels()
	
	
	
func levels():
	anim.play("FadeOut")
	await anim.animation_finished

	# ChangeScene tutorial system
	if GlobalVars.tutorial == true:
		$Level1.position.y = 45

	# ChangeScene level_1 system
	if GlobalVars.level1 == true:
		$Level2.position.y = 45
		
	# level_2 system
	if GlobalVars.level2 == true:
		$Level3.position.y = 240
		
	# level_3+1 system
	if GlobalVars.level3_1 == true:
		$Level3.position.y = 240

# Tutorial
func _on_button_pressed():
	anim.play("FadeIn")
	await anim.animation_finished
	if anim.animation_finished:
		get_tree().change_scene_to_file("res://Scenes/main_world.tscn")


# Level 1
func _on_button_2_pressed():
	anim.play("FadeIn")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")


# Level 2
func _on_level_2_pressed():
	anim.play("FadeIn")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	
	
# Level 3
func _on_level_3_pressed():
	anim.play("FadeIn")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Scenes/level_3.tscn")


func _on_level_31_pressed():
	anim.play("FadeIn")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Scenes/level_3+1.tscn")







	
