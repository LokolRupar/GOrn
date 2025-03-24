extends CanvasLayer

@export var empty_cursor: Texture

func _ready():
	Input.set_custom_mouse_cursor(empty_cursor, Input.CURSOR_ARROW)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) # Hide system cursor
	
func _process(delta):
	$CursorDefault.global_position = $CursorDefault.get_global_mouse_position()
