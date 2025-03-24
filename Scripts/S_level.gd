extends Node2D



func _ready():
	levels()


func levels():
# ChangeScene tutorial system
	if GlobalVars.tutorial == true:
		$Level1.position.y = 45

	# ChangeScene level_1 system
	if GlobalVars.level1 == true:
		$Level2.position.y = 45
		
	# level_2 system
	if GlobalVars.level2 == true:
		$Level3.position.y = 240
		
	# level_3+1 system
	if GlobalVars.level3_1 == true:
		$Level3.position.y = 240
