extends CanvasLayer

# Scenes

var Game = "res://source/core/Game.tscn"
var TitleScreen = "res://source/interface/menus/TitleScreen.tscn"
var Credits = "res://source/interface/menus/Credits.tscn"
var Options = "res://source/interface/menus/Options.tscn"
var Controls = "res://source/interface/menus/Controls.tscn"
var Score = "res://source/interface/menus/Score.tscn"

# GLOBAL

var next_scene = null

onready var anim = $AnimationPlayer

func change(scene):
	next_scene = scene
	anim.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene(next_scene)
		next_scene = null
		anim.play("fade_in")