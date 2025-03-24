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
# Attack
var attack = false
# state
var state = MOVE
# speed +
var acceleration = GlobalVars.speedGor
#control
var control = true





func _physics_process(delta):
	if Input.is_action_just_pressed("StopGor"):
		control = not control
		if not control:
			velocity = Vector2.ZERO
			animPlayer.play('Idle')
	
	
	
	if control:
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
	if Input.is_action_pressed("Left") and control:
		velocity.x = direction * speed * GlobalVars.speedGor


	#right
	elif Input.is_action_pressed("Right") and control:
		velocity.x = direction * speed * GlobalVars.speedGor
	else: 
		velocity.x = move_toward(velocity.x, 0, speed)
		if velocity.y == 0 and control:
			animPlayer.play('Idle')
		
		# Turn left/right
	if velocity.x < 0:
		animPlayer.flip_h = true
	elif velocity.x > 0:
		animPlayer.flip_h = false
	
	
	if Input.is_action_pressed("Run") and velocity.x != 0 and control:
		GlobalVars.speedGor = 2
	else:
		GlobalVars.speedGor = 1
	

func animation(): 
	
	
	# Walk/Idle/Acceleration (Player)
	if velocity.x:
		if acceleration == 1 and control:
			animPlayer.play('Run')
		else:
			animPlayer.play("Run")
	
	
	# Jump/Fall
	if velocity.y < 0 and control:
		animPlayer.play('Jump')
	elif velocity.y > 0 and control:
		animPlayer.play('Fall')



	





