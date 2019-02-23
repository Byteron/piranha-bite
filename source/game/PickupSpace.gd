extends Area2D

var current_fish = null

func _on_PickupSpace_area_entered(area):
	current_fish = area
	# print(area.name, " entered")

func _on_PickupSpace_area_exited(area):
	current_fish = null
	# print(area.name, " exited")
