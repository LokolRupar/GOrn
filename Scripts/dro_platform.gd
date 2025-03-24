extends StaticBody2D

@onready var collision = $CollisionShape2D
@onready var area = $DetectPlayer



func _unhandled_input(event):
		if event.is_action_pressed('move_down'):
			area.set_deferred("monitoring", true)


func _on_detect_player_body_entered(body):
	collision.set_deferred("disabled", true) 


func _on_detect_player_body_exited(body):
	collision.set_deferred("disabled", false)  
	area.set_deferred("monitoring", false)
