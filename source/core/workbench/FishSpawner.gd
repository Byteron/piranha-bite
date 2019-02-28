extends Position2D

var fish = [
	preload("res://source/core/fish/RedFish.tscn"),
	preload("res://source/core/fish/BlueFish.tscn"),
	preload("res://source/core/fish/YellowFish.tscn"),
	preload("res://source/core/fish/Piranha.tscn")
]

func spawn_fish(container):
	var fish = _get_random_fish().instance()
	fish.initialize(position)
	container.add_child(fish)

func _get_random_fish():
	randomize()
	return fish[randi() % fish.size()]
