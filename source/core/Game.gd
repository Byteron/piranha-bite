extends Node2D

onready var hand = $Hand

func _unhandled_input(event):
	if event.is_action_pressed("one"):
		_sort_fish(0)
	elif event.is_action_pressed("two"):
		_sort_fish(1)
	elif event.is_action_pressed("three"):
		_sort_fish(2)
	
	if event.is_action_pressed("ui_cancel"):
		Scene.change(Scene.TitleScreen)

func _sort_fish(box_type):
	var current_fish = hand.grab()
	
	if not current_fish:
		return
