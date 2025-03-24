extends CanvasLayer

@export var empty_cursor: Texture

func _ready():
	# Скрыть системный курсор
	Input.set_custom_mouse_cursor(empty_cursor, Input.CURSOR_ARROW)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _process(delta):
	$"../CursorDefault".global_position = $"../CursorDefault".get_global_mouse_position()
