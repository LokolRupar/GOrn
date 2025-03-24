extends StaticBody2D

@onready var collision = $CollisionShape2D
@onready var area = $DetectPlayer



func _unhandled_input(event):
		if Input.is_action_just_pressed('move_down2'):
			area.set_deferred("monitoring", true)


func _on_detect_player_body_entered(body):
	collision.set_deferred("disabled", true)  


func _on_detect_player_body_exited(body):
	collision.set_deferred("disabled", false)  
	area.set_deferred("monitoring", false)
