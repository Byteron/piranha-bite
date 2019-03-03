extends Node2D

const MAX_MISTAKES = 5

var score = 0
var mistakes = 0

onready var hand = $Hand
onready var shop = $Shop
onready var workbench = $Workbench
onready var HUD = $HUD

func _ready():
	workbench.fish_catcher.connect("fish_missed", self, "_on_FishCatcher_fish_missed")
	hand.connect("bitten", self, "_on_Hand_bitten")
	shop.connect("sold", self, "_on_Shop_sold")
	shop.connect("mistake_made", self, "_on_Shop_mistake_made")
	
	HUD.update_mistakes(mistakes)
	HUD.update_high_score(Board.high_score)
	HUD.update_score(score)

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
	shop.fill(box_type, current_fish)

func _mistake_made():
	mistakes += 1
	HUD.update_mistakes(mistakes)
	if mistakes == MAX_MISTAKES:
		_game_over()

func _game_over():
	Board.score = score
	Scene.change(Scene.Score)

func _on_Hand_bitten(finger_left):
	print(finger_left, " fingers left")

func _on_Shop_sold(revenue):
	score += revenue
	Board.score = score
	HUD.update_score(score)
	HUD.update_high_score(Board.high_score)
	workbench.speed_up()

func _on_Shop_mistake_made():
	_mistake_made()

func _on_FishCatcher_fish_missed():
	_mistake_made()