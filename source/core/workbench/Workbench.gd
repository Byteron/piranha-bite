extends Node2D

var speed = 100
var spawn_time_min = 1.0
var spawn_time_max = 1.6

onready var spawn_timer = $SpawnTimer
onready var fish_spawner = $FishSpawner
onready var fish_container = $FishContainer
onready var fish_catcher = $FishCatcher
onready var lines = $Lines.get_children()

func _ready():
	lines[0].other_line = lines[1]
	lines[1].other_line = lines[0]

func _process(delta):
	_move_lines(speed * delta)
	_move_fish(speed * delta)
	_reset_lines()

func _move_lines(motion):
	for line in lines:
		line.position.x -= motion

func _move_fish(motion):
	for fish in fish_container.get_children():
		fish.position.x -= motion

func _reset_lines():
	for line in lines:
		if line.position.x <= -240:
			line.move_back()

func speed_up():
	speed += 10
	spawn_time_min *= 0.95
	spawn_time_max *= 0.95

func _on_SpawnTimer_timeout():
	fish_spawner.spawn_fish(fish_container)
	spawn_timer.wait_time = rand_range(spawn_time_min, spawn_time_max)
	spawn_timer.start()
