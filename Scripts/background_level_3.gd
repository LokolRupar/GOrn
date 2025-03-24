extends ParallaxBackground

var speed = 80

func _process(delta):
	scroll_offset.x -= speed * delta
	$Cloud.motion_offset.x += 5  * delta
