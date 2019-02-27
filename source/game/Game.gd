extends Node2D

enum FISH { FISH1, FISH2, FISH3, PIRANHA }

const START_POSITION = Vector2(240, 75)

var fingers = 5
var mistakes = 0
var score = 0

var speed = 80
var acceleration = 1

var spawn_time_min = 1.0
var spawn_time_max = 1.8

onready var workbench = $Workbench
onready var hand = $Hand
onready var pickup_space = $PickupSpace
onready var timer = $Timer

onready var mistake_player = $AudioStreamPlayer
onready var score_label = $Interface/Screen/VBox/Score
onready var highscore_label = $Interface/Screen/VBox/HighScore
onready var mistakes_label = $Interface/Screen/VBox/Mistakes

func _unhandled_input(event):
	if event.is_action_pressed("one"):
		_sort_fish(0)
	elif event.is_action_pressed("two"):
		_sort_fish(1)
	elif event.is_action_pressed("three"):
		_sort_fish(2)
	elif event.is_action_pressed("ui_cancel"):
		Global.change_scene(Global.Menu)

func _ready():
	Get.Game = self
	mistakes_label.text = "Mistakes: " + str(mistakes)
	score_label.text = "Score: " + str(score)
	highscore_label.text = "High Score: " + str(Get.high_score)
	timer.start()

func _process(delta):
	speed += delta * acceleration
	spawn_time_max -= delta / 100
	spawn_time_min -= delta / 100

func _on_Timer_timeout():
	_spawn_fish()
	timer.wait_time = rand_range(spawn_time_min, spawn_time_max)
	timer.start()

func _sort_fish(box_type):
	hand.grab()
	if pickup_space.current_fish:
		if pickup_space.current_fish.type == FISH.PIRANHA:
			hand.remove_finger()
		else:
			if box_type != pickup_space.current_fish.type:
				_on_Fish_slipped_through(pickup_space.current_fish.type)
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
	score_label.text = "Score: " + str(score)
	if score > Get.high_score:
		highscore_label.text = "High Score: " + str(score)

func _game_over():
	Get.score = score
	if Get.score > Get.high_score:
		Get.high_score = Get.score
	Global.change_scene(Global.GameOver)

func _on_Fish_slipped_through(type):
	if not type == FISH.PIRANHA:
		mistake_player.play()
		mistakes += 1
		mistakes_label.text = "Mistakes: " + str(mistakes)
	if mistakes == 10:
		_game_over()

func _on_Hand_lost_finger(finger_left):
	if finger_left == 0:
		_game_over()
