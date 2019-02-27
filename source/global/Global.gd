extends CanvasLayer

var Game = "res://source/game/Game.tscn"
var Menu = "res://source/interface/Menu.tscn"
var Credits = "res://source/interface/Credits.tscn"
var Controls = "res://source/interface/Controls.tscn"
var GameOver = "res://source/interface/GameOver.tscn"

# GLOBAL

var theme = preload("res://audio/music/theme.wav")

var next_scene

onready var anim = $AnimationPlayer
onready var audio = $AudioStreamPlayer

func _ready():
	play_theme()

func play_theme():
	audio.stream = theme
	audio.play()

func change_scene(scene):
	next_scene = scene
	anim.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene(next_scene)
		next_scene = null
		anim.play("fade_in")

func _on_AudioStreamPlayer_finished():
	play_theme()
