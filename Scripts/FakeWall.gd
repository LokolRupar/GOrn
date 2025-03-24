extends AnimatableBody2D

@onready var fakeWall = $CollisionShape2D2



# Fake Wall del
func _on_delete_collision_body_entered(body):
	if body.name == "Gor" and GlobalVars.speedGor == 2:
		fakeWall.position.y = 400

# Fake Wall add
func _on_delete_collision_body_exited(body):
	if body.name == "Gor":
		fakeWall.position.y = 320
