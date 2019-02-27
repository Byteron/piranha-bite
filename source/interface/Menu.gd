extends Control

func _on_Game_pressed():
	Global.change_scene(Global.Game)

func _on_Credits_pressed():
	Global.change_scene(Global.Credits)

func _on_Controls_pressed():
	Global.change_scene(Global.Controls)

func _on_Quit_pressed():
	get_tree().quit()