extends Node2D

@onready var anim = $ButtonsAndLoadDisplay/AnimationPlayer


func _ready():
	Music.stop()
	animation()

	
func animation():
	anim.play("FadeOut")
	await anim.animation_finished


# Show Platform
func _on_hide_platform_mouse_entered():
	var tween1 = get_tree().create_tween()
	tween1.tween_property($AreasAndStatics/InvisiblePlatform/PlatformLong, "self_modulate:a", 3.0, 2)
	tween1.tween_property($HelpText/GorText, "self_modulate:a", 3.0, 2)
	tween1.tween_property($HelpText/Arrow, "self_modulate:a", 3.0, 2)
	
# Hide Platform
func _on_hide_platform_mouse_exited():
	var tween2 = get_tree().create_tween()
	tween2.tween_property($AreasAndStatics/InvisiblePlatform/PlatformLong, "self_modulate:a", 0.0, 2)
	tween2.tween_property($HelpText/GorText, "self_modulate:a", 0.0, 2)
	tween2.tween_property($HelpText/Arrow, "self_modulate:a", 0.0, 2)

# Del BigBox
func _on_del_big_box_body_entered(body):
	if body.name == "Gor":
		var tween3 = get_tree().create_tween()
		tween3.tween_property($TileMaps/BigBox, "modulate:a", 0.0, 2)
		await tween3.finished
		$TileMaps/BigBox.position.y = 1000

# Collision del
func _on_del_collision_body_entered(body):
	if body.name == "Gor" and GlobalVars.speedGor == 2:
		$AreasAndStatics/FakePillar/CollisionShape2D.position.y = -250

# Collision add
func _on_del_collision_body_exited(body):
	if body.name == "Gor":
		$AreasAndStatics/FakePillar/CollisionShape2D.position.y = 312

# Del BushTileMap
func _on_del_bush_tile_map_body_entered(body):
	if body.name == "Player" or body.name == "Gor":
		var tween5 = get_tree().create_tween()
		tween5.tween_property($TileMaps/BushTest2, "modulate:a", 0.0, 2)

# Add BushTileMap
func _on_del_bush_tile_map_body_exited(body):
	if body.name == "Player" or body.name == "Gor":
		var tween6 = get_tree().create_tween()
		tween6.tween_property($TileMaps/BushTest2, "modulate:a", 1.0, 2)

# Del Bush
func _on_button_pressed():
	var tween7 = get_tree().create_tween()
	tween7.tween_property($AreasAndStatics/Bush/Bush, "modulate:a", 0.0, 2)
	await tween7.finished
	$AreasAndStatics/Bush/CollisionShape2D.position.y = 700

# Player protection Show
func _on_hide_platform_2_mouse_entered():
	var tween8 = get_tree().create_tween()
	tween8.tween_property($AreasAndStatics/InvisiblePlatform2/PlatformLong2, "self_modulate:a", 3.0, 2)

# Player protection Hide
func _on_hide_platform_2_mouse_exited():
	var tween9 = get_tree().create_tween()
	tween9.tween_property($AreasAndStatics/InvisiblePlatform2/PlatformLong2, "self_modulate:a", 0.0, 2)

# Strong Jump
func _on_strong_jump_body_entered(body):
	if body.name == "Player" or body.name == "Gor":
		body.velocity.y -= 650

# Show Fake Platform
func _on_empty_mouse_entered():
	var tween10 = get_tree().create_tween()
	tween10.tween_property($Objects/Platform, "self_modulate:a", 3.0, 2)

# Hide Fake Platform
func _on_empty_mouse_exited():
	var tween11 = get_tree().create_tween()
	tween11.tween_property($Objects/Platform, "self_modulate:a", 0.0, 2)

# Show "Parkour1"
func _on_platform_show_mouse_entered():
	var tween12 = get_tree().create_tween()
	tween12.tween_property($AreasAndStatics/Parkour1/Platform, "self_modulate:a", 3.0, 2)

# Hide "Parkour1"
func _on_platform_show_mouse_exited():
	var tween12 = get_tree().create_tween()
	tween12.tween_property($AreasAndStatics/Parkour1/Platform, "self_modulate:a", 0.0, 2)

# Show Text and Portal
func _on_show_portal_body_entered(body):
	if body.name == "Player":
		var tween13 = get_tree().create_tween()
		tween13.tween_property($Objects/Portal, "self_modulate:a", 1.0, 2)
		tween13.tween_property($HelpText/OrnText, "self_modulate:a", 1.0, 2)
		tween13.tween_property($HelpText/Arrow2, "self_modulate:a", 1.0, 2)

# Hide Text and Portal
func _on_show_portal_body_exited(body):
	if body.name == "Player":
		var tween14 = get_tree().create_tween()
		tween14.tween_property($Objects/Portal, "self_modulate:a", 0.0, 2)
		tween14.tween_property($HelpText/OrnText, "self_modulate:a", 0.0, 2)
		tween14.tween_property($HelpText/Arrow2, "self_modulate:a", 0.0, 2)

# Change Scene
func _on_change_scene_body_entered(body):
	if body.name == "Player":
		GlobalVars.level3_1 = true
		anim.play("FadeIn")
		await anim.animation_finished
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		



func _on_return_scene_body_entered(body):
	if body.name == "Player" or body.name == "Gor":
		get_tree().reload_current_scene()
