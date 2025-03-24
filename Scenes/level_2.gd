extends Node2D

@onready var anim = $AnimationPlayer
@onready var player = $Player
@onready var fakeWall = $FakeWall/TileMap


func _ready():
	Music.stop()
	animation()
	
	
	
func animation():
	anim.play("FadeOut")
	await anim.animation_finished
	

# Del Orn
func _on_tel_orn_body_entered(body):
	if body.name == "Player":
		player.position.x = 1248
		player.position.y = 350

# Del TileMap
func _on_hide_tile_map_body_entered(body):
	if body.name == "Gor" or body.name == "Player":
		var tween1 = get_tree().create_tween()
		tween1.tween_property(fakeWall, "modulate:a", 0.0, 2)

# Add TileMap
func _on_hide_tile_map_body_exited(body):
	if body.name ==  "Gor":
		var tween2 = get_tree().create_tween()
		tween2.tween_property(fakeWall, "modulate:a", 1.0, 2)

# Del Collision
func _on_delete_collision_body_entered(body):
	if body.name == "Gor":
		$FakeWall/CollisionShape2D.position.y = 400

# Add Collision
func _on_delete_collision_body_exited(body):
	$FakeWall/CollisionShape2D.position.y = 320

# Add Portal
func _on_add_portal_body_entered(body):
	if body.name == "Player":
		var tween6 = get_tree().create_tween()
		tween6.tween_property($AnimatedSprite2D, "self_modulate:a", 1.0, 2)

# Del Portal
func _on_add_portal_body_exited(body):
	if body.name == "Gor" and "Player":
		var tween7 = get_tree().create_tween()
		tween7.tween_property($AnimatedSprite2D, "self_modulate:a", 0.0, 2)
	
# Next Scene
func _on_next_scene_body_entered(body):
	if body.name == "Player":
		GlobalVars.level2 = true
		await play_fade_in_and_switch_scene()
		
# Show Orn Text
func _on_show_orn_body_entered(body):
	if body.name == "Player":
		var tween7 = get_tree().create_tween()
		tween7.tween_property($HelpText/OrnText3, "self_modulate:a", 1.0, 2)
		tween7.tween_property($HelpText/Arrow3, "self_modulate:a", 1.0, 2)

# Hide Orn Text
func _on_show_orn_body_exited(body):
	if body.name == "Player":
		var tween7 = get_tree().create_tween()
		tween7.tween_property($HelpText/OrnText3, "self_modulate:a", 0.0, 2)
		tween7.tween_property($HelpText/Arrow3, "self_modulate:a", 0.0, 2)

# Show Orn Text Spawn
func _on_hide_orn_text_body_entered(body):
	if body.name == "Gor" and "Player":
		var tween8 = get_tree().create_tween()
		tween8.tween_property($HelpText/OrnText, "self_modulate:a", 1.0, 2)
		tween8.tween_property($HelpText/Arrow, "self_modulate:a", 1.0, 2)

# Hide Orn Text Spawn
func _on_hide_orn_text_body_exited(body):
	if body.name == "Gor" and "Player":
		var tween9 = get_tree().create_tween()
		tween9.tween_property($HelpText/OrnText, "self_modulate:a", 0.0, 2)
		tween9.tween_property($HelpText/Arrow, "self_modulate:a", 0.0, 2)

# Show Brothers Text Spawn
func _on_hide_brothers_text_body_entered(body):
	if body.name == "Gor" and "Player":
		var tween10 = get_tree().create_tween()
		tween10.tween_property($HelpText/GorText, "self_modulate:a", 1.0, 2)
		tween10.tween_property($HelpText/OrnText2, "self_modulate:a", 1.0, 2)
	
# Hide Brothers Text Spawn
func _on_hide_brothers_text_body_exited(body):
	if body.name == "Gor" and "Player":
		var tween10 = get_tree().create_tween()
		tween10.tween_property($HelpText/GorText, "self_modulate:a", 0.0, 2)
		tween10.tween_property($HelpText/OrnText2, "self_modulate:a", 0.0, 2)
	
# Show Gor Text Center
func _on_gor_text_body_entered(body):
	if body.name == "Gor":
		var tween11 = get_tree().create_tween()
		tween11.tween_property($HelpText/GorText2, "self_modulate:a", 1.0, 2)
	
func _on_gor_text_body_exited(body):
	if body.name == "Gor":
		var tween12 = get_tree().create_tween()
		tween12.tween_property($HelpText/GorText2, "self_modulate:a", 0.0, 2)
	
# Anim NextScene
func play_fade_in_and_switch_scene():
	anim.play("FadeIn")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Scenes/level_3.tscn")









func _on_return_scene_body_entered(body):
	if body.name == "Player" or body.name == "Gor":
		get_tree().reload_current_scene()
		
