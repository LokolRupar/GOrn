extends ParallaxBackground

var speed = 80

func _process(delta):
	scroll_offset.x -= speed * delta
	$Clouds1.motion_offset.x += 75  * delta
	$Clouds2.motion_offset.x -= 60 * delta
	$Clouds3.motion_offset.x -= 45 * delta

