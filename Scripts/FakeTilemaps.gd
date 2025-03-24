extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body.name == "Player" and GlobalVars.speedOrn == 2:
		$CollisionShape2D.position.y = -500


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		$CollisionShape2D.position.y = 0
	
