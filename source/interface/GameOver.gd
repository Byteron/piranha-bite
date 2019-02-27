extends Control

onready var score_label = $CenterContainer/VBoxContainer/Score

func _ready():
	score_label.text = "Score: " + str(Get.score)

func _on_Back_pressed():
	Global.change_scene(Global.Menu)
