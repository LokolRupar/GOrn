extends ParallaxBackground

var speed = 80

func _process(delta):
	scroll_offset.x -= speed * delta
