extends Node2D

@onready var anim = $AnimationPlayer
@onready var player = $Player

var is_falling = false # Флаг для начала падения
var fall_speed = 200

func _ready():
	Music.stop()
	animation()

	
func animation():
	anim.play("FadeOut")
	await anim.animation_finished
	

# spikes
func _on_spike_del_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene() 

# Player on spikes
func _on_spike_del_2_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene() 

# Fake parkour
func _on_jump_body_entered(body):
	if body.name == "Player":
		body.velocity.y -= 500

# Hide TileMap
func _on_show_tile_map_body_entered(body):
	if body.name == "Player":
		var tween1 = get_tree().create_tween()
		tween1.tween_property($FakeTilemaps/FakeTileMap, "modulate:a", 0.0, 2)

# Show TileMap
func _on_show_tile_map_body_exited(body):
	if body.name == "Player":
		var tween2 = get_tree().create_tween()
		tween2.tween_property($FakeTilemaps/FakeTileMap, "modulate:a", 1.0, 2)

# Show OrnText
func _on_show_orn_text_body_entered(body):
	if body.name == "Player":
		var tween3 = get_tree().create_tween()
		tween3.tween_property($HelpText/OrnText, "self_modulate:a", 1.0, 2)
		tween3.tween_property($HelpText/OrnText2, "self_modulate:a", 1.0, 2)

# Hide OrnText
func _on_show_orn_text_body_exited(body):
	if body.name == "Player":
		var tween5 = get_tree().create_tween()
		tween5.tween_property($HelpText/OrnText, "self_modulate:a", 0.0, 2)
		tween5.tween_property($HelpText/OrnText2, "self_modulate:a", 0.0, 2)

# Show Floor
func _on_add_floor_body_entered(body):
	if body.name == "Player":
		$TileMap2.position.y = -368.045
		var tween6 = get_tree().create_tween()
		tween6.tween_property($TileMap2, "modulate:a", 1.0, 2)

# Show GOrnText
func _on_orn_gor_text_body_entered(body):
	if body.name == "Player":
		var tween7 = get_tree().create_tween()
		tween7.tween_property($HelpText/OrnText3, "self_modulate:a", 1.0, 2)
		tween7.tween_property($HelpText/GorText3, "self_modulate:a", 1.0, 2)

# Hide GOrnText
func _on_orn_gor_text_body_exited(body):
	if body.name == "Player":
		var tween8 = get_tree().create_tween()
		tween8.tween_property($HelpText/OrnText3, "self_modulate:a", 0.0, 2)
		tween8.tween_property($HelpText/GorText3, "self_modulate:a", 0.0, 2)

# Show GorText
func _on_show_gor_text_body_entered(body):
	if body.name == "Player" and "Gor":
		var tween9 = get_tree().create_tween()
		tween9.tween_property($HelpText/GorText, "self_modulate:a", 1.0, 2)
		tween9.tween_property($HelpText/GorText2, "self_modulate:a", 1.0, 2)

# Hide GorText
func _on_show_gor_text_body_exited(body):
	if body.name == "Gor":
		var tween10 = get_tree().create_tween()
		tween10.tween_property($HelpText/GorText, "self_modulate:a", 0.0, 2)
		tween10.tween_property($HelpText/GorText2, "self_modulate:a", 0.0, 2)

# Show HelpText
func _on_show_help_text_body_entered(body):
	if body.name == "Player" and "Gor":
		var tween11 = get_tree().create_tween()
		tween11.tween_property($HelpText/HelpPlatform2, "self_modulate:a", 1.0, 2)

# Hide HelpText
func _on_show_help_text_body_exited(body):
	if body.name == "Player" and "Gor":
		var tween12 = get_tree().create_tween()
		tween12.tween_property($HelpText/HelpPlatform, "self_modulate:a", 0.0, 2)
		tween12.tween_property($HelpText/HelpPlatform2, "self_modulate:a", 0.0, 2)

# Show Portal
func _on_show_portal_body_entered(body):
	if body.name == "Gor":
		var tween14 = get_tree().create_tween()
		tween14.tween_property($Portal, "self_modulate:a", 1.0, 2)
		tween14.tween_property($"HelpText/GorText3+1", "self_modulate:a", 1.0, 2)
		
# Hide Portal
func _on_show_portal_body_exited(body):
	if body.name == "Gor":
		var tween14 = get_tree().create_tween()
		tween14.tween_property($Portal, "self_modulate:a", 0.0, 2)
		tween14.tween_property($"HelpText/GorText3+1", "self_modulate:a", 0.0, 2)

# Portal Change Scene
func _on_change_scene_body_entered(body):
	if body.name == "Gor":
		GlobalVars.level3 = true
		anim.play("FadeIn")
		await anim.animation_finished
		get_tree().change_scene_to_file("res://Scenes/level_3+1.tscn")

# C418
func _on_c_418_body_entered(body):
	if body.name == "Player":
		$AudioStreamPlayer2D.stop()
		$C418_2.play()
		var tween15 = get_tree().create_tween()
		tween15.tween_property($HelpText/Relax, "self_modulate:a", 1.0, 2)





func _on_return_scene_body_entered(body):
	if body.name == "Player" or body.name == "Gor":
		get_tree().reload_current_scene()
