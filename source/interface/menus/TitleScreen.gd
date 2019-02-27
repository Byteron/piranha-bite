extends Control

func _on_Play_pressed():
	Scene.change(Scene.Game)

func _on_Score_pressed():
	Scene.change(Scene.Score)

func _on_Controls_pressed():
	Scene.change(Scene.Controls)

func _on_Options_pressed():
	Scene.change(Scene.Options)

func _on_Credits_pressed():
	Scene.change(Scene.Credits)

func _on_Quit_pressed():
	get_tree().quit()