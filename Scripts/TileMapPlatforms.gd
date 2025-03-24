extends StaticBody2D

@onready var collision = $CollisionShape2D
@onready var area = $Area2D



func _unhandled_input(event):
		if Input.is_action_just_pressed('move_down'):
			area.set_deferred("monitoring", true)
			
			
func _on_area_2d_body_entered(body):
	collision.set_deferred("disabled", true)


func _on_area_2d_body_exited(body):
	area.set_deferred("monitoring", false)
	collision.set_deferred("disabled", false)  
	
