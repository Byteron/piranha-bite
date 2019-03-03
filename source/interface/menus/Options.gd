extends Control

onready var music_audio = $CenterContainer/Content/Music/AudioStreamPlayer
onready var effects_audio = $CenterContainer/Content/Effects/AudioStreamPlayer

onready var music_slider = $CenterContainer/Content/Music/HSlider
onready var effects_slider = $CenterContainer/Content/Effects/HSlider

func _ready():
	music_slider.value = AudioServer.get_bus_volume_db(1)
	effects_slider.value = AudioServer.get_bus_volume_db(2)
	
func _on_Back_pressed():
	Scene.change(Scene.TitleScreen)

func _on_MusicHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)
	music_audio.play()


func _on_EffectsHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(2, value)
	effects_audio.play()
