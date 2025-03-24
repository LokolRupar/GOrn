extends ParallaxBackground

var speed = 80

func _process(delta):
	scroll_offset.x -= speed * delta
	$ParallaxLayer.motion_offset.x += 10  * delta
	
