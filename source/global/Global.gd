extends CanvasLayer

var Game = "res://source/game/Game.tscn"
var Menu = "res://source/interface/Menu.tscn"

# GLOBAL

var next_scene

onready var anim = $AnimationPlayer

func change_scene(scene):
	next_scene = scene
	anim.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene(next_scene)
		next_scene = null
		anim.play("fade_in")