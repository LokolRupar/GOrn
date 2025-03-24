extends CharacterBody2D


@onready var anim: AnimatedSprite2D = $AnimatedSprite2D 
@export var speed: int = 100
@export var jump: int = -400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction := -1
var spawn_position : Vector2
var alive = true

var anim_attack = true
var attacking = false
var player_in_attack_range = false

var damage = false
var chase = false


func _ready():
	velocity = Vector2.ZERO
	spawn_position = position


func _physics_process(delta):
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
		
	if is_on_wall() and not attacking:
		direction =  -direction
	
	
	if not attacking and not player_in_attack_range :
		velocity.x = direction * speed
	else:
		velocity.x = 0
		
	var direction2 = ($"../Gor".position - self.position).normalized()
	
	if chase == true:
		velocity.x = direction2.x * speed
	

	# Call function
	animation()
	move_and_slide()
	
	if player_in_attack_range and not attacking:
		attack_player()


#Animation
func animation():
	
	
	# Walk/Idle/Acceleration (Player)
	if anim_attack and alive:
		if velocity.x != 0:
			anim.play('Run')
		else:
			anim.play('Idle')
			
			
		# Turn left/right
	if velocity.x < 0:
		anim.flip_h = false
	elif velocity.x > 0:
		anim.flip_h = true


# Death (Die)
func _on_die_body_entered(body):
	if body.name == "Player" or "Gor":
		body.velocity.y -= 400
		
		
# Damage  (Attack)
func _on_area_2d_body_entered(body):
	if body.name == "Player" or "Gor"  :
		player_in_attack_range = true
		attack_player()


func _on_attack_body_exited(body):

	if body.name == "Player" or "Gor" :
		await anim.animation_finished
		GlobalVars.generalHP += 50
		player_in_attack_range = false
		attacking = false 
		anim_attack = true

	
func attack_player():
	anim_attack = false
	attacking = true
	damage = true
	anim.play("Attack")
	await anim.animation_finished
	GlobalVars.generalHP -= 50
	attacking = false 
	anim_attack = true
	
	
 # Detect Player (AttackDetect)
func _on_attack_detect_body_entered(_body):
	get_tree().reload_current_scene()


func _on_player_detect_body_entered(body):
	if body.name == "Player" or "Gor":
		chase = true
		

func _on_player_detect_body_exited(body):
	if body.name == "Player" or "Gor":
		chase = false
