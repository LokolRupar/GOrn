extends AnimatableBody2D

@onready var anim = $AnimationPlayer
@onready var platform = $"." # Объект, который движется
var move = false
var animation_position = 0.0


# Start move
func _on_area_2d_body_entered(body):
	if body.name == "Gor":
		return
	if body.name == "Player":
		move = true
		anim.play("MovePlatform")
		anim.seek(animation_position) 

# Stop move
func _on_area_2d_body_exited(body):
	if body.name == "Gor":
		return
	if body.name == "Player":
		move = false
		animation_position = anim.current_animation_position
		anim.pause()
		platform.position = platform.position 


func _process(delta):
	if move:
		platform.position = platform.position
