extends AudioStreamPlayer2D

@onready var menu = "res://Scenes/menu.tscn"
@onready var s_levels = "res://Scenes/s_levels.tscn"




const level_music = preload("res://Music/for_game_08.04.24.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume 
	play()
	
func play_music_level():
	_play_music(level_music)
