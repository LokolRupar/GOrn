extends CharacterBody2D

enum {
	MOVE
}


# Animations
@onready var animPlayer: AnimatedSprite2D = $AnimatedSprite2D 
# Base
@export var speed: int = 150
@export var jump: int = -400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# state
var state = MOVE
# speed +
var acceleration = GlobalVars.speedOrn
# control
var control = true








func _physics_process(delta):
	if Input.is_action_just_pressed("StopOrn"):
		control = not control
		if not control:
			velocity = Vector2.ZERO
			animPlayer.play('Idle')

	
	
	if control == true:
		match state:
			MOVE:
				move_state()


	#if is_dead:
		#velocity = Vector2.ZERO
		#move_and_slide()
		#return

	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta


	# Jump
	if Input.is_action_just_pressed("Up") and is_on_floor() and control:
			velocity.y = jump  
	

	# Call function
	animation()
	move_and_slide()

	
func move_state():
	
	
	#left
	var direction = Input.get_axis("Left", "Right")
	if Input.is_action_pressed("Left") and control == true:
		velocity.x = direction * speed * GlobalVars.speedOrn


	#right
	elif Input.is_action_pressed("Right") and control == true:
		velocity.x = direction * speed * GlobalVars.speedOrn
	else: 
		velocity.x = move_toward(velocity.x, 0, speed)
		if velocity.y == 0:
			animPlayer.play('Idle')
		
		
		# Turn left/right
	if velocity.x < 0:
		animPlayer.flip_h = true
	elif velocity.x > 0:
		animPlayer.flip_h = false
	
	
	if Input.is_action_pressed("Run") and velocity.x != 0  and control == true:
		GlobalVars.speedOrn = 2
	else:
		GlobalVars.speedOrn = 1
	

func animation(): 
	
	# Walk/Idle/Acceleration (Player)

	
	if velocity.x and control == true:
		if GlobalVars.speedOrn == 1:
			animPlayer.play('Walk')
		else:
			animPlayer.play("Run")
	
	
	# Jump/Fall
	if velocity.y < 0 and control == true:
		animPlayer.play('Jump')
	elif velocity.y > 0 and control == true :
		animPlayer.play('Fall')


func _on_timer_timeout():
	pass 




		
