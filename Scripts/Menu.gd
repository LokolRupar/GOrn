extends Node2D

@onready var anim = $AnimationPlayer


func _ready():
	Music.play_music_level()
	animation()
	
	
func animation():
	anim.play("FadeOut")
	await anim.animation_finished
	
	
# Play
func _on_play_pressed():
	anim.play("FadeIn")
	await anim.animation_finished
	if anim.animation_finished:
		get_tree().change_scene_to_file("res://Scenes/main_world.tscn")


# Quit
func _on_quit_pressed():
	get_tree().quit()
