extends Node2D

enum FISH { FISH1, FISH2, FISH3, PIRANHA }

const START_POSITION = Vector2(240, 75)

var fingers = 10
var mistakes = 0
var score = 0

var speed = 60
var acceleration = 1

var spawn_time_min = 1.2
var spawn_time_max = 1.6

onready var workbench = $Workbench
onready var pickup_space = $PickupSpace
onready var timer = $Timer

func _unhandled_input(event):
	if event.is_action_pressed("one"):
		_sort_fish(0)
	elif event.is_action_pressed("two"):
		_sort_fish(1)
	elif event.is_action_pressed("three"):
		_sort_fish(2)

func _ready():
	Get.Game = self
	$Fingers.text = "Fingers: " + str(fingers)
	$Mistakes.text = "Mistakes: " + str(mistakes)
	$Score.text = "Score: " + str(score)
	timer.start()

func _process(delta):
	speed += delta * acceleration
	spawn_time_max -= delta / 350
	spawn_time_min -= delta / 350

func _on_Timer_timeout():
	_spawn_fish()
	timer.wait_time = rand_range(spawn_time_min, spawn_time_max)
	timer.start()

func _sort_fish(box_type):
	if pickup_space.current_fish:
		if pickup_space.current_fish.type == FISH.PIRANHA:
			_lose_finger()
		workbench.boxes[box_type].fill(Get.fish_instance(pickup_space.current_fish.type))
		pickup_space.current_fish.caught()
		pickup_space.current_fish.queue_free()
		pickup_space.current_fish = null

func _spawn_fish():
	var fish = Get.random_fish().instance()
	fish.connect("slipped_through", self, "_on_Fish_slipped_through")
	fish.initialize(START_POSITION)
	workbench.fish_container.add_child(fish)

func score(points):
	score += points
	$Score.text = "Score: " + str(score)

func _lose_finger():
	fingers -= 1
	$Fingers.text = "Fingers: " + str(fingers)
	if fingers == 0:
		get_tree().reload_current_scene()

func _on_Fish_slipped_through(type):
	if not type == FISH.PIRANHA:
		mistakes += 1
		$Mistakes.text = "Mistakes: " + str(mistakes)
	if mistakes == 10:
		get_tree().reload_current_scene()