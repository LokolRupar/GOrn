extends Node2D

@onready var anim = $AnimationPlayer


func _ready():
	Music.stop()
	animation()
	
func animation():
	anim.play("FadeOut")
	await anim.animation_finished



# Appearance(Text)
func _on_area_2d_body_entered(body):
	var tween1 = get_tree().create_tween()
	if body.name == "Player" or "Gor":
		
		tween1.tween_property($Text/OrnGor, "self_modulate:a", 1.0, 2)
		
		tween1.tween_property($Text/Arrow, "self_modulate:a", 1.0, 2)
		
		tween1.tween_property($Text/Arrow3, "self_modulate:a", 1.0, 3)


# Leave(Text)
func _on_area_2d_body_exited(body):
	var tween2 = get_tree().create_tween()
	if body.name == "Player" or "Gor":
		
		tween2.tween_property($Text/OrnGor, "self_modulate:a", 0.0, 2)
		
		tween2.tween_property($Text/Arrow, "self_modulate:a", 0.0, 2)
		
		tween2.tween_property($Text/Arrow3, "self_modulate:a", 0.0, 2)


# portal(activated)
func _on_area_gor_body_entered(body):
	if body.name == "Player":
		return
	elif body.name == "Gor":
		$Portal.show()
		$Portal/AreaPortal.monitoring = true
		$Portal/AreaPortal.monitorable = true
		
		
		
		
# portal(deactivated)
func _on_area_gor_body_exited(body):
	if body.name == "Player":
		return
	elif body.name == "Gor":
		$Portal.hide()


# Gor mooving
func _on_delete_gor_body_entered(body):
	if body.name == "Gor":
		$Gor.position.x = 824
		$Gor.position.y = 236













