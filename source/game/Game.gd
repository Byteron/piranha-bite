extends Node2D

onready var hand = $Hand

func _unhandled_input(event):
	if event.is_action_pressed("one"):
		_sort_fish(0)
	if event.is_action_pressed("two"):
		_sort_fish(1)
	if event.is_action_pressed("three"):
		_sort_fish(2)

func _sort_fish(box_type):
	var current_fish = hand.grab()
	
	if not current_fish:
		return
	
	