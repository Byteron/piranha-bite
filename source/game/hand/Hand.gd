extends Node2D

signal bitten(finger_left)

onready var hand = $Hand
onready var anim = $AnimationPlayer
onready var audio = $AudioStreamPlayer

onready var pickup_space = $PickupSpace

func _ready():
	_remove_finger()
	_remove_finger()

func grab():
	anim.play("grab")
	var current_fish = pickup_space.current_fish
	if current_fish:
		if current_fish.type == Board.FISH.PIRANHA:
			_remove_finger()
	return current_fish

func _remove_finger():
	audio.play()
	if hand.get_child_count() < 1:
		return
	var finger = _get_random_finger()
	finger.free()
	emit_signal("bitten", hand.get_child_count())

func _get_fingers():
	return hand.get_children()

func _get_random_finger():
	randomize()
	var fingers = _get_fingers()
	return fingers[randi() % fingers.size()]
