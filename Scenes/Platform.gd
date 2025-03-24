extends AnimatableBody2D

@onready var anim = $AnimationPlayer2
@onready var platform = $"." # Объект, который движется
var move = false
var animation_position = 0.0


func _on_mooving_platform_body_entered(body):
	if body.name == "Player":
		return
	if body.name == "Gor":
		move = true
		anim.play("Mooving")
		anim.seek(animation_position)  


func _on_mooving_platform_body_exited(body):
	if body.name == "Player":
		return
	if body.name == "Gor":
		move = false
		animation_position = anim.current_animation_position
		anim.pause()
		platform.position = platform.position
		
func _process(delta):
	if move:
		platform.position = platform.position
